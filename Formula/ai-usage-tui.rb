# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "A btop-inspired terminal dashboard for AI coding-agent token usage, cost and budgets — reads Claude Code, Codex CLI, Gemini CLI, OpenCode and Ollama, live TUI or JSON/CSV."
  homepage "https://github.com/SophanaSok/ai-usage-tui"
  version "0.10.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.10.0/ai-usage-tui-v0.10.0-aarch64-macos.tar.gz"
      sha256 "a9f16e13e40a51b7f85cfccea14125ba9315e15e0f6a37613b5850b3bf25e4f3"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.10.0/ai-usage-tui-v0.10.0-x86_64-macos.tar.gz"
      sha256 "68d24e4a1246b89aae93a7c8b0c6df626fd2193c31f90ba1e82a14e9498c69a3"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.10.0/ai-usage-tui-v0.10.0-x86_64-linux.tar.gz"
      sha256 "5111e825e640ca6f9e22964aecfb89f20ae3866545e76e2bd9edfddf48ba691b"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.10.0/ai-usage-tui-v0.10.0-aarch64-linux.tar.gz"
      sha256 "4f377279a2658f17a6b2a359ca0faa8d8e1c4dc180919bdbffa4bdbab0205a9e"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
