#import <UIKit/UIKit.h>
#import <libcolorpicker.h>
#import "Tweak.h"
#define PLIST_PATH @"/private/var/mobile/Library/Preferences/com.sss136.askunread.plist"

inline bool getPrefBool(NSString *key){
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] boolValue];
}

inline int getPrefInt(NSString *key) {
	return [[[NSDictionary dictionaryWithContentsOfFile:PLIST_PATH] valueForKey:key] intValue];
}

static NSMutableDictionary *prefs = nil;

static NSString *ka = nil;
static NSString *kb = nil;
static NSString *kc = nil;
static NSString *kd = nil;

static void loadPrefs() {

prefs = [[NSMutableDictionary alloc] initWithContentsOfFile:PLIST_PATH];
	ka = [prefs objectForKey:@"changecolor"];
	kb = [prefs objectForKey:@"currentcolor"];
	kc = [prefs objectForKey:@"changebuttoncolor"];
	kd = [prefs objectForKey:@"currentbuttoncolor"];
}

static BOOL enabled;

%hook UITableViewCellContentView
-(instancetype)initWithFrame:(CGRect)frame {
if(getPrefBool(@"enabledd")) {
	self = %orig;
   UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(application)];
        doubleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTap];
	return self;
}
return %orig;
}
%end
%hook UITableViewCellContentView
%new
-(void) application {
   UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
            view = view.presentedViewController;
        }
   if(enabled) {//read mode
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Change Mode"
        message:@"Enable No Read Mode??"
        preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Yes"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
                enabled = FALSE;
            }]];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
            }]];

        [view presentViewController:alertController animated:YES completion:nil];
    }else{
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Change Mode"
        message:@"Enable Read Mode??"
        preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Yes"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
                enabled = TRUE;
            }]];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
            }]];

        [view presentViewController:alertController animated:YES completion:nil];

    }//endif

}
%end

%hook ManagedSquareChat
-(id) notifyServerReadUpToMessage:(id)arg1 chatMID:(id)arg2 completion:(id)arg3 {
    if(!enabled && getPrefBool(@"enabledd")) {
        return nil;
        arg1 = nil;
        arg2 = nil;
        arg3 = nil;
    }
        return %orig;
}
+(void) notifyServerForAllUnsyncedChatsInContext:(id)arg1 {
    if(!enabled && getPrefBool(@"enabledd")) {
        return;
        arg1 = nil;
    }
    return %orig;
}
%end

%hook ManagedChat
-(id) notifyServerReadUpToMessage:(id)arg1 chatMID:(id)arg2 completion:(id)arg3 {
    if(!enabled && getPrefBool(@"enabledd")) {
        return nil;
        arg1 = nil;
        arg2 = nil;
        arg3 = nil;
    }
       return %orig;
}

+(void) notifyServerForAllUnsyncedChatsInContext:(id)arg1 {
    if(!enabled && getPrefBool(@"enabledd")) {
        return;
        arg1 = nil;
    }
    return %orig;
}

%end

