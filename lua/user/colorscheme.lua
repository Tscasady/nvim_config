local colortable = {"tokyonight-storm", "codemonkey", "system76", "spacedark", "tomorrow", "catppuccin-mocha", "rose-pine", "OceanicNext", "zephyr", "gloombuddy"}
--melange, sonokai
math.randomseed(os.time())

local colorscheme = colortable[ math.random(#colortable) ]
print("Current colorscheme: " .. colorscheme)

local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok then
  vim.notify("colorscheme" .. colorscheme .. " not found.")
  return
end
