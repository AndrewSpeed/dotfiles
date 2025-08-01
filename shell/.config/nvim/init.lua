-- Remap leader
vim.keymap.set("n", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "

-- keep more context on screen while scrolling
vim.opt.scrolloff = 2

-- never show me line breaks if they're not there
vim.opt.wrap = false

-- always draw sign column. prevents buffer moving when adding/deleting sign
vim.opt.signcolumn = 'yes'

-- sweet sweet relative line numbers
vim.opt.relativenumber = true

-- and show the absolute line number for the current line
vim.opt.number = true

-- keep current content top + left when splitting
vim.opt.splitright = true
vim.opt.splitbelow = true

-- infinite undo!
-- NOTE: ends up in ~/.local/state/nvim/undo/
vim.opt.undofile = true

--" Decent wildmenu
-- in completion, when there is more than one match,
-- list all matches, and only complete to longest common match
vim.opt.wildmode = 'list:longest'

-- when opening a file with a command (like :e),
-- don't suggest files like there:
vim.opt.wildignore = '.hg,.svn,*~,*.png,*.jpg,*.gif,*.min.js,*.swp,*.o,vendor,dist,_site'

-- Replace tabs with 4 spaces
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.expandtab = true

-- case-insensitive search/replace
vim.opt.ignorecase = true

-- unless uppercase in search term
vim.opt.smartcase = true

-- never ever make my terminal beep
vim.opt.vb = true

-- more useful diffs (nvim -d)
-- by ignoring whitespace
vim.opt.diffopt:append('iwhite')
-- and using a smarter algorithm
-- https://vimways.org/2018/the-power-of-diff/
-- https://stackoverflow.com/questions/32365271/whats-the-difference-between-git-diff-patience-and-git-diff-histogram
-- https://luppeng.wordpress.com/2020/10/10/when-to-use-each-of-the-git-diff-algorithms/
vim.opt.diffopt:append('algorithm:histogram')
vim.opt.diffopt:append('indent-heuristic')

-- show a column at 80 characters as a guide for long lines
vim.opt.colorcolumn = '80'
-- except in Rust where the rule is 100 characters
vim.api.nvim_create_autocmd('Filetype', { pattern = 'rust', command = 'set colorcolumn=100' })

-- lint files on save
vim.api.nvim_create_autocmd({ "BufWritePost" }, {
  callback = function()

    -- try_lint without arguments runs the linters defined in `linters_by_ft`
    -- for the current filetype
    require("lint").try_lint(nil, { ignore_errors = true })
  end,
})

-- show more hidden characters
-- also, show tabs nicer
vim.opt.listchars = 'tab:^ ,nbsp:¬,extends:»,precedes:«,trail:•'


-- bootstrap package manager
-- https://github.com/folke/lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- load package manager
require("lazy").setup({
  -- Detect tabstop and shiftwidth automatically
  "tpope/vim-sleuth",

  "junegunn/fzf",

  -- git interface
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",
      "ibhagwan/fzf-lua",
    },
  },

  -- project specific config
  {
    "klen/nvim-config-local",
    config = function()
      require('config-local').setup {
        -- Default options (optional)

        -- Config file patterns to load (lua supported)
        config_files = { ".nvim.lua", ".nvimrc", ".exrc" },

        -- Where the plugin keeps files data
        hashfile = vim.fn.stdpath("data") .. "/config-local",

        autocommands_create = true, -- Create autocommands (VimEnter, DirectoryChanged)
        commands_create = true,     -- Create commands (ConfigLocalSource, ConfigLocalEdit, ConfigLocalTrust, ConfigLocalDeny)
        silent = false,             -- Disable plugin messages (Config loaded/denied)
        lookup_parents = false,     -- Lookup config files in parent directories
      }
    end
  },

  -- linters
  {
    "mfussenegger/nvim-lint",
    config = function()
      local linter = require('lint')
      linter.linters_by_ft = {
        sh = {'bash', 'shellcheck'},
        python = {'mypy', 'ruff'},
      }
    end
  },

  -- LSP
  {
    'neovim/nvim-lspconfig',
    config = function()
      -- Setup language servers.
      local lspconfig = require('lspconfig')

      -- Rust
      lspconfig.rust_analyzer.setup {
        -- Server-specific settings. See `:help lspconfig-setup`
        settings = {
          ["rust-analyzer"] = {
            cargo = {
              allFeatures = true,
            },
            imports = {
              group = {
                enable = false,
              },
            },
            completion = {
              postfix = {
                enable = false,
              },
            },
          },
        },
      }

      -- Python
      -- lspconfig.basedpyright.setup {
      --   analysis = {
      --     typeCheckingMode = "off"
      --   },
      --   python = {
      --     venvPath = "/Users/aspeed/Cloudsmith/monolith/.venv/"
      --   }
      -- }

      lspconfig.pyright.setup {
        python = {
          venvPath = "/Users/aspeed/Cloudsmith/monolith/.venv/"
        }
      }

      lspconfig.ruff.setup {
        init_options = {
          settings = {
            configuration = "./pyproject.toml"
          }
        }
      }

      -- Global mappings.
      -- See `:help vim.diagnostic.*` for documentation on any of the below functions
      vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
      vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist)

      -- Use LspAttach autocommand to only map the following keys
      -- after the language server attaches to the current buffer
      vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
          -- Enable completion triggered by <c-x><c-o>
          vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

          -- Buffer local mappings.
          -- See `:help vim.lsp.*` for documentation on any of the below functions
          local opts = { buffer = ev.buf }
          vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
          vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
          vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
          vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
          vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
          vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, opts)
          vim.keymap.set('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
          end, opts)
          
          vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
          vim.keymap.set('n', '<leader>r', vim.lsp.buf.rename, opts)
          vim.keymap.set({ 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action, opts)
          vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
          vim.keymap.set('n', '<leader>f', function()
              vim.lsp.buf.format { async = true }
          end, opts)
        end,
      })
    end
  },

  -- LSP-based code-completion
  {
    "hrsh7th/nvim-cmp",
    -- load cmp on InsertEnter
    event = "InsertEnter",
    -- these dependencies will only be loaded when cmp loads
    -- dependencies are always lazy-loaded unless specified otherwise
    dependencies = {
      'neovim/nvim-lspconfig',
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
    },
    config = function()
      local cmp = require'cmp'
      cmp.setup({
        snippet = {
          -- REQUIRED by nvim-cmp. get rid of it once we can
          expand = function(args)
            vim.fn["vsnip#anonymous"](args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ['<C-b>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete(),
          ['<C-e>'] = cmp.mapping.abort(),
          -- Accept currently selected item.
          -- Set `select` to `false` to only confirm explicitly selected items.
          ['<CR>'] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = 'nvim_lsp' },
        }, {
          { name = 'path' },
        }),
        experimental = {
          ghost_text = true,
        },
      })

      -- Enable completing paths in :
      cmp.setup.cmdline(':', {
        sources = cmp.config.sources({
          { name = 'path' }
        })
      })
    end
  },
  -- code formatter
  {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
      local conform = require'conform'
      conform.setup({
        formatters_by_ft = {
          python = {"mypy", "ruff_fix", "ruff_format"},
          rust = { "rustfmt", lsp_format="fallback" }
        },
        format_on_save = {
          -- These options will be passed to conform.format()
          timeout_ms = 500,
          lsp_format = "fallback",
        },
      })
    end
  },
  -- inline function signatures
  {
    "ray-x/lsp_signature.nvim",
    event = "VeryLazy",
    opts = {},
    config = function(_, opts)
      -- Get signatures (and _only_ signatures) when in argument lists.
      require "lsp_signature".setup({
        doc_lines = 0,
        handler_opts = {
          border = "none"
        },
      })
    end
  },
  -- language support
  -- general syntax
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "yaml" },
      })
    end,
  },
  -- terraform
  {
    'hashivim/vim-terraform',
    ft = { "terraform" },
    config = function()
      vim.g.hcl_align = 1
      vim.g.terraform_align = 1
      vim.g.terraform_fmt_on_save = 1
    end
  },
  -- toml
  'cespare/vim-toml',
  -- yaml
  {
    "cuducos/yaml.nvim",
    ft = { "yaml", "yml" },
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
    },
  },
  -- rust
  {
    'rust-lang/rust.vim',
    ft = { "rust" },
    config = function()
      vim.g.rustfmt_autosave = 1
      vim.g.rustfmt_emit_files = 1
      vim.g.rustfmt_fail_silently = 0
      vim.g.rust_clip_command = 'wl-copy'
    end
  },
  -- markdown
  {
    'plasticboy/vim-markdown',
    ft = { "markdown" },
    dependencies = {
      'godlygeek/tabular',
    },
    config = function()
      -- never ever fold!
      vim.g.vim_markdown_folding_disabled = 1

      -- support front-matter in .md files
      vim.g.vim_markdown_frontmatter = 1

      -- 'o' on a list item should insert at same level
      vim.g.vim_markdown_new_list_item_indent = 0

      -- don't add bullets when wrapping:
      -- https://github.com/preservim/vim-markdown/issues/232
      vim.g.vim_markdown_auto_insert_bullets = 0
    end
  },
  -- auto bracket insertion
  {
    'windwp/nvim-autopairs',
    event = "InsertEnter",
    config = true
    -- use opts = {} for passing setup options
    -- this is equivalent to setup({}) function
  },
  -- file search
  {
    'nvim-telescope/telescope.nvim', tag = '0.1.8',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function ()
      local builtin = require('telescope.builtin')
      vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
      vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
      vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
      vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
      vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Git status' })
    end
  },
})
