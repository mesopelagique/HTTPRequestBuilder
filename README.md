# HTTPClassBuilder

## Usage

```4d
var $client : cs.HTTPClient
$client:=cs.HTTPClient.new()
```

### Simple get request

```4d
$client.get("https://httpbin.org/")\
  .onTerminate(Formula(ALERT(JSON Stringify($1.response))))\
  .build()\
  .wait()
````

or just getting request without waiting async

```4d
var $request: 4D.HTTPREquest
$request:=$client.get("https://httpbin.org/")\
  .onTerminate(Formula(ALERT(JSON Stringify($1.response))))\
  .build()
````

### Simple get request in my class with function receiveHttpBinData as callback

```4d
Class constructor
  This:C1470.client:=cs:C1710.HTTPClient.new()
```
```4d
Function receiveHttpBinData($response : Object; $event : Object)
  // ...
```
```4d
Function run()
  $client.get("https://httpbin.org/")\
    .onTerminate(This.receiveHttpBinData)\
    .build()\
    .wait()
```

### More "complex" request

```4d
$client.request()\
	.GET()\
	.url("https://httpbin.org/")\
	.appendHeader("Toto"; "Totovalue")\
	.version(1)\
	.onTerminate(Formula(ALERT(JSON Stringify($1.response))))\
	.build()\
	.wait()
```
