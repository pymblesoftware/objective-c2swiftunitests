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



- (NSString *)dataFilePath
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    return [documentsDirectory stringByAppendingPathComponent:@"settings"];
}



-(void) initImages
{
    blankImg = [UIImage imageNamed:@"blank.png"];
    oneImg = [UIImage imageNamed:@"one.png"];
    twoImg = [UIImage imageNamed:@"two.png"];
    threeImg = [UIImage imageNamed:@"three.png"];
    fourImg = [UIImage imageNamed:@"four.png"];
    fiveImg = [UIImage imageNamed:@"five.png"];
    sixImg = [UIImage imageNamed:@"six.png"];
    sevenImg = [UIImage imageNamed:@"seven.png"];
    eightImg = [UIImage imageNamed:@"eight.png"];
    nineImg = [UIImage imageNamed:@"nine.png"];
    zeroImg = [UIImage imageNamed:@"zero.png"];
}

#pragma mark - 

-(void) flashDisplays
{
    // Test on/off state.
    if( flashCount % 2 == 1 )
    {
        [self.minutesMajorImage setImage:eightImg];
        [self.minutesMinorImage setImage:eightImg];
        [self.secondsMajorImage setImage:eightImg];
        [self.secondsMinorImage setImage:eightImg];

-(void) flashDots
{
    if( running )
    {
        NSDate *now = [[NSDate alloc]init];
        
        // update display.
        NSTimeInterval diff;
        diff = [now timeIntervalSinceDate:playStartTime];
        double even = fabs(fmod(diff, 2.0));
//        NSLog(@"diff:%g %g", diff, even );
        
        if( even > 1.0 )
        {
            [self.dotsImg setImage:[UIImage imageNamed:@"dots.png" ]];
        }
        else
        {
            [self.dotsImg setImage:[UIImage imageNamed:@"red-dots.png"]];
        }
        
        [self performSelector:@selector(flashDots) withObject:nil afterDelay:1.0];
    }
    else
    {
        
    }
}
