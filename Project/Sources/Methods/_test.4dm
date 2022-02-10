//%attributes = {}


/*

var $client : cs.HTTPClient
$client:=cs.HTTPClient.new()

$client.request()\
.GET()\
.url("https://httpbin.org/")\
.appendHeader("Toto"; "Totovalue")\
.version(1)\
.onTerminate(Formula(ALERT(JSON Stringify($1.response; *))))\
.run()

$client.get("https://httpbin.org/")\
.appendHeader("Toto"; "Totovalue")\
.version(1)\
.onTerminate(Formula(ALERT(JSON Stringify($1.response; *))))\
.run()

$client.get("https://httpbin.org/").onTerminate(Formula(ALERT(JSON Stringify($1.response; *)))).run()

*/

cs:C1710._TestHTTPClass.new().run()