# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "Terminal dashboard that measures what each AI coding model actually costs per passing test — routing, escalation and budget analytics across Claude Code, Codex CLI, GitHub Copilot, Gemini CLI, OpenCode and Local models, where an unknown cost stays unknown instead of rendering as $0.00. Live TUI or JSON/CSV."
  homepage "https://sophanasok.github.io/ai-usage-tui-site/"
  version "0.20.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.20.0/ai-usage-tui-v0.20.0-aarch64-macos.tar.gz"
      sha256 "c7a98ac5a290502e472b1ae2e24712e7f983a84cd80fda5ee352325dc7eb0f01"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.20.0/ai-usage-tui-v0.20.0-x86_64-macos.tar.gz"
      sha256 "5d11bc776a4e2b7822db3faa21a3015a3535b42d8d1cb59672cb17def88cb5f9"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.20.0/ai-usage-tui-v0.20.0-x86_64-linux.tar.gz"
      sha256 "75aa11f136c09b9ef1274a99db3720c21230e64d74633ea77e55d6dda93dcb04"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.20.0/ai-usage-tui-v0.20.0-aarch64-linux.tar.gz"
      sha256 "57171f199a126cdbc6b4ca7e5b5fe32e3089d4bc4109eb995f8351b8724a7d01"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
