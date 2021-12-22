import Foundation


class BaseResult : Codable {
    
    internal let kSuccessKey: String = "success"
    internal let kMessageKey: String = "message"
    
    var message:String?
    var success:Bool?
    
    
    enum CodingKeys:String,CodingKey {
        case message = "message"
        case success = "success"
    }
}

class ResultDefault<T>: BaseResult  {
    var data : T?
    
    enum CodingKeys:String,CodingKey {
        case data = "data"
    }
    
}

class Result<T:Codable>: BaseResult {
    
    var data : T?
    
    enum CodingKeys:String,CodingKey {
        case data = "data"
    }
}


class ResultArray<T:Codable>: BaseResult {
    var data:[T]?
    
    enum CodingKeys:String,CodingKey {
        case data = "data"
    }
    
}


