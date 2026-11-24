cask "wildstring" do
  version "0.8.29"
  sha256 "0f5e45eb9ae41cc06d63de48b5d99f66d16c6c7d60113a9a4b0239cfa20554e3"

  url "https://github.com/qingmuhy744/wildstring/releases/download/v#{version}/WildString-macOS.dmg"
  name "WildString"
  name "野弦"
  desc "AI-native self-hosted private music and podcast player"
  homepage "https://github.com/qingmuhy744/wildstring"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on macos: ">= :sonoma"

  app "WildString.app"

  postflight do
    system_command "/usr/bin/xattr",
                   args:         ["-dr", "com.apple.quarantine", "#{appdir}/WildString.app"],
                   must_succeed: false
  end

  zap trash: [
    "~/Library/Application Support/WildString",
    "~/Library/Preferences/com.wildstring.mac.plist",
    "~/Library/Caches/com.wildstring.mac",
  ]
end
