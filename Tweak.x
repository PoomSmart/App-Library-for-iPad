#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SBHIconManager : NSObject
@end

@interface SBHLibrarySearchController : UIViewController
@end

@interface SBFolderControllerConfiguration : NSObject
@property (assign, nonatomic) NSUInteger allowedOrientations;
@end

@interface SBRootFolderControllerConfiguration : SBFolderControllerConfiguration
@property NSUInteger folderPageManagementAllowedOrientations;
@property NSUInteger ignoresOverscrollOnLastPageOrientations;
@end

@interface SBHLibraryPodFolderControllerConfiguration : SBFolderControllerConfiguration
@end
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
    configuration.folderPageManagementAllowedOrientations = 30;
    configuration.ignoresOverscrollOnLastPageOrientations = 30;
}

%end

%hook SBHLibraryPodFolderControllerConfiguration

- (void)setAllowedOrientations:(NSUInteger)orientation {
    %orig(30);
}

%end