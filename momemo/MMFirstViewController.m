//
//  MMFirstViewController.m
//  momemo
//
//  Created by Gavin Williams on 30/03/2012.
//  Copyright (c) 2012 fishrod interactive. All rights reserved.
//

#import "MMFirstViewController.h"

@interface MMFirstViewController ()

@end

@implementation MMFirstViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
	    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
	} else {
	    return YES;
	}
}

# pragma mark -
# pragma mark Search table delegates

-(NSInteger) numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 10;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	
	static NSString *CellIdentifier = @"CellIdentifier";
	
	// Dequeue or create a cell of the appropriate type.
	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
	if (cell == nil) {
		cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
		cell.accessoryType = UITableViewCellAccessoryNone;
	}
	
	// Configure the cell.
	cell.textLabel.text = [NSString stringWithFormat:@"Row %d", indexPath.row];
	return cell;
	
}

- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString
{
	
	[[RKClient sharedClient] get:@"/search/movie" queryParams:[NSDictionary dictionaryWithObjectsAndKeys: @"bbe8939bdc4d7d35197a12af12b258d8", @"api_key", searchString, @"query", nil] delegate: self];
	
	return NO;
}

- (void)request:(RKRequest *)request didLoadResponse:(RKResponse *)response {
	NSLog(@"Got response: %@", [response bodyAsString]);
}

- (void) request:(RKRequest *)request didFailLoadWithError:(NSError *)error {
	NSLog(@"Request failed with error %@", [error localizedDescription]);
}

- (void) requestDidTimeout:(RKRequest *)request {
	NSLog(@"Request timed out");
}

@end
