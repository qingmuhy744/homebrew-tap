cask "wildstring" do
  version "0.8.19"
  sha256 "50c3ec7bdbdcc3550e7e6c7bd5fbbf8e4cc8a01cb49dc0b922b05b19395c5786"

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
