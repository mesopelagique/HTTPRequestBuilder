# HTTPClassBuilder

## Usage

```4d
var $client : cs.HTTPClient
$client:=cs.HTTPClient.new()
 
// Simple get request
$client.get("https://httpbin.org/")\
.onTerminateF(Formula(ALERT(JSON Stringify($1.response))))\
.run()
````

Simple get request in my class with function receiveHttpBinData as callback

```4d
$client.get("https://httpbin.org/")\
.onTerminate(This.receiveHttpBinData)\
.run()
```

More "complex" request

```4d
$client.request()\
	.GET()\
	.url("https://httpbin.org/")\
	.appendHeader("Toto"; "Totovalue")\
	.version(1)\
	.onTerminate(Formula(ALERT(JSON Stringify($1.response))))\
	.run()
```
