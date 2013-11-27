module Colorputs

  colors = Hash.new
  modes  = Hash.new

  format_wrapper = ->(start_code, str, end_code) { "\e[#{start_code}m#{str}\e[#{end_code}m" }

  std_mode = proc do |start_mode, end_mode, str|
    format_wrapper.(start_mode, str, end_mode)
  end.curry()

  std_coloring = proc do |color_code, str|
    format_wrapper.(color_code, str, 0)
  end.curry()

  rainbow_coloring = proc do |str|
    str.chars.inject("") { |acc,c| acc + colors.values[rand(colors.size - 2)].(c) }
  end

  modes.merge!({
    b:  std_mode.(1,21), # Bold
    bl: std_mode.(5,25), # Blinking
    u:  std_mode.(4,24), # Underlined
    r:  std_mode.(7,27)  # Reversed
  })

  colors.merge!({
    red:     std_coloring.('91'),
    green:   std_coloring.('92'),
    yellow:  std_coloring.('93'),
    blue:    std_coloring.('94'),
    magenta: std_coloring.('95'),
    cyan:    std_coloring.('96'),
    white:   std_coloring.('37'),
    black:   std_coloring.('30'),
    rainbow: rainbow_coloring
  })

  old_puts = Kernel.method :puts

  fancyner = proc do |normal_str, maybe_Cp_code| 
    if maybe_Cp_code.instance_of? Symbol
      maybe_color, maybe_mode = maybe_Cp_code.to_s.split('_').map(&:to_sym)
      fancy_str = colors[maybe_color].(normal_str) rescue normal_str
      fancy_str = modes[maybe_mode].(fancy_str)    rescue fancy_str
      fancy_str
    else
      normal_str
    end
  end

  p_color_body = proc do |print_m_sym, ret_lambda, obj, *args|
    maybe_Cp_code = args.last # Cp -> Colorputs ;)
    normal_str = obj.send(print_m_sym)
    fancy_str  = fancyner.(normal_str, maybe_Cp_code)
    args.pop unless fancy_str == normal_str
    old_puts.(fancy_str, args)
    ret_lambda.(obj,args)
  end.curry()

  define_method :puts, p_color_body.(:to_s,    ->(_  , _)    { nil })
  define_method :p,    p_color_body.(:inspect, ->(obj, args) { (args == []) ? obj : [obj] + args })
end
