- (void)mailComposeController:(MFMailComposeViewController*)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError*)error
{
    @try
    {
        NSLog(@"%s", __PRETTY_FUNCTION__);
        
        if( result == MFMailComposeResultCancelled || result == MFMailComposeResultFailed)
        {
            
        }
        
        [self becomeFirstResponder];
        [self dismissModalViewControllerAnimated:YES];
    }
    @catch ( NSException *e)
    {
        // [self faultMessage:e.reason Method:(char *)__PRETTY_FUNCTION__ CallingFile:__FILE__ LineAt:__LINE__ hasThrown:e];
    }
}

