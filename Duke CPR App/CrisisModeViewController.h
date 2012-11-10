#import "GenericViewController.h"
#import <AVFoundation/AVFoundation.h>  

@interface CrisisModeViewController : GenericViewController  <AVAudioPlayerDelegate>

@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end
