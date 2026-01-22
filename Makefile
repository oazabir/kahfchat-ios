SCHEME ?= ElementX
BUNDLE_ID ?= io.element.elementx
SIMULATOR_ID ?= 48C646D0-E75A-4EBF-A20C-DF2A5886130D
DERIVED_DATA ?= /tmp/kahfchat-ios-derived
APP_BUNDLE := $(DERIVED_DATA)/Build/Products/Debug-iphonesimulator/$(SCHEME).app

.PHONY: setup build install run boot clean

setup:
	swift run tools setup-project

boot:
	xcrun simctl boot "$(SIMULATOR_ID)" || true

build:
	xcodebuild -scheme "$(SCHEME)" -destination "id=$(SIMULATOR_ID)" -derivedDataPath "$(DERIVED_DATA)" build

install: build
	xcrun simctl install "$(SIMULATOR_ID)" "$(APP_BUNDLE)"

run: install
	xcrun simctl launch "$(SIMULATOR_ID)" "$(BUNDLE_ID)"

clean:
	rm -rf "$(DERIVED_DATA)"
