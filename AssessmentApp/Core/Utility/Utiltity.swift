//
//  Utilitity.swift
//  AssessmentApp
//
//  Created by Nisum on 10/18/18.
//  Copyright © 2018 Nisum. All rights reserved.
//

import UIKit
import SwiftyJSON
class Utility: NSObject {

    
    func showAlertView(message: String? , title : String?,preferedStyle :UIAlertController.Style, actions:[UIAlertAction]?,completionHandler :  (() ->Void)? = nil) {
        
        let alertController = UIAlertController(title: title, message: message, preferredStyle: preferedStyle)
        guard let alertActions = actions else {
            addOkAction(alertController: alertController, completionHandler: completionHandler)
            showAlertController(alertController: alertController)
            return
        }
        for action in alertActions{
            alertController.addAction(action)
        }
        showAlertController(alertController: alertController)
    }
    
    private func addOkAction(alertController: UIAlertController,completionHandler :  (() ->Void)? = nil){
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { [weak alertController](action) in
            alertController?.dismiss(animated: true, completion: {
                completionHandler?()
            })
        })
        alertController.addAction(okAction)
    }
    
    private func showAlertController(alertController : UIAlertController){
        
        (UIApplication.shared.windows.first?.rootViewController as? UINavigationController)?.present(alertController, animated: true, completion: nil)
    }
    
    func setup(dictObject : JSON, object: NSObject ){
        
        if let allKeys = object.getAllKeys(){
            for (key,value) in dictObject{
                if allKeys.contains(key.replacingOccurrences(of: "-", with: "_")){
                    castValueForObject(key: key.replacingOccurrences(of: "-", with: "_"), val: value, object: object)
                }
            }
        }
    }
    
    func setupRelationObjects(object:NSObject, key:String, jsonObjects:[JSON]?){
        
        
        let modelName = key.replacingCharacters(in: key.startIndex ... key.startIndex, with: String(key.characters.first!).uppercased())
        
        guard let jsonArray = jsonObjects else {return}
        var array = [Any]()
        for json in jsonArray{
            if let model : NSObject.Type = stringClassFromString(modelName+"Model") as? NSObject.Type{
                let modelObject:NSObject = model.init()
                self.setup(dictObject: json, object: modelObject)
                array.append(modelObject)
            }
        }
        if array.count > 0{
            object.setValue(array, forKey: key)
        }
    }
    func setupRelationObject(object:NSObject, key:String, jsonObjects:JSON?){
        
        let modelName = key.replacingCharacters(in: key.startIndex ... key.startIndex, with: String(key.characters.first!).uppercased())
        guard let json = jsonObjects else {return}
        if let model : NSObject.Type = stringClassFromString(modelName+"Model") as? NSObject.Type{
            let modelObject:NSObject = model.init()
            self.setup(dictObject: json, object: modelObject)
            object.setValue(modelObject, forKey: key)
        }
    }
    
    
    func castValueForObject(key:String,val:JSON, object:NSObject){
        switch val.type {
        case Type.bool: object.setValue(val.bool, forKey: key)
        case Type.number: object.setValue(val.number!, forKey: key)
        case Type.string: object.setValue(val.string!, forKey: key)
        case Type.dictionary: setupRelationObject(object: object, key: key, jsonObjects: val)
        case Type.array :  setupRelationObjects(object: object, key: key, jsonObjects: val.array)
        default: return
            
        }
    }
  
    func stringClassFromString(_ className: String) -> AnyClass! {
    
        /// get namespace
        let namespace = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String;
        
        /// get 'anyClass' with classname and namespace
        let cls: AnyClass = NSClassFromString("\(namespace).\(className)")! as! NSObject.Type;
        
        // return AnyClass!
        return cls;
    }

    func getControllerClass<T>(controller : T)->T{
        return controller.self
    }
    
    func removeCharacterFromKey(replaceChar:String,key:String)->String{
        return key.replacingOccurrences(of: key, with: "")
        
    }
    
   
    
    func creatObjectJson(model:NSObject)->[String:Any]{
        var json : [String : Any] = [:]
        for key in model.getAllKeys()!{
            setValueTypeInJSONObject(key: key, json: &json, object: model)
        }
        return json
    }
    
    func setValueTypeInJSONObject(key:String, json:inout [String:Any],object:NSObject){
        if let objects = object.value(forKey: key) as? [NSObject]{
            var relationalJSONObjects:[[String:Any]] = [[String:Any]]()
            for relationObject in objects{
                relationalJSONObjects.append(creatObjectJson(model: relationObject))
            }
            json[key] = relationalJSONObjects
        }else{
            json[key] = object.value(forKey: key)!
        }
    }
    
    
    func getLocalizeValue(string : String)-> String{
        
        return ""
    }
}
extension NSObject{
    func getAllKeys()->[String]?{
        let allKeys = Mirror(reflecting: self).children.flatMap { $0.label }
        return allKeys
    }
    func unWrapOptionalObject<T>(className : String)-> T?{
    if let unWrapObject = self as? T{
        return unWrapObject
    }
        return nil
    }
}





