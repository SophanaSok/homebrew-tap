# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "A btop-inspired terminal dashboard for AI coding-agent token usage, cost and budgets — reads Claude Code, Codex CLI, Gemini CLI, OpenCode and Ollama, live TUI or JSON/CSV."
  homepage "https://github.com/SophanaSok/ai-usage-tui"
  version "0.11.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.11.0/ai-usage-tui-v0.11.0-aarch64-macos.tar.gz"
      sha256 "a4d423b9a93822a6d0fbf2392cbfcaaaddb6b3edc01704289aee252204bbede9"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.11.0/ai-usage-tui-v0.11.0-x86_64-macos.tar.gz"
      sha256 "d416c3da791ba068eac2cf7d9dbb5a68057999c6cdaece41674d6852cdc7389c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.11.0/ai-usage-tui-v0.11.0-x86_64-linux.tar.gz"
      sha256 "4ab547fd6ff4736c3538ba1baa24fac2c27fd56979fa65aa88161f932e6272b6"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.11.0/ai-usage-tui-v0.11.0-aarch64-linux.tar.gz"
      sha256 "e92f84e1c80d9f8e8778eccc8c875742e562e66c51a3034f0e38882e7d106e61"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
