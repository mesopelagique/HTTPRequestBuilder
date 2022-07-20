
Class constructor($client : cs:C1710.HTTPClient)
	This:C1470.client:=$client
	This:C1470.options:=New object:C1471
	
	// launch the request
Function run()->$request : 4D:C1709.HTTPRequest
	$request:=4D:C1709.HTTPRequest.new(This:C1470.options.url; This:C1470.options)
	$request.wait()
	
Function url($url : Text)->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.url:=$url
	$builder:=This:C1470
	
	// MARK:- HTTP methods
Function GET()->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.method:="GET"
	$builder:=This:C1470
	
Function POST()->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.method:="POST"
	$builder:=This:C1470
	
Function PUT()->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.method:="PUT"
	$builder:=This:C1470
	
Function DELETE()->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.method:="DELETE"
	$builder:=This:C1470
	
	// MARK:- shortcuts
	
Function get($url : Text)->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.method:="GET"
	This:C1470.options.url:=$url
	$builder:=This:C1470
	
Function post($url : Text; $body : Variant)->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.method:="POST"
	This:C1470.options.url:=$url
	This:C1470.options.body:=$body
	$builder:=This:C1470
	
Function put($url : Text; $body : Variant)->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.method:="PUT"
	This:C1470.options.url:=$url
	This:C1470.options.body:=$body
	$builder:=This:C1470
	
Function delete($url : Text)->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.method:="DELETE"
	This:C1470.options.url:=$url
	$builder:=This:C1470
	
Function head($url : Text)->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.method:="HEAD"
	This:C1470.options.url:=$url
	$builder:=This:C1470
	
	// MARK:- Headers
Function appendHeader($name : Text; $value : Text)->$builder : cs:C1710.HTTPRequestBuilder
	If (This:C1470.options.headers=Null:C1517)
		This:C1470.options.headers:=New object:C1471
	End if 
	This:C1470.options.headers[$name]:=$value
	$builder:=This:C1470
	
Function appendHeaders($headers : Variant)->$builder : cs:C1710.HTTPRequestBuilder
	If (This:C1470.options.headers=Null:C1517)
		This:C1470.options.headers:=New object:C1471
	End if 
	This:C1470._appendHeaders($headers)
	
	$builder:=This:C1470
	
	// Replace all headers
Function setHeaders($headers : Variant)
	This:C1470.options.headers:=New object:C1471
	This:C1470._appendHeaders($headers)
	
Function _appendHeaders($headers : Variant)
	Case of 
		: (Value type:C1509($headers)=Is object:K8:27)
			var $name : Text
			For each ($name; $headers)
				This:C1470.options.headers[$name]:=String:C10($headers[$name])
			End for each 
			
		: (Value type:C1509($headers)=Is collection:K8:32)
			var $entry : Object
			For each ($entry; $headers)
				This:C1470.options.headers[String:C10($entry.key || $entry.name)]:=String:C10($entry.value)
			End for each 
	End case 
	
	// MARK: - protocol
Function version($version : Integer)->$builder : cs:C1710.HTTPRequestBuilder
	Case of 
		: ($version=1)
			This:C1470.options.protocol:="HTTP1"/*
: ($version=3)
This.options.protocol:="HTTP3"*/
		Else 
			ASSERT:C1129(False:C215; "Unsupported protocol version "+String:C10($version))
	End case 
	$builder:=This:C1470
	
	// MARK:-callback
Function onTerminate($callback : 4D:C1709.Function)->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.onTerminate:=$callback
	$builder:=This:C1470
	
Function onResponse($callback : 4D:C1709.Function)->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.onResponse:=$callback
	$builder:=This:C1470
	
Function onError($callback : 4D:C1709.Function)->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.onError:=$callback
	$builder:=This:C1470
	
Function onHeaders($callback : 4D:C1709.Function)->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.onHeaders:=$callback
	$builder:=This:C1470
	
Function onData($callback : 4D:C1709.Function)->$builder : cs:C1710.HTTPRequestBuilder
	This:C1470.options.onData:=$callback
	$builder:=This:C1470
	
	// TODO: callback on specific status ode
	