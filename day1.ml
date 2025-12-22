
let readfile filename = In_channel.with_open_text filename In_channel.input_lines

type direction = Right | Left

type instruction = {dir: direction; value: int}


let char_of_instruction ins = match ins with
| Right -> 'R'
| Left -> 'L'

let string_of_instruction ins = Format.sprintf "Instruction{dir: %c; value: %d}" (char_of_instruction ins.dir) ins.value

let direction_from_row row = match (String.get row 0) with
| 'R' -> Right
| 'L' -> Left
| _ -> assert false

let number_from_row row = 
    String.sub row 1 ((String.length row) - 1)
    |> int_of_string

let parse_row value = {dir = (direction_from_row value); value = (number_from_row value)}

let print_instruction ins = 
    print_endline (string_of_instruction ins)

let _ = 
    let mapper = List.map parse_row in
    let printer = List.map print_instruction in
    readfile "day1.txt" |> mapper |> printer 