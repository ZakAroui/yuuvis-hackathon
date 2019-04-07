//
//  JuuvisRestClient.swift
//  data-avengers
//
//  Created by Zack Aroui on 4/6/19.
//  Copyright © 2019 Zack Aroui. All rights reserved.
//

import Foundation
import Alamofire

class JuuvisRestClient {
    
    let yuuvisSearch: String = "https://yuuvis.io/api/dms/objects/search"
    let yvDocMeta: String = "https://yuuvis.io/api/dms/objects/726fe955-b7c7-45f8-a0ce-70e04975cdc7"
    let yvDocContent: String = "https://yuuvis.io/api/dms/objects/726fe955-b7c7-45f8-a0ce-70e04975cdc7/contents/file"
    let yvDocUpload: String = "https://yuuvis.io/api/dms/objects"
    
    func getDocMeta(completion: @escaping ([YuuvisDoc]?) -> Void, teamId: String){
        //        let thisTeamSocial = teamSocial + teamId
        
        let headers: HTTPHeaders = [
            "Authorization": "Basic YWRtaW46cmp1TVBBTFdjblVT",
            "Accept": "application/json",
            "X-ID-TENANT-NAME": "nyc007"
        ]
        
        Alamofire.request(yvDocMeta, headers: headers)
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("couldn't get /search")
                    return
                }
                
                guard let value = response.result.value as? [String: Any],
                    let results = value["objects"] as? [[String: Any]] else {
                        print("Malformed data received from /social.json service")
                        return
                }
                
                print("we are at getmeta")
                
                //                let teamSocials = results.compactMap { socialDict in
                //                    return TeamSocial(jsonData: socialDict) }
                //
                //                completion(teamSocials)
        }
    }
    
    func searchDocs(completion: @escaping ([YuuvisDoc]?) -> Void, teamId: String){
//        let thisTeamSocial = teamSocial + teamId
        
        let headers: HTTPHeaders = [
            "Authorization": "Basic YWRtaW46cmp1TVBBTFdjblVT",
            "Accept": "application/json",
            "Content-Type": "application/json",
            "X-ID-TENANT-NAME": "nyc007"
        ]
        
        let parameters: Parameters = [
            "statement": "SELECT * FROM enaio:object",
            "skipCount": 0,
            "maxItems": 50
        ]
        
        let parameters1: Parameters = [
            "query": parameters
        ]
        
        Alamofire.request(yuuvisSearch, method: .post, parameters: parameters1, encoding: JSONEncoding.default, headers: headers)
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("couldn't get /search")
                    return
                }
                
                guard let value = response.result.value as? [String: Any],
                    let results = value["objects"] as? [[String: Any]] else {
                        print("Malformed data received from /search service")
                        return
                }
                
                print("we are at search")
                
//                let teamSocials = results.compactMap { socialDict in
//                    return TeamSocial(jsonData: socialDict) }
//
//                completion(teamSocials)
        }
    }
    
    func downloadDoc(completion: @escaping ([YuuvisDoc]?) -> Void, teamId: String){
        //        let thisTeamSocial = teamSocial + teamId
        
        let headers: HTTPHeaders = [
            "Authorization": "Basic YWRtaW46cmp1TVBBTFdjblVT",
            "Accept": "application/json",
            "Content-Type": "application/json",
            "X-ID-TENANT-NAME": "nyc007"
        ]
        
        let destination = DownloadRequest.suggestedDownloadDestination()
        
//        let dest: DownloadRequest.DownloadFileDestination = { _, _ in
//            var documentsURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0]
//            documentsURL.appendPathComponent("_yuuvis")
//            return (documentsURL, [.removePreviousFile])
//        }
        
        Alamofire.download(yvDocContent, method: .get, headers: headers, to: destination)
            .responseJSON { response in
                guard response.result.isSuccess else {
                    print("couldn't get /content")
                    return
                }
                
                guard let value = response.result.value as? [String: Any],
                    let results = value["objects"] as? [[String: Any]] else {
                        print("Malformed data received from /content service")
                        return
                }
                
                print("we are at content")
                
                //                let teamSocials = results.compactMap { socialDict in
                //                    return TeamSocial(jsonData: socialDict) }
                //
                //                completion(teamSocials)
        }
    }
    
    func uploadDoc(imageData: Data?, onCompletion: ((String?) -> Void)? = nil, onError: ((Error?) -> Void)? = nil){
        
        let headers: HTTPHeaders = [
            "Authorization": "Basic YWRtaW46cmp1TVBBTFdjblVT",
//            "Accept": "application/json",
            "Content-Type": "multipart/form-data",
            "X-ID-TENANT-NAME": "nyc007"
        ]
        
        let dataUrl = Bundle.main.url(forResource: "testMetadata", withExtension: "json")
        let fileUrl = Bundle.main.url(forResource: "Team_Star-Track", withExtension: "jpg")
        
        Alamofire.upload(multipartFormData: { multipartFormData in
            multipartFormData.append(dataUrl!, withName: "data")
            multipartFormData.append(fileUrl!, withName: "cid_63apple")
                    }, usingThreshold: UInt64.init(), to: yvDocUpload, method: .post, headers: headers) { (result) in
            switch result{
            case .success(let upload, _, _):
                upload.responseJSON { response in
                    print("Succesfully uploaded")
                    if let err = response.error{
                        onError?(err)
                        return
                    }
                    onCompletion?(nil)
                }
            case .failure(let error):
                print("Error in upload: \(error.localizedDescription)")
                onError?(error)
            }
        }
    }

    
}
