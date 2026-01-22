# Repository Guidelines

## Project Structure & Module Organization
- `ElementX/` contains the main app sources; `ElementX.xcodeproj` is generated (do not edit directly).
- Feature and platform targets live at the repo root: `ShareExtension/`, `NSE/`, `Enterprise/`, `SDKMocks/`.
- Tests are grouped by type: `UnitTests/`, `UITests/`, `PreviewTests/`, `IntegrationTests/`, `AccessibilityTests/`.
- Build and tooling assets: `Tools/`, `ci_scripts/`, `fastlane/`, `project.yml`, `Package.swift`, `Package.resolved`.
- Vendored SwiftPM patches live in `Vendor/` (e.g., `Vendor/SFSafeSymbols`).
- UI assets and development resources live under `DevelopmentAssets/`.

## Build, Test, and Development Commands
- `swift run tools setup-project` installs dependencies, configures githooks, and runs XcodeGen once.
- `swift run tools build-sdk` builds the local Matrix Rust SDK and wires it into the app.
- `xcodegen` regenerates `ElementX.xcodeproj` after changes to `project.yml` or screen templates.
- `bundle exec fastlane` lists available CI lanes; use the relevant lane for automated builds/tests.
- `make setup` / `make build` / `make install` / `make run` wrap common simulator tasks. Set `SIMULATOR_ID` or `DERIVED_DATA` as needed.
- For day-to-day work, build/run tests via the shared **Element X** scheme in Xcode.

## Coding Style & Naming Conventions
- Swift style is enforced by `SwiftLint` (`.swiftlint.yml`) and `SwiftFormat` (`.swiftformat`).
- Follow Apple Swift API Design Guidelines; prefer 4-space indentation and spaces over tabs.
- New screens follow MVVM-Coordinator and use `MyScreenNameXxx` naming (see `Tools/Scripts/createScreen.sh`).

## Testing Guidelines
- Tests use XCTest; snapshots are stored under `Sources/__Snapshots__` in UI/Preview targets (Git LFS).
- Run tests from Xcode or via an appropriate Fastlane lane in `fastlane/Fastfile`.
- Update snapshots when UI changes and ensure LFS is installed (`git lfs install`).

## Commit & Pull Request Guidelines
- Recent history favors short, imperative subjects with optional issue references (e.g., `Fix #4856 ...`).
- Ensure your PR maps to a well-defined issue; UI/features require Product input.
- Use `pr-` labels to drive changelog sections (see `CHANGES.md` and `.github/release.yml`).
- Follow the external PR guide referenced in `CONTRIBUTING.md` when submitting.

## Strings & Localization
- Do not edit `Localizable.strings`, `Localizable.stringsdict`, or `InfoPlist.strings` directly.
- Add new `en` strings to `Untranslated.strings`/`Untranslated.stringsdict` for Localazy sync.
