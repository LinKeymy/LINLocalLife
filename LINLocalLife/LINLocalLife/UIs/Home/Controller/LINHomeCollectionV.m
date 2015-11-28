//
//  LINHomeCollectionV.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/25.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINHomeCollectionV.h"
#import "LINCollectionModel.h"

@interface LINHomeCollectionV ()


@property(nonatomic, strong) NSDictionary *datas;
@property(nonatomic, strong) LINCollectionModel *model;



@end

@implementation LINHomeCollectionV

static NSString * const reuseIdentifier = @"Cell";


- (NSDictionary *)datas{
    if (!_datas) {
        NSDictionary *dataDict = [NSDictionary dictionaryWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"home.plist" ofType:nil]];
        [LINCollectionModel mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"focus":@"LINFocusM",
                     @"group":@"LINGroupM",
                     @"famous":@"LINFamousM",
                     @"guess":@"LINGuessM"
                     };
        }];
        
       self.model = [LINCollectionModel mj_objectWithKeyValues:dataDict];
        _datas = dataDict;
    }
    return _datas;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登录／注册" style:UIBarButtonItemStylePlain target:self action:@selector(rightItemClicked:)];
    self.navigationItem.title = @"青岛生活圈";
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
 

}


- (void)rightItemClicked:(UIBarButtonItem *)sender{



}

- (instancetype)init{
    if (self = [super init]) {
           UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
      self = [self initWithCollectionViewLayout:flowLayout];
    }
    return self;
}



#pragma mark <UICollectionViewDataSource>

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [self.datas allKeys].count;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    NSString *key = [self.datas allKeys][section];
    return [self.datas[key] count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    
    
    
    return cell;
}

#pragma mark <UICollectionViewDelegate>








@end
