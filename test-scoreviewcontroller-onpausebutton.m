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
        
        [self.redPointMajorImg setImage:eightImg];
        [self.redPointMinorImg setImage:eightImg];
        [self.bluePointMajorImg setImage:eightImg];
        [self.bluePointMinorImg setImage:eightImg];
    }
    else
    {
        [self.minutesMajorImage setImage:blankImg];
        [self.minutesMinorImage setImage:blankImg];
        [self.secondsMajorImage setImage:blankImg];
        [self.secondsMinorImage setImage:blankImg];
        
        [self.redPointMajorImg setImage:blankImg];
        [self.redPointMinorImg setImage:blankImg];
        [self.bluePointMajorImg setImage:blankImg];
        [self.bluePointMinorImg setImage:blankImg];

    }
    
    // recursive call after 250msec
    flashCount--;
    if( flashCount > 0 )
    {
        [self performSelector:@selector(flashDisplays) withObject:nil afterDelay:0.25];
    }
    else    // or no call at all if run out of flashes to execute.
    {
        [self.minutesMajorImage setImage:blankImg];
        [self.minutesMinorImage setImage:blankImg];
        [self.secondsMajorImage setImage:blankImg];
        [self.secondsMinorImage setImage:blankImg];
        
        [self.redPointMajorImg setImage:blankImg];
        [self.redPointMinorImg setImage:blankImg];
        [self.bluePointMajorImg setImage:blankImg];
        [self.bluePointMinorImg setImage:blankImg];

    }
}



-(void) flash
{
    flashCount = 6;             // on and off states times 3 is 6.
    [self flashDisplays];
    
}


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

#pragma mark - image from number

-(UIImage *) imageFromNumber:(int) num
{
    UIImage *result = nil;
    
    switch (num)
    {
        case 1:
            result = oneImg;
            break;
        case 2:
            result = twoImg;
            break;
        case 3:
            result = threeImg;
            break;
        case 4:
            result = fourImg;
            break;
        case 5:
            result = fiveImg;
            break;
        case 6:
            result = sixImg;
            break;
        case 7:
            result = sevenImg;
            break;
        case 8:
            result = eightImg;
            break;
        case 9:
            result = nineImg;
            break;
        case 0:
            result = zeroImg;
            break;
            
        case 11:
            result = blankImg;
            break;
            
        default:
            break;
    }
    
    return result;
}


#pragma mark - events

- (void)vibrate
{
    AudioServicesPlaySystemSound (kSystemSoundID_Vibrate);      // Should be conditional on setting.
}

-(void) blankClock
{
    [self.minutesMajorImage setImage:blankImg];
    [self.minutesMinorImage setImage:blankImg];
    [self.secondsMajorImage setImage:blankImg];
    [self.secondsMinorImage setImage:blankImg];
    self.dotsImg.image = [UIImage imageNamed:@"dots.png"];

//    [self vibrate];
}

-(void) updateClock:(NSTimeInterval) displayTime
{
    
    double minutes = displayTime / 60;
    double seconds = fmod(displayTime, 60.0);
    
    int majMins = (int) minutes/ 10;
    int minMinutes = (int) minutes % 10;
    [self.minutesMajorImage setImage:[self imageFromNumber:majMins]];
    [self.minutesMinorImage setImage:[self imageFromNumber:minMinutes]];
    
    int majSecs = seconds / 10;
    int minSecs = (int) seconds % 10;
    [self.secondsMajorImage setImage:[self imageFromNumber:majSecs]];
    [self.secondsMinorImage setImage:[self imageFromNumber:minSecs]];
    
    
    if( displayTime < 5)
    {
        // Do something.
        
    }
    
    
}


-(void) update
{
    // get current time.
    NSDate *now = [[NSDate alloc]init];
    
    // update display.
    NSTimeInterval diff;
    diff = [now timeIntervalSinceDate:playStartTime];

    
    remaining = [targetDate timeIntervalSinceDate:now];
    
//    NSLog( @"diff:%g remaining:%g", diff, remaining );
    
    if( diff > boutTime )
    {
        running = NO;
        [self performSelector:@selector(blankClock) withObject:nil afterDelay:1.5];
        self.playButton.enabled = YES;
        self.pauseButton.enabled = NO;
    }
    
    [self updateClock:remaining];
    
    
    // if more time to run then recursive call.
    if( running)
    {
        [self performSelector:@selector(update) withObject:nil afterDelay:1.0];
    }

- (IBAction)onPauseButton:(id)sender
{
    if( running )
    {
//        NSLog(@"paused");
        running = NO;
    }
    else
    {
//        NSLog(@"unpaused");
        playStartTime = [[NSDate alloc] init];
        targetDate = [playStartTime dateByAddingTimeInterval:remaining];
        
//        NSLog( @"%@", playStartTime );
        
        
        running = YES;
        
        // Start updating
        [self update];
        [self flashDots];

    }
}



