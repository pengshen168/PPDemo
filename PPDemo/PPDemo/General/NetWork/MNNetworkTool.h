//
//  MNNetworkTool.h
//  
//
//  Created by 万启鹏 on 2018/4/15.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
typedef NS_ENUM(NSInteger,MNRequestMothed){
    MNRequestMothedGET,
    MNRequestMothedPOST,
};

typedef void (^SuccessBlock)(id responseObj);
typedef void (^FailedBlock)(NSError * _Nonnull error);

@interface MNNetSet : NSObject
@property (nonatomic,assign) MNRequestMothed requestMothed;//默认get
@property (nonatomic,assign) BOOL saveCache;//是否缓存,默认不缓存
@property (nonatomic,assign) BOOL readCache;//是否读取网络缓存,默认不读取
@property (nonatomic,assign) BOOL showSVP;//是否显示网络加载动画,默认不显示
-(instancetype)initWithRequstMothed:(MNRequestMothed)requestMothed
                      SaveCache:(BOOL)saveCache
                          ReadCache:(BOOL)readCache
                            ShowSVP:(BOOL)showSVP NS_DESIGNATED_INITIALIZER;
+(instancetype)saveCache;
+(instancetype)readCache;
+(instancetype)postMethod;
@end

@interface MNNetworkTool : AFHTTPSessionManager

+(instancetype)shareService;

/**
 通用网络请求方法(不带MNNetset)

 @param url url
 @param param 参数
 @param success 成功回调
 @param failed 失败回调

 */
-(void)requstWithUrl:(NSString *)url
               Param:(NSDictionary *)param
             Success:(SuccessBlock)success
              Failed:(FailedBlock)failed;

-(void)requstWithUrl:(NSString *)url
               Param:(NSDictionary *)param
            MNNetSet:(MNNetSet *)mnnetSet
             Success:(SuccessBlock)success
              Failed:(FailedBlock)failed;

-(void)getTokenSuccess:(void (^)(void))success;
-(void)getVideoUrlWithId:(NSString *)Id
                 Success:(void (^)(NSString *url))success;


@end
