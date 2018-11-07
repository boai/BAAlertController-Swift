//
//  BAPGYResponseModel.h
//  AAAAA
//
//  Created by 孙博岩 on 2018/10/14.
//  Copyright © 2018 boai. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/*
 
 {
     "code":0,
     "message":"",
     "data":{
         "appKey":"094655c816ad6c5265e6c55ce313ce97",
         "userKey":"fd29e4393999d1007145963d2d34a581",
         "appType":"1",
         "appIsLastest":"1",
         "appFileSize":"208303",
         "appName":"AAAAA",
         "appVersion":"1.1.1.1",
         "appVersionNo":"7",
         "appBuildVersion":"8",
         "appIdentifier":"com.yingzi.aaaaa",
         "appIcon":"",
         "appDescription":"",
         "appUpdateDescription":"更新了很多颜色信息！！！",
         "appScreenshots":"",
         "appShortcutUrl":"gcE2",
         "appCreated":"2018-10-14 17:32:10",
         "appUpdated":"2018-10-14 17:32:10",
         "appQRCodeURL":"https://www.pgyer.com/app/qrcodeHistory/4514e84a20d5fcca82756c0279cd491e795ec58723b7e27ac3a9bb2f3134fd63"
     }
 }
 */

@class BAPGYResponseModelData;
@interface BAPGYResponseModel : NSObject

@property(nonatomic, copy) NSString *code;
@property(nonatomic, copy) NSString *message;
@property(nonatomic, strong) BAPGYResponseModelData *data;

@end

@interface BAPGYResponseModelData : NSObject

@property(nonatomic, copy) NSString *appKey;
@property(nonatomic, copy) NSString *userKey;
@property(nonatomic, copy) NSString *appType;
@property(nonatomic, copy) NSString *appIsLastest;
@property(nonatomic, copy) NSString *appFileSize;
@property(nonatomic, copy) NSString *appName;
@property(nonatomic, copy) NSString *appVersion;
@property(nonatomic, copy) NSString *appBuildVersion;
@property(nonatomic, copy) NSString *appIdentifier;
@property(nonatomic, copy) NSString *appIcon;
@property(nonatomic, copy) NSString *appDescription;
@property(nonatomic, copy) NSString *appUpdateDescription;
@property(nonatomic, copy) NSString *appScreenshots;
@property(nonatomic, copy) NSString *appShortcutUrl;
@property(nonatomic, copy) NSString *appCreated;
@property(nonatomic, copy) NSString *appUpdated;
@property(nonatomic, copy) NSString *appQRCodeURL;

/*
 response:
 {
     appUrl = "https://www.pgyer.com/gcE2";
     build = 8;
     downloadURL = "itms-services://?action=download-manifest&url=https://www.pgyer.com/app/plist/b404ae6c242fc33710cf64e9fe596608/update/s.plist";
     haveNewVersion = 1;
     lastBuild = 9;
     releaseNote = "\U66f4\U65b0\U4e86\U5f88\U591a\U989c\U8272\U4fe1\U606f\Uff01\Uff01\Uff01";
     updateDeny = 0;
     version = "1.1.1.2";
 }
 */

@property(nonatomic, copy) NSString *appUrl;
@property(nonatomic, copy) NSString *build;
@property(nonatomic, copy) NSString *downloadURL;
@property(nonatomic, copy) NSString *haveNewVersion;
@property(nonatomic, copy) NSString *lastBuild;
@property(nonatomic, copy) NSString *releaseNote;
@property(nonatomic, copy) NSString *version;

@end

NS_ASSUME_NONNULL_END
