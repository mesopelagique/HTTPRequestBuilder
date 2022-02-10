Class constructor
	
	// raw request
Function request()->$builder : cs:C1710.HTTPRequestBuilder
	$builder:=cs:C1710.HTTPRequestBuilder.new(This:C1470)
	
	If (This:C1470.headers#Null:C1517)
		$builder.setHeaders(This:C1470.headers)
	End if 
	If (This:C1470.version#Null:C1517)
		$builder.version(This:C1470.version)
	End if 
	
	// MARK:- shorcuts
	
Function get($url : Text)->$builder : cs:C1710.HTTPRequestBuilder
	$builder:=This:C1470.request().get($url)
	
Function post($url : Text; $body : Variant)->$builder : cs:C1710.HTTPRequestBuilder
	$builder:=This:C1470.request().post($url; $body)
	
Function put($url : Text; $body : Variant)->$builder : cs:C1710.HTTPRequestBuilder
	$builder:=This:C1470.request().put($url; $body)
	
Function delete($url : Text)->$builder : cs:C1710.HTTPRequestBuilder
	$builder:=This:C1470.request().delete($url)
	
Function head($url : Text)->$builder : cs:C1710.HTTPRequestBuilder
	$builder:=This:C1470.request().head($url)