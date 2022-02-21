# This is just an example to get you started. A typical binary package
# uses this file as the main entry point of the application.

import jester
import asyncdispatch
import json

when isMainModule:
    routes:
        get "/":
            resp "Hello World!"
        
        get "/users/@id":
            var data = %*{"id": @"id"}
            resp $data, "application/json"
        
        post "/test/@test":
            # var params = request.formData
            # var name = params["name"].body
            var params = request.headers
            var name = params["name"]
            echo name
            var data = %*{"test": @"test"}
            resp $data, "application/json"
        
    runForever()
    
