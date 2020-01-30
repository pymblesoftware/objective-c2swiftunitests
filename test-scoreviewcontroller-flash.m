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

-(void) flash
{
    flashCount = 6;             // on and off states times 3 is 6.
    [self flashDisplays];
    
}
