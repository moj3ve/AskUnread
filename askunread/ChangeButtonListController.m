#include "ChangeButtonListController.h"

@implementation ChangeButtonListController

- (NSArray *)specifiers {
	if (!_specifiers) {
		_specifiers = [self loadSpecifiersFromPlistName:@"Change" target:self];
	}

	return _specifiers;
}
@end