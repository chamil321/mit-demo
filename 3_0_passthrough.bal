import ballerina/http;

http:Client clientEndpoint = new("http://localhost:8080");

service service1 on new http:Listener(9090) {
    resource function newResource(http:Caller caller, http:Request request) returns @untainted error? {
        http:Response response = check clientEndpoint->get("/service2/newResource");
        json jsonPayload = check response.getJsonPayload();
        if (jsonPayload is map<json>) {
            jsonPayload["org"] = "mit";
        }
        error? respond = caller->respond(<@untainted> jsonPayload);
    }
}

service service2 on new http:Listener(8080) {
    resource function newResource(http:Caller caller, http:Request request) {
        json jsonPayload = {task:"writing services", org: "ballerina"};
        error? respond = caller->respond(jsonPayload);
    }
}