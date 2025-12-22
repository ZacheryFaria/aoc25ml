let _ =
  let file = Aoc.Day1.file_to_use Sys.argv in
  let result = Aoc.Day1.solve_file file in
  let _ = print_int result in
  print_endline
