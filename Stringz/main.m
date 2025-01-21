//
//  main.m
//  Stringz
//
//  Created by Edwin Cardenas on 14/01/25.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // MARK: - Writing into the file system
        
        NSMutableString *writeStr = [[NSMutableString alloc] init];
        
        for (int i = 0; i < 10; i++) {
            [writeStr appendString:@"Edwin is cool!\n"];
        }
        
        NSError *writeError;
        
        BOOL success = [writeStr writeToFile:@"/too/darned/bad.txt"
                             atomically:YES
                               encoding:NSUTF8StringEncoding
                                  error:&writeError];
        
        if (success) {
            NSLog(@"done writting /tmp/cool.txt");
        } else {
            NSLog(@"writing /tmp/cool.txt failed: %@", [writeError localizedDescription]);
        }
        
        // MARK: - Reading from the file system
        
        NSError *readError;
        NSString *readStr = [[NSString alloc] initWithContentsOfFile:@"/etc/resolv.conf"
                                                        encoding:NSASCIIStringEncoding
                                                           error:&readError];
        
        if (!readStr) {
            NSLog(@"read failed: %@", [readError localizedDescription]);
        } else {
            NSLog(@"resolv.conf looks like this:\n%@", readStr);
        }
    }
    return 0;
}
