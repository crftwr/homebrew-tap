cask "xefm" do
  version "1.17.1"
  sha256 "b96b805c280e7739d8a82cc364317d75013cd63f0336da6f5594ece11a0d0ffe"

  url "https://github.com/crftwr/xefm/releases/download/v#{version}/XeFM-#{version}-macos.dmg"
  name "XeFM"
  desc "Dual-pane file manager"
  homepage "https://github.com/crftwr/xefm"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

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
