# Mit-demo

- This is the source code for ballerina HTTP service demo which is compatible for ballerina v1.1.0

## Steps to follow
- install ballerina
- install VSCode ballerina plugin

### Create project

    - $ mkdir mit
    - $ cd mit
    - $ ballerina new demo
    - $ cd demo

### Create module 1
    - $ ballerina add client_invocation
    - update the write the client invocation code as in 1_0_client_invocation.bal in the main.bal file

- build the module
    - $ ballerina build client_invocation
    - $ ballerina run target/bin/client_invocation.jar

- Check the output

### Create module 2
    - $ ballerina add hello_world
    - update the write the simple hello world code as in 2_0_hello_world.bal in the main.bal file

- build the module
    - $ ballerina build hello_world
    - $ ballerina run target/bin/hello_world.jar

- Invoke the service
```
curl -v http://0.0.0.0:9090/myService/logic

```
- Check for the response
```
> GET /myService/logic HTTP/1.1
> Host: 0.0.0.0:9090
> User-Agent: curl/7.64.1
> Accept: */*
> 
< HTTP/1.1 200 OK
< content-type: text/plain
< content-length: 12
< server: ballerina/1.1.0
< date: Tue, 7 Jan 2020 09:22:31 +0530
< 
* Connection #0 to host 0.0.0.0 left intact
Hello world!* Closing connection 0

```

### Create module 3
    - $ ballerina add passthrough
    - update the write the simple passthrough service code as in 3_0_passthrough.bal in the main.bal file

- build the module
    - $ ballerina build passthrough
    - $ ballerina run target/bin/passthrough.jar

- Invoke the service
```
curl -v http://0.0.0.0:9090/service1/newResource

```
- Check for the response
```
> GET /service1/newResource HTTP/1.1
> Host: 0.0.0.0:9090
> User-Agent: curl/7.64.1
> Accept: */*
> 
< HTTP/1.1 200 OK
< content-type: application/json
< content-length: 40
< server: ballerina/1.1.0
< date: Tue, 7 Jan 2020 10:30:54 +0530
< 
* Connection #0 to host 0.0.0.0 left intact
{"task":"writing services", "org":"mit"}
```
## Writing your own client
https://github.com/ldclakmal/module-shoutout
https://github.com/ldclakmal/ballerina-samples

## Download NATS here
https://nats.io/download/nats-io/nats-server/ 

## Ballerina NATS example
https://ballerina.io/learn/by-example/nats-basic-client.html
