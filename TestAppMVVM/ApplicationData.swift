//
//  ApplicationData.swift
//  TestAppMVVM
//
//  Created by May Phoo on 30/04/2022.
//

import Foundation
class ApplicationData: NSObject {
    var currentUser: User?;
    var accessToken: String?;
    override init() {
        super.init()
        self.unarchiveUser();
        self.unarchiveAccessToken();
    }
    func archiveAccessToken(){
        if(self.accessToken != nil){
            NSKeyedArchiver.archiveRootObject(self.accessToken, toFile: makeDocumentPath(filename: "accessToken.dat"));
//            NSKeyedArchiver.archivedData(withRootObject: self.accessToken, requiringSecureCoding: false)
        }
    }

    func unarchiveAccessToken(){
        if let token = NSKeyedUnarchiver.unarchiveObject(withFile: makeDocumentPath(filename: "accessToken.dat")) as? String{
            self.accessToken = token;
        }
    }
    func archiveUser(){
        if((self.currentUser) != nil){
            NSKeyedArchiver.archiveRootObject(self.currentUser!, toFile: makeDocumentPath(filename: "currentuser.dat"));
        }
    }

    func unarchiveUser(){
        if let user = NSKeyedUnarchiver.unarchiveObject(withFile: makeDocumentPath(filename: "currentuser.dat")) as? User{
            self.currentUser = User();
            self.currentUser?.userID = user.userID
            self.currentUser?.imgURL = user.imgURL
            self.currentUser?.name = user.name
            self.currentUser?.birthday = user.birthday
            self.currentUser?.email = user.email
            self.currentUser?.currentAddress = user.currentAddress
            self.currentUser?.country = user.country
            self.currentUser?.gender = user.gender
            self.currentUser?.nationality = user.nationality
            self.currentUser?.nrc = user.nrc
            self.currentUser?.nrcImgURL = user.nrcImgURL
            self.currentUser?.primaryPhone = user.primaryPhone
            self.currentUser?.secondaryPhone = user.secondaryPhone
            self.currentUser?.secondaryPhoneDesc = user.secondaryPhoneDesc
            self.currentUser?.occupation = user.occupation
//            self.currentUser?.createdWhen = user.createdWhen
//            self.currentUser?.updatedWhen = user.updatedWhen
            self.currentUser?.userPermission = user.userPermission
//            self.currentUser?.hashcode = user.hashcode
            self.currentUser?.active = user.active
            self.currentUser?.approve = user.approve
            self.currentUser?.block = user.block

        }
    }
}
