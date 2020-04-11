#line 1 "Tweak.xm"
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
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


#include <substrate.h>
#if defined(__clang__)
#if __has_feature(objc_arc)
#define _LOGOS_SELF_TYPE_NORMAL __unsafe_unretained
#define _LOGOS_SELF_TYPE_INIT __attribute__((ns_consumed))
#define _LOGOS_SELF_CONST const
#define _LOGOS_RETURN_RETAINED __attribute__((ns_returns_retained))
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif
#else
#define _LOGOS_SELF_TYPE_NORMAL
#define _LOGOS_SELF_TYPE_INIT
#define _LOGOS_SELF_CONST
#define _LOGOS_RETURN_RETAINED
#endif

@class _TtC4LINE22ChatListViewController; @class ManagedChat; @class UITableViewCellContentView; @class NLGroupHomeViewController; @class ManagedSquareChat; 
static UITableViewCellContentView* (*_logos_orig$_ungrouped$UITableViewCellContentView$initWithFrame$)(_LOGOS_SELF_TYPE_INIT UITableViewCellContentView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static UITableViewCellContentView* _logos_method$_ungrouped$UITableViewCellContentView$initWithFrame$(_LOGOS_SELF_TYPE_INIT UITableViewCellContentView*, SEL, CGRect) _LOGOS_RETURN_RETAINED; static void _logos_method$_ungrouped$UITableViewCellContentView$application(_LOGOS_SELF_TYPE_NORMAL UITableViewCellContentView* _LOGOS_SELF_CONST, SEL); static id (*_logos_orig$_ungrouped$ManagedSquareChat$notifyServerReadUpToMessage$chatMID$completion$)(_LOGOS_SELF_TYPE_NORMAL ManagedSquareChat* _LOGOS_SELF_CONST, SEL, id, id, id); static id _logos_method$_ungrouped$ManagedSquareChat$notifyServerReadUpToMessage$chatMID$completion$(_LOGOS_SELF_TYPE_NORMAL ManagedSquareChat* _LOGOS_SELF_CONST, SEL, id, id, id); static void (*_logos_meta_orig$_ungrouped$ManagedSquareChat$notifyServerForAllUnsyncedChatsInContext$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static void _logos_meta_method$_ungrouped$ManagedSquareChat$notifyServerForAllUnsyncedChatsInContext$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static id (*_logos_orig$_ungrouped$ManagedChat$notifyServerReadUpToMessage$chatMID$completion$)(_LOGOS_SELF_TYPE_NORMAL ManagedChat* _LOGOS_SELF_CONST, SEL, id, id, id); static id _logos_method$_ungrouped$ManagedChat$notifyServerReadUpToMessage$chatMID$completion$(_LOGOS_SELF_TYPE_NORMAL ManagedChat* _LOGOS_SELF_CONST, SEL, id, id, id); static void (*_logos_meta_orig$_ungrouped$ManagedChat$notifyServerForAllUnsyncedChatsInContext$)(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static void _logos_meta_method$_ungrouped$ManagedChat$notifyServerForAllUnsyncedChatsInContext$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST, SEL, id); static void (*_logos_orig$_ungrouped$_TtC4LINE22ChatListViewController$viewWillAppear$)(_LOGOS_SELF_TYPE_NORMAL _TtC4LINE22ChatListViewController* _LOGOS_SELF_CONST, SEL, bool); static void _logos_method$_ungrouped$_TtC4LINE22ChatListViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL _TtC4LINE22ChatListViewController* _LOGOS_SELF_CONST, SEL, bool); static void _logos_method$_ungrouped$_TtC4LINE22ChatListViewController$hoge2$(_LOGOS_SELF_TYPE_NORMAL _TtC4LINE22ChatListViewController* _LOGOS_SELF_CONST, SEL, UIButton*); static void _logos_method$_ungrouped$_TtC4LINE22ChatListViewController$hoge3$(_LOGOS_SELF_TYPE_NORMAL _TtC4LINE22ChatListViewController* _LOGOS_SELF_CONST, SEL, UIButton*); static void (*_logos_orig$_ungrouped$NLGroupHomeViewController$viewDidLoad)(_LOGOS_SELF_TYPE_NORMAL NLGroupHomeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$NLGroupHomeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL NLGroupHomeViewController* _LOGOS_SELF_CONST, SEL); static void _logos_method$_ungrouped$NLGroupHomeViewController$hoge$(_LOGOS_SELF_TYPE_NORMAL NLGroupHomeViewController* _LOGOS_SELF_CONST, SEL, UIButton*); static void _logos_method$_ungrouped$NLGroupHomeViewController$hoge1$(_LOGOS_SELF_TYPE_NORMAL NLGroupHomeViewController* _LOGOS_SELF_CONST, SEL, UIButton*); 

#line 33 "Tweak.xm"

static UITableViewCellContentView* _logos_method$_ungrouped$UITableViewCellContentView$initWithFrame$(_LOGOS_SELF_TYPE_INIT UITableViewCellContentView* __unused self, SEL __unused _cmd, CGRect frame) _LOGOS_RETURN_RETAINED {
if(getPrefBool(@"enabledd")) {
	self = _logos_orig$_ungrouped$UITableViewCellContentView$initWithFrame$(self, _cmd, frame);
   UITapGestureRecognizer* doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(application)];
        doubleTap.numberOfTapsRequired = 2;
        [self addGestureRecognizer:doubleTap];
	return self;
}
return _logos_orig$_ungrouped$UITableViewCellContentView$initWithFrame$(self, _cmd, frame);
}



