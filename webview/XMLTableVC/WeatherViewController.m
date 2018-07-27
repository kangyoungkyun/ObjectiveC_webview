//
//  WeatherViewController.m
//  webview
//
//  Created by MacBookPro on 2018. 7. 27..
//  Copyright © 2018년 MacBookPro. All rights reserved.
//

#import "WeatherViewController.h"
#import "WeatherCell.h"
@interface WeatherViewController ()


@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //배열 초기화
    datalist = [[NSMutableArray alloc]init];
    
    //파서 설정
    parser = [[NSXMLParser alloc]initWithContentsOfURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/ChoiJinYoung/iphonewithswift2/master/weather.xml"]];
    parser.delegate = self;
    [parser parse];
    
    //파서를 다 돌고 마지막에 실행됨
    NSLog(@"%@", datalist);
}


//파서가 돌때 xml이 시작되는 부분에서 작동
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary<NSString *,NSString *> *)attributeDict{
    NSLog(@"didStartElement : %@", elementName);
    
    //딕셔너리 초기화
    if([elementName isEqualToString:@"local"]){
        detailData = [[NSMutableDictionary alloc]init];
    }
    //xml안의 value 값을 넣어준다.
    elementTemp = elementName;
    blank = YES;
}

//xml의 벨류 값을 가져오는 녀석
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string{
    
    if(blank == YES && ![elementTemp isEqualToString:@"local"]){
        NSLog(@"foundCharacters : %@", string);
        [detailData setObject:string forKey:elementTemp];
    }
}

//xml의 마지막 꺽쇠 (>) 부분에서 실행
- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName{
    
    //날씨 키:벨류를 딕셔너리에 다 넣었으면 그 한 묶음을 배열에 넣어준다.
    if([elementName isEqualToString:@"local"]){
        [datalist addObject:detailData];
    }
    NSLog(@"didEndElement : %@", elementName);
    blank = NO;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return datalist.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    WeatherCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    NSDictionary *dicTemp = [datalist objectAtIndex:indexPath.row];
    cell.contry.text = [dicTemp objectForKey:@"country"];
    NSString *weatherStr = [dicTemp objectForKey:@"weather"];
    cell.weather.text = weatherStr;
    cell.temper.text = [dicTemp objectForKey:@"temperature"];
    
    
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
