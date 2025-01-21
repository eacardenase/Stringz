//
//  main.m
//  Stringz
//
//  Created by Edwin Cardenas on 14/01/25.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSMutableString *str = [[NSMutableString alloc] init];
        
        for (int i = 0; i < 10; i++) {
            [str appendString:@"Edwin is cool!\n"];
        }
        
        NSError *error;
        
        BOOL success = [str writeToFile:@"/too/darned/bad.txt"
              atomically:YES
                encoding:NSUTF8StringEncoding
                   error:&error];
        
        if (success) {
            NSLog(@"done writting /tmp/cool.txt");
        } else {
            NSLog(@"writing /tmp/cool.txt failed: %@", [error localizedDescription]);
        }
    }
    return 0;
}