static void _logos_method$_ungrouped$UITableViewCellContentView$application(_LOGOS_SELF_TYPE_NORMAL UITableViewCellContentView* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {

   UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
                view = view.presentedViewController;
        }
   if(enabled) {
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

}

}



static id _logos_method$_ungrouped$ManagedSquareChat$notifyServerReadUpToMessage$chatMID$completion$(_LOGOS_SELF_TYPE_NORMAL ManagedSquareChat* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3) {
    if(!enabled && getPrefBool(@"enabledd")) {
        return nil;
        arg1 = nil;
        arg2 = nil;
        arg3 = nil;
    }
        return _logos_orig$_ungrouped$ManagedSquareChat$notifyServerReadUpToMessage$chatMID$completion$(self, _cmd, arg1, arg2, arg3);
}
static void _logos_meta_method$_ungrouped$ManagedSquareChat$notifyServerForAllUnsyncedChatsInContext$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    if(!enabled && getPrefBool(@"enabledd")) {
        return;
        arg1 = nil;
    }
    return _logos_meta_orig$_ungrouped$ManagedSquareChat$notifyServerForAllUnsyncedChatsInContext$(self, _cmd, arg1);
}



static id _logos_method$_ungrouped$ManagedChat$notifyServerReadUpToMessage$chatMID$completion$(_LOGOS_SELF_TYPE_NORMAL ManagedChat* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1, id arg2, id arg3) {
    if(!enabled && getPrefBool(@"enabledd")) {
        return nil;
        arg1 = nil;
        arg2 = nil;
        arg3 = nil;
    }
       return _logos_orig$_ungrouped$ManagedChat$notifyServerReadUpToMessage$chatMID$completion$(self, _cmd, arg1, arg2, arg3);
}

static void _logos_meta_method$_ungrouped$ManagedChat$notifyServerForAllUnsyncedChatsInContext$(_LOGOS_SELF_TYPE_NORMAL Class _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, id arg1) {
    if(!enabled && getPrefBool(@"enabledd")) {
        return;
        arg1 = nil;
    }
    return _logos_meta_orig$_ungrouped$ManagedChat$notifyServerForAllUnsyncedChatsInContext$(self, _cmd, arg1);
}





