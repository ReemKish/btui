#!/bin/env bash
###################################  CONSTS  ###################################
declare -A COLORS=([black]=0 [maroon]=1 [green]=2 [olive]=3 [navy]=4 [purple]=5 [teal]=6 [silver]=7 [grey]=8 [red]=9 [lime]=10 [yellow]=11 [blue]=12 [fuchsia]=13 [aqua]=14 [white]=15 [grey0]=16 [navyblue]=17 [darkblue]=18 [blue3]=19 [blue3]=20 [blue1]=21 [darkgreen]=22 [deepskyblue4]=23 [deepskyblue4]=24 [deepskyblue4]=25 [dodgerblue3]=26 [dodgerblue2]=27 [green4]=28 [springgreen4]=29 [turquoise4]=30 [deepskyblue3]=31 [deepskyblue3]=32 [dodgerblue1]=33 [green3]=34 [springgreen3]=35 [darkcyan]=36 [lightseagreen]=37 [deepskyblue2]=38 [deepskyblue1]=39 [green3]=40 [springgreen3]=41 [springgreen2]=42 [cyan3]=43 [darkturquoise]=44 [turquoise2]=45 [green1]=46 [springgreen2]=47 [springgreen1]=48 [mediumspringgreen]=49 [cyan2]=50 [cyan1]=51 [darkred]=52 [deeppink4]=53 [purple4]=54 [purple4]=55 [purple3]=56 [blueviolet]=57 [orange4]=58 [grey37]=59 [mediumpurple4]=60 [slateblue3]=61 [slateblue3]=62 [royalblue1]=63 [chartreuse4]=64 [darkseagreen4]=65 [paleturquoise4]=66 [steelblue]=67 [steelblue3]=68 [cornflowerblue]=69 [chartreuse3]=70 [darkseagreen4]=71 [cadetblue]=72 [cadetblue]=73 [skyblue3]=74 [steelblue1]=75 [chartreuse3]=76 [palegreen3]=77 [seagreen3]=78 [aquamarine3]=79 [mediumturquoise]=80 [steelblue1]=81 [chartreuse2]=82 [seagreen2]=83 [seagreen1]=84 [seagreen1]=85 [aquamarine1]=86 [darkslategray2]=87 [darkred]=88 [deeppink4]=89 [darkmagenta]=90 [darkmagenta]=91 [darkviolet]=92 [purple]=93 [orange4]=94 [lightpink4]=95 [plum4]=96 [mediumpurple3]=97 [mediumpurple3]=98 [slateblue1]=99 [yellow4]=100 [wheat4]=101 [grey53]=102 [lightslategrey]=103 [mediumpurple]=104 [lightslateblue]=105 [yellow4]=106 [darkolivegreen3]=107 [darkseagreen]=108 [lightskyblue3]=109 [lightskyblue3]=110 [skyblue2]=111 [chartreuse2]=112 [darkolivegreen3]=113 [palegreen3]=114 [darkseagreen3]=115 [darkslategray3]=116 [skyblue1]=117 [chartreuse1]=118 [lightgreen]=119 [lightgreen]=120 [palegreen1]=121 [aquamarine1]=122 [darkslategray1]=123 [red3]=124 [deeppink4]=125 [mediumvioletred]=126 [magenta3]=127 [darkviolet]=128 [purple]=129 [darkorange3]=130 [indianred]=131 [hotpink3]=132 [mediumorchid3]=133 [mediumorchid]=134 [mediumpurple2]=135 [darkgoldenrod]=136 [lightsalmon3]=137 [rosybrown]=138 [grey63]=139 [mediumpurple2]=140 [mediumpurple1]=141 [gold3]=142 [darkkhaki]=143 [navajowhite3]=144 [grey69]=145 [lightsteelblue3]=146 [lightsteelblue]=147 [yellow3]=148 [darkolivegreen3]=149 [darkseagreen3]=150 [darkseagreen2]=151 [lightcyan3]=152 [lightskyblue1]=153 [greenyellow]=154 [darkolivegreen2]=155 [palegreen1]=156 [darkseagreen2]=157 [darkseagreen1]=158 [paleturquoise1]=159 [red3]=160 [deeppink3]=161 [deeppink3]=162 [magenta3]=163 [magenta3]=164 [magenta2]=165 [darkorange3]=166 [indianred]=167 [hotpink3]=168 [hotpink2]=169 [orchid]=170 [mediumorchid1]=171 [orange3]=172 [lightsalmon3]=173 [lightpink3]=174 [pink3]=175 [plum3]=176 [violet]=177 [gold3]=178 [lightgoldenrod3]=179 [tan]=180 [mistyrose3]=181 [thistle3]=182 [plum2]=183 [yellow3]=184 [khaki3]=185 [lightgoldenrod2]=186 [lightyellow3]=187 [grey84]=188 [lightsteelblue1]=189 [yellow2]=190 [darkolivegreen1]=191 [darkolivegreen1]=192 [darkseagreen1]=193 [honeydew2]=194 [lightcyan1]=195 [red1]=196 [deeppink2]=197 [deeppink1]=198 [deeppink1]=199 [magenta2]=200 [magenta1]=201 [orangered1]=202 [indianred1]=203 [indianred1]=204 [hotpink]=205 [hotpink]=206 [mediumorchid1]=207 [darkorange]=208 [salmon1]=209 [lightcoral]=210 [palevioletred1]=211 [orchid2]=212 [orchid1]=213 [orange1]=214 [sandybrown]=215 [lightsalmon1]=216 [lightpink1]=217 [pink1]=218 [plum1]=219 [gold1]=220 [lightgoldenrod2]=221 [lightgoldenrod2]=222 [navajowhite1]=223 [mistyrose1]=224 [thistle1]=225 [yellow1]=226 [lightgoldenrod1]=227 [khaki1]=228 [wheat1]=229 [cornsilk1]=230 [grey100]=231 [grey3]=232 [grey7]=233 [grey11]=234 [grey15]=235 [grey19]=236 [grey23]=237 [grey27]=238 [grey30]=239 [grey35]=240 [grey39]=241 [grey42]=242 [grey46]=243 [grey50]=244 [grey54]=245 [grey58]=246 [grey62]=247 [grey66]=248 [grey70]=249 [grey74]=250 [grey78]=251 [grey82]=252 [grey85]=253 [grey89]=254 [grey93]=255)
declare -A KEYS=([UP]=$'\e[A' [DOWN]=$'\e[B' [LEFT]=$'\e[C' [RIGHT]=$'\e[D' [CR]="" [ESC]=$'\e')

