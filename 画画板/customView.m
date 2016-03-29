//
//  customView.m
//  画画板
//
//  Created by cb on 16/1/26.
//  Copyright © 2016年 cuibing. All rights reserved.
//

#import "customView.h"

@interface customView()
@property (nonatomic,strong) NSMutableArray *pathArr;
@end

@implementation customView

- (NSMutableArray *)pathArr
{
    if (!_pathArr) {
        _pathArr = [NSMutableArray array];
    }
    return _pathArr;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint starPoint = [touch locationInView:touch.view];
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path setLineJoinStyle:kCGLineJoinRound];
    [path setLineWidth:10];
    [path setLineCapStyle:kCGLineCapRound];
    [path moveToPoint:starPoint];
    [self.pathArr addObject:path];
    
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint endPoint = [touch locationInView:touch.view];
    UIBezierPath *path = [self.pathArr lastObject];
    [path addLineToPoint:endPoint];
    [self setNeedsDisplay];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
}


- (void)drawRect:(CGRect)rect {
//    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    
    for (UIBezierPath *path in self.pathArr) {
        [path stroke];
    }
    
}
- (void)clear
{
    [self.pathArr removeAllObjects];
    [self setNeedsDisplay];
}
- (void)back
{
    [self.pathArr removeLastObject];
    [self setNeedsDisplay];
}


@end
