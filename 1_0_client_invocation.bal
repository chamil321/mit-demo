import ballerina/http;
import ballerina/io;

public function main() {
    http:Client clientEndpoint = new("http://postman-echo.com");

    http:Request req = new;
    req.setHeader("x-mit", "balleina");
    http:Response|error response = clientEndpoint->get("/get?test=123", message = req);

    if (response is http:Response) {
        json|error jsonPayload = response.getJsonPayload();

        if (jsonPayload is json) {
            io:println(jsonPayload.toJsonString());
        } else {
            io:println("Invalid payload received: ", jsonPayload.reason());
        }
    } else {
        io:println("Error when calling the backend: ", response.reason());
    }

}
