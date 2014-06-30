@interface PLCameraView : NSObject
- (void)setHDRIsOn:(BOOL)b;
- (void)_setHDRMode:(int)arg1;
@end

%hook PLCameraView
- (void)layoutSubviews {
    %orig;
    // iOS 7.0.x
    if ([self respondsToSelector:@selector(setHDRIsOn:)]) {
        self.HDRIsOn = YES;
    }
    else {
        [self _setHDRMode:1]; // 1 is 'HDR On' in iOS 7.1+
    }
}
%end
