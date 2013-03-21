//
//  ViewController.m
//  Parse.com01
//
//  Created by OSX on 3/21/13.
//  Copyright (c) 2013 OSX. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *url = [NSURL URLWithString: [NSString stringWithFormat:@"https://api.parse.com/1/classes/Console"]];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setURL:url];
    [request setHTTPMethod:@"GET"];
    [request setValue:@"APPLICATION_ID" forHTTPHeaderField:@"X-Parse-Application-Id"];
    [request setValue:@"REST_API_KEY" forHTTPHeaderField:@"X-Parse-REST-API-Key"];
    
    NSError *error;
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil]  options:0 error:&error];

    NSArray *resultsArray = [jsonDictionary objectForKey:@"results"];
    
    for (NSDictionary *dictionaryName in resultsArray) {
        NSString *name = [dictionaryName objectForKey:@"consoleName"];
        NSLog(@"Request: %@", name);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