# Colorscheme
declare -r COLOR_DEFAULT='#f0f0f0'
declare -r COLOR_SELECTED='#ffaf87'

declare -r DEFAULT_RGB_TRANSITION_DURTATION=0.15

####################################  CORE  ####################################
getyx() {
  local -n outvary="$1"
  local -n outvarx="$2"
  IFS='[;' read -p $'\e[6n' -d R -rs _ outvary outvarx _
}

setyx() {
  (( n_scroll = y + $1 + _BTUI__INIT_Y - _BTUI__MAX_Y ))
  if (( n_scroll > 0 )); then
    echo -ne "\e[$_BTUI__MAX_Y;0H"
    for _ in $(seq $n_scroll); do echo; (( --_BTUI__INIT_Y )); done
  fi
  local -i absy absx;
  getabsyx absy absx;
  setabsyx $((absy + $1)) $((absx + $2))
}

getabsyx() {
  local -n outvary="$1"
  local -n outvarx="$2"
  # shellcheck disable=SC2034
  outvary=$((_BTUI__INIT_Y+y)) outvarx=$((1+x))
}

setabsyx() {
  echo -en "\e[$(($1<0?0:$1));$(($2<0?0:$2))H"
}

_addstr() {
  local -i dy=${dy-0} dx=${dx-0}
  setyx "$dy" "$dx"
  echo -en "$*"
}

getkey() {
    local -n outvar=${1:-REPLY}
    local key rest

    IFS= read -rsn1 key

    if [[ $key == $'\e' ]]; then
        IFS= read -rsn2 -t 0.01 rest
        key+=$rest
    fi

    outvar=$key
}

###################################  UTILS  ####################################
_flush_stdin() { while read -t 0; do read -rsn1; done }

_interpolate_rgb() {
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

    echo -e "\e[38;2;${r};${g};${b}m"
  done
}

