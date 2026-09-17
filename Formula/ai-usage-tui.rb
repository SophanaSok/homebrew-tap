# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "Terminal dashboard that measures what each AI coding model actually costs per passing test — routing, escalation and budget analytics across Claude Code, Codex CLI, GitHub Copilot, Gemini CLI, OpenCode and Local models, where an unknown cost stays unknown instead of rendering as $0.00. Live TUI or JSON/CSV."
  homepage "https://sophanasok.github.io/ai-usage-tui-site/"
  version "0.19.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.19.0/ai-usage-tui-v0.19.0-aarch64-macos.tar.gz"
      sha256 "383e662b0eca10d10146be87128d59d4d865b61b7213eb2822ea09b463357073"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.19.0/ai-usage-tui-v0.19.0-x86_64-macos.tar.gz"
      sha256 "0653177ce239053904002169b338653046a4df366f092b9113ed0d2b19db7702"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.19.0/ai-usage-tui-v0.19.0-x86_64-linux.tar.gz"
      sha256 "40de0a87a711dfb7324f08023c140c8efc7d2692538afca0c3efb42ed2d086ce"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.19.0/ai-usage-tui-v0.19.0-aarch64-linux.tar.gz"
      sha256 "f43d4d056b43737e669b61a7be96266905ae4b89aea8b0e3a2c117f87d1cbc70"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
