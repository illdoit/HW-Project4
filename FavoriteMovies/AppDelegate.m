//
//  AppDelegate.m
//  FavoriteMovies
//
//  Created by Sir Andrew on 11/12/13.
//  Copyright (c) 2013 edu.nyu.spcs. All rights reserved.
//

#import "AppDelegate.h"
#import "Movie.h"
#import "MovieStore.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self prepareMovieData];
    
        NSString *documentsDirectory = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString *destPath = [documentsDirectory stringByAppendingPathComponent:@"images"];  //optionally create a subdirectory
    
    //"source" is a physical folder in your app bundle.  Once that has a blue color folder (not the yellow group folder)
    // To create a physical folder in your app bundle: drag a folder from Mac's Finder to the Xcode project, when prompts
    // for "Choose options for adding these files" make certain that "Create folder references for …" is selected.
    // Store all your 300 or so images into this physical folder.
    
    NSString *sourcePath = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"images"];
    NSError *error;
    [[NSFileManager defaultManager] copyItemAtPath:sourcePath toPath:destPath error:&error];
    if (error)
        NSLog(@"copying error: %@", error);
    
    return YES;
}
							
- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

-(void)prepareMovieData
{
    NSString *path = [[NSBundle mainBundle] pathForResource:
                      @"Movies" ofType:@"plist"];
    
    NSMutableArray *temp = [[NSMutableArray alloc] initWithContentsOfFile:path];
    
    NSMutableArray *movies = [[NSMutableArray alloc] init];
    
    if ([[MovieStore sharedInstance] movies] == nil) {
        for (NSDictionary *movObj in temp) {
            Movie *m = [[Movie alloc] init];
            m.title = [movObj objectForKey:TITLE];
            m.year = [movObj objectForKey:YEAR];
            m.rating = [movObj objectForKey:RATING];
            m.image = [movObj objectForKey:IMAGE];
            m.link = [movObj objectForKey:LINK];
            
            [movies addObject:m];
        }
        //since empty fill with data
        [[MovieStore sharedInstance] setMovies:movies];
    }
}
@end
