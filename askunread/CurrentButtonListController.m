#include "CurrentButtonListController.h"

@implementation CurrentButtonListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Current" target:self];
	}

	return _specifiers;
}
@end