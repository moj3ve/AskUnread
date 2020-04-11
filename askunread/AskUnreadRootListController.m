#include "AskUnreadRootListController.h"
#include "BC.h"
#import <spawn.h>

@implementation AskUnreadRootListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Root" target:self];
	}

	return _specifiers;
}

@synthesize respringButton;

- (instancetype)init {
    self = [super init];

    if (self) {
        HBAppearanceSettings *appearanceSettings = [[HBAppearanceSettings alloc] init];
        appearanceSettings.tintColor = [UIColor colorWithRed:0.8f green:0.1f blue:0.1f alpha:1];
        appearanceSettings.tableViewCellSeparatorColor = [UIColor
colorWithRed:0.8f green:0.3f blue:0.1f alpha:0.5];
        self.hb_appearanceSettings = appearanceSettings;
        self.respringButton = [[UIBarButtonItem alloc] initWithTitle:@"Apply" 
                                    style:UIBarButtonItemStylePlain
                                    target:self 
                                    action:@selector(resp)];
        self.respringButton.tintColor = [UIColor redColor];
        self.navigationItem.rightBarButtonItem = self.respringButton;
    }

    return self;
}
-(void)resp {

BKSTerminateApplicationForReasonAndReportWithDescription(@"jp.naver.line", 5, false, NULL);

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"line://"]];

}

-(void) twitter
{
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://mobile.twitter.com/DevTweak"]];
} 

-(void) github {

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"https://sss136.github.io/"]];

}

@end
