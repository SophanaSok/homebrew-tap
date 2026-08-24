# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "A btop-inspired dashboard for local and hosted AI usage"
  homepage "https://github.com/SophanaSok/ai-usage-tui"
  version "0.6.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.6.0/ai-usage-tui-v0.6.0-aarch64-macos.tar.gz"
      sha256 "fddc5a7cb72fda938e7da3e35db4fc0fe88f446e3771d84bbaff6ea66cb57df2"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.6.0/ai-usage-tui-v0.6.0-x86_64-macos.tar.gz"
      sha256 "170dd65b98b63b5791c1bebfdc5d95d478eadeb96f82b9e6318b21efae28ac15"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.6.0/ai-usage-tui-v0.6.0-x86_64-linux.tar.gz"
      sha256 "482bed8dd7498379bc12dfb2befb7c603b69e7125293f6174c0fcad35d5a7198"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.6.0/ai-usage-tui-v0.6.0-aarch64-linux.tar.gz"
      sha256 "0f252a443af2b8374c590f4dc7655ba8a801091f26bcfedcb43b6006cfbc8c5e"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
