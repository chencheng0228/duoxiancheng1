//
//  ViewController.m
//  多线程
//
//  Created by admin on 14-8-14.
//  Copyright (c) 2014年 ___DNEUSER___. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    mystyle * style;
    if (style== style1) {
        
    }
//块
    //返回值类型+传递参数=传递参数
    NSString* (^myBlock)(NSString*) =  ^(NSString * str){return str;};
    NSLog(@"%@",myBlock(@"HelloEveryBoday"));
    
//===================================主线程===============================================
   [self hello];
// [self hello2];
    
//=========================通过NSInvocationOperation实现多线程。=============================
    
       NSOperationQueue *operationQueue = [[NSOperationQueue alloc]init];
       [operationQueue setMaxConcurrentOperationCount:2];

       //NSInvocationOperation *operation = [[NSInvocationOperation alloc]initWithTarget:self selector:@selector(hello) object:nil];
    
       NSInvocationOperation *operation2 = [[NSInvocationOperation  alloc]initWithTarget:self selector:@selector(hello2) object:nil];
    
       //[operationQueue addOperation:operation];
       [operationQueue addOperation:operation2];
    
    
    
//=========================通过NSThread来实现多线程.=======================================
    
    
                   //(1)类方法
//    [NSThread detachNewThreadSelector:@selector(hello) toTarget:self withObject:nil];
//    [NSThread detachNewThreadSelector:@selector(hello2) toTarget:self withObject:nil];
//                //(2)实例方法
//    NSThread *thread = [[NSThread alloc]initWithTarget:self selector:@selector(hello)object:nil];
//    [thread start];
//    NSThread *thread2 = [[NSThread alloc]initWithTarget:self selector:@selector(hello2)object:nil];
//    [thread2 start];
    
    //1.第一种方式会立即调用并执行线程，第二种必须调用start方法后才会开始执行线程，在此之前可以对线程进行一些设置，比如线程优先级等。第二种方式与Java中线程的使用类似。
    // 2.使用类方法（Convenient Method）创建的线程不需要进行内存清理，而使用initWithTarget方法创建的线程需要当retainCount为0时调用release方法释放内存。
    
    
    
//==========================在后台创建一个线程来执行任务======================================
    
//方法为我们在后台创建了一个线程。这等同于 我们为 selectors 创建一个新的线程。 但是要记住，必须在调用的方法中加上自动释放池！
//    [self performSelectorInBackground:@selector(hello3) withObject:nil];
//    [self performSelectorInBackground:@selector(hello4) withObject:nil];
    
    UITableView * tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    
    tableView.layer.borderWidth = 1;
    [tableView setSectionIndexColor:[UIColor redColor]];
    tableView.backgroundColor = [UIColor whiteColor];
    tableView.contentOffset = CGPointMake(100, 100);
    tableView.contentMode = UIViewContentModeRedraw;
    tableView.contentOffset = CGPointMake(180, 100);
    
    [self.view addSubview:tableView];
    
    
}

-(void)hello
{
    
    for (int i=3; i<=6; i++) {
        NSLog(@"%d",i);
    }
    
    //可以回到主线程在UI上进行更新
    //[self performSelectorOnMainThread:  withObject:  waitUntilDone: ];
}
-(void)hello2
{
    for (int i=0; i<=2; i++) {
        NSLog(@"%d",i);
    }
}

-(void)hello3
{
    @autoreleasepool {
        for (int i=3; i<=6; i++) {
        NSLog(@"%d",i);
        }
    }
    
}

-(void)hello4
{
    @autoreleasepool {
        for (int i=0; i<=2; i++) {
        NSLog(@"%d",i);
        }
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    
}

-(void)dosomethings
{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



@end
