#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "ImglySDKPlugin.h"

FOUNDATION_EXPORT double imgly_sdkVersionNumber;
FOUNDATION_EXPORT const unsigned char imgly_sdkVersionString[];

