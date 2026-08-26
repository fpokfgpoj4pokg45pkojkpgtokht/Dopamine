XCODE_PROJECT = src/idownloadd.xcodeproj
XCODE_SCHEME = idownloadd
CS_FLAGS = CODE_SIGN_IDENTITY="" CODE_SIGNING_REQUIRED=NO CODE_SIGNING_ALLOWED=NO
CONFIGURATION = Release

OUTPUT_NAME = idownloadd

build:
	xcodebuild -project $(XCODE_PROJECT) -scheme $(XCODE_SCHEME) -configuration $(CONFIGURATION) -destination generic/platform=iOS build $(CS_FLAGS) SYMROOT=$(PWD)/DerivedData
	@cp -f $(PWD)/DerivedData/$(CONFIGURATION)-iphoneos/$(OUTPUT_NAME) ./$(OUTPUT_NAME)
	@rm -rf $(PWD)/DerivedData
	@ldid -Cadhoc -Sentitlements.plist $(OUTPUT_NAME)

clean:
	xcodebuild -project $(XCODE_PROJECT) -scheme $(XCODE_SCHEME) -configuration $(CONFIGURATION) -destination generic/platform=iOS clean
	@rm -rf $(OUTPUT_NAME) $(PWD)/DerivedData

default: build
