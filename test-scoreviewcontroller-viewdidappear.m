
-(void) viewDidAppear:(BOOL)animated
{
//    NSLog( @"%s: %@", __PRETTY_FUNCTION__, [self dataFilePath] );
    settings = [[NSMutableDictionary alloc] initWithContentsOfFile:[self dataFilePath]];
    NSString *timeStr = [settings valueForKey:@"time"];
    
    if( !timeStr || [timeStr length] == 0 )
    {
        // Not set default 120..
//        NSLog( @"NOT set ddefault 120.." );
        timeStr = @"120";
    }
    boutTime = [timeStr doubleValue];
    
//    NSLog(@"bout time: %g", boutTime );
}

