# colorization
  def colorize(color_code, string)
    "\e[#{color_code}m#{string}\e[0m"
  end

  def red (string)
    colorize(31, string)
  end

  def green (string)
    colorize(32, string)
  end