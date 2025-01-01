{ config, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;

    extraPackages = [ pkgs.coc-clangd pkgs.clang-tools ];

    coc = {
      enable = true;
      package = pkgs.vimPlugins.coc-nvim;
      
      settings = {
        suggest = {
          noselect = true;
          enablePreview = true;
          enablePreselect = true;
          disableKind = true;
        };

        languageserver = {
          clangd = {
            command = "clangd";
            rootPatterns = [ "compile_flags.txt" "compile_commands.json" ];
            filetypes = [ "c" "cc" "cpp" "c++" "objc" "objcpp" ];
          };
        };
      };
    };
    
    # 自定义配置
    extraConfig = ''
      " Use tab for trigger completion with characters ahead and navigate.
      " NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
      " other plugin before putting this into your config.
      "inoremap <silent><expr> <TAB>
      "  \ pumvisible() ? "\<C-n>" :
      "  \ <SID>check_back_space() ? "\<TAB>" :
      "  \ coc#refresh()
      "inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

      "function! s:check_back_space() abort
      "  let col = col('.') - 1
      "  return !col || getline('.')[col - 1]  =~# '\s'
      "endfunction

      " Make <CR> auto-select the first completion item and notify coc.nvim to
      " format on enter, <cr> could be remapped by other vim plugin
      inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
        \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
        " Use `[g` and `]g` to navigate diagnostics
      
      " Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
      nmap <silent> [g <Plug>(coc-diagnostic-prev)
      nmap <silent> ]g <Plug>(coc-diagnostic-next)

      " GoTo code navigation.
      nmap <silent> gd <Plug>(coc-definition)
      nmap <silent> gy <Plug>(coc-type-definition)
      nmap <silent> gi <Plug>(coc-implementation)
      nmap <silent> gr <Plug>(coc-references)
    '';

    extraLuaConfig = ''
      -- Hint: use `:h <option>` to figure out the meaning if needed
      vim.opt.clipboard = 'unnamedplus' -- use system clipboard
      vim.opt.completeopt = { 'menu', 'menuone', 'noselect' }
      vim.opt.mouse = 'a' -- allow the mouse to be used in Nvim

      -- Tab
      vim.opt.tabstop = 4 -- number of visual spaces per TAB
      vim.opt.softtabstop = 4 -- number of spacesin tab when editing
      vim.opt.shiftwidth = 4 -- insert 4 spaces on a tab
      vim.opt.expandtab = true -- tabs are spaces, mainly because of python

      -- UI config
      vim.opt.number = true -- show absolute number
      vim.opt.relativenumber = false -- add numbers to each line on the left side
      vim.opt.cursorline = true -- highlight cursor line underneath the cursor horizontally
      vim.opt.splitbelow = true -- open new vertical split bottom
      vim.opt.splitright = true -- open new horizontal splits right
      vim.opt.termguicolors = true        -- enabl 24-bit RGB color in the TUI
      vim.opt.showmode = false -- we are experienced, wo don't need the "-- INSERT --" mode hint

      -- Searching
      vim.opt.incsearch = true -- search as characters are entered
      vim.opt.hlsearch = false -- do not highlight matches
      vim.opt.ignorecase = true -- ignore case in searches by default
      vim.opt.smartcase = true -- but make it case sensitive if an uppercase is entered
    '';
  };
}
