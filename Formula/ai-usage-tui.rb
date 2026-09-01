# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "A btop-inspired terminal dashboard for AI coding-agent token usage, cost and budgets — reads Claude Code, Codex CLI, GitHub Copilot, Gemini CLI, OpenCode and Ollama, live TUI or JSON/CSV."
  homepage "https://github.com/SophanaSok/ai-usage-tui"
  version "0.12.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.12.0/ai-usage-tui-v0.12.0-aarch64-macos.tar.gz"
      sha256 "be38fd94766eee244ec2b05c90745094e3e414bd1ce2d35b990220f21703ce8c"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.12.0/ai-usage-tui-v0.12.0-x86_64-macos.tar.gz"
      sha256 "b553128b84551cf2468988d8b91eaa1b6dfc454faca723234a31707a4af9a284"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.12.0/ai-usage-tui-v0.12.0-x86_64-linux.tar.gz"
      sha256 "265e410d2e33cc60f1b295178c6786f57ebcbfc47df81abe827fd2e3024d6722"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.12.0/ai-usage-tui-v0.12.0-aarch64-linux.tar.gz"
      sha256 "73a1283f904076baed80ca922d59a4419e6ab153e6eb92fb8dab867c74c6c3ed"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
