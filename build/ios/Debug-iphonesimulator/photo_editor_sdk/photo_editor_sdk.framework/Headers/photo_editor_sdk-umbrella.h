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

#import "PhotoEditorSDKPlugin.h"

FOUNDATION_EXPORT double photo_editor_sdkVersionNumber;
FOUNDATION_EXPORT const unsigned char photo_editor_sdkVersionString[];

