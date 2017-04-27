dir = "/nfs/2016/e/ebucheit/Desktop/42_header/tests"
my_name = "ebucheit"
new_dir = ""

require_relative 'fix_lines'

def get_file_lines(item, dir)

  needs_nl = false
      x = 0;
    file_lines = ""
    if item.include? ".c" or item.include? ".h"
        File.open(dir + "/" + item, "r") do |f|
         f.each_line do |line|
          if line.include? "****"
            skip_file = true
            break
          end
          if line.length > 0 && x == 0
            needs_nl = true
          end
          file_lines += line
          x += 1
        end
        f.close
      end
    end
    return needs_nl, file_lines

end

def put_header(item, skip_file, line, dir, needs_nl, file_lines)

  if (item.include? ".c" or item.include? ".h") and skip_file == false
        File.open(dir + "/" + item, "w+") do |f|
          f.puts  line[1]
          f.puts  line[2]
          f.puts  line[3]
          f.puts  line[4]
          f.puts  line[5]
          f.puts  line[6]
          f.puts  line[7]
          f.puts  line[8]
          f.puts  line[9]
          f.puts  line[10]
          f.puts  line[11]
          if needs_nl == true
            f.puts "\n"
          end
          f.puts file_lines
        f.close
      end
    end

end

def search_directory(dir, my_name)

file_lines    = ""
line = []
	Dir.foreach(dir) do |item|
  		next if item == '.' or item == '..'
    skip_file = false
 		new_dir = dir + "/" + item
    line = init_lines(line, item, my_name)
  		if File.directory?(new_dir) == true and !item.include? "libft" and !item.include? "minilibx_macos" and !item.include? ".git"
  			search_directory(new_dir)
  		end
      needs_nl, file_lines = get_file_lines(item, dir)
      put_header(item, skip_file, line, dir, needs_nl, file_lines)
  end

end

search_directory(dir, my_name)

# end product is header on top of every file =)
# /* ************************************************************************** */
# /*                                                                            */
# /*                                                        :::      ::::::::   */
# /*   randomna.c                                         :+:      :+:    :+:   */
# /*                                                    +:+ +:+         +:+     */
# /*   By: YOURNAME  <marvin@42.fr>                    +#+  +:+       +#+        */
# /*                                                +#+#+#+#+#+   +#+           */
# /*   Created: 2016/09/30 21:22:45 by ebucheit          #+#    #+#             */
# /*   Updated: 2016/09/30 21:30:29 by ebucheit         ###   ########.fr       */
# /*                                                                            */
# /* ************************************************************************** */