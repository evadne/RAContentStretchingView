//
//  RAContentStretchingView.h
//  NineSlice
//
//  Created by Evadne Wu on 10/5/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

@interface RAContentStretchingView : UIView

@property (nonatomic, readwrite, strong) UIImage *image;
@property (nonatomic, readwrite, assign) UIEdgeInsets imageStretchingInsets;
@property (nonatomic, readwrite, assign) UIEdgeInsets imageVisualInsets;
@property (nonatomic, readwrite, assign) UIEdgeInsets stretchedResultInsets;

@end
