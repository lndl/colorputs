module Kernel
  __colors__ = {
    red:     '[91m',
    green:   '[92m',
    yellow:  '[93m',
    blue:    '[94m',
    magenta: '[95m',
    cyan:    '[96m',
    white:   '[37m',
    black:   '[30m'
  }
  
  old_puts = method :puts
 
  aux_rb_body = proc do |str|
    str.chars.inject("") {|acc,c| acc << "\e[5m\e" + __colors__.values[rand(__colors__.size - 1)] + c}.<< "\e[0m"
  end

  p_color_body = proc do |print_m_sym, obj, color = nil|
    color_s = if color == :rainbow
      aux_rb_body.(obj.send(print_m_sym))
    elsif color && __colors__[color.to_sym]
      "\e#{__colors__[color.to_sym]}#{obj.send(print_m_sym)}\e[0m"
    else
      obj
    end
    old_puts.(color_s)
  end.curry()

  define_method :puts, p_color_body.(:to_s)
  define_method :p, p_color_body.(:inspect)
end
