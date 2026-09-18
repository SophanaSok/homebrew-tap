# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "Terminal dashboard that measures what each AI coding model actually costs per passing test — routing, escalation and budget analytics across Claude Code, Codex CLI, GitHub Copilot, Gemini CLI, OpenCode and Local models, where an unknown cost stays unknown instead of rendering as $0.00. Live TUI or JSON/CSV."
  homepage "https://sophanasok.github.io/ai-usage-tui-site/"
  version "1.0.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v1.0.1/ai-usage-tui-v1.0.1-aarch64-macos.tar.gz"
      sha256 "24c96073c2f241ad635827066f499ce53e54257ff920f9faf6d7451cc1f51c84"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v1.0.1/ai-usage-tui-v1.0.1-x86_64-macos.tar.gz"
      sha256 "183c8ee232628410e214b816857da349d40d7ad9449eacdd68dff3f4139008a9"
    end
  end

  # The static builds. Homebrew on Linux is mostly found on LTS distributions, and the gnu
  # archives need the glibc of the release runner (2.39 through v0.20.0), which Ubuntu 22.04 and
  # Debian 12 do not have: the formula installed a binary that would not start.
  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v1.0.1/ai-usage-tui-v1.0.1-x86_64-linux-musl.tar.gz"
      sha256 "d7cbeced2df1d4ca170bd56d09eb4be1690b0673ca8fa9fd4eb6d4e41fdde221"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v1.0.1/ai-usage-tui-v1.0.1-aarch64-linux-musl.tar.gz"
      sha256 "68e1eb9016a68e4c298f5129f81da87cb3a02c4ec3dceb5b21bd147c015b9ca6"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
