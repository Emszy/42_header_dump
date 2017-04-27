def fix_line_4(item)

  s_name = "/*   #{item}"
  name_length = s_name.length()
  end_line = ":+:      :+:    :+:   */"
  end_line_length = end_line.length
  total_b4_spaces = name_length + end_line_length
  num_of_spaces = 80 - total_b4_spaces
  i = 0
  while i < num_of_spaces
    s_name += " "
    i += 1
  end
  return s_name + end_line
  
end

def fix_line_6(my_name)

  s_name = "/*   By: #{my_name} <marvin@42.fr>"
  name_length = s_name.length()
  end_line = "+#+  +:+       +#+        */"
  end_line_length = end_line.length
  total_b4_spaces = name_length + end_line_length
  num_of_spaces = 80 - total_b4_spaces
  i = 0
  while i < num_of_spaces
    s_name += " "
    i += 1
  end
  return s_name + end_line

end

def fix_line_8(my_name)

  date = Time.now.strftime("%Y/%m/%d %H:%M:%S")
  s_name       = "/*   Created: #{date} by #{my_name}"
  name_length = s_name.length()
  end_line = "#+#    #+#             */"
  end_line_length = end_line.length
  total_b4_spaces = name_length + end_line_length
  num_of_spaces = 80 - total_b4_spaces
  i = 0
  while i < num_of_spaces
    s_name += " "
    i += 1
  end
  return s_name + end_line

end

def fix_line_9(my_name)

  date = Time.now.strftime("%Y/%m/%d %H:%M:%S")
  s_name       = "/*   Updated: #{date} by #{my_name}"
  name_length = s_name.length()
  end_line = "###   ########.fr       */"
  end_line_length = end_line.length
  total_b4_spaces = name_length + end_line_length
  num_of_spaces = 80 - total_b4_spaces
  i = 0
  while i < num_of_spaces
    s_name += " "
    i += 1
  end
  return s_name + end_line

end

def init_lines(line, item, my_name)

  line[1]   = "/* ************************************************************************** */"
  line[2]   = "/*                                                                            */"
  line[3]   = "/*                                                        :::      ::::::::   */"
  line[4] = fix_line_4(item)
  line[5]   = "/*                                                    +:+ +:+         +:+     */"
  line[6] = fix_line_6(my_name)
  line[7]   = "/*                                                +#+#+#+#+#+   +#+           */"
  line[8] = fix_line_8(my_name)
  line[9] = fix_line_9(my_name)
  line[10]  = "/*                                                                            */"
  line[11]  = "/* ************************************************************************** */"
  return line

end
