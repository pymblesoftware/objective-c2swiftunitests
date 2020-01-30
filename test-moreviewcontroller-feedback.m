
-(void) feedback
{
    @try
    {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        
        // Look at: http://mobileorchard.com/new-in-iphone-30-tutorial-series-part-2-in-app-email-messageui/
        // Look at this blog: http://agilewarrior.wordpress.com/2012/02/08/how-to-attach-an-image-from-your-photo-gallery-and-send-it-as-an-image-on-iphone/
        
        MFMailComposeViewController *controller = [[MFMailComposeViewController alloc] init];
        controller.mailComposeDelegate = self;
        
        NSString *subject = [[NSString alloc] initWithFormat:@"Feedback on Taekwondo Scorer running %@ on %@", [[UIDevice currentDevice] systemVersion], [self platformString] ];
        // NSString *subject = [[NSString alloc] initWithFormat:@"Feedback on Royal Baccarat running %@ ", [[UIDevice currentDevice] systemVersion] ];
        
        NSArray *toArr = [[NSArray alloc] initWithObjects:@"info@pymblesoftware.com",nil];
        [controller setToRecipients:toArr ];
        [controller setEditing:YES];
        
        [controller setSubject:subject];
        [controller setMessageBody:@"Dear Support team," isHTML:NO];
        // Get view controller with dodgy category extension of UIView class that goes looking for responders.
//        UIViewController *vc = [[[CCDirector sharedDirector] openGLView] viewController];
        
        [self presentViewController:controller animated:YES completion:^{ NSLog(@"Completed");}];
        
    }
    @catch ( NSException *e)
    {
        // [self faultMessage:e.reason Method:(char *)__PRETTY_FUNCTION__ CallingFile:__FILE__ LineAt:__LINE__ hasThrown:e];
    }
    
}


