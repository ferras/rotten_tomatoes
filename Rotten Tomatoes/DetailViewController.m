//
//  DetailViewController.m
//  Rotten Tomatoes
//
//  Created by Ferras Hamad on 9/14/14.
//  Copyright (c) 2014 Ferras Hamad. All rights reserved.
//

#import "DetailViewController.h"
#import "UIImageView+AFNetworking.h"

@interface DetailViewController ()


@property (nonatomic, strong) NSString *summary;
//@property (weak, nonatomic) IBOutlet UILabel *movieTitleLabel;
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIView *contentView;
@property (weak, nonatomic) IBOutlet UILabel *synopsisLabel;
@property (weak, nonatomic) IBOutlet UIImageView *posterView;

@end

@implementation DetailViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        //self.titleLabel.text = @"hello";

    }
    return self;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    [self.scrollView layoutIfNeeded];
    [self.synopsisLabel sizeToFit];
    CGRect contentRect = CGRectZero;
    
    for (UIView *subview in self.contentView.subviews) {
        contentRect = CGRectUnion(contentRect, subview.frame);
    }

    self.scrollView.contentSize = contentRect.size;
    //[self.scrollView setContentSize:(CGSizeMake(self.scrollView.contentSize.width, self.scrollView.contentSize.width + 10))];
    //self.scrollView.contentSize = (CGSizeMake(self.scrollView.contentSize.width, self.scrollView.contentSize.width + 10));
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.movieTitleLabel.text = self.movieTitle;
    self.synopsisLabel.text = self.movieSynopsis;
    NSString *str = [self.posterUrl stringByReplacingOccurrencesOfString:@"_tmb.jpg"
                                         withString:@"_org.jpg"];
    [self.posterView setImageWithURL:[NSURL URLWithString:str]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
