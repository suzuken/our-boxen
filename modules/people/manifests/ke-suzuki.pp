class people::taka84u9 {
  include dropbox
  include skype
  include iterm2::stable #::devもある
  include chrome
  include osx
  include virtualbox
  include intellij
  include mou
  include caffeine
  include github_for_mac
  include vagrant
  include pckeyboardhack::login_item

  # homebrewでインストール
  package {
    [
      'apple-gcc42',
      's3cmd',
      'tmux',
      'cmake',
      'csshx',
      'hive',
      'ctags',
      'mysql',
      'gnuplot',
      'pcre',
      'graphviz',
      'reattach-to-user-namespace',
      'tig',
      'the_silver_searcher',
      'go',
      'mercurial',
      'php54',
      'php54-mcrypt',
      'php54-mongo',
      'php54-xdebug',
      'scala',
      'sbt',
      'mcrypt',
      'phpenv',
      'pyenv',
      'wget',
      'gauche',
      'fontforge',
      'autojump',
      'zsh',
      'lv',
    ]:
  }

  package {
    'GoogleJapaneseInput':
      source => "http://dl.google.com/japanese-ime/latest/GoogleJapaneseInput.dmg",
      provider => pkgdmg;
    'Gyazo'
      source => "https://files.gyazo.com/setup/Gyazo_2.0.dmg",
      provider => pkgdmg;
  }

  $home     = "/Users/${::luser}"
  $dotfiles = "${home}/.dotfiles"

  file { $dotfiles:
    ensure => directory
  }
  repository { $dotfiles:
    source  => "suzuken/dotfiles",
    require => File[$home]
  }
  exec { "sh ${dotfiles}/install.sh":
    cwd => $dotfiles,
    creates => ["${home}/.zshrc","${home}/.vimrc"],
    require => Repository[$dotfiles],
  }

  pckeyboardhack::bind { 'keyboard bindings':
    mappings => { 'jis_nfer' => 76 }
  }
  pckeyboardhack::bind { 'keyboard bindings':
    mappings => { 'jis_xfer' => 53 }
  }
}

