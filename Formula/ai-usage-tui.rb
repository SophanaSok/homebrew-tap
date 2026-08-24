# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "A btop-inspired dashboard for local and hosted AI usage"
  homepage "https://github.com/SophanaSok/ai-usage-tui"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.7.0/ai-usage-tui-v0.7.0-aarch64-macos.tar.gz"
      sha256 "360687df13e6da4b6b6aa335d80044d8aa2d6a34ed9cc60ce239cdfbc64a9edc"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.7.0/ai-usage-tui-v0.7.0-x86_64-macos.tar.gz"
      sha256 "a4dbcedeeae53e74ad67b9ed162ffbdffe4dcd255c0d2184727a2a24f70d0044"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.7.0/ai-usage-tui-v0.7.0-x86_64-linux.tar.gz"
      sha256 "3a652e65edb871d5812e312665ff22623cadb263f8bb1376445074ebd27bb110"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.7.0/ai-usage-tui-v0.7.0-aarch64-linux.tar.gz"
      sha256 "25e3b5465acda48d1ed300aaa0beda00d0c3a126efa3bdb76a907f41c6de7deb"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