//talk list
%hook _TtC4LINE22ChatListViewController
-(void)viewWillAppear:(bool)arg1 {
    if(getPrefBool(@"enabledd")) {
         if(getPrefBool(@"talklist")) {
            %orig;
            if(!getPrefBool(@"hidechange")) {
                UIButton *btn2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            if(getPrefInt(@"sizer1") == 3) {
                btn2.frame = CGRectMake(getPrefInt(@"changesizel1"), 0, getPrefInt(@"changesize1"), getPrefInt(@"changesizeh1"));
            }
            else if(getPrefInt(@"sizer1") == 2){
                btn2.frame = CGRectMake(39, 0, 90, 25);
            }else{
                btn2.frame = CGRectMake(16, 0, 67, 16);
            }
            [btn2 setTitle:@"Change Mode" forState:UIControlStateNormal];
            if(!getPrefBool(@"hideborder1")) {
                if(getPrefBool(@"color1")) {
                    [btn2.layer setBorderColor:(LCPParseColorString(ka, @"868e99")).CGColor];
                }else{
                    [btn2.layer setBorderColor:[UIColor blueColor].CGColor];
                }
                [btn2.layer setBorderWidth:2.0];
                [btn2.layer setCornerRadius:5.0];
            }
            if(getPrefBool(@"textcolor1")) {
                [btn2 setTitleColor:(LCPParseColorString(kc, @"868e99")) forState:UIControlStateNormal];
            }
            btn2.titleLabel.font = [UIFont systemFontOfSize:14];
            btn2.titleLabel.adjustsFontSizeToFitWidth = YES;
            btn2.titleLabel.minimumScaleFactor        = 0.5f;
            [btn2 addTarget:self action:@selector(hoge2:) forControlEvents:UIControlEventTouchDown];
            [self.view addSubview:btn2];
            }

        //currentbutton
            if(!getPrefBool(@"hidecurrent")) {
                UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                if(getPrefInt(@"sizer2") == 3) {//original
                    btn3.frame = CGRectMake(getPrefInt(@"changesizel2"), 0, getPrefInt(@"changesize2"), getPrefInt(@"changesizeh2"));
                }
                else if(getPrefInt(@"sizer2") == 2) {//middle
                    btn3.frame = CGRectMake(252, 0, 90, 25);
                }else{
                    btn3.frame = CGRectMake(288, 0, 67, 15);
                }
                [btn3 setTitle:@"Current Mode" forState:UIControlStateNormal];
                if(!getPrefBool(@"hideborder2")) {
                    if(getPrefBool(@"color2")) {
                        [btn3.layer setBorderColor:(LCPParseColorString(kb, @"868e99")).CGColor];
                    }else{
                        [btn3.layer setBorderColor:[UIColor blueColor].CGColor];
                    }
                [btn3.layer setBorderWidth:2.0];
                [btn3.layer setCornerRadius:5.0];
                }
                if(getPrefBool(@"textcolor2")) {
                    [btn3 setTitleColor:(LCPParseColorString(kd, @"868e99")) forState:UIControlStateNormal];
                }
                btn3.titleLabel.font = [UIFont systemFontOfSize:14];
                btn3.titleLabel.adjustsFontSizeToFitWidth = YES;
                btn3.titleLabel.minimumScaleFactor        = 0.5f;
                [btn3 addTarget:self action:@selector(hoge3:) forControlEvents:UIControlEventTouchDown];
                [self.view addSubview:btn3];
            }
        }
    }
    return %orig;
}
%end

%hook _TtC4LINE22ChatListViewController
%new
-(void)hoge2:(UIButton*)button{
    UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
            view = view.presentedViewController;
        }
    if(enabled) {//read mode
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Change Mode"
        message:@"Enable No Read Mode??"
        preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Yes"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
                enabled = FALSE;
            }]];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {

            }]];

        [view presentViewController:alertController animated:YES completion:nil];
    }else{
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Change Mode"
        message:@"Enable Read Mode??"
        preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Yes"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
                enabled = TRUE;
            }]];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {

            }]];

        [view presentViewController:alertController animated:YES completion:nil];

    }//endif
}//endhoge

%new
-(void)hoge3:(UIButton*)button{
    UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
            view = view.presentedViewController;
        }
    if(enabled) {//read mode
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Current Mode"
        message:@"Current Mode is Read Mode"
        preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
                    
            }]];

        [view presentViewController:alertController animated:YES completion:nil];

    }else{

        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Current Mode"
        message:@"Current Mode is Unread Mode"
        preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {

            }]];

        [view presentViewController:alertController animated:YES completion:nil];

    }//endif
}
%end

//Personal chat

