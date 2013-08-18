require 'stringio'

class Interpreter

  def initialize
    @file_buffer = StringIO.new
    @file_buffer.puts "#include <stdio.h>"
    @file_buffer.puts "#include <stdlib.h>"
    @file_buffer.puts "#include <string.h>"
    @file_buffer.puts "int main() {"
    @file_buffer.puts "}"
  end

  def read_and_output
    insert_into_buffer(gets)
    write_to_file
    compile_and_run
  end

  private

  def write_to_file
    File.open("temp\\c_temp.c", "w") do |f|
      f.puts @file_buffer.string
    end
  end

  def compile_and_run
    system("gcc-3 temp\\c_temp.c && a.exe")
    puts
  end

  def insert_into_buffer(input)
    @file_buffer.string.chomp!("}\n")
    @file_buffer.puts input
    @file_buffer.puts "}"
    @file_buffer.string.delete!("\x00")
  end

end

loop do
  n = Interpreter.new
  n.read_and_output
end