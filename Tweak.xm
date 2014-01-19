@interface PLCameraView
- (void)setHDRIsOn:(BOOL)b;
@end

%hook PLCameraView
- (void)layoutSubviews {
    %orig;
    self.HDRIsOn = YES;
}
%end
