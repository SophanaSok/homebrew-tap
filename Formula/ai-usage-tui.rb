# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "Terminal dashboard that measures what each AI coding model actually costs per passing test — routing, escalation and budget analytics across Claude Code, Codex CLI, GitHub Copilot, Gemini CLI, OpenCode and Ollama, where an unknown cost stays unknown instead of rendering as $0.00. Live TUI or JSON/CSV."
  homepage "https://github.com/SophanaSok/ai-usage-tui"
  version "0.15.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.15.0/ai-usage-tui-v0.15.0-aarch64-macos.tar.gz"
      sha256 "6ac30ceeec390926d2e37df9a4d4cf7a28cbf67e985b6f6d5b2d2b9effa8cb82"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.15.0/ai-usage-tui-v0.15.0-x86_64-macos.tar.gz"
      sha256 "db8c56bf398a55edaa633d8d80476e936282d67cc27630943ce77f138fa9b88d"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.15.0/ai-usage-tui-v0.15.0-x86_64-linux.tar.gz"
      sha256 "096bdf17b63fa9b94c3ee2e9ab9b2f2bb94e0c2cb9f398d51dbb7bfbd6d4b797"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.15.0/ai-usage-tui-v0.15.0-aarch64-linux.tar.gz"
      sha256 "92b36ae450b0783964bb84162e46b0d233424e56a23091742be3b98ebe620899"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
