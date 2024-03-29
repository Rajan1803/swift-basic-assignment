//
//  URLRequest+Extension.swift
//  UIComponets
//
//  Created by Rajan Patel on 29/06/23.
//

import Foundation


extension URLRequest {
    mutating func setMultipartFormData(params: [String: (String, filename: String?)]) -> Data {
           let boundary = UUID().uuidString

           setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")

           var body = Data()

           for (key, (data, filename)) in params {
               body.append("--\(boundary)\r\n")

               if let filename = filename {
                   body.append("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(filename)\"\r\n")
               }
               else {
//                   body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n")
               }

               body.append("\r\n")
               body.append(data)
               body.append("\r\n")
           }

           body.append("--\(boundary)--")
           return body
       }
       
       mutating func setMultipartFormDataBinaryImage(params: [String: (Data, filename: String?)]) -> Data {
           let boundary = UUID().uuidString
           
           setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
           
           var body = Data()
           
           for (key, (data, filename)) in params {
               body.append("--\(boundary)\r\n")
               
               if let filename = filename {
                   body.append("Content-Disposition: form-data; name=\"\(key)\"; filename=\"\(filename)\"\r\n")
               }
               else {
                   body.append("Content-Disposition: form-data; name=\"\(key)\"\r\n")
               }
               
               body.append("Content-Type: image/png\r\n")
               body.append("\r\n")
               body.append(data)
               body.append("\r\n")
           }
           
           body.append("--\(boundary)--")
           return body
       }
   }


extension Data {
    mutating func append(_ s: String) {
        self.append((s.data(using: .utf8) ?? Data()))
                    
    }
}
