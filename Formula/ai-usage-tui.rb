# Rendered by .github/workflows/release.yml; placeholders are substituted at release time.
# Do not hand-edit the version or checksums -- they drifted from the published artifact names
# before (the tarball is tagged v0.2.0 but this file asked for 0.2.0) and every URL 404'd.
class AiUsageTui < Formula
  desc "A btop-inspired dashboard for local and hosted AI usage"
  homepage "https://github.com/SophanaSok/ai-usage-tui"
  version "0.8.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.8.0/ai-usage-tui-v0.8.0-aarch64-macos.tar.gz"
      sha256 "8c6e18fb351c208565a8f44b36f1450e4febf887635d78bf7cfd7e4f1d3c808b"
    end
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.8.0/ai-usage-tui-v0.8.0-x86_64-macos.tar.gz"
      sha256 "2793ae1ec69b3c8281193ed2990b96d01c30d12271fdbad1cadec0c1b83b2072"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.8.0/ai-usage-tui-v0.8.0-x86_64-linux.tar.gz"
      sha256 "625ff30e64c49b8465872d9083a32e2133b74e6923d9da473127408810091e6e"
    end
    # The aarch64-linux tarball has been built and published since v0.2.0; the formula simply
    # never offered it, so `brew install` on an ARM Linux box fell through to no bottle at all.
    on_arm do
      url "https://github.com/SophanaSok/ai-usage-tui/releases/download/v0.8.0/ai-usage-tui-v0.8.0-aarch64-linux.tar.gz"
      sha256 "bc482dd66cf577117db07761c5861f2d1716b18267decacc0d44cb5e43eaed6e"
    end
  end

  def install
    bin.install "ai-usage-tui"
  end

  test do
    assert_match "ai-usage-tui", shell_output("#{bin}/ai-usage-tui --version")
  end
end
