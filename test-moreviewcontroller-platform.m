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
