//
//  BubbleSort.m
//  PersonSort
//
//  Created by Benjamin Encz on 29/10/14.
//  Copyright (c) 2014 MakeSchool. All rights reserved.
//

#import "BubbleSort.h"
#import "Person.h"

@implementation BubbleSort

+ (NSArray *)sort:(NSArray *)persons {
    NSMutableArray *sortedPersons = [persons mutableCopy];
    
    BOOL swapped = YES;

    NSInteger n = [sortedPersons count];
    
    while (swapped) {
        swapped = NO;

        // keep comparing all values to their neighbours until no swap occured in an entire iteration
        for (int i = 0; i+1 < n; i++) {
            BOOL needsSwap = NO;
            
            // compare the element to its neighbour
            if ([sortedPersons[i] age] > [sortedPersons[i+1] age]) {
                // if the left neighbor is older than the right neighbor, swap them
                needsSwap = YES;
            } else if ([sortedPersons[i] age] == [sortedPersons[i+1] age]) {
                // if both have the same age we need to check the second criteria; the last name
                NSComparisonResult lastNameCompare = [[sortedPersons[i] lastName] compare:[sortedPersons[i+1] lastName]];
                
                if (lastNameCompare == NSOrderedDescending) {
                    needsSwap = YES;
                } else if (lastNameCompare == NSOrderedSame) {
                    // if the last names are the same we need to check the first name
                    NSComparisonResult firstNameCompare = [[sortedPersons[i] firstName] compare:[sortedPersons[i+1] firstName]];
                    if (firstNameCompare == NSOrderedDescending) {
                        needsSwap = YES;
                    }
                }
            }
            
            // if a swap is necessarz; peform it here
            if (needsSwap) {
                [sortedPersons exchangeObjectAtIndex:i withObjectAtIndex:i+1];
                swapped = YES;
            }
        }
        
        n = n-1;
        
        if (!swapped) {
            // if there was an entire round without swapping any elements, we are done sorting
            return sortedPersons;
        }
    }
    
    return sortedPersons;
}

@end
