//
//  RAContentStretchingView.m
//  NineSlice
//
//  Created by Evadne Wu on 10/5/12.
//  Copyright (c) 2012 Radius. All rights reserved.
//

#import "RAContentStretchingView.h"

@interface RAContentStretchingView ()
@property (nonatomic, readonly, strong) UIView *imageView;
@property (nonatomic, readonly, strong) UIView *imageViewContainer;
@end

@implementation RAContentStretchingView
@synthesize imageStretchingInsets = _imageStretchingInsets;
@synthesize imageVisualInsets = _imageVisualInsets;
@synthesize stretchedResultInsets = _stretchedResultInsets;
@synthesize imageView = _imageView;
@synthesize imageViewContainer = _imageViewContainer;

- (UIView *) imageView {

	if (!_imageView) {
	
		_imageView = [[UIView alloc] initWithFrame:self.bounds];
	
	}
	
	return _imageView;

}

- (UIView *) imageViewContainer {

	if (!_imageViewContainer) {
	
		_imageViewContainer = [[UIView alloc] initWithFrame:self.bounds];
	
	}
	
	return _imageViewContainer;

}

- (void) setImage:(UIImage *)image {

	if (_image == image)
		return;
	
	_image = image;
	self.imageView.layer.contents = (id)_image.CGImage;
	self.imageView.layer.contentsScale = self.window.screen.scale;
	
	[self setNeedsLayout];

}

- (void) didMoveToWindow {

	[super didMoveToWindow];

	self.imageView.layer.contentsScale = self.window.screen.scale;

}

- (void) setImageStretchingInsets:(UIEdgeInsets)imageStretchingInsets {

	if (UIEdgeInsetsEqualToEdgeInsets(_imageVisualInsets, imageStretchingInsets))
		return;
	
	_imageStretchingInsets = imageStretchingInsets;
	
	[self setNeedsLayout];

}

- (void) setImageVisualInsets:(UIEdgeInsets)imageVisualInsets {

	if (UIEdgeInsetsEqualToEdgeInsets(_imageVisualInsets, imageVisualInsets))
		return;
	
	_imageVisualInsets = imageVisualInsets;
	
	[self setNeedsLayout];

}

- (void) setStretchedResultInsets:(UIEdgeInsets)stretchedResultInsets {

	if (UIEdgeInsetsEqualToEdgeInsets(_stretchedResultInsets, stretchedResultInsets))
		return;
	
	_stretchedResultInsets = stretchedResultInsets;
	
	[self setNeedsLayout];

}

- (void) layoutSubviews {

	[super layoutSubviews];
	
	[self addSubview:self.imageViewContainer];
	[self.imageViewContainer addSubview:self.imageView];
	
	self.clipsToBounds = NO;
	self.imageView.clipsToBounds = NO;
	self.imageViewContainer.clipsToBounds = YES;
	
	UIView *iv = self.imageView;
	UIView *ivc = self.imageViewContainer;
	UIImage *image = self.image;
	CGSize imageSize = image.size;
	
	if (!image) {
		ivc.hidden = YES;
		return;
	}
	
	ivc.hidden = NO;
	
	CGRect contentsRect = (CGRect){
		(CGPoint){
			_imageStretchingInsets.left / imageSize.width,
			_imageStretchingInsets.top / imageSize.height
		},
		(CGSize){
			(imageSize.width - _imageStretchingInsets.left - _imageStretchingInsets.right) / imageSize.width,
			(imageSize.height - _imageStretchingInsets.top - _imageStretchingInsets.bottom) / imageSize.height
		}
	};
	
	iv.layer.contentsCenter = contentsRect;
	
	CGRect imageFrame = UIEdgeInsetsInsetRect(self.bounds, (UIEdgeInsets){
		-1 * _imageVisualInsets.top,
		-1 * _imageVisualInsets.left,
		-1 * _imageVisualInsets.bottom,
		-1 * _imageVisualInsets.right,
	});
	
	ivc.frame = imageFrame;
	iv.frame = [ivc convertRect:imageFrame fromView:self];
	iv.frame = UIEdgeInsetsInsetRect(iv.frame, _stretchedResultInsets);
	
}

@end
