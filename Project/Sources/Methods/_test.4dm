//%attributes = {}



var $client : cs:C1710.HTTPClient
$client:=cs:C1710.HTTPClient.new()

var $request : 4D:C1709.HTTPRequest
var $wait : Boolean
$wait:=Not:C34(Shift down:C543)

$request:=$client.request()\
.GET()\
.url("https://httpbin.org/")\
.appendHeader("Toto"; "Totovalue")\
.version(1)\
.onResponse(Formula:C1597(ALERT:C41(JSON Stringify:C1217($1.response; *))))\
.build()

If ($wait)
	$request.wait()
End if 

$request:=$client.get("https://httpbin.org/")\
.appendHeader("Toto"; "Totovalue")\
.version(1)\
.onTerminate(Formula:C1597(ALERT:C41(JSON Stringify:C1217($1.response; *))))\
.build()

If ($wait)
	$request.wait()
End if 

$request:=$client.get("https://httpbin.org/")\
.onTerminate(Formula:C1597(ALERT:C41(JSON Stringify:C1217($1.response; *))))\
.build()

If ($wait)
	$request.wait()
End if 

$request:=cs:C1710._TestHTTPClass.new().build()

If ($wait)
	$request.wait()
End if 


