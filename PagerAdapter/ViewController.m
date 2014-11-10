//
//  ViewController.m
//  PagerAdapter
//
//  Created by Yogesh Shetty on 09/11/14.
//  Copyright (c) 2014 test. All rights reserved.
//

#import "ViewController.h"
#import "InfoBlockViewController.h"

@interface ViewController ()

@property NSMutableArray *infoTypes;

@property UIScrollView *infotypeContainerScrollView;
@property UIScrollView *infoblockScrollView;


@end

@implementation ViewController

-(instancetype) initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.infoTypes = [[NSMutableArray alloc] init];
        [self.infoTypes addObject:@"Contacts"];
        [self.infoTypes addObject:@"Profitibality by product"];
        [self.infoTypes addObject:@"Profitability by office"];
        [self.infoTypes addObject:@"Key Financial Figures"];
        [self.infoTypes addObject:@"Part Details"];
        [self.infoTypes addObject:@"Business Notes"];
        [self.infoTypes addObject:@"Relationship Managers"];
        [self.infoTypes addObject:@"Profitability"];
//        for (int i = 0; i < 20; i++) {
//            [self.infoTypes addObject:[NSString stringWithFormat:@"Infoblock %d", i ]];
//        }
    }
    return self;
}

-(void) loadView {
    self.view = [[UIView alloc] init];
    self.view.backgroundColor = [UIColor lightGrayColor];
    self.infotypeContainerScrollView = [[UIScrollView alloc] initWithFrame:CGRectZero];
    self.infotypeContainerScrollView.backgroundColor = [UIColor blueColor];
    [self.view addSubview:self.infotypeContainerScrollView];
    
    //add constraints
    self.infotypeContainerScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[_infotypeContainerScrollView]|"
                                                                    options:0
                                                                    metrics:nil views:NSDictionaryOfVariableBindings(_infotypeContainerScrollView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[_infotypeContainerScrollView(==49)]|"
                                                                      options:0
                                                                      metrics:nil views:NSDictionaryOfVariableBindings(_infotypeContainerScrollView)]];
    
    UIView *previousInfoTypeContainerView = nil;
    for (NSString *infoType in self.infoTypes) {
        UIView *infoTypeContainerView = [[UIView alloc] init];
        infoTypeContainerView.backgroundColor = [UIColor blackColor];
        
        UILabel *infoTypeLabel = [[UILabel alloc] init];
        infoTypeLabel.numberOfLines = 2;
        //infoTypeLabel.backgroundColor = [UIColor greenColor];
        infoTypeLabel.textColor = [UIColor whiteColor];
        infoTypeLabel.text = infoType;
        
        [infoTypeContainerView addSubview:infoTypeLabel];
        [self.infotypeContainerScrollView addSubview:infoTypeContainerView];
        
        UIView *spacer = [[UIView alloc] init];
        spacer.backgroundColor = [UIColor clearColor];
        [self.infotypeContainerScrollView addSubview:spacer];
        
        
        //add constraints
        infoTypeContainerView.translatesAutoresizingMaskIntoConstraints = NO;
        infoTypeLabel.translatesAutoresizingMaskIntoConstraints = NO;
        spacer.translatesAutoresizingMaskIntoConstraints = NO;
        [infoTypeContainerView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|-[infoTypeLabel]-|"
                                                                                            options:0
                                                                                            metrics:nil
                                                                                        views:NSDictionaryOfVariableBindings(infoTypeLabel)]];
        
        [infoTypeContainerView addConstraint:[NSLayoutConstraint constraintWithItem:infoTypeLabel
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:infoTypeContainerView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:0]];
        [infoTypeContainerView addConstraint:[NSLayoutConstraint constraintWithItem:infoTypeLabel
                                                                          attribute:NSLayoutAttributeCenterX
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:infoTypeContainerView
                                                                          attribute:NSLayoutAttributeCenterX
                                                                         multiplier:1.0
                                                                           constant:0]];

        
        [self.infotypeContainerScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[infoTypeContainerView(==49)]|"
                                                                                            options:0
                                                                                            metrics:nil
                                                                                              views:NSDictionaryOfVariableBindings(infoTypeContainerView)]];
 
        [self.infotypeContainerScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[spacer(==40)]"
                                                                                            options:0
                                                                                            metrics:nil
                                                                                              views:NSDictionaryOfVariableBindings(spacer)]];
        [self.infotypeContainerScrollView addConstraint:[NSLayoutConstraint constraintWithItem:spacer
                                                                          attribute:NSLayoutAttributeCenterY
                                                                          relatedBy:NSLayoutRelationEqual
                                                                             toItem:self.self.infotypeContainerScrollView
                                                                          attribute:NSLayoutAttributeCenterY
                                                                         multiplier:1.0
                                                                           constant:0]];

        if (!previousInfoTypeContainerView) {
            //first infoblock
            [self.infotypeContainerScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[infoTypeContainerView(==150)]"
                                                                              options:0
                                                                              metrics:nil views:NSDictionaryOfVariableBindings(infoTypeContainerView)]];
        } else {
            [self.infotypeContainerScrollView addConstraints:[NSLayoutConstraint
                                                         constraintsWithVisualFormat:@"H:[previousInfoTypeContainerView][spacer(==3)][infoTypeContainerView(==150)]"
                                                                             options:0
                                                                             metrics:nil
                                                                            views:NSDictionaryOfVariableBindings(spacer, previousInfoTypeContainerView, infoTypeContainerView)]];
        }
        
        previousInfoTypeContainerView = infoTypeContainerView;
        
    }
    
    //infotypeContainerScrollView.contentSize = CGSizeMake(self.infoTypes.count * (100 + 3), 49);
    
    //navigation bar
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    UINavigationBar *myNav = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 20, screenWidth, 50)];
    [UINavigationBar appearance].barTintColor = [UIColor lightGrayColor];
    [self.view addSubview:myNav];
    
    
    UIBarButtonItem *cancelItem = [[UIBarButtonItem alloc] initWithTitle:@"Cancel"
                                                                   style:UIBarButtonItemStyleBordered
                                                                  target:self
                                                                  action:nil];
    
    UIBarButtonItem *doneItem = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                 style:UIBarButtonItemStyleBordered
                                                                target:self action:nil];
    
    
    UINavigationItem *navigItem = [[UINavigationItem alloc] initWithTitle:@"Navigation Title"];
    navigItem.rightBarButtonItem = doneItem;
    navigItem.leftBarButtonItem = cancelItem;
    myNav.items = [NSArray arrayWithObjects: navigItem,nil];
    
    [UIBarButtonItem appearance].tintColor = [UIColor blueColor];
    
    
    //infoblock view
    //CGFloat infoblockHeight = screenHeight - 50 - 50 - 20;
    //UIScrollView *infoblockScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20+50, screenWidth, infoblockHeight)];
    UIScrollView *infoblockScrollView = [[UIScrollView alloc] init];
    infoblockScrollView.backgroundColor = [UIColor greenColor];
    [self.view addSubview:infoblockScrollView];
    
    infoblockScrollView.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[infoblockScrollView]|"
                                                                     options:0
                                                                     metrics:nil
                                                                       views:NSDictionaryOfVariableBindings(infoblockScrollView)]];
    [self.view addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[myNav][infoblockScrollView][_infotypeContainerScrollView]"
                                                                      options:0
                                                                      metrics:nil
                                                                        views:NSDictionaryOfVariableBindings(myNav, infoblockScrollView,_infotypeContainerScrollView)]];
    //CGFloat originX = 0;
    UIView *prevInfoblockView = nil;
    for (NSString *infoType in self.infoTypes) {
        InfoBlockViewController *infoBlockVC = [[InfoBlockViewController alloc] init:infoType];
        //infoBlockVC.view.frame = CGRectMake(originX, 0, screenWidth, infoblockHeight);
        UIView *infoblockView = infoBlockVC.view;
        //UIView *infoblockView = [[UIView alloc] init];
        infoblockView.backgroundColor = [UIColor redColor];
        [infoblockScrollView addSubview:infoblockView];

//        UIView *spacer = [[UIView alloc] init];
//        spacer.backgroundColor = [UIColor brownColor];
//        [infoblockScrollView addSubview:spacer];
        
        
        
        infoblockView.translatesAutoresizingMaskIntoConstraints = NO;
//        spacer.translatesAutoresizingMaskIntoConstraints = NO;
        [infoblockScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[infoblockView]|"
                                                                                    options:0
                                                                                    metrics:nil
                                                                                      views:NSDictionaryOfVariableBindings(infoblockView)]];
