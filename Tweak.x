#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SBHIconManager : NSObject
@end

@interface SBHLibrarySearchController : UIViewController
@end

@interface SBRootFolderControllerConfiguration : NSObject
@property NSUInteger folderPageManagementAllowedOrientations;
@property NSUInteger ignoresOverscrollOnLastPageOrientations;
@property NSUInteger sidebarAllowedOrientations;
@end

%hook SBIconController

- (bool)isAppLibrarySupported {
    return true;
}

- (bool)isAppLibraryAllowed {
    return true;
}

- (void)iconManager:(SBHIconManager *)iconManager willUseRootFolderControllerConfiguration:(SBRootFolderControllerConfiguration *)configuration {
    %orig;
    configuration.sidebarAllowedOrientations = 30;
    configuration.folderPageManagementAllowedOrientations = 30;
    configuration.ignoresOverscrollOnLastPageOrientations = 30;
}

%end