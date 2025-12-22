let readfile filename =
  In_channel.with_open_text filename In_channel.input_lines

type direction = Right | Left
type instruction = { dir : direction; value : int }

(* let char_of_instruction ins = match ins with Right -> 'R' | Left -> 'L'

let string_of_instruction ins =
  Format.sprintf "Instruction{dir: %c; value: %d}"
    (char_of_instruction ins.dir)
    ins.value

let print_instruction ins = print_endline (string_of_instruction ins) *)

let direction_from_row row =
  match String.get row 0 with 'R' -> Right | 'L' -> Left | _ -> assert false

let number_from_row row =
  String.sub row 1 (String.length row - 1) |> int_of_string

let parse_row value =
  { dir = direction_from_row value; value = number_from_row value }

let apply_instruction curr ins =
  match ins.dir with Right -> curr + ins.value | Left -> curr - ins.value

let normalize value =
  let mod_value = value mod 100 in
  if mod_value >= 0 then mod_value else 100 + mod_value

let score_from_value origin value =
  if value > 0 then value / 100
  else if value == 0 then 1
  else if origin == 0 && value > -100 then 0
  else (Int.abs value / 100) + 1

let rec solve instructions curr count =
  match instructions with
  | [] -> count
  | hd :: tl ->
      let result = apply_instruction curr hd in
      let normalized_result = normalize result in
      let score_delta = score_from_value curr result in
      let _ =
        Format.printf "Result: %d, normalized: %d, delta: %d\n" result
          normalized_result score_delta
      in
      solve tl normalized_result (count + score_delta)

let file_to_use args =
  if Array.length args == 1 then "day1.txt"
  else Format.sprintf "day1_%s.txt" args.(1)

let _ =
  let file = file_to_use Sys.argv in
  let input = List.map parse_row (readfile file) in
  let _ = solve input 50 0 |> print_int in
  print_endline
