$:.unshift File.dirname(__FILE__) + 'lib'

task :default => :bin

desc "Instalar las gemas requeridas con bundle"
task :install do
  sh "bundle install"
 end

desc "Ejecutar lib/frac_main.rb"
task :bin do
  sh "ruby lib/frac_main.rb"
end

desc "Ejecutar rspec con documentación --format"
task :test do
  sh "rspec -Ilib spec/frac_spec.rb --format documentation"
end

desc "Ejecutar rspec con formato: html"
task :thtml do
  sh "rspec -Ilib spec/frac_spec.rb --format html > index.html"
end