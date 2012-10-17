#import "GenericViewController.h"
#import <AVFoundation/AVFoundation.h>  

@interface CrisisModeViewController : GenericViewController  <AVAudioPlayerDelegate>

@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end
