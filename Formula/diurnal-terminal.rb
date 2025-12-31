class DiurnalTerminal < Formula
  desc "Automatically switch Terminal themes at sunrise and sunset"
  homepage "https://github.com/cboone/diurnal-terminal"
  url "https://github.com/cboone/diurnal-terminal.git", branch: "main"
  head "https://github.com/cboone/diurnal-terminal.git", branch: "main"
  version "0.1.0"

  depends_on "heliocron"

  def install
    bin.install "scripts/diurnal-terminal"
    bin.install "scripts/diurnal-terminal-switch-theme.applescript" => "switch-terminal-theme"
  end

  test do
    system bin/"diurnal-terminal", "--help"
  end
end