%hook NLGroupHomeViewController
-(void)viewDidLoad {
    if(getPrefBool(@"enabledd")) {
        if(getPrefBool(@"personalchat")) {
            %orig;
            if(!getPrefBool(@"hidechange")) {
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
            if(getPrefInt(@"sizer1") == 3) {
                btn.frame = CGRectMake(getPrefInt(@"changesizel1"), 0, getPrefInt(@"changesize1"), getPrefInt(@"changesizeh1"));
            }
            else if(getPrefInt(@"sizer2") == 2){
                btn.frame = CGRectMake(39, 0, 90, 25);
            }else{
                btn.frame = CGRectMake(16, 0, 67, 16);
            }
            [btn setTitle:@"Change Mode" forState:UIControlStateNormal];
            if(!getPrefBool(@"hideborder1")) {
                if(getPrefBool(@"color1")) {
                    [btn.layer setBorderColor:(LCPParseColorString(ka, @"868e99")).CGColor];
                }else{
                    [btn.layer setBorderColor:[UIColor blueColor].CGColor];
                }
                [btn.layer setBorderWidth:2.0];
                [btn.layer setCornerRadius:5.0];
            }
            if(getPrefBool(@"textcolor1")) {
                [btn setTitleColor:(LCPParseColorString(kc, @"868e99")) forState:UIControlStateNormal];
            }
            btn.titleLabel.font = [UIFont systemFontOfSize:14];
            btn.titleLabel.adjustsFontSizeToFitWidth = YES;
            btn.titleLabel.minimumScaleFactor        = 0.5f;
            [btn addTarget:self action:@selector(hoge:) forControlEvents:UIControlEventTouchDown];
            [self.view addSubview:btn];
            }

        //currentbutton
            if(!getPrefBool(@"hidecurrent")) {
                UIButton *btn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                if(getPrefInt(@"sizer2") == 3) {
                    btn1.frame = CGRectMake(getPrefInt(@"changesizel2"), 0, getPrefInt(@"changesize2"), getPrefInt(@"changesizeh2"));
                }
                else if(getPrefInt(@"sizer2") == 2){
                    btn1.frame = CGRectMake(252, 0, 90, 25);
                }else{
                    btn1.frame = CGRectMake(288, 0, 67, 15);
                }
                [btn1 setTitle:@"Current Mode" forState:UIControlStateNormal];
                if(!getPrefBool(@"hideborder2")) {
                    if(getPrefBool(@"color2")) {
                        [btn1.layer setBorderColor:(LCPParseColorString(kb, @"868e99")).CGColor];
                    }else{
                        [btn1.layer setBorderColor:[UIColor blueColor].CGColor];
                    }
                [btn1.layer setBorderWidth:2.0];
                [btn1.layer setCornerRadius:5.0];
                }
                if(getPrefBool(@"textcolor2")) {
                    [btn1 setTitleColor:(LCPParseColorString(kd, @"868e99")) forState:UIControlStateNormal];
                }
                btn1.titleLabel.font = [UIFont systemFontOfSize:14];
                btn1.titleLabel.adjustsFontSizeToFitWidth = YES;
                btn1.titleLabel.minimumScaleFactor        = 0.5f;
                [btn1 addTarget:self action:@selector(hoge1:) forControlEvents:UIControlEventTouchDown];
                [self.view addSubview:btn1];
            }
        }
    }
    return %orig;
}
%end

%hook NLGroupHomeViewController
%new
-(void)hoge:(UIButton*)button{

    UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
            view = view.presentedViewController;
        }

    if(enabled) {//read mode
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Change Mode"
        message:@"Enable No Read Mode??"
        preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"Yes"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
                enabled = FALSE;
            }]];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {

            }]];

        [view presentViewController:alertController animated:YES completion:nil];

    }else{

        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Change Mode"
        message:@"Enable Read Mode??"
        preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Yes"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
                enabled = TRUE;
            }]];

        [alertController addAction:[UIAlertAction actionWithTitle:@"Cancel"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {

            }]];

        [view presentViewController:alertController animated:YES completion:nil];

    }//endif
}//endhoge
%new
-(void)hoge1:(UIButton*)button{
    UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
            view = view.presentedViewController;
        }
    if(enabled) {//read mode
        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Current Mode"
        message:@"Current Mode is Read Mode"
        preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {
                            
            }]];

        [view presentViewController:alertController animated:YES completion:nil];

    }else{

        UIAlertController *alertController =
        [UIAlertController alertControllerWithTitle:@"Current Mode"
        message:@"Current Mode is Unread Mode"
        preferredStyle:UIAlertControllerStyleAlert];

        [alertController addAction:[UIAlertAction actionWithTitle:@"OK"
            style:UIAlertActionStyleDefault
            handler:^(UIAlertAction *action) {

            }]];

        [view presentViewController:alertController animated:YES completion:nil];

    }//endif
}
%end

%ctor {
    loadPrefs();
}
