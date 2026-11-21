cask "wildstring" do
  version "0.8.25"
  sha256 "82e71fc659a1145c6c05536d1f5aa7bd9a27f75514770a2255e06d4555665498"

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
