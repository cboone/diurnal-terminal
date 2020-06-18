class DiurnalTerminal < Formula
  desc "Automatically switch Terminal themes at sunrise and sunset"
  homepage "https://github.com/cboone/diurnal-terminal"
  version "0.1.0"
  url "https://github.com/cboone/diurnal-terminal/archive/v#{version}.tar.gz"
  sha256 "837da6a2e8f461b0a950e208dfa5d8f8fffabaab9482dd41a662efbb3cb987aa"
  head "https://github.com/cboone/diurnal-terminal.git", :branch => "main"

  depends_on "heliocron"

  def install
    bin.mkpath
    bin.install "scripts/#{name}"
    bin.install "scripts/#{name}-switch-theme.applescript" => "switch-terminal-theme"

    share.mkpath
    share.install "LaunchAgents/#{plist_name}.template.plist"
  end

  bottle :unneeded

  def caveats
    <<~EOS
      Create ~/.config/#{name}.conf and put something like this in it:
        LATITUDE=37.783N
        LONGITUDE=122.417W
        NIGHT_THEME=Nord
        DAY_THEME=Atom One Light

      Do this before running or loading the service
    EOS
  end

  plist_options :manual => "diurnal-terminal [-h|--help] [-v|--verbose] [--overwrite-plist|--print-plist|--restart-agent|--update-theme]"
  def plist
    `#{bin/name} --print-plist`
  end

  test do
    (testpath/".config/diurnal-terminal.conf").write <<~EOS
      LATITUDE=37.783N
      LONGITUDE=122.417W
      NIGHT_THEME=Nord
      DAY_THEME=Atom One Light
    EOS
    assert_match /homebrew.mxcl.diurnal-terminal.log/,
      shell_output("#{bin/name} --print-plist")
  end
end