_readhexcolor() {
    local hex="$1"
    local -n __r="$2" __g="$3" __b="$4"
    __r=$((16#${hex:1:2}))
    __g=$((16#${hex:3:2}))
    __b=$((16#${hex:5:2}))
}

_gen_rgbtrans() {
  local -n trans="$1"
  local hexcolor1="$2"
  local hexcolor2="$3"
  local n="$4"
  _readhexcolor "$hexcolor1" r1 g1 b1
  _readhexcolor "$hexcolor2" r2 g2 b2
  mapfile -t trans < <(_interpolate_rgb "$r1" "$g1" "$b1" "$r2" "$g2" "$b2" "$n")
}

_addstr_rgbtrans() {
  local -r str="$1"
  local -rn transname="$2"
  local -r duration=${3-$DEFAULT_RGB_TRANSITION_DURTATION}
  local -r delay=$(bc -l <<< "$duration/${#transname[@]}")

  setyx 0 0
  getabsyx absy absx
  for color_ansi in "${transname[@]}"; do
    echo -en "\e[s\e[$absy;${absx}H${color_ansi}$str\e[u"
    sleep "$delay"
  done
}


_center() {
  local str="$1"
  local -i width=$2
  local pad_total=$((width - ${#str}))
  local pad_left=$((pad_total / 2))
  local pad_right=$((pad_total - pad_left))
  printf '%*s%s%*s\n' "$pad_left" '' "$str" "$pad_right" ''
}


################################  MENU ELEMENT  ################################

__erase_menu() {
  local x=${x-0} y=${y-0} choice=${choice-1}
  for i in $(seq $#); do
    setyx $((i-1)) 0
    local opt=${!i}
    _addstr "  "
    _addstr "$(printf '%*s' ${#opt})"
    color reset
  done
  setyx 0 0
}


_draw_menu() {
  local x=${x-0} y=${y-0}
  local -i curr=${curr-0}
  local indicator=${indicator-'>'} text_color=${text_color-$COLOR_DEFAULT} selected_color=${selected_color-$COLOR_SELECTED}
  local labels=("$@")
  color "$text_color"
  for ((i = 0; i < ${#labels[@]}; i++)); do
    if [[ $curr == "$i" ]]; then
      y=$((y+i)) _addstr "$(color "$selected_color")$indicator ${labels[i]}$(color "$text_color")"
    else
      y=$((y+i)) _addstr "  ${labels[i]}"
    fi
  done
  color reset
  setyx 0 0
}



_imenu() {
  local -n outvar="$1"
  local labels=("${@:2}")
  local -i x=${x-0} y=${y-0}
  local -i curr=${curr-0}
  local -i prev=0
  local KEY
  _draw_menu "${labels[@]}"
  while true; do
    prev=$curr
    getkey KEY
    case "$KEY" in
      "${KEYS[CR]}" | "${KEYS[LEFT]}" | 'l') break ;;
      "${KEYS[ESC]}" | "${KEYS[RIGHT]}"  | 'h') curr=-1; break ;;
      "${KEYS[UP]}" | 'k') {
        while :; do
          curr=(${#labels[@]}+curr-1)%${#labels[@]}
          [[ -n ${labels[curr]} ]] && break
        done
       } ;;
      "${KEYS[DOWN]}" | 'j') {
        while :; do
          curr=(curr+1)%${#labels[@]}
          [[ -n ${labels[curr]} ]] && break
        done
      } ;;
      *) continue ;;
    esac
    y=$((y+curr)) _addstr "$(color $COLOR_SELECTED)>"
    y=$((y+prev)) _addstr "  "
    y=$((y+prev)) x=$((x+2)) _addstr_rgbtrans "${labels[prev]}" _RGBTRANS_MENU_DESELECT "$(bc -l <<< "$DEFAULT_RGB_TRANSITION_DURTATION * 1.5")" &
    y=$((y+curr)) x=$((x+2)) _addstr_rgbtrans "${labels[curr]}" _RGBTRANS_MENU_SELECT
    _flush_stdin
  done
  # shellcheck disable=SC2034
  (( curr >= 0 )) && outvar="${labels[curr]}" || outvar=""
  kill $! 2>/dev/null  # Kill last RGB transition subprocess
}


_iswitcher() {
  local -n outvar="$1"
  local labels=("${@:2}")
  local -i x=${x-0} y=${y-0}
  local -i dx=${dx-0} dy=${dy-0}
  x+=dx; y+=dy; unset dx dy
  local -i curr=${curr-0}
  local -i prev=0
  local KEY
  local -i maxlen=0
  for label in "${labels[@]}"; do
    if (( maxlen < ${#label} )); then
      maxlen=${#label}
    fi
  done
  for i in "${!labels[@]}"; do
    labels[i]=$(_center "${labels[i]}" $maxlen)
  done

  color \#707070
  dy=-1 _addstr "$(_center "▲" $maxlen)"
  dy=1 _addstr "$(_center "▼" $maxlen)"
  _addstr_rgbtrans "${labels[curr]}" _RGBTRANS_MENU_SELECT
  color $COLOR_SELECTED
  while true; do
    prev=$curr
    getkey KEY
    case "$KEY" in
      "${KEYS[CR]}" | "${KEYS[LEFT]}" | 'l') break ;;
      "${KEYS[UP]}" | 'k') curr=(${#labels[@]}+curr-1)%${#labels[@]} ;;
      "${KEYS[DOWN]}" | 'j') curr=(curr+1)%${#labels[@]} ;;
      *) continue ;;
    esac
    _addstr "${labels[curr]}"
  done
  _flush_stdin
  dy=-1 _addstr "$(printf "%${maxlen}s" "")"
  dy=1 _addstr "$(printf "%${maxlen}s" "")"
  # shellcheck disable=SC2034
  outvar="${labels[curr]}"
  declare -x CHOICE_IDX=curr
}


####################################  API  #####################################
# setpos() {
#   declare -i y=0 x=0
#   eval set -- "$(getopt -o y:x: -- "$@")"
#   while true; do
#     case $1 in
#       -y) y=$2; shift 2 ;;
#       -x) x=$2; shift 2 ;;
#       --) shift; break ;;
#     esac
#   done
#   setyx 0 0
# }

color() {
  local color="$1"
  if [[ $color == \#* ]]; then
    _readhexcolor "$color" r g b
    echo -ne "\e[38;2;${r};${g};${b}m"
  elif [[ $color =~ ^[0-9]+$ ]]; then
    echo -ne "\e[38;5;${color}m"
  else
    [[ $color == reset ]] && echo -ne '\e[0m' || echo -ne "\e[38;5;${COLORS[$color]}m"
  fi
}


### Elements ###

menu() {
  local -i x=${x-0} y=${y-0}
  local -i dx=${dx-0} dy=${dy-0}
  x+=dx; y+=dy; unset dx dy
  local chosen
  eval set -- "$(getopt -o c: -- "$@")"
  while true; do
    case "$1" in
      -c) chosen="$2"; shift 2 ;;
      --) shift; break ;;
    esac
  done
  curr=$chosen _draw_menu "$@"
}

imenu() {
  local -i x=${x-0} y=${y-0}
  local -i dx=${dx-0} dy=${dy-0}
  x+=dx; y+=dy; unset dx dy
  local chosen
  eval set -- "$(getopt -o c: -- "$@")"
  while true; do
    case "$1" in
      -c) chosen="$2"; shift 2 ;;
      --) shift; break ;;
    esac
  done
  curr=$chosen _imenu "$@"
}

iswitcher() {
  local -i x=${x-0} y=${y-0}
  local -i dx=${dx-0} dy=${dy-0}
  x+=dx; y+=dy; unset dx dy
  _iswitcher "$@"
}

addstr() {
  local -i x=${x-0} y=${y-0}
  local -i dx=${dx-0} dy=${dy-0}
  x+=dx; y+=dy; unset dx dy
  _addstr "$@"
}


fill_rect() {
  local -i x=${x-0} y=${y-0}
  local -i dx=${dx-0} dy=${dy-0}
  x+=dx; y+=dy; unset dx dy
  local -i w=$1 h=$2
  local -r fillchar=${3-' '}
  local -r fill="$(printf "$fillchar%.0s" $(seq $w))"
  for ((i = 0; i < h; i++)); do
    y=$i _addstr "$fill"
  done
}

draw_box() {
  local -i x=${x-0} y=${y-0}
  local -i dx=${dx-0} dy=${dy-0}
  x+=dx; y+=dy; unset dx dy
  local -i w=$1 h=$2
  local -r hchar="─" vchar="│" tl="┌" tr="┐" bl="└" br="┘"
  local -r hline="$(printf "$hchar%.0s" $(seq $((w-2))))"
  local -r vlines="$(printf "$vchar%*s$vchar" $((w-2)) )"
  local -r top="$tl$hline$tr"
  local -r bot="$bl$hline$br"
  _addstr "$top"
  dy=$((w-1)) _addstr "$bot"
  for ((i = 1; i < h - 1; i++)); do
    y=$i _addstr "$vlines"
  done
}


####################################  INIT  ####################################
declare -n _BTUI__MAX_Y=LINES _BTUI__MAX_X=COLUMNS
declare -i _BTUI__INIT_Y


# RGB Transitions
_gen_rgbtrans _RGBTRANS_MENU_SELECT "$COLOR_DEFAULT" "$COLOR_SELECTED" 20
_gen_rgbtrans _RGBTRANS_MENU_DESELECT "$COLOR_SELECTED" "$COLOR_DEFAULT" 20

setup() {
  stty -echo
  tput civis  # make cursor invisible
  shopt -s checkwinsize
  getyx _BTUI__INIT_Y _
}

restore() {
  tput cnorm  # make cursor appear normal
  stty sane   # restore terminal to sane condition
  setabsyx $((_BTUI__INIT_Y<0?0:_BTUI__INIT_Y)) 0
  tput ed     # erase display
}


trap restore EXIT
setup
