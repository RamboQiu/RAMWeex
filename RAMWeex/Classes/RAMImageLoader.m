
#import "RAMImageLoader.h"
#import <SDWebImageManager.h>

@implementation RAMImageLoader

-(id<WXImageOperationProtocol>)downloadImageWithURL:(NSString *)url imageFrame:(CGRect)imageFrame userInfo:(NSDictionary *)options completed:(void (^)(UIImage *, NSError *, BOOL))completedBlock{
    if ([url containsString:@"aos="] && [url containsString:@"ios="]) {
        //url
        NSString *url0 = [[url componentsSeparatedByString:@"/"] lastObject];
        ///约定的协议为<img url="aos=img1&ios=img2"></img>
        NSString *url1 = [[url0 componentsSeparatedByString:@"&"] objectAtIndex:1]; ///ios=img2
        NSString *url2 = [[url1 componentsSeparatedByString:@"="] objectAtIndex:1];
        UIImage *image = [UIImage imageNamed:url2];
        completedBlock(image,nil,YES);
        return self;
    }
    if ([url hasPrefix:@"//"]) {
        url = [@"http:" stringByAppendingString:url];
    }
    return (id<WXImageOperationProtocol>)[[SDWebImageManager sharedManager] downloadImageWithURL:[NSURL URLWithString:url] options:0 progress:^(NSInteger receivedSize, NSInteger expectedSize) {
    } completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
        if (completedBlock) {
            completedBlock(image, error, finished);
        }
    }];
}

- (void)cancel {
    //TODO
}

@end
