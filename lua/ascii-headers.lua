local M = {}

M.headers = {
  {
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣠⣤⣤⣴⣦⣤⣤⣄⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⠀⠀⢀⣤⣾⣿⣿⣿⣿⠿⠿⠿⠿⣿⣿⣿⣿⣶⣤⡀⠀⠀⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⣠⣾⣿⣿⡿⠛⠉⠀⠀⠀⠀⠀⠀⠀⠀⠉⠛⢿⣿⣿⣶⡀⠀⠀⠀⠀ ",
    "⠀⠀⠀⣴⣿⣿⠟⠁⠀⠀⠀⣶⣶⣶⣶⡆⠀⠀⠀⠀⠀⠀⠈⠻⣿⣿⣦⠀⠀⠀ ",
    "⠀⠀⣼⣿⣿⠋⠀⠀⠀⠀⠀⠛⠛⢻⣿⣿⡀⠀⠀⠀⠀⠀⠀⠀⠙⣿⣿⣧⠀⠀ ",
    "⠀⢸⣿⣿⠃⠀⠀⠀⠀⠀⠀⠀⠀⢀⣿⣿⣷⠀⠀⠀⠀⠀⠀⠀⠀⠸⣿⣿⡇⠀ ",
    "⠀⣿⣿⡿⠀⠀⠀⠀⠀⠀⠀⠀⢀⣾⣿⣿⣿⣇⠀⠀⠀⠀⠀⠀⠀⠀⣿⣿⣿⠀ ",
    "⠀⣿⣿⡇⠀⠀⠀⠀⠀⠀⠀⢠⣿⣿⡟⢹⣿⣿⡆⠀⠀⠀⠀⠀⠀⠀⣹⣿⣿⠀ ",
    "⠀⣿⣿⣷⠀⠀⠀⠀⠀⠀⣰⣿⣿⠏⠀⠀⢻⣿⣿⡄⠀⠀⠀⠀⠀⠀⣿⣿⡿⠀ ",
    "⠀⢸⣿⣿⡆⠀⠀⠀⠀⣴⣿⡿⠃⠀⠀⠀⠈⢿⣿⣷⣤⣤⡆⠀⠀⣰⣿⣿⠇⠀ ",
    "⠀⠀⢻⣿⣿⣄⠀⠀⠾⠿⠿⠁⠀⠀⠀⠀⠀⠘⣿⣿⡿⠿⠛⠀⣰⣿⣿⡟⠀⠀ ",
    "⠀⠀⠀⠻⣿⣿⣧⣄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⣾⣿⣿⠏⠀⠀⠀ ",
    "⠀⠀⠀⠀⠈⠻⣿⣿⣷⣤⣄⡀⠀⠀⠀⠀⠀⠀⢀⣠⣴⣾⣿⣿⠟⠁⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⠀⠀⠈⠛⠿⣿⣿⣿⣿⣿⣶⣶⣿⣿⣿⣿⣿⠿⠋⠁⠀⠀⠀⠀⠀⠀ ",
    "⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠛⠛⠛⠛⠛⠛⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ",
    "",
    "",
  },
  {
    "    ,----.   ,------. ,------. ,------. ,------. ,------.   ,------. ,------. ,------. ,------. ,------.                  _    _ __    __                              ",
    "   j|Esc`|i j| F1  `|V| F2  `|V| F3  `|V| F4  `|V| F5  `|i j| F6  `|V| F7  `|V| F8  `|V| F9  `|V| F10 `|i           /|    /|  /| ||  //' |    /|                      ",
    "   ||    || ||      |||      |||      |||      |||      || ||      |||      |||      |||      |||      ||          /||   /|| /|| || /|  __   /||    H.DISK  =====      ",
    "   |;----:| |;------:|;------:|;------:|;------:|;------:| |;------:|;------:|;------:|;------:|;------:|         /-||  / ||/ || || ||  ||  /-||    F.DISK  =====      ",
    "|______| |________|________|________|________|________| |________|________|________|________|________|        /  || /  |/  || || \\_\\,|/ /  ||    POWER   =====  ",
    '                                                                                                                ""  """"      "" ""   ""  ""  ""                       ',
    "    ,-------. ,----. ,----. ,----. ,----. ,----. ,----. ,----. ,----. ,----. ,----. ,----. ,----. ,----. ,----.   ,-------. ,--------.   ,----. ,----. ,----. ,----.   ",
    '   j| ~    `|V| !  |V| " @|V| £ #|V| $  |V| %  |V| & ^|V| / &|V| ( *|V| ) (|V| = )|V| ? _|V| ` +|V| |  |V| <-`|i j| Del  `|V| Help  `|i j| { `|V| } `|V| / `|V| * `|i  ',
    "   || `     ||| 1  ||| 2  ||| 3  ||| 4  ||| 5  ||| 6  ||| 7  ||| 8  ||| 9  ||| 0  ||| + -||| ´ =||| \\  |||    || ||       |||        || || [  ||| ]  |||    |||    || ",
    "   |;-------:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:| |;-------:|;--------:| |;----:|;----:|;----:|;----:|  ",
    "   |,-----------._,----._,----._,----._,----._,----._,----._,----._,----._,----._,----._,----._,----._,-------.| |_________|__________| |,----.|,----.|,----.|,----.|  ",
    "   j| |<--     `|V| Q  |V| W  |V| E  |V| R  |V| T  |V| Y  |V| U  |V| I  |V| O  |V| P  |V| Å  |V| ^  |V|      `|i                        j| 7  |V| 8  |V| 9  |V| - `|i  ",
    "   || -->|      |||    |||    |||    |||    |||    |||    |||    |||    |||    |||    |||    ||| ¨  |||     | ||                        ||    |||    |||    |||    ||  ",
    "   |;-----------:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;-,   | ||                        |;----:|;----:|;----:|;----:|  ",
    "   |,------._,----._,----._,----._,----._,----._,----._,----._,----._,----._,----._,----._,----._,----.j|   | ||         ,----.         |,----.|,----.|,----.|,----.|  ",
    "   j|Ctrl `|V|Caps|V| A  |V| S  |V| D  |V| F  |V| G  |V| H  |V| J  |V| K  |V| L  |V| Ö :|V| Ä \"|V| *  |i| <-' ||        j| ^  |i        j| 4  |V| 5  |V| 6  |V| + `|i ",
    "   ||      |||Lock|||    |||    |||    |||    |||    |||    |||    |||    |||    |||   ;|||   ´||| '  |||     ||        || |  ||        ||    |||    |||    |||    || ",
    "   |;------:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;-----:|        |;----:|        |;----:|;----:|;----:|;----:|  ",
    "   |,----------._,----._,----._,----._,----._,----._,----._,----._,----._,----._,----._,----._,---------------.|  ,----.|,----.|,----.  |,----.|,----.|,----.|,----.|  ",
    "  j| /\\      `|V| >  |V| Z  |V| X  |V| C  |V| V  |V| B  |V| N  |V| M  |V| ; <|V| : >|V| _ ?|V| /\\           `|i j| <- |V| |  |V| -> |i j| 1  |V| 2  |V| 3  |V| E `|i",
    "   || ||       ||| <  |||    |||    |||    |||    |||    |||    |||    ||| ,  ||| .  ||| - /||| ||            || ||    ||| v  |||    || ||    |||    |||    ||| n  ||  ",
    "   |;----------:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;----:|;---------------:| |;----:|;----:|;----:| |;----:|;----:|;----:|| t  ||  ",
    "   |_____,------._,------._,------------------------------------------------------------._,------._,------.____| |______|______|______| |,-----------.|,----.|| e  ||  ",
    "        j| Alt `|V|  /# `|V|                                                            |V|  /] `|V| Alt `|i                            j| 0         |V| .  |i| r  ||  ",
    '        ||      ||| /"#  |||                                                            ||| /"]  |||      ||                            ||           |||    |||    ||  ',
    "        |;------:|;------:|;------------------------------------------------------------:|;------:|;------:|                            |;-----------:|;----:|;----:|  ",
    "        |________|________|______________________________________________________________|________|________|                            |____Ins______|_Del__|______|  ",
    "",
    "",
  },
  {
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "88888888888888888888888888888888888888888888888888888",
    '8888"""""""""""""""8888888888888888888888888888888888',
    "8888               8888888888888888888888888888888888",
    "8888               8888888888888888888888888888888888",
    '8888               888888888888888888888888888888888"',
    "8888aaaaaaaaaaaaaaa888888888888888888888888888888888a",
    "88888888888888888888888888888888888888888888888888888",
    "88888888888888888888888888888888888888888888888888888",
    "88888888888888888888888888888888888888888888888888888",
    '88888888888888888888888":::::"88888888888888888888888',
    "888888888888888888888::;gPPRg;::888888888888888888888",
    "88888888888888888888::dP'   `Yb::88888888888888888888",
    "88888888888888888888::8)     (8::88888888888888888888",
    "88888888888888888888;:Yb     dP:;88( )888888888888888",
    '888888888888888888888;:"8ggg8":;888888888888888888888',
    "88888888888888888888888aa:::aa88888888888888888888888",
    "88888888888888888888888888888888888888888888888888888",
    "88888888888888888888888888888888888888888888888888888",
    '88888888888888888888888888"88888888888888888888888888',
    "8888888888888888888888888:::8888888888888888888888888",
    "8888888888888888888888888:::8888888888888888888888888",
    "8888888888888888888888888:::8888888888888888888888888",
    "8888888888888888888888888:::8888888888888888888888888",
    "8888888888888888888888888:::8888888888888888888888888",
    "88888888888888888888888888a88888888888888888888888888",
    '"""""""""""""""""""\' `"""""""""\' `"""""""""""""""""""',
    "",
    "",
  },
  {
    "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa",
    "8                                                   8",
    "8  a---------------a                                8",
    "8  |               |                                8",
    "8  |               |                                8",
    '8  |               |                               8"',
    '8  "---------------"                               8a',
    "8                                                   8",
    "8                                                   8",
    "8                      ,aaaaa,                      8",
    '8                    ad":::::"ba                    8',
    "8                  ,d::;gPPRg;::b,                  8",
    "8                  d::dP'   `Yb::b                  8",
    "8                  8::8)     (8::8                  8",
    "8                  Y;:Yb     dP:;P  O               8",
    '8                  `Y;:"8ggg8":;P\'                  8',
    '8                    "Yaa:::aaP"                    8',
    '8                       """""                       8',
    "8                                                   8",
    '8                       ,d"b,                       8',
    "8                       d:::8                       8",
    "8                       8:::8                       8",
    "8                       8:::8                       8",
    "8                       8:::8                       8",
    "8                       8:::8                       8",
    "8                  aaa  `bad'  aaa                  8",
    '"""""""""""""""""""\' `"""""""""\' `"""""""""""""""""""',
    "",
    "",
  },
  {
    "___,___,_______,____",
    "|  :::|///./||'||    \\",
    "|  :::|//.//|| || H)  |",
    "|  :::|/.///|!!!|     |",
    "|   _______________   |",
    "|  |:::::::::::::::|  |",
    "|  |_______________|  |",
    "|  |_______________|  |",
    "|  |_______________|  |",
    "|  |_______________|  |",
    "||_|               ||_|",
    "|__|_______________|__|",
    "",
    "",
  },
  {
    "                       .,,uod8B8bou,,.                              ",
    "              ..,uod8BBBBBBBBBBBBBBBBRPFT?l!i:.                     ",
    "         ,=m8BBBBBBBBBBBBBBBRPFT?!||||||||||||||                    ",
    '         !...:!TVBBBRPFT||||||||||!!^^""\'   ||||                   ',
    '         !.......:!?|||||!!^^""\'            ||||                   ',
    "         !.........||||                     ||||                    ",
    "         !.........||||  ##                 ||||                    ",
    "         !.........||||                     ||||                    ",
    "         !.........||||                     ||||                    ",
    "         !.........||||                     ||||                    ",
    "         !.........||||                     ||||                    ",
    "         `.........||||                    ,||||                    ",
    "          .;.......||||               _.-!!|||||                    ",
    "   .,uodWBBBBb.....||||       _.-!!|||||||||!:'                    ",
    "!YBBBBBBBBBBBBBBb..!|||:..-!!|||||||!iof68BBBBBb....                ",
    "!..YBBBBBBBBBBBBBBb!!||||||||!iof68BBBBBBRPFT?!::   `.              ",
    "!....YBBBBBBBBBBBBBBbaaitf68BBBBBBRPFT?!:::::::::     `.            ",
    '!......YBBBBBBBBBBBBBBBBBBBRPFT?!::::::;:!^"`;:::       `.          ',
    "!........YBBBBBBBBBBRPFT?!::::::::::^''...::::::;         iBBbo.  ",
    "`..........YBRPFT?!::::::::::::::::::::::::;iof68bo.      WBBBBbo.  ",
    "  `..........:::::::::::::::::::::::;iof688888888888b.     `YBBBP^'",
    "    `........::::::::::::::::;iof688888888888888888888b.     `      ",
    "      `......:::::::::;iof688888888888888888888888888888b.          ",
    "        `....:::;iof688888888888888888888888888888888899fT!         ",
    "          `..::!8888888888888888888888888888888899fT|!^\"'          ",
    "            `' !!988888888888888888888888899fT|!^\"'               ",
    "                `!!8888888888888888899fT|!^\"'                      ",
    "                  `!988888888899fT|!^\"'                            ",
    "                    `!9899fT|!^\"'                                  ",
    "                      `!^\"'                                        ",
    "",
    "",
  },
  {
    "              ,---------------------------,             ",
    "              |  /---------------------\\  |             ",
    "              | |                       | |             ",
    "              | |     Best Busy         | |             ",
    "              | |      Businesses       | |             ",
    "              | |       Company         | |             ",
    "              | |                       | |             ",
    "              |  \\_____________________/  |             ",
    "              |___________________________|             ",
    "            ,---\\_____     []     _______/------,       ",
    "          /         /______________\\           /|       ",
    "        /___________________________________ /  | ___   ",
    "        |                                   |   |    )  ",
    "        |  _ _ _                 [-------]  |   |   (   ",
    "        |  o o o                 [-------]  |  /    _)_ ",
    "        |__________________________________ |/     /  / ",
    "    /-------------------------------------/|      ( )/  ",
    "  /-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/ /             ",
    "/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/-/ /               ",
    "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~                 ",
    "",
    "",
  },
}

-- Function to get daily random header
function M.get_random_header()
  local current_date = os.date "*t"
  local day_seed = tonumber(current_date.yday)

  local index = (day_seed % #M.headers) + 1
  return M.headers[index]
end

return M
