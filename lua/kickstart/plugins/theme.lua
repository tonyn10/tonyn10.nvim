-- return {
--   { -- You can easily change to a different colorscheme.
--     -- Change the name of the colorscheme plugin below, and then
--     -- change the command in the config to whatever the name of that colorscheme is.
--     --
--     -- If you want to see what colorschemes are already installed, you can use `:Telescope colorscheme`.
--     'folke/tokyonight.nvim',
--     priority = 1000, -- Make sure to load this before all the other start plugins.
--     config = function()
--       ---@diagnostic disable-next-line: missing-fields
--       require('tokyonight').setup {
--         styles = {
--           comments = { italic = true }, -- Enable italics in comments
--         },
--       }
--
--       -- Load the colorscheme here.
--       -- Like many other themes, this one has different styles, and you could load
--       -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
--       vim.cmd.colorscheme 'tokyonight-night'
--     end,
--   },
-- }
--
-- return {
--   {
--     -- Change the colorscheme plugin to Nord
--     'shaunsingh/nord.nvim',
--     priority = 1000, -- load before other plugins
--     config = function()
--       -- Optional settings for Nord
--       vim.g.nord_contrast = true           -- darker backgrounds
--       vim.g.nord_borders = true            -- add borders to floats / popups
--       vim.g.nord_disable_background = true -- set to true if you want transparent bg
--
--       -- Apply the colorscheme
--       vim.cmd.colorscheme 'nord'
--     end,
--   },
-- }
--
return {
  {
    'rebelot/kanagawa.nvim',
    priority = 1000, -- load before other plugins
    config = function()
      -- Apply the colorscheme
      vim.cmd.colorscheme 'kanagawa-dragon'
    end,
  }
}
