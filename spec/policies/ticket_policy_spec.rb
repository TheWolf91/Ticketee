require 'rails_helper'

RSpec.describe TicketPolicy do
  context "permissions" do
    subject { TicketPolicy.new(user, ticket) }

    let(:user) { FactoryGirl.create(:user) }
    let(:project) { FactoryGirl.create(:project) }
    let(:ticket) { FactoryGirl.create(:ticket, project: project, author: User.new) }  #"author: User.new" è stato aggiunto perché era un parametro richiesto,
                                                                                      # ma Rails 4 avrebbe fatto passare il test anche senza

    context "for anonymous users" do
      let(:user) { nil }

      it { should_not permit_action :show }
      it { should_not permit_action :create }
      it { should_not permit_action :update }
    end

    context "for viewers of the project" do
      before { assign_role!(user, :viewer, project) }

      it { should permit_action :show }
      it { should_not permit_action :create }
      it { should_not permit_action :update }
    end

    context "for editors of the project" do
      before { assign_role!(user, :editor, project) }

      it { should permit_action :show }
      it { should permit_action :create }
      it { should_not permit_action :update }
    end

    context "when the editor created the ticket" do   # assign_role! aggiunto da me, per problema di incompatibilità tra rails 4 e 5
      before do
        assign_role!(user, :editor, project)
        ticket.author = user
      end

      it { should permit_action :update }
    end

    context "for managers of the project" do
      before { assign_role!(user, :manager, project) }

      it { should permit_action :show }
      it { should permit_action :create }
      it { should permit_action :update }
    end

    context "for managers of other projects" do
      before { assign_role!(user, :manager, FactoryGirl.create(:project)) }

      it { should_not permit_action :show }
      it { should_not permit_action :create }
      it { should_not permit_action :update }
    end

    context "for administrators" do
      let(:user) { FactoryGirl.create(:user, :admin) }

      it { should permit_action :show }
      it { should permit_action :create }
      it { should permit_action :update }
    end
  end
end
