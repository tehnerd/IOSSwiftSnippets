//with delegate protocol

import Foundation

class RemoteAPI {
    
    var delegate: RemoteAPIProtocol?
    
    init(){
        
    }
    
    func getRemote(){
            let urlPath = "https://www.remoteEndpoint.com/with/json/response"
            let url = NSURL(string: urlPath)
            var sessionCfg = NSURLSessionConfiguration.defaultSessionConfiguration()
            sessionCfg.HTTPAdditionalHeaders = ["X-Requested-With":"XMLHttpRequest"] //to pass, for example, Django's is_ajax() check
            let session = NSURLSession(configuration: sessionCfg)
            let task = session.dataTaskWithURL(url!, completionHandler: {data, response, error -> Void in
                println("Task completed")
                println(response)
                if(error != nil) {
                    // If there is an error in the web request, print it to the console
                    println(error.localizedDescription)
                }
                var err: NSError?
                
                var jsonResult = NSJSONSerialization.JSONObjectWithData(data, options: NSJSONReadingOptions.MutableContainers, error: &err) as NSArray
                if(err != nil) {
                    // If there is an error parsing JSON, print it to the console
                    println("JSON Error \(err!.localizedDescription)")
                }
                dispatch_async(dispatch_get_main_queue(), {
                    var responseList = [NSDictionary]()
                    for value in jsonResult {
                        let response = value as NSDictionary
                        responseList.append(value as NSDictionary)
                        self.delegate?.didReceiveApiData(responseList)
                    }

                })
            })
            
            task.resume()
        }

}

protocol RemoteAPIProtocol {
    func didReceiveApiData(data: NSArray)
}
