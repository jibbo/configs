# Removes the fish greeting
function fish_greeting
end

# Fish git prompt
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showstashstate 'yes'
set __fish_git_prompt_showuntrackedfiles 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_color_branch yellow
set __fish_git_prompt_color_upstream_ahead green
set __fish_git_prompt_color_upstream_behind red

# Status Chars
set __fish_git_prompt_char_dirtystate ''
set __fish_git_prompt_char_stagedstate ''
set __fish_git_prompt_char_untrackedfiles 'u'
set __fish_git_prompt_char_stashstate ''
set __fish_git_prompt_char_upstream_ahead '+'
set __fish_git_prompt_char_upstream_behind '-'

function git_info
  set gprompt (echo (__fish_git_prompt) | sed "s/ //")
  if test -n "$gprompt"
	printf '::%s' $gprompt
  end
end

function better_pwd
  printf '(%s)' (pwd | sed "s/\/Users\/"(whoami)"/~/g")
end

#Replaces the fish prompt
function fish_prompt
	printf '%s%s>' (better_pwd) (git_info)
end
