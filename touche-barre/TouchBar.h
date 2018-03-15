//
//  TouchBar.h
//  touche-barre
//
//  Created by Thomas Pucci on 14/03/2018.
//  Copyright © 2018 ThomasPucci. All rights reserved.
//

#ifndef TouchBar_h
#define TouchBar_h

#import <AppKit/AppKit.h>

extern void DFRElementSetControlStripPresenceForIdentifier(NSString *, BOOL);
extern void DFRSystemModalShowsCloseBoxWhenFrontMost(BOOL);

@interface NSTouchBarItem ()

+ (void)addSystemTrayItem:(NSTouchBarItem *)item;

@end

@interface NSTouchBar ()

+ (void)presentSystemModalFunctionBar:(NSTouchBar *)touchBar systemTrayItemIdentifier:(NSString *)identifier;

@end

#endif /* TouchBar_h */
