# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "A btop-inspired terminal dashboard for AI coding-agent token usage, cost and budgets — reads Claude Code, Codex CLI, GitHub Copilot, Gemini CLI, OpenCode and Ollama, live TUI or JSON/CSV."
  homepage "https://github.com/SophanaSok/ai-usage-tui"
  version "0.12.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.12.1/ai-usage-tui-v0.12.1-aarch64-macos.tar.gz"
      sha256 "0f85d4cc7e330e2f936176bcdaa29b99c6758980bba5fdc0b6522e2e32797cdb"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.12.1/ai-usage-tui-v0.12.1-x86_64-macos.tar.gz"
      sha256 "05f505ddc38ae2f06931fe1c932edfe703422983c6b8681e5121d83ce732c69d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.12.1/ai-usage-tui-v0.12.1-x86_64-linux.tar.gz"
      sha256 "5024c53725c1903fc607ad4a5fb483c89f7727bc7b5aa0db360ef094d7398081"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.12.1/ai-usage-tui-v0.12.1-aarch64-linux.tar.gz"
      sha256 "9e81b1aedefe62e4ef186f1a2697dfcb45e42b836baff53d5fded6f9ee2b71b9"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
