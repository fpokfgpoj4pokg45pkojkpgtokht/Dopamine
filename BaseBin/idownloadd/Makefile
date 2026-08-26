XCODE_PROJECT = src/idownloadd.xcodeproj
XCODE_SCHEME = idownloadd
CS_FLAGS = CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO
CONFIGURATION = Release

OUTPUT_NAME = idownloadd

build:
	xcodebuild -archivePath ./.build -project $(XCODE_PROJECT) -scheme $(XCODE_SCHEME) -configuration $(CONFIGURATION) -destination generic/platform=iOS archive $(CS_FLAGS) DSTROOT=$(PWD)/.build_root INSTALL_PATH=/
	@cp -f ./.build_root/$(OUTPUT_NAME) .
	@rm -rf ./.build_root ./.build.xcarchive
	@ldid -Cadhoc -Sentitlements.plist $(OUTPUT_NAME)

clean:
	xcodebuild -project $(XCODE_PROJECT) -scheme $(XCODE_SCHEME) -configuration $(CONFIGURATION) -destination generic/platform=iOS clean
	@rm -rf $(OUTPUT_NAME) ./.build_root ./.build.xcarchive

default: build
