//
//  TouchDelegate.h
//  touche-barre
//
//  Created by Thomas Pucci on 15/03/2018.
//  Copyright © 2018 ThomasPucci. All rights reserved.
//

#ifndef TouchDelegate_h
#define TouchDelegate_h

#import <Foundation/Foundation.h>

@protocol TouchDelegate <NSObject>

- (void)onPressed:(NSButton *)sender;

- (void)onLongPressed:(NSButton *)sender;

@end

#endif /* TouchDelegate_h */
