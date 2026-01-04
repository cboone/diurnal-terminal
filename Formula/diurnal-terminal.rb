class DiurnalTerminal < Formula
  desc "Automatically switch Terminal themes at sunrise and sunset"
  homepage "https://github.com/cboone/diurnal-terminal"
  url "https://github.com/cboone/diurnal-terminal.git", branch: "main"
  head "https://github.com/cboone/diurnal-terminal.git", branch: "main"
  version "0.3.2"

  depends_on "heliocron"

  def install
    bin.install "scripts/diurnal-terminal"
    bin.install "scripts/diurnal-terminal-switch-theme.applescript" => "switch-terminal-theme"
    (share).install "LaunchAgents/homebrew.mxcl.diurnal-terminal.template.plist"
    (share).install "config/diurnal-terminal.conf" => "diurnal-terminal.conf.example"
    zsh_completion.install "completions/_diurnal-terminal"
  end

  def post_install
    config_path = Pathname.new(Dir.home)/".config/diurnal-terminal.conf"
    return if config_path.exist?

    config_path.dirname.mkpath
    cp share/"diurnal-terminal.conf.example", config_path
    ohai "Created config at #{config_path}"
    ohai "Edit it with your coordinates, then run: brew services start diurnal-terminal"
  end

  def caveats
    <<~EOS
      To start diurnal-terminal:
        1. Edit ~/.config/diurnal-terminal.conf with your coordinates
        2. Run: brew services start diurnal-terminal
    EOS
  end

  service do
    run [opt_bin/"diurnal-terminal", "--overwrite-plist", "--restart-agent", "--run-at-load", "--update-theme"]
    run_type :immediate
    environment_variables PATH: std_service_path_env
  end

  test do
    system bin/"diurnal-terminal", "--help"
  end
end
