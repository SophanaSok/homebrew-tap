# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "Terminal dashboard that measures what each AI coding model actually costs per passing test — routing, escalation and budget analytics across Claude Code, Codex CLI, GitHub Copilot, Gemini CLI, OpenCode and Ollama, where an unknown cost stays unknown instead of rendering as $0.00. Live TUI or JSON/CSV."
  homepage "https://github.com/SophanaSok/ai-usage-tui"
  version "0.13.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.13.0/ai-usage-tui-v0.13.0-aarch64-macos.tar.gz"
      sha256 "6b553639c1c9cf77fdf895b1da97f174f07f09e9c49968285842a765693a23fb"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.13.0/ai-usage-tui-v0.13.0-x86_64-macos.tar.gz"
      sha256 "dbaa4477d93a16c164fb2ad080151ce3e228709e10f7a875b362eb63dc1f482e"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.13.0/ai-usage-tui-v0.13.0-x86_64-linux.tar.gz"
      sha256 "0b17fc2a7bcf846482be547903d0e17fd72c072785080b224826607fb352407e"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.13.0/ai-usage-tui-v0.13.0-aarch64-linux.tar.gz"
      sha256 "fb3a2cc812f55eeae5bb24d9a07e33cf3220ee4b9afecbd8416de217fb479202"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
