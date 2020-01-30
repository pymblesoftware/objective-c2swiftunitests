- (NSString *) platformURLString
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    NSString *platform = [self platform];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"%20iPhone%201G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"%20iPhone%203G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"%20iPhone%203GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"%20iPhone%204";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"%20Verizon%20iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"%20iPhone%204S";
    if ([platform isEqualToString:@"iPod1,1"])      return @"%20iPod%20Touch%201G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"%20iPod%20Touch%202G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"%20iPod%20Touch%203G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"%20iPod%20Touch%204G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"%20iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"%20iPad%202%20(WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"%20iPad%202%20(GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"%20iPad%202%20(CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"%20iPad%202";
    if ([platform isEqualToString:@"iPad3,1"])      return @"%20iPad-3G%20(WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"%20iPad-3G%20(4G)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"%20iPad-3G%20(4G)";
    if ([platform isEqualToString:@"i386"])         return @"%20Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"%20Simulator";
    return platform;
}
