//%attributes = {}



var $client : cs:C1710.HTTPClient
$client:=cs:C1710.HTTPClient.new()

$client.request()\
.GET()\
.url("https://httpbin.org/")\
.appendHeader("Toto"; "Totovalue")\
.version(1)\
.onTerminate(Formula:C1597(ALERT:C41(JSON Stringify:C1217($1.response; *))))\
.run()

$client.get("https://httpbin.org/")\
.appendHeader("Toto"; "Totovalue")\
.version(1)\
.onTerminate(Formula:C1597(ALERT:C41(JSON Stringify:C1217($1.response; *))))\
.run()

$client.get("https://httpbin.org/")\
.onTerminate(Formula:C1597(ALERT:C41(JSON Stringify:C1217($1.response; *)))).run()


cs:C1710._TestHTTPClass.new().run()