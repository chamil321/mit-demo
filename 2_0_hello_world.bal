import ballerina/http;

listener http:Listener listenerEndpoint = new(9090); //host 0.0.0.0:9090

@http:ServiceConfig {
    basePath: "myService"
}
service hello on listenerEndpoint {

    @http:ResourceConfig {
        methods: ["GET"],
        path : "logic"
    }
    resource function sayHello(http:Caller caller, http:Request request) {
        http:Response response = new;
        response.setTextPayload("Hello world!");
        error? respond = caller->respond(response);
    }
}