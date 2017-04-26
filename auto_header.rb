dir = "/nfs/2016/e/ebucheit/Desktop/wolf3d"
new_dir = ""



def fix_line_4(line4, item)

end_line = ":+:      :+:    :+:   */"
neg_len = end_line.length()

  if line4.length() != 80
      spaces = 80 - line4.length()
      spaced_name = item
    if spaces > 0
      i = 0
      while i < spaces do
        spaced_name += " "
        i += 1 
      end
      line4 = "/*   #{spaced_name}                                          :+:      :+:    :+:   */"
    end

    if spaces < 0
      i = 0
      line4 = "/*   #{spaced_name}"
      neg_len = neg_len + line4.length()
      spaces = 80 - neg_len
      while i < spaces do
        line4 += " "
        i += 1
      end
      line4 += end_line
    end
  end
  return line4
end


def fix_line_8(line8, item)


  my_name = "ebucheit"
    date = Time.now.strftime("%Y/%m/%d %H:%M:%S")
  created       = "Created: #{date} by #{my_name}"
  i = 0
  if line8.length() != 80
      spaces = 80 - line8.length()
      spaced_name = created
           while i < spaces do
              spaced_name += " "
              i += 1 
            end
  line8 = "/*   #{spaced_name}          #+#    #+#             */"         
  end
end


def fix_line_9(line9, item)
  my_name = "ebucheit"
    date = Time.now.strftime("%Y/%m/%d %H:%M:%S")
  updated       = "Updated: #{date} by #{my_name}"
  i = 0
  if line9.length() != 80
      spaces = 80 - line9.length()
      spaced_name = updated
           while i < spaces do
              spaced_name += " "
              i += 1 
            end
    line9   =  "/*   #{spaced_name}         ###   ########.fr       */"
  end
end



def search_directory(dir)


file_lines    = ""

my_name = "ebucheit"
date = Time.now.strftime("%Y/%m/%d %H:%M:%s")
by            = "By: #{my_name} <marvin@42.fr>"
created       = "Created: #{date} by #{my_name}"
updated       = "Updated: #{date} by #{my_name}"




	Dir.foreach(dir) do |item|
  		next if item == '.' or item == '..'


    skip_file = false
 		new_dir = dir + "/" + item
          line1   = "/* ************************************************************************** */"
          line2   = "/*                                                                            */"
          line3   = "/*                                                        :::      ::::::::   */"
          line4   = "/*   #{item}                                          :+:      :+:    :+:   */"
          line5   = "/*                                                    +:+ +:+         +:+     */"
          line6   = "/*   #{by}                    +#+  +:+       +#+        */"
          line7   = "/*                                                +#+#+#+#+#+   +#+           */"
          line8   = "/*   #{created}          #+#    #+#             */"
          line9   = "/*   #{updated}         ###   ########.fr       */"
          line10  = "/*                                                                            */"
          line11  = "/* ************************************************************************** */"

  		# if File.directory?(new_dir) == true and !item.include? "libft" and !item.include? "minilibx_macos" and !item.include? ".git"
  		# 	search_directory(new_dir)
  		# end
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

  if (item.include? ".c" or item.include? ".h") and skip_file == false
        File.open(dir + "/" + item, "w+") do |f|
        line4 = fix_line_4(line4, item)
        line8 = fix_line_8(line8, item)
        line9 = fix_line_9(line9, item)
          f.puts  line1
          f.puts  line2
          f.puts  line3
          f.puts  line4
          f.puts  line5
          f.puts  line6
          f.puts  line7
          f.puts  line8
          f.puts  line9
          f.puts  line10
          f.puts  line11
          if needs_nl == true
            f.puts "\n"
          end
          f.puts file_lines
        f.close
      end
    end 
  end
end
end

search_directory(dir)



# end product is header on top of every file =)
# /* ************************************************************************** */
# /*                                                                            */
# /*                                                        :::      ::::::::   */
# /*   randomna.c                                         :+:      :+:    :+:   */
# /*                                                    +:+ +:+         +:+     */
# /*   By: ebucheit <marvin@42.fr>                    +#+  +:+       +#+        */
# /*                                                +#+#+#+#+#+   +#+           */
# /*   Created: 2016/09/30 21:22:45 by ebucheit          #+#    #+#             */
# /*   Updated: 2016/09/30 21:30:29 by ebucheit         ###   ########.fr       */
# /*                                                                            */
# /* ************************************************************************** */