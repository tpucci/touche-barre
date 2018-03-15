#ifndef TouchButton_h
#define TouchButton_h

#import <Cocoa/Cocoa.h>
#import "TouchDelegate.h"

@interface TouchButton : NSButton

@property (nonatomic, weak) id<TouchDelegate> delegate;

@end

#endif /* TouchButton_h */
