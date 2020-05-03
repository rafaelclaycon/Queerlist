//
//  CucumberishTest.m
//  bluemmUITests
//
//  Created by Rafael Schmitt on 21/02/19.
//  Copyright © 2020 SLB. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SpellCheckerUITests-Swift.h"

void CucumberishInit(void);

__attribute__((constructor))
void CucumberishInit()
{
    [CucumberishInitializer CucumberishSwiftInit];
}