//        [infoblockScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:|[spacer]|"
//                                                                                    options:0
//                                                                                    metrics:nil
//                                                                                      views:NSDictionaryOfVariableBindings(spacer)]];
//        [infoblockScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[infoblockView]|"
//                                                                                    options:0
//                                                                                    metrics:nil
//                                                                                      views:NSDictionaryOfVariableBindings(infoblockView)]];
        if (!prevInfoblockView) {
                    [infoblockScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:|[infoblockView(screenWidth)]"
                                                                                                options:0
                                                                                                metrics:@{@"screenWidth":@(screenWidth)}
                                                                                                  views:NSDictionaryOfVariableBindings(infoblockView)]];
        } else {
            [infoblockScrollView addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"H:[prevInfoblockView][infoblockView(screenWidth)]"
                                                                                        options:0
                                                                                        metrics:@{@"screenWidth":@(screenWidth)}
                                                                                          views:NSDictionaryOfVariableBindings(prevInfoblockView, infoblockView)]];
        }
        //originX = originX + screenWidth;
        prevInfoblockView = infoblockView;
    }
    infoblockScrollView.pagingEnabled = YES;
    self.infoblockScrollView = infoblockScrollView;
    //infoblockScrollView.contentSize = CGSizeMake(originX + screenWidth, screenHeight - 50 - 50 - 20);
    
    
}

- (void)viewDidLayoutSubviews {
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    CGFloat screenHeight = screenRect.size.height;
    
    self.infotypeContainerScrollView.contentSize = CGSizeMake(self.infoTypes.count * (150 + 3), 49);
    self.infoblockScrollView.contentSize = CGSizeMake(self.infoTypes.count * (screenWidth), screenHeight - 50 - 50 - 20);
    
    for (UIView *subview  in self.infoblockScrollView.subviews) {
        subview.backgroundColor = [UIColor whiteColor];
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
