//
//  BVSLeftSideDrawerTableViewController.m
//  BVS_Lite
//
//  Created by Tory on 16/3/3.
//  Copyright © 2016年 normcore. All rights reserved.
//

#import "BVSLeftSideDrawerTableViewController.h"
#import "BVSLeftSideDrawerTableHeaderView.h"

@interface BVSLeftSideDrawerTableViewController ()

@property (nonatomic, strong) UIView *tableHeaderView;

@end

@implementation BVSLeftSideDrawerTableViewController

- (id)init {
    self = [super init];
    if(self) {
        [self setRestorationIdentifier:@"BVSLeftSideDrawerController"];
        _tableHeaderView = [[BVSLeftSideDrawerTableHeaderView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 50)];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
//    self.title = @"ver 1.0.0 2016-3-6";
    self.tableView.tableHeaderView = _tableHeaderView;
    self.tableView.tableFooterView = [[UIView alloc] init];
    self.tableView.backgroundColor = [UIColor colorWithRed:33.0/255.0
                                                     green:202.0/255.0
                                                      blue:183.0/255.0
                                                     alpha:1.0];
    
    UINavigationBar *bar = self.navigationController.navigationBar;
    bar.barTintColor = [UIColor colorWithRed:243.0/255.0
                                       green:243.0/255.0
                                        blue:243.0/255.0
                                       alpha:1.0];
    [bar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:100.0/255.0
                                                                                   green:100.0/255.0
                                                                                    blue:100.0/255.0
                                                                                   alpha:1.0]}];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 7;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"LeftCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    cell.backgroundColor = [UIColor colorWithRed:33.0/255.0
                                           green:202.0/255.0
                                            blue:183.0/255.0
                                           alpha:1.0];
    cell.textLabel.textColor = [UIColor whiteColor];
    
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text = @"一般信息";
            break;
        case 1:
            cell.textLabel.text = @"保存帧设置";
            break;
        case 2:
            cell.textLabel.text = @"校正模式";
            break;
        case 3:
            cell.textLabel.text = @"探头设置";
            break;
        case 4:
            cell.textLabel.text = @"更新探头固件";
            break;
        case 5:
            cell.textLabel.text = @"授权信息";
            break;
        case 6:
            cell.textLabel.text = @"探头参数";
            break;
        default:
            break;
    }
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
