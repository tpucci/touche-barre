#import "AppDelegate.h"
#import "TouchBar.h"
#import "TouchButton.h"
#import "TouchDelegate.h"
#import <Cocoa/Cocoa.h>

static const NSTouchBarItemIdentifier clockIdentifier = @"tb.clock";

@interface AppDelegate () <TouchDelegate>

@end

@implementation AppDelegate

NSButton *touchBarButton;

TouchButton *button;

NSDateFormatter *timeformatter;
NSString *format = @"HH:mm";
NSMutableAttributedString *colorTitle;

-(void)UpdateTime:(id)sender
{
    NSString *time  = [timeformatter stringFromDate:[NSDate date]];
    [colorTitle.mutableString setString:time];
    [button setAttributedTitle:colorTitle];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    [[[[NSApplication sharedApplication] windows] lastObject] close];
    
    DFRSystemModalShowsCloseBoxWhenFrontMost(YES);
    
    timeformatter = [[NSDateFormatter alloc] init];
    [timeformatter setTimeStyle: NSDateFormatterShortStyle];
    [timeformatter setDateFormat:format];
    
    NSDate *now = [NSDate date];
    NSString *spacer = @"  ";
    NSString *buttonTitle = [spacer stringByAppendingString:[timeformatter stringFromDate:now]];
    
    button = [TouchButton buttonWithTitle:buttonTitle target:nil action:nil];
    [button setAlignment:NSTextAlignmentCenter];
    [button setDelegate: self];
    
    NSFont *systemFont = [NSFont systemFontOfSize:14.0f];
    NSDictionary * fontAttributes = [[NSDictionary alloc] initWithObjectsAndKeys:systemFont, NSFontAttributeName, nil];
    
    colorTitle = [[NSMutableAttributedString alloc] initWithString:[button title] attributes:fontAttributes];
    
    NSColor *color = [NSColor greenColor];
    
    [colorTitle addAttribute:NSForegroundColorAttributeName value:color range:NSMakeRange(0, button.title.length)];
    [button setAttributedTitle:colorTitle];
    
    NSCustomTouchBarItem *time = [[NSCustomTouchBarItem alloc] initWithIdentifier:clockIdentifier];
    time.view = button;
    [NSTouchBarItem addSystemTrayItem:time];
    //[NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(UpdateTime:) userInfo:nil repeats:YES];
    
    touchBarButton = button;
    
    [NSTouchBarItem addSystemTrayItem:time];
    DFRElementSetControlStripPresenceForIdentifier(clockIdentifier, YES);
}

- (void)applicationWillTerminate:(NSNotification *)aNotification
{
    // Insert code here to tear down your application
}

- (void)onPressed:(TouchButton*)sender
{
    NSLog(@"On Press clicked");
}

- (void)onLongPressed:(TouchButton*)sender
{
    NSLog(@"On Long Press clicked");
}

@end
