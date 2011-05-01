#import <UIKit/UIKit.h>
#import <objc/runtime.h>
#import <SpringBoard/SpringBoard.h>

#define ANIMATED YES

static int lastIconListNumber=0;

@interface SBIconController (add)
-(BOOL)hasOpenFolder;
@end

%hook SBIconListPageControl
- (void)setCurrentPageWithIconListNumber:(int)number 
{
    %log;
    
    id controller = [objc_getClass("SBIconController") sharedInstance];
    
    if (lastIconListNumber == number && ![controller hasOpenFolder])
    { 
        UIScrollView *_scrVw = [controller scrollView];
        
        int _n = (int)(_scrVw.contentSize.width / 320);
        
        if ((_n - 2) == number)
        {
            number=0;
            [_scrVw setContentOffset:CGPointMake(320,0) animated:ANIMATED];
        }
    }
    lastIconListNumber=number;
    %orig;
}
%end