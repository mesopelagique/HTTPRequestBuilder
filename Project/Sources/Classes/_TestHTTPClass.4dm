

Class constructor
	This:C1470.client:=cs:C1710.HTTPClient.new()
	
Function run()
	This:C1470.client.get("https://httpbin.org/")\
		.onTerminate(This:C1470.receiveCallback)\
		.run()
	
Function receiveCallback($response : Object; $event : Object)
	ALERT:C41(JSON Stringify:C1217($response.response; *))