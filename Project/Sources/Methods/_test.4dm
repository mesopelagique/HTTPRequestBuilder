//%attributes = {}



var $client : cs:C1710.HTTPClient
$client:=cs:C1710.HTTPClient.new()

$handle:=$client.request()\
.GET()\
.url("https://httpbin.org/")\
.appendHeader("Toto"; "Totovalue")\
.version(1)\
.onResponse(Formula:C1597(ALERT:C41(JSON Stringify:C1217($1.response; *))))\
.build()\
.wait()

While (Not:C34($handle.terminated))
	// Code I can execute while waiting for the request.
	// If I don't have code to execute, I can replace the while by $request.wait()
End while 

$client.get("https://httpbin.org/")\
.appendHeader("Toto"; "Totovalue")\
.version(1)\
.onTerminate(Formula:C1597(ALERT:C41(JSON Stringify:C1217($1.response; *))))\
.build()\
.wait()

$client.get("https://httpbin.org/")\
.onTerminate(Formula:C1597(ALERT:C41(JSON Stringify:C1217($1.response; *))))\
.build()\
.wait()

cs:C1710._TestHTTPClass.new().build().wait()