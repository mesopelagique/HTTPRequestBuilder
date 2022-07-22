
Class constructor
	This:C1470.requests:=New collection:C1472()
	
Function push($request : 4D:C1709.HTTPRequest)
	This:C1470.requests.push($request)
	
Function wait($time : Real)
	var $request : 4D:C1709.HTTPRequest
	
	If ($time>0)
		
		var $endTime : Real
		$endTime:=Num:C11(Milliseconds:C459)+$time
		
		For each ($request; This:C1470.requests) Until (Num:C11(Milliseconds:C459)>$endTime)
			$request.wait($endTime-Milliseconds:C459)
		End for each 
		
	Else 
		
		For each ($request; This:C1470.requests)
			$request.wait()
		End for each 
		
	End if 
	
Function clear()
	This:C1470.requests.clear()