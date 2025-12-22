let%expect_test "number_from_row" =
  Format.printf "%d" (Aoc.Day1.number_from_row "R25");
  [%expect {| 25 |}]
