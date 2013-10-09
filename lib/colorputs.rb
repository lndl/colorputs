module Kernel

  colors = Hash.new

  std_coloring = proc do |color_code, str|
    "\e#{color_code}#{str}\e[0m"
  end.curry()

  rainbow_coloring = proc do |str|
    str.chars.inject("") { |acc,c| acc + colors.values[rand(colors.size - 2)].(c) }
  end

  colors.merge!({
    red:     std_coloring.('[91m'),
    green:   std_coloring.('[92m'),
    yellow:  std_coloring.('[93m'),
    blue:    std_coloring.('[94m'),
    magenta: std_coloring.('[95m'),
    cyan:    std_coloring.('[96m'),
    white:   std_coloring.('[37m'),
    black:   std_coloring.('[30m'),
    rainbow: rainbow_coloring
  })

  old_puts = method :puts

  p_color_body = proc do |print_m_sym, obj, *args|
    maybe_color = args.last
    fancy_str = colors[maybe_color].(obj.send(print_m_sym)) rescue obj
    args.pop unless fancy_str == obj
    old_puts.(fancy_str, args)
  end.curry()

  define_method :puts, p_color_body.(:to_s)
  define_method :p, p_color_body.(:inspect)
end
