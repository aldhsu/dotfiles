" vim-rails

" Set ctags command so that tags are supported by YouCompleteMe
let g:rails_ctags_arguments = ['--languages=-javascript', '--fields=+l', '--exclude=.git', '--exclude=log']

" When not in a Rails project, vim-rails doesn't highlight RSpec files. Do it manually.
if !exists(":Rails!")
  function! SyntaxForRspec()
    syn keyword rubyRailsTestMethod describe context it its specify shared_context shared_examples shared_examples_for shared_context include_examples include_context it_should_behave_like it_behaves_like before after around subject fixtures controller_name helper_name scenario feature background given described_class
    syn match rubyRailsTestMethod '\<let\>!\='
    syn keyword rubyRailsTestMethod violated pending expect expect_any_instance_of allow allow_any_instance_of double instance_double mock mock_model stub_model xit
    syn match rubyRailsTestMethod '\.\@<!\<stub\>!\@!'
    highlight def link rubyRailsTestMethod Function
  endfunction

  au BufNewFile,BufRead *_spec.rb call SyntaxForRspec()
endif

" vim-airline
let g:airline_powerline_fonts = 1
let g:airline_detect_modified = 1
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#hunks#enabled = 0
let g:airline_theme='base16'

" fzf
let $FZF_DEFAULT_COMMAND='rg --files'

" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" For Commits and BCommits to customize the options used by 'git log':
let g:fzf_commits_log_options = '--graph --color=always --format="%C(auto)%h%d %s %C(black)%C(bold)%cr"'

" vim-test
let test#strategy = 'neovim'

" netrw
let g:netrw_localrmdir='rm -rf'
