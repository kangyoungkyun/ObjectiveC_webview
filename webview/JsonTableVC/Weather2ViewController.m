//
//  Weather2ViewController.m
//  webview
//
//  Created by MacBookPro on 2018. 7. 27..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

#import "Weather2ViewController.h"
#import "Weather2TableViewCell.h"
@interface Weather2ViewController ()

@end

@implementation Weather2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSError *err;
    
    datalist = [NSJSONSerialization JSONObjectWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString: @"https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.json"]] options:NSJSONReadingAllowFragments error:&err];
    local = [[datalist objectForKey:@"weatherinfo"] objectForKey: @"local"];
    NSLog(@"%@",datalist);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return local.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Weather2TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell2" forIndexPath:indexPath];
    
    NSDictionary *dicTemp = [local objectAtIndex:indexPath.row];
    cell.contry.text = [dicTemp objectForKey:@"country"];
    NSString *weatherStr = [dicTemp objectForKey:@"weather"];
    cell.weather.text = weatherStr;
    cell.temp.text = [dicTemp objectForKey:@"temperature"];
    
    
    if([weatherStr isEqualToString:@"맑음"]){
        cell.imageView.image = [UIImage imageNamed:@"sunny2.png"];
    }else if([weatherStr isEqualToString:@"흐림"]){
        cell.imageView.image = [UIImage imageNamed:@"rain.png"];
    }else if([weatherStr isEqualToString:@"비"]){
        cell.imageView.image = [UIImage imageNamed:@"cloud.png"];
    }
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 180.0;
}


@end
