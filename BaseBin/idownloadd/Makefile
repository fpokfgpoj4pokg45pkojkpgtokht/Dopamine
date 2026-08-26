XCODE_PROJECT = src/idownloadd.xcodeproj
XCODE_SCHEME = idownloadd
CS_FLAGS = CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO
CONFIGURATION = Release

OUTPUT_NAME = idownloadd

build:
	xcodebuild -project $(XCODE_PROJECT) -scheme $(XCODE_SCHEME) -configuration $(CONFIGURATION) -destination generic/platform=iOS build $(CS_FLAGS) CONFIGURATION_BUILD_DIR=$(PWD)
	@ldid -Cadhoc -Sentitlements.plist $(OUTPUT_NAME)

clean:
	xcodebuild -project $(XCODE_PROJECT) -scheme $(XCODE_SCHEME) -configuration $(CONFIGURATION) -destination generic/platform=iOS clean
	@rm -rf $(OUTPUT_NAME)

default: build

