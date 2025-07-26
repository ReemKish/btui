#!/bin/env bash
###################################  CONSTS  ###################################
declare -A COLORS=( [black]=0 [maroon]=1 [green]=2 [olive]=3 [navy]=4 [purple]=5 [teal]=6 [silver]=7 [grey]=8 [red]=9 [lime]=10 [yellow]=11 [blue]=12 [fuchsia]=13 [aqua]=14 [white]=15 [grey0]=16 [navyblue]=17 [darkblue]=18 [blue3]=19 [blue3]=20 [blue1]=21 [darkgreen]=22 [deepskyblue4]=23 [deepskyblue4]=24 [deepskyblue4]=25 [dodgerblue3]=26 [dodgerblue2]=27 [green4]=28 [springgreen4]=29 [turquoise4]=30 [deepskyblue3]=31 [deepskyblue3]=32 [dodgerblue1]=33 [green3]=34 [springgreen3]=35 [darkcyan]=36 [lightseagreen]=37 [deepskyblue2]=38 [deepskyblue1]=39 [green3]=40 [springgreen3]=41 [springgreen2]=42 [cyan3]=43 [darkturquoise]=44 [turquoise2]=45 [green1]=46 [springgreen2]=47 [springgreen1]=48 [mediumspringgreen]=49 [cyan2]=50 [cyan1]=51 [darkred]=52 [deeppink4]=53 [purple4]=54 [purple4]=55 [purple3]=56 [blueviolet]=57 [orange4]=58 [grey37]=59 [mediumpurple4]=60 [slateblue3]=61 [slateblue3]=62 [royalblue1]=63 [chartreuse4]=64 [darkseagreen4]=65 [paleturquoise4]=66 [steelblue]=67 [steelblue3]=68 [cornflowerblue]=69 [chartreuse3]=70 [darkseagreen4]=71 [cadetblue]=72 [cadetblue]=73 [skyblue3]=74 [steelblue1]=75 [chartreuse3]=76 [palegreen3]=77 [seagreen3]=78 [aquamarine3]=79 [mediumturquoise]=80 [steelblue1]=81 [chartreuse2]=82 [seagreen2]=83 [seagreen1]=84 [seagreen1]=85 [aquamarine1]=86 [darkslategray2]=87 [darkred]=88 [deeppink4]=89 [darkmagenta]=90 [darkmagenta]=91 [darkviolet]=92 [purple]=93 [orange4]=94 [lightpink4]=95 [plum4]=96 [mediumpurple3]=97 [mediumpurple3]=98 [slateblue1]=99 [yellow4]=100 [wheat4]=101 [grey53]=102 [lightslategrey]=103 [mediumpurple]=104 [lightslateblue]=105 [yellow4]=106 [darkolivegreen3]=107 [darkseagreen]=108 [lightskyblue3]=109 [lightskyblue3]=110 [skyblue2]=111 [chartreuse2]=112 [darkolivegreen3]=113 [palegreen3]=114 [darkseagreen3]=115 [darkslategray3]=116 [skyblue1]=117 [chartreuse1]=118 [lightgreen]=119 [lightgreen]=120 [palegreen1]=121 [aquamarine1]=122 [darkslategray1]=123 [red3]=124 [deeppink4]=125 [mediumvioletred]=126 [magenta3]=127 [darkviolet]=128 [purple]=129 [darkorange3]=130 [indianred]=131 [hotpink3]=132 [mediumorchid3]=133 [mediumorchid]=134 [mediumpurple2]=135 [darkgoldenrod]=136 [lightsalmon3]=137 [rosybrown]=138 [grey63]=139 [mediumpurple2]=140 [mediumpurple1]=141 [gold3]=142 [darkkhaki]=143 [navajowhite3]=144 [grey69]=145 [lightsteelblue3]=146 [lightsteelblue]=147 [yellow3]=148 [darkolivegreen3]=149 [darkseagreen3]=150 [darkseagreen2]=151 [lightcyan3]=152 [lightskyblue1]=153 [greenyellow]=154 [darkolivegreen2]=155 [palegreen1]=156 [darkseagreen2]=157 [darkseagreen1]=158 [paleturquoise1]=159 [red3]=160 [deeppink3]=161 [deeppink3]=162 [magenta3]=163 [magenta3]=164 [magenta2]=165 [darkorange3]=166 [indianred]=167 [hotpink3]=168 [hotpink2]=169 [orchid]=170 [mediumorchid1]=171 [orange3]=172 [lightsalmon3]=173 [lightpink3]=174 [pink3]=175 [plum3]=176 [violet]=177 [gold3]=178 [lightgoldenrod3]=179 [tan]=180 [mistyrose3]=181 [thistle3]=182 [plum2]=183 [yellow3]=184 [khaki3]=185 [lightgoldenrod2]=186 [lightyellow3]=187 [grey84]=188 [lightsteelblue1]=189 [yellow2]=190 [darkolivegreen1]=191 [darkolivegreen1]=192 [darkseagreen1]=193 [honeydew2]=194 [lightcyan1]=195 [red1]=196 [deeppink2]=197 [deeppink1]=198 [deeppink1]=199 [magenta2]=200 [magenta1]=201 [orangered1]=202 [indianred1]=203 [indianred1]=204 [hotpink]=205 [hotpink]=206 [mediumorchid1]=207 [darkorange]=208 [salmon1]=209 [lightcoral]=210 [palevioletred1]=211 [orchid2]=212 [orchid1]=213 [orange1]=214 [sandybrown]=215 [lightsalmon1]=216 [lightpink1]=217 [pink1]=218 [plum1]=219 [gold1]=220 [lightgoldenrod2]=221 [lightgoldenrod2]=222 [navajowhite1]=223 [mistyrose1]=224 [thistle1]=225 [yellow1]=226 [lightgoldenrod1]=227 [khaki1]=228 [wheat1]=229 [cornsilk1]=230 [grey100]=231 [grey3]=232 [grey7]=233 [grey11]=234 [grey15]=235 [grey19]=236 [grey23]=237 [grey27]=238 [grey30]=239 [grey35]=240 [grey39]=241 [grey42]=242 [grey46]=243 [grey50]=244 [grey54]=245 [grey58]=246 [grey62]=247 [grey66]=248 [grey70]=249 [grey74]=250 [grey78]=251 [grey82]=252 [grey85]=253 [grey89]=254 [grey93]=255 )
declare -A KEYS=( [UP]=$'\e[A' [DN]=$'\e[B' [CR]="" )

