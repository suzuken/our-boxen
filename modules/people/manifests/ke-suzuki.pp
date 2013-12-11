class people::taka84u9 {
  # 自分の環境で欲しいresourceをincludeする
  include dropbox
  include skype
  include iterm2::stable #::devもある
  include chrome
  include osx
  include virtualbox
  include intellij
  include mou

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

  $home     = "/Users/${::luser}"
  $dotfiles = "${home}/.dotfiles"

  file { $dotfiles:
    ensure => directory
  }
  repository { $dotfiles:
    source  => "suzuken/dotfiles",
    require => File[$home]
  }
  # git-cloneしたらインストールする
  exec { "sh ${dotfiles}/install.sh":
    cwd => $dotfiles,
    creates => ["${home}/.zshrc","${home}/.vimrc"],
    require => Repository[$dotfiles],
  }
}

