#import "SharkfoodMuteSwitchDetector.h"

extern void UnitySendMessage(const char *, const char *, const char *);

extern "C" {
    
    void StartListeningForMuteChanges() {
        [[SharkfoodMuteSwitchDetector shared] setSilentNotify:^(BOOL silent) {
            UnitySendMessage("MuteSwitchDetector", "OnMuteStateChanged", silent ? "True" : "False");
        }];
    }
    
    void StopListeningForMuteChanges() {
        [[SharkfoodMuteSwitchDetector shared] setSilentNotify:nil];
    }
    
    BOOL IsMuted() {
        return [SharkfoodMuteSwitchDetector shared].isMute;
    }
}