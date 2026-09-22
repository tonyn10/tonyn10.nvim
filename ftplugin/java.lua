local jdtls = require('jdtls')

-- 1. Root directory detection (Prioritize Gradle)
-- find_root looks for these markers to define where the project starts
local root_markers = { "gradlew", "build.gradle", "settings.gradle", "pom.xml", ".git" }
local root_dir = jdtls.setup.find_root(root_markers)

-- 2. Workspace isolation
-- JDTLS needs a unique data directory for every project to store indices
local project_name = vim.fn.fnamemodify(root_dir, ":p:h:t")
local workspace_dir = vim.fn.stdpath("data") .. "/jdtls-workspace/" .. project_name

-- 3. Blink.cmp Integration
-- This pulls the specific LSP capabilities blink needs for snippets/fuzzy matching
local capabilities = require('blink.cmp').get_lsp_capabilities()

local config = {
  -- The command that starts the language server
  -- If 'jdtls' isn't in your PATH, use the absolute path to the Mason binary
  cmd = {
    "jdtls",
    "-data", workspace_dir,
    -- Enable Lombok support if you have the jar (optional but common)
    "--jvm-arg=-javaagent:" .. vim.fn.expand("$HOME/.local/share/nvim/mason/packages/jdtls/lombok.jar"),
  },

  root_dir = root_dir,
  capabilities = capabilities,

  -- Essential settings for Gradle and project imports
  settings = {
    java = {
      eclipse = { downloadSources = true },
      maven = { downloadSources = true },
      implementationsCodeLens = { enabled = true },
      referencesCodeLens = { enabled = true },
      format = { enabled = true },
      import = {
        gradle = { enabled = true },
        maven = { enabled = true },
      },
    },
  },

  -- Keymaps specific to Java
  -- on_attach = function(client, bufnr)
  --   local opts = { buffer = bufnr, silent = true }
  --   vim.keymap.set('n', '<leader>jo', jdtls.organize_imports, opts)
  --   vim.keymap.set('n', '<leader>jv', jdtls.extract_variable, opts)
  --   vim.keymap.set('n', '<leader>jc', jdtls.extract_constant, opts)
  --   vim.keymap.set('v', '<leader>jm', [[<ESC><CMD>lua require('jdtls').extract_method(true)<CR>]], opts)
  -- end,
}

-- Start or attach the server
jdtls.start_or_attach(config)
