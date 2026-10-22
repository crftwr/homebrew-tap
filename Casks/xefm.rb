cask "xefm" do
  version "1.9.0"
  sha256 "93d862af9f11525c2a543ce173016b30c5320845ee957756be220ea1c569721c"

  url "https://github.com/crftwr/xefm/releases/download/v#{version}/XeFM-#{version}-macos.dmg"
  name "XeFM"
  desc "Dual-pane file manager"
  homepage "https://github.com/crftwr/xefm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :monterey

  app "XeFM.app"

  # ~/.xefm is left alone: the terminal app (the xefm formula, pip, uv) reads
  # the same config and state.
  zap trash: [
    "~/Library/Preferences/com.xefm.app.plist",
    "~/Library/Saved Application State/com.xefm.app.savedState",
  ]

  caveats <<~EOS
    This is the desktop app. For the terminal app, install the formula:
      brew install crftwr/tap/xefm
  EOS
end