####################################  CORE  ####################################
###################################  UTILS  ####################################



# fgcolor() { tput setaf ${COLORS[$1]}; }
setrgb() {
  local r=$1 g=$2 b=$3
  echo -ne "\e[38;2;${r};${g};${b}m"
}
fgcolor() { tput setaf ${COLORS["$1"]}; }
bgcolor() { tput setab ${COLORS["$1"]}; }
resetcolor() { tput sgr0; }

getyx() {
  IFS='[;' read -p $'\e[6n' -d R -rs _ Y X _
  printf -v "$1" '%s' "$((--Y))"
  printf -v "$2" '%s' "$((--X))"
}

setyx() {
  echo "y=$y 1=$1 _BTUI__INIT_Y=$_BTUI__INIT_Y BTUI__MAX_Y=$_BTUI__MAX_Y" >> debug
  (( n_scroll = y + $1 + _BTUI__INIT_Y - _BTUI__MAX_Y ))
  if (( n_scroll > 0 )); then
    tput cup $_BTUI__MAX_Y 0
    for _ in $(seq $n_scroll); do echo; (( --_BTUI__INIT_Y )); done
    echo "_BTUI__INIT_Y=$_BTUI__INIT_Y" >> debug
  fi
  setabsyx $((_BTUI__INIT_Y+y+$1)) $((_BTUI__INIT_X+x+$2))
}

setabsyx() {
  tput cup $(($1<0?0:$1)) $(($2<0?0:$2))
}

