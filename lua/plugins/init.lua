return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    config = function()
      require "configs.conform"
    end,
  },
  {
    "github/copilot.vim",
    lazy = false,
    config = function()  -- Mapping tab is already used by NvChad
    -- Use <C-u> to accept Copilot suggestion
        vim.api.nvim_set_keymap("i", "<C-u>", "copilot#Accept('<CR>')", { silent = true, expr = true, script = true })

    -- Use <C-j> to navigate to the next suggestion
        vim.api.nvim_set_keymap("i", "<C-l>", "copilot#Next()", { silent = true, expr = true, script = true })

    -- Use <C-k> to navigate to the previous suggestion
        vim.api.nvim_set_keymap("i", "<C-k>", "copilot#Previous()", { silent = true, expr = true, script = true })
    end
  },
  {
    vim.cmd([[
      for char in split('abcdefghijklmnopqrstuvwxyz', '\zs')
          exe printf("inoremap <expr> %s search('[.!?]\\_s\\+\\%%#', 'bcnw') ? '%s' : '%s'", char, toupper(char), char)
      endfor

      for char in split('ABCDEFGHIJKLMNOPQRSTUVWXYZ', '\zs')
          exe printf("inoremap <expr> %s search('[.!?]\\_s\\+\\%%#', 'bcnW') ? '%s' : '%s'", char, tolower(char), char)
      endfor
      ]]),
  }
  -- These are some examples, uncomment them if you want to see them work!
  -- {
  --   "neovim/nvim-lspconfig",
  --   config = function()
  --     require("nvchad.configs.lspconfig").defaults()
  --     require "configs.lspconfig"
  --   end,
  -- },
  --
  -- {
  -- 	"williamboman/mason.nvim",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"lua-language-server", "stylua",
  -- 			"html-lsp", "css-lsp" , "prettier"
  -- 		},
  -- 	},
  -- },
  --
  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
