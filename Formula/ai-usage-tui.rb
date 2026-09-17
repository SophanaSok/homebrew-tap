# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "Terminal dashboard that measures what each AI coding model actually costs per passing test — routing, escalation and budget analytics across Claude Code, Codex CLI, GitHub Copilot, Gemini CLI, OpenCode and Local models, where an unknown cost stays unknown instead of rendering as $0.00. Live TUI or JSON/CSV."
  homepage "https://sophanasok.github.io/ai-usage-tui-site/"
  version "0.18.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.18.0/ai-usage-tui-v0.18.0-aarch64-macos.tar.gz"
      sha256 "10fcdffd3cc164d9f122c37eddfb736661a5cea959c9c1d5b91e116df9410105"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.18.0/ai-usage-tui-v0.18.0-x86_64-macos.tar.gz"
      sha256 "f11be2fc52d552be413b1ab4a41854af3e7a803651508466beb83af1c3779bdb"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.18.0/ai-usage-tui-v0.18.0-x86_64-linux.tar.gz"
      sha256 "7af1c458593caf5c5885916d0e33c5769a84662c58ab73bec967f66ff34a5ecb"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.18.0/ai-usage-tui-v0.18.0-aarch64-linux.tar.gz"
      sha256 "ed3179c53dda65c70c831fb472e24117704c39bac5fc54dc2500138cbff83304"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
