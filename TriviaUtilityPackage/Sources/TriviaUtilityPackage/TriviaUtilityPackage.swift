import Foundation

public class TriviaUtilityPackage
{
    static public let shared = TriviaUtilityPackage()
    
    var isRequestPending = false
    
    // These variables are for the local storage of the trivia question and answer
    var triviaQuestion = String()
    var triviaAnswer = String()

    private init() { }

    public func makeAPIRequest()
    {
        print("It's a miracle inside TriviaUtilityPackage.makeAPIRequest.......")
        
        if isRequestPending {
            return
        }

        isRequestPending = true

        // Make the API HTTPS request...
    }

    public func onReturnAPIRequest()
    {
        print("It's a miracle inside TriviaUtilityPackage.onReturnAPIRequest.......")
        
        isRequestPending = false

        // Do something with request data...
    }
    
    public func generateTriviaFunction() {
        // Make call to API to get a trivia question via REST call.
        let todoEndpoint: String = "https://opentdb.com/api.php?amount=10"
          guard let url = URL(string: todoEndpoint) else {
            print("Error: cannot create URL")
            return
          }
          let urlRequest = URLRequest(url: url)

          // set up the session
          let config = URLSessionConfiguration.default
          let session = URLSession(configuration: config)

          // make the request
          let task = session.dataTask(with: urlRequest) {
            (data, response, error) in
            // check for any errors
            guard error == nil else {
              print("error calling GET on /todos/1")
              print(error!)
              return
            }
            // make sure we got data
            guard let responseData = data else {
              print("Error: did not receive data")
              return
            }
            
            // parse the result as JSON, since that's what the API provides
            do {
              guard let todo = try JSONSerialization.jsonObject(with: responseData, options: [])
                as? [String: Any] else {
                  print("error trying to convert data to JSON")
                  return
              }
                
                //KWB start of MKB code
                let todoResults = todo["results"]
                
                let JSON = todoResults as! NSArray
                let firstResult = JSON[0]
                let firstResultDict = firstResult as! NSDictionary
                
                var i = 1
                
                print("We are now going to print out the name value pairs for JSON[0]")
                for (key, value) in firstResultDict {
                    print(i)
                    print("The key is '\(key)' and the value is '\(value)'.")
                    var updateText = key as! String
                    
                    if("\(key)" == "question")
                    {
                        self.triviaQuestion = "\(value)"
                    }
                    if("\(key)" == "correct_answer")
                    {
                        self.triviaAnswer = "\(value)"
                    }
                    i += 1
                    
                }
                
                print("triviaQuestion:" + self.triviaQuestion + " triviaAnswer:" + self.triviaAnswer)
           
            } catch  {
              print("error trying to convert data to JSON")
              return
            }
          }
          task.resume()
        
        return
    }
    
    public func getTriviaQuestion() -> String{
        return (triviaQuestion)
    }

    public func getTriviaAnswer() -> String{
        return (triviaAnswer)
    }
}
