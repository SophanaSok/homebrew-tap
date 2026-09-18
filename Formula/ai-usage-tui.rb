# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "Terminal dashboard that measures what each AI coding model actually costs per passing test — routing, escalation and budget analytics across Claude Code, Codex CLI, GitHub Copilot, Gemini CLI, OpenCode and Local models, where an unknown cost stays unknown instead of rendering as $0.00. Live TUI or JSON/CSV."
  homepage "https://sophanasok.github.io/ai-usage-tui-site/"
  version "1.0.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v1.0.0/ai-usage-tui-v1.0.0-aarch64-macos.tar.gz"
      sha256 "5e343b71e14d04745d946a438303824ba8fa3b78cc0b1990476954e6c3b8e831"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v1.0.0/ai-usage-tui-v1.0.0-x86_64-macos.tar.gz"
      sha256 "255f062fa3bc6dde3a2c2ec47981316ad18945625c0ed7fbfdade1b73940f88c"
    end
  end

  # The static builds. Homebrew on Linux is mostly found on LTS distributions, and the gnu
  # archives need the glibc of the release runner (2.39 through v0.20.0), which Ubuntu 22.04 and
  # Debian 12 do not have: the formula installed a binary that would not start.
  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v1.0.0/ai-usage-tui-v1.0.0-x86_64-linux-musl.tar.gz"
      sha256 "605286221c11809ee1323f9e9a08c8d02b3b5e0181a7b9512a0a1c6465963edb"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v1.0.0/ai-usage-tui-v1.0.0-aarch64-linux-musl.tar.gz"
      sha256 "f0c5d4f9b8e742fcac8924078950502b50ae2f56a6a1d88c199bf022d16cb819"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
