//
//  InfoBlockViewController.m
//  PagerAdapter
//
//  Created by Yogesh Shetty on 09/11/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "InfoBlockViewController.h"

@interface InfoBlockViewController ()

@property NSString *infoBlockName;

@end

@implementation InfoBlockViewController

-(instancetype) init: (NSString *) name {
    self = [super init];
    if (self) {
        self.infoBlockName = name;
    }
    return self;
}

-(void) loadView {
    self.view = [[UIView alloc] init];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, 300, 20)];
    label.text = self.infoBlockName;
    label.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:label];
    self.view.backgroundColor = [UIColor brownColor];
//    self.view.backgroundColor = [[UIColor alloc] initWithRed:(arc4random() * 100 / 100.0)
//                                                       green:(arc4random() * 100 / 100.0)
//                                                        blue:(arc4random() * 100 / 100.0)
//                                                       alpha:1.0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
