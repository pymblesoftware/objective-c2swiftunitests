//
//
//



- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSString *) platform
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    @try
    {
        size_t size;
        sysctlbyname("hw.machine", NULL, &size, NULL, 0);
        char *machine = malloc(size);
        sysctlbyname("hw.machine", machine, &size, NULL, 0);
        NSString *platform = [NSString stringWithUTF8String:machine] ;
        free(machine);
        return platform;
    }
    @catch ( NSException *e)
    {
        // [self faultMessage:e.reason Method:(char *)__PRETTY_FUNCTION__ CallingFile:__FILE__ LineAt:__LINE__ hasThrown:e];
    }
    return nil;
}

// This needs updting for iPad4 and later models.

- (NSString *) platformString
{
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
    NSString *platform = [self platform];
    if ([platform isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
    if ([platform isEqualToString:@"iPhone1,2"])    return @"iPhone 3G";
    if ([platform isEqualToString:@"iPhone2,1"])    return @"iPhone 3GS";
    if ([platform isEqualToString:@"iPhone3,1"])    return @"iPhone 4";
    if ([platform isEqualToString:@"iPhone3,3"])    return @"Verizon iPhone 4";
    if ([platform isEqualToString:@"iPhone4,1"])    return @"iPhone 4S";
    if ([platform isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([platform isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([platform isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([platform isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([platform isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([platform isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([platform isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([platform isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([platform isEqualToString:@"iPad2,4"])      return @"iPad 2";
    if ([platform isEqualToString:@"iPad3,1"])      return @"iPad-3G (WiFi)";
    if ([platform isEqualToString:@"iPad3,2"])      return @"iPad-3G (4G)";
    if ([platform isEqualToString:@"iPad3,3"])      return @"iPad-3G (4G)";
    if ([platform isEqualToString:@"i386"])         return @"Simulator";
    if ([platform isEqualToString:@"x86_64"])       return @"Simulator";
    return platform;
}

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

- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    @try
    {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        
        if( result == MFMailComposeResultCancelled || result == MFMailComposeResultFailed)
        {
            
        }
        
- (IBAction)onSettingsButton:(id)sender
{
    
}
