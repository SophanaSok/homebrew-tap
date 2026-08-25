# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "A btop-inspired terminal dashboard for AI coding-agent token usage, cost and budgets — reads Claude Code, Codex CLI, Gemini CLI, OpenCode and Ollama, live TUI or JSON/CSV."
  homepage "https://github.com/SophanaSok/ai-usage-tui"
  version "0.9.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.9.0/ai-usage-tui-v0.9.0-aarch64-macos.tar.gz"
      sha256 "73f2bc15407df783d69d1b58aaa7c3a1c35dbff7750c66148157faf4211f5614"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.9.0/ai-usage-tui-v0.9.0-x86_64-macos.tar.gz"
      sha256 "ec81fbb13d8e4e58f2d41c447b2a874bc9a66528717a50a181eb66f10b4fa1f3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.9.0/ai-usage-tui-v0.9.0-x86_64-linux.tar.gz"
      sha256 "ca8a9335ad40215862c0700181ed609d483aee1bf8489540cb908ef26eab6ee0"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.9.0/ai-usage-tui-v0.9.0-aarch64-linux.tar.gz"
      sha256 "3c62dfadc60c72c5156a0f51fe5edfa74f90bf1580f18931cfd0bfc932034066"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
