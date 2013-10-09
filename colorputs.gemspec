lib = File.expand_path(File.join('..', 'lib'), __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |s|
  s.name          = 'colorputs'
  s.version       = '0.2.0'
  s.date          = '2013-10-07'
  s.summary       = "Color in puts method!!"
  s.description   = "Enables to use puts and p standard methods with a easy color interface"
  s.authors       = ["Agustín Beamurguía, Lautaro De León"]
  s.email         = ['agus.beam@gmail.com, laudleon@gmail.com']
  s.files         = ["lib/colorputs.rb"]
  s.require_paths = ["lib/"]
  s.homepage      = 'http://github.com/lndl/colorputs'
  s.license       = 'MIT'
end