static void _logos_method$_ungrouped$_TtC4LINE22ChatListViewController$viewWillAppear$(_LOGOS_SELF_TYPE_NORMAL _TtC4LINE22ChatListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, bool arg1) {
    if(getPrefBool(@"enabledd")) {
         if(getPrefBool(@"talklist")) {
            _logos_orig$_ungrouped$_TtC4LINE22ChatListViewController$viewWillAppear$(self, _cmd, arg1);
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

        
            if(!getPrefBool(@"hidecurrent")) {
                UIButton *btn3 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
                    if(getPrefInt(@"sizer2") == 3) {
                        btn3.frame = CGRectMake(getPrefInt(@"changesizel2"), 0, getPrefInt(@"changesize2"), getPrefInt(@"changesizeh2"));
                    }
                    else if(getPrefInt(@"sizer2") == 2) {
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
    return _logos_orig$_ungrouped$_TtC4LINE22ChatListViewController$viewWillAppear$(self, _cmd, arg1);
}




static void _logos_method$_ungrouped$_TtC4LINE22ChatListViewController$hoge2$(_LOGOS_SELF_TYPE_NORMAL _TtC4LINE22ChatListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton* button){
    UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
                view = view.presentedViewController;
        }
   if(enabled) {
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

}
}

static void _logos_method$_ungrouped$_TtC4LINE22ChatListViewController$hoge3$(_LOGOS_SELF_TYPE_NORMAL _TtC4LINE22ChatListViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton* button){
    UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
                view = view.presentedViewController;
        }
   if(enabled) {
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

}
}





static void _logos_method$_ungrouped$NLGroupHomeViewController$viewDidLoad(_LOGOS_SELF_TYPE_NORMAL NLGroupHomeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd) {
    if(getPrefBool(@"enabledd")) {
        if(getPrefBool(@"personalchat")) {
            _logos_orig$_ungrouped$NLGroupHomeViewController$viewDidLoad(self, _cmd);
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
    return _logos_orig$_ungrouped$NLGroupHomeViewController$viewDidLoad(self, _cmd);
}




static void _logos_method$_ungrouped$NLGroupHomeViewController$hoge$(_LOGOS_SELF_TYPE_NORMAL NLGroupHomeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton* button){
    UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
                view = view.presentedViewController;
        }
   if(enabled) {
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

}
}

static void _logos_method$_ungrouped$NLGroupHomeViewController$hoge1$(_LOGOS_SELF_TYPE_NORMAL NLGroupHomeViewController* _LOGOS_SELF_CONST __unused self, SEL __unused _cmd, UIButton* button){
    UIViewController *view = [UIApplication sharedApplication].keyWindow.rootViewController;
        while (view.presentedViewController != nil && !view.presentedViewController.isBeingDismissed) {
                view = view.presentedViewController;
        }
   if(enabled) {
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

}
}



static __attribute__((constructor)) void _logosLocalCtor_22a1b6cf(int __unused argc, char __unused **argv, char __unused **envp) {
    loadPrefs();
}
static __attribute__((constructor)) void _logosLocalInit() {
{Class _logos_class$_ungrouped$UITableViewCellContentView = objc_getClass("UITableViewCellContentView"); MSHookMessageEx(_logos_class$_ungrouped$UITableViewCellContentView, @selector(initWithFrame:), (IMP)&_logos_method$_ungrouped$UITableViewCellContentView$initWithFrame$, (IMP*)&_logos_orig$_ungrouped$UITableViewCellContentView$initWithFrame$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$UITableViewCellContentView, @selector(application), (IMP)&_logos_method$_ungrouped$UITableViewCellContentView$application, _typeEncoding); }Class _logos_class$_ungrouped$ManagedSquareChat = objc_getClass("ManagedSquareChat"); Class _logos_metaclass$_ungrouped$ManagedSquareChat = object_getClass(_logos_class$_ungrouped$ManagedSquareChat); MSHookMessageEx(_logos_class$_ungrouped$ManagedSquareChat, @selector(notifyServerReadUpToMessage:chatMID:completion:), (IMP)&_logos_method$_ungrouped$ManagedSquareChat$notifyServerReadUpToMessage$chatMID$completion$, (IMP*)&_logos_orig$_ungrouped$ManagedSquareChat$notifyServerReadUpToMessage$chatMID$completion$);MSHookMessageEx(_logos_metaclass$_ungrouped$ManagedSquareChat, @selector(notifyServerForAllUnsyncedChatsInContext:), (IMP)&_logos_meta_method$_ungrouped$ManagedSquareChat$notifyServerForAllUnsyncedChatsInContext$, (IMP*)&_logos_meta_orig$_ungrouped$ManagedSquareChat$notifyServerForAllUnsyncedChatsInContext$);Class _logos_class$_ungrouped$ManagedChat = objc_getClass("ManagedChat"); Class _logos_metaclass$_ungrouped$ManagedChat = object_getClass(_logos_class$_ungrouped$ManagedChat); MSHookMessageEx(_logos_class$_ungrouped$ManagedChat, @selector(notifyServerReadUpToMessage:chatMID:completion:), (IMP)&_logos_method$_ungrouped$ManagedChat$notifyServerReadUpToMessage$chatMID$completion$, (IMP*)&_logos_orig$_ungrouped$ManagedChat$notifyServerReadUpToMessage$chatMID$completion$);MSHookMessageEx(_logos_metaclass$_ungrouped$ManagedChat, @selector(notifyServerForAllUnsyncedChatsInContext:), (IMP)&_logos_meta_method$_ungrouped$ManagedChat$notifyServerForAllUnsyncedChatsInContext$, (IMP*)&_logos_meta_orig$_ungrouped$ManagedChat$notifyServerForAllUnsyncedChatsInContext$);Class _logos_class$_ungrouped$_TtC4LINE22ChatListViewController = objc_getClass("_TtC4LINE22ChatListViewController"); MSHookMessageEx(_logos_class$_ungrouped$_TtC4LINE22ChatListViewController, @selector(viewWillAppear:), (IMP)&_logos_method$_ungrouped$_TtC4LINE22ChatListViewController$viewWillAppear$, (IMP*)&_logos_orig$_ungrouped$_TtC4LINE22ChatListViewController$viewWillAppear$);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton*), strlen(@encode(UIButton*))); i += strlen(@encode(UIButton*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$_TtC4LINE22ChatListViewController, @selector(hoge2:), (IMP)&_logos_method$_ungrouped$_TtC4LINE22ChatListViewController$hoge2$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton*), strlen(@encode(UIButton*))); i += strlen(@encode(UIButton*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$_TtC4LINE22ChatListViewController, @selector(hoge3:), (IMP)&_logos_method$_ungrouped$_TtC4LINE22ChatListViewController$hoge3$, _typeEncoding); }Class _logos_class$_ungrouped$NLGroupHomeViewController = objc_getClass("NLGroupHomeViewController"); MSHookMessageEx(_logos_class$_ungrouped$NLGroupHomeViewController, @selector(viewDidLoad), (IMP)&_logos_method$_ungrouped$NLGroupHomeViewController$viewDidLoad, (IMP*)&_logos_orig$_ungrouped$NLGroupHomeViewController$viewDidLoad);{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton*), strlen(@encode(UIButton*))); i += strlen(@encode(UIButton*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$NLGroupHomeViewController, @selector(hoge:), (IMP)&_logos_method$_ungrouped$NLGroupHomeViewController$hoge$, _typeEncoding); }{ char _typeEncoding[1024]; unsigned int i = 0; _typeEncoding[i] = 'v'; i += 1; _typeEncoding[i] = '@'; i += 1; _typeEncoding[i] = ':'; i += 1; memcpy(_typeEncoding + i, @encode(UIButton*), strlen(@encode(UIButton*))); i += strlen(@encode(UIButton*)); _typeEncoding[i] = '\0'; class_addMethod(_logos_class$_ungrouped$NLGroupHomeViewController, @selector(hoge1:), (IMP)&_logos_method$_ungrouped$NLGroupHomeViewController$hoge1$, _typeEncoding); }} }
#line 498 "Tweak.xm"
