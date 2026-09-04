 local M = {}

function M.setup()
  require('base16-colorscheme').setup({
    base00 = '#101417',
    base01 = '#1d2024',
    base02 = '#272a2e',
    base03 = '#8a919b',
    base04 = '#c0c7d1',
    base05 = '#e0e2e8',
    base06 = '#e0e2e8',
    base07 = '#e0e2e8',
    base08 = '#ffb4ab',
    base09 = '#ebb2ff',
    base0A = '#afc9e4',
    base0B = '#94ccff',
    base0C = '#ebb2ff',
    base0D = '#94ccff',
    base0E = '#afc9e4',
    base0F = '#cde5ff',
  })

  local hi = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
  end

  hi('TelescopeNormal',         { fg = '#e0e2e8',          bg = '#101417' })
  hi('TelescopeBorder',         { fg = '#8a919b',             bg = '#101417' })
  hi('TelescopePromptNormal',   { fg = '#e0e2e8',          bg = '#101417' })
  hi('TelescopePromptBorder',   { fg = '#8a919b',             bg = '#101417' })
  hi('TelescopePromptPrefix',   { fg = '#94ccff',             bg = '#101417' })
  hi('TelescopePromptCounter',  { fg = '#c0c7d1',  bg = '#101417' })
  hi('TelescopePromptTitle',    { fg = '#101417',             bg = '#94ccff' })
  hi('TelescopePreviewTitle',   { fg = '#101417',             bg = '#afc9e4' })
  hi('TelescopeResultsTitle',   { fg = '#101417',             bg = '#ebb2ff' })
  hi('TelescopeSelection',      { fg = '#e0e2e8',          bg = '#272a2e' })
  hi('TelescopeSelectionCaret', { fg = '#94ccff',             bg = '#272a2e' })
  hi('TelescopeMatching',       { fg = '#94ccff',             bold = true })
end

-- Register a signal handler for SIGUSR1 (matugen updates).
-- The handler re-requires this module, which re-runs the code below, so the
-- previous handle is stopped first; otherwise handlers double on every signal.
if _G.__matugen_signal then
  _G.__matugen_signal:stop()
  _G.__matugen_signal:close()
end

local signal = vim.uv.new_signal()
_G.__matugen_signal = signal
signal:start(
  'sigusr1',
  vim.schedule_wrap(function()
    package.loaded['matugen'] = nil
    require('matugen').setup()
  end)
)

return M
