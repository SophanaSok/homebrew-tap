# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "Terminal dashboard that measures what each AI coding model actually costs per passing test — routing, escalation and budget analytics across Claude Code, Codex CLI, GitHub Copilot, Gemini CLI, OpenCode and Local models, where an unknown cost stays unknown instead of rendering as $0.00. Live TUI or JSON/CSV."
  homepage "https://github.com/SophanaSok/ai-usage-tui"
  version "0.16.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.16.0/ai-usage-tui-v0.16.0-aarch64-macos.tar.gz"
      sha256 "f89d2b1690855775a1d6165988cf27ab42b5ac451d1fefe1f24dae783958efdd"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.16.0/ai-usage-tui-v0.16.0-x86_64-macos.tar.gz"
      sha256 "11609bf5885983caa1c1d5b8af9e08de2f3366b22a712b8df21a63f0393cde7a"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.16.0/ai-usage-tui-v0.16.0-x86_64-linux.tar.gz"
      sha256 "1d2489f5a8a133eed7be3f8951cca3d047eb9a100b62441f9cc387a65898ee30"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.16.0/ai-usage-tui-v0.16.0-aarch64-linux.tar.gz"
      sha256 "ec9d38e23e865b8e7a77801aca93ef91b39ae04f004a8d703bb9b7d3e5bdc7e9"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