addstr() {
  if [[ $# == 3 ]]; then
    tput sc
    setyx $2 $3
    echo -n "$1"
    tput rc
  else
    echo -n "$1"
  fi
}

# insch() {
#   if [[ $# == 3 ]]; then
#     tput sc
#     setyx $2 $3
#     echo -n "$1"; tput cub1
#     tput rc
#   else
#     echo -n "$1"; tput cub1;
#   fi
# }

getkey() {
  read -rsn1 key
  read -rsn3 -t 0.0001 key_  # Handle escaped keys, e.g. Arrow Up.
  echo "$key$key_"
}

scroll() {
  tput sc
  tput cup $BTUI__MAX_Y 0
  for _ in $(seq $1); do echo; (( --_BTUI__INIT_Y )); done
  tput rc
}

interpolate_rgb() {
  local r1=$1 g1=$2 b1=$3
  local r2=$4 g2=$5 b2=$6
  local n=$7

  if (( n < 2 )); then
    echo "Error: N must be at least 2"
    return 1
  fi

  for ((i=0; i<n; i++)); do
    # Integer interpolation using rounding
    r=$(( r1 + ( (r2 - r1) * i + (n - 1) / 2 ) / (n - 1) ))
    g=$(( g1 + ( (g2 - g1) * i + (n - 1) / 2 ) / (n - 1) ))
    b=$(( b1 + ( (b2 - b1) * i + (n - 1) / 2 ) / (n - 1) ))

    printf "%d %d %d\n" "$r" "$g" "$b"
  done
}


################################  MENU ELEMENT  ################################

__erase_menu() {
  local x=${x-0} y=${y-0} choice=${choice-1}
  for i in $(seq $#); do
    setyx $((i-1)) 0
    local opt=${!i}
    # addstr "${#opt}"
    addstr "  "
    addstr "$(printf '%*s' ${#opt})"
    resetcolor
  done
  setyx 0 0
}

__disable_menu() {
  local x=${x-0} y=${y-0} choice=${choice-1}
  for i in $(seq $#); do
    setyx $((i-1)) 0
    if [[ ${choice:=1} == "$i" ]]; then
      fgcolor white; addstr '> '
    else
      fgcolor grey; addstr '  '
    fi
    addstr "${!i}"
    resetcolor
  done
  setyx 0 0
}

__draw_menu() {
  local x=${x-0} y=${y-0} choice=${choice-1}
  local indicator=${indicator-'>'} text_color=${text_color-'255 255 255'} selected_color=${selected_color-'255 175 135'}
  setrgb $text_color
  for i in $(seq $#); do
    setyx $((i-1)) 0
    if [[ ${choice:=1} == "$i" ]]; then
      setrgb $selected_color
      addstr "$indicator ${!i}"
      setrgb $text_color
    else
      addstr "  ${!i}"
    fi
  done
  resetcolor
  setyx 0 0
}

__transition_menu() {
  local x=${x-0} y=${y-0} choice=${choice-1} prev_choice=${prev_choice-1} indicator=${indicator-'>'}
  local text_color=${prev_color-"255 255 255"} selected_color=${selected_color-"255 175 135"}
  local i
  local n=15
  mapfile -t colors < <(interpolate_rgb $selected_color $text_color $n)
  for ((i = 0; i < $n; i++)); do
    setyx $((prev_choice-1)) 0
    setrgb ${colors[i]}
    addstr "  ${!prev_choice}"
    setyx $((choice-1)) 0
    setrgb ${colors[n-i-1]}
    addstr "> ${!choice}"
    sleep 0.001
  done
  resetcolor
  setyx 0 0
}




__exec_menu() {
  local x=${x-0} y=${y-0} choice=${choice-1} prev_choice=1
  setyx 0 0
  __draw_menu "$@"
  while true; do
    case $(getkey) in
      1) echo one ;;
      2) echo two ;;
      "${KEYS[CR]}" | 'l') break ;;
      "${KEYS[UP]}" | 'k') ((choice >   1)) && {  prev_choice=$((choice--)); __transition_menu "$@"; } ;;
      # ${KEYS[UP]} | 'k') ((choice >   1)) && {  prev_choice=$((choice--)); __draw_menu "$@"; } ;;
      "${KEYS[DN]}" | 'j') ((choice <  $#)) && {  prev_choice=$((choice++)); __transition_menu "$@"; } ;;
      # ${KEYS[DN]} | 'j') ((choice <  $#)) && {  prev_choice=$((choice++)); __draw_menu "$@"; } ;;
    esac
  done
  indicator=' ' text_color='150 150 150' __draw_menu "$@"
  echo "${!choice}"
}


minimenu() {
  echo $x
  # : "${y:=0} ${x:=0}"
  # fgcolor salmon1; addstr "$1" 0 0; resetcolor; shift 1
  __exec_menu "$@"
  # __exec_menu "$@"
  # addstr "         " 0 0
  # y=$((y+1)) __erase_menu "$@"
  # __disable_menu "$@"
  echo "$chosen"
}

####################################  API  #####################################


####################################  INIT  ####################################
declare -n _BTUI__MAX_Y=LINES _BTUI__MAX_X=COLUMNS
declare -i _BTUI__INIT_Y _BTUI__INIT_X

setup() {
  stty -echo
  tput civis  # make cursor invisible
  shopt -s checkwinsize
  getyx BTUI__INIT_Y BTUI__INIT_X
  # echo $BTUI__MAX_Y $BTUI__MAX_X >> debug
}

restore() {
  tput cnorm  # make cursor appear normal
  tput rc     # restore cursor position
  stty sane   # restore terminal to sane condition
  setabsyx $((_BTUI__INIT_Y<0?0:_BTUI__INIT_Y)) $((_BTUI__INIT_X<0?0:_BTUI__INIT_X))
  tput ed     # erase display
  # echo "$BTUI__INIT_Y $BTUI__INIT_X" >> debug
}


trap restore EXIT
setup
