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

