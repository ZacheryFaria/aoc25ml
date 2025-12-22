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

let rec solve instructions curr count =
  match instructions with
  | [] -> count
  | hd :: tl ->
      let result = apply_instruction curr hd |> normalize in
      let _ = print_int result in
      let _ = print_endline "" in
      solve tl result (count + if result == 0 then 1 else 0)

let _ =
  let input = List.map parse_row (readfile "day1.txt") in
  solve input 50 0 |> print_int
