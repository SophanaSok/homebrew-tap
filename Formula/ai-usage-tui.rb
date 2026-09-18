# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "Terminal dashboard that measures what each AI coding model actually costs per passing test — routing, escalation and budget analytics across Claude Code, Codex CLI, GitHub Copilot, Gemini CLI, OpenCode and Local models, where an unknown cost stays unknown instead of rendering as $0.00. Live TUI or JSON/CSV."
  homepage "https://sophanasok.github.io/ai-usage-tui-site/"
  version "1.1.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v1.1.0/ai-usage-tui-v1.1.0-aarch64-macos.tar.gz"
      sha256 "2c96638dd5bc7b401a9a0c11d7449d2cc8e6daeaa57dba07971642125b78f5a2"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v1.1.0/ai-usage-tui-v1.1.0-x86_64-macos.tar.gz"
      sha256 "8f29c75180ed49cf3880af722471dc0d2f3b29e46ca960ff38fccf8e346ed331"
    end
  end

  # The static builds. Homebrew on Linux is mostly found on LTS distributions, and the gnu
  # archives need the glibc of the release runner (2.39 through v0.20.0), which Ubuntu 22.04 and
  # Debian 12 do not have: the formula installed a binary that would not start.
  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v1.1.0/ai-usage-tui-v1.1.0-x86_64-linux-musl.tar.gz"
      sha256 "3932160edf7752f50b6e2bd141b90fe9ea291bd14ed209b1fbc2a3a24e8cabb0"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v1.1.0/ai-usage-tui-v1.1.0-aarch64-linux-musl.tar.gz"
      sha256 "3ba95c168cf73c7bbe6e10ce7a7f6b5493e5a4115a0e62492b00a3c46a561ce9"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
