let%expect_test "number_from_row" =
  Format.printf "%d" (Aoc.Day1.number_from_row "R25");
  [%expect {| 25 |}]

let%expect_test "test1" = 
  Format.printf "%d" (Aoc.Day1.solve_file "test_files/day1/test1.txt");
  [%expect {| 1 |}]

let%expect_test "test2" = 
  Format.printf "%d" (Aoc.Day1.solve_file "test_files/day1/test2.txt");
  [%expect {| 4 |}]

let%expect_test "test3" = 
  Format.printf "%d" (Aoc.Day1.solve_file "test_files/day1/test3.txt");
  [%expect {| 5 |}]

let%expect_test "test4" = 
  Format.printf "%d" (Aoc.Day1.solve_file "test_files/day1/test4.txt");
  [%expect {| 12 |}]

let%expect_test "test5" = 
  Format.printf "%d" (Aoc.Day1.solve_file "test_files/day1/test5.txt");
  [%expect {| 3 |}]

let%expect_test "test6" = 
  Format.printf "%d" (Aoc.Day1.solve_file "test_files/day1/test6.txt");
  [%expect {| 6 |}]

let%expect_test "test7" = 
  Format.printf "%d" (Aoc.Day1.solve_file "test_files/day1/test7.txt");
  [%expect {| 3 |}]

let%expect_test "test8" = 
  Format.printf "%d" (Aoc.Day1.solve_file "test_files/day1/test8.txt");
  [%expect {| 6 |}]