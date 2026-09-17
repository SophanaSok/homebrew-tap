# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "Terminal dashboard that measures what each AI coding model actually costs per passing test — routing, escalation and budget analytics across Claude Code, Codex CLI, GitHub Copilot, Gemini CLI, OpenCode and Local models, where an unknown cost stays unknown instead of rendering as $0.00. Live TUI or JSON/CSV."
  homepage "https://github.com/SophanaSok/ai-usage-tui"
  version "0.17.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.17.0/ai-usage-tui-v0.17.0-aarch64-macos.tar.gz"
      sha256 "975dbfa9e61efbf94e425fe5442a29c9ef60e34430a22bbb16d74ddbc247624f"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.17.0/ai-usage-tui-v0.17.0-x86_64-macos.tar.gz"
      sha256 "dec4121f27015355297a42fb6b0bfda98d6d9b96daa5f4dda3cb7da801a87612"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.17.0/ai-usage-tui-v0.17.0-x86_64-linux.tar.gz"
      sha256 "1c6df1d45b1724f323df25b46ad847ef1b537b8086b23cab10edc08988dbb353"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.17.0/ai-usage-tui-v0.17.0-aarch64-linux.tar.gz"
      sha256 "43cbcc7927fab5b1a13d3b659c0b3ee5f74d03c6bbc6832709ce6ce357a5c5ad"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
