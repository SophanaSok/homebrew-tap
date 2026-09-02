# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "Terminal dashboard that measures what each AI coding model actually costs per passing test — routing, escalation and budget analytics across Claude Code, Codex CLI, GitHub Copilot, Gemini CLI, OpenCode and Ollama, where an unknown cost stays unknown instead of rendering as $0.00. Live TUI or JSON/CSV."
  homepage "https://github.com/SophanaSok/ai-usage-tui"
  version "0.14.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.14.0/ai-usage-tui-v0.14.0-aarch64-macos.tar.gz"
      sha256 "0616922c285cebbe927ec40479a617c6a2ce17c34f97b685e027370dc221bc9c"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.14.0/ai-usage-tui-v0.14.0-x86_64-macos.tar.gz"
      sha256 "14869b3dd6d4962d4551d246da893159d5ee4cabf824279c513f79e2352badbc"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.14.0/ai-usage-tui-v0.14.0-x86_64-linux.tar.gz"
      sha256 "67f98d27ed711a4f5fa845e9c53bfdb1c630adee2be40415f69dd3aaa3d7f337"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.14.0/ai-usage-tui-v0.14.0-aarch64-linux.tar.gz"
      sha256 "c92c1d58f5d8eb5bc1bc1f46727f5f1f59ae58310f3b9dfe33b842561cbca306"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
