module Heartbeat
  class TestApplication
    def self.call(env)
      default_headers = { "Content-type" => "text/html" }
      body = %Q(
      <!doctype html>
<html>
<head>
	<title>Success of FAILURE?!</title>
</head>
<body>
	<h1>Success of FAILURE?!</h1>
	<form action="/test/200">
		<input type="submit" value="Success!">
	</form>

	<form action="/test/500">
		<input type="submit" value="Failure!">
	</form>
</body>
</html>
)

      [200, default_headers, [body]]
    end
  end
end