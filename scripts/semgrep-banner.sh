_cmd_banner() {
  local BLUE=$'\033[38;5;117m'
  local gray=$'\033[38;5;245m'
  local reset=$'\033[0m'

  # small poison ASCII (баннер)

  local banner_top
  banner_top=$'
                                                                                   
    @@@  @@@@@@  @@@  @@@  @@@@@@     @@@@@@@  @@@@@@@@  @@@@@@@  @@@@@@  @@@  @@@ 
    @@! @@!  @@@ @@!  @@@ @@!  @@@    @@!  @@@ @@!      !@@      @@!  @@@ @@!@!@@@ 
    !!@ @!@!@!@! @!@  !@! @!@!@!@!    @!@!!@!  @!!!:!   !@!      @!@  !@! @!@@!!@! 
.  .!!  !!:  !!!  !: .:!  !!:  !!!    !!: :!!  !!:      :!!      !!:  !!! !!:  !!! 
::.::    :   : :    ::     :   : :     :   : : : :: ::   :: :: :  : :. :  ::    :  
                                                                                   '

  printf '%s\n' "$banner_top" \
    | sed "s/^/${BLUE}/; s/$/${reset}/"
  printf '\n'

  printf '\n%b%s%b\n' "$gray" "2026 Elijah S Shmakov (c) tool v.1.0" "$reset"
  printf '\n'

}