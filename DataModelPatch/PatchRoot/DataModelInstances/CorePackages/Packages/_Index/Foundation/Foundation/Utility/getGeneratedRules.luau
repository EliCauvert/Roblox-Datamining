local Foundation = script:FindFirstAncestor("Foundation")
local DeviceModule = require(Foundation.Enums.Device)
local FlagsModule = require(Foundation.Utility.Flags)
local ThemeModule = require(Foundation.Enums.Theme)
local config = {
	Common = function()
		-- upvalues: Foundation (copy)
		return require(Foundation.Generated.StyleRules.CommonAttribute)
	end,
	Dark = function()
		-- upvalues: Foundation (copy)
		return require(Foundation.Generated.StyleRules.DarkAttribute)
	end,
	Light = function()
		-- upvalues: Foundation (copy)
		return require(Foundation.Generated.StyleRules.LightAttribute)
	end,
	Console = function()
		-- upvalues: Foundation (copy)
		return require(Foundation.Generated.StyleRules.ConsoleAttribute)
	end,
	Desktop = function()
		-- upvalues: Foundation (copy)
		return require(Foundation.Generated.StyleRules.DesktopAttribute)
	end
}

return function(Dark, Console)
	-- upvalues: config (copy), ThemeModule (copy), DeviceModule (copy), FlagsModule (copy)
	local DarkResult = nil
	local CommonResult = config.Common()
	
	if Dark == ThemeModule.Dark then
		DarkResult = config.Dark()
	elseif Dark == ThemeModule.Light then
		DarkResult = config.Light()
	end
	local ConsoleResult = if Console == DeviceModule.Console and not FlagsModule.FoundationDisableTokenScaling then config.Console() else config.Desktop()
	
	if not DarkResult or not ConsoleResult or not CommonResult then
		return {}
	end
	local Copy = table.clone(ConsoleResult)
	
	for i, value in CommonResult do
		Copy[i] = value
	end
	for i1, value1 in DarkResult do
		Copy[i1] = value1
	end
	return Copy
end