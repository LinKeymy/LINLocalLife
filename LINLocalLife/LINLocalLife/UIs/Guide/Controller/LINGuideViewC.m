//
//  LINGuideViewC.m
//  LINLocalLife
//
//  Created by 林荣安 on 15/11/25.
//  Copyright © 2015年 Family. All rights reserved.
//

#import "LINGuideViewC.h"

static NSString * const  reuseIdentifier = @"guideCell";

@implementation LINGuideViewC


- (void)viewDidLoad{
    [super viewDidLoad];
    self.collectionView.backgroundColor = [UIColor orangeColor];
    self.collectionView.pagingEnabled = YES;
    self.collectionView.bounces = NO;
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:reuseIdentifier];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    UIImageView *imageV = [[UIImageView alloc] init];
    NSString *imageName = [NSString stringWithFormat:@"guide_%ld",(long)indexPath.item];
    imageV.image = [UIImage imageNamed:imageName];
    imageV.frame = cell.contentView.frame;
    [cell.contentView addSubview:imageV];
    if (indexPath.item == 2) {
        UITapGestureRecognizer *tap  = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapped:)];
        [cell addGestureRecognizer:tap];
    }
    return cell;
}

- (void)tapped:(UITapGestureRecognizer *)sender{
    self.goHomeBlock();
}

@end
