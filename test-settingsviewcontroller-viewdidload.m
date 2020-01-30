- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    settings = [[NSMutableDictionary alloc] initWithContentsOfFile:[self dataFilePath]];
    if( !settings )
    {
        settings = [[NSMutableDictionary alloc] init];
    }
        
    NSString *timeStr = [settings valueForKey:@"time"];
    
    if( !timeStr || [timeStr length] == 0 )
        timeStr = @"120";
    
    [self.boutLenTextField setText:timeStr];
    self.boutLenTextField.delegate = self;
    [self.boutLenTextField becomeFirstResponder];
    
}

