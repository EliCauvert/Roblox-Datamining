local foundation = script:FindFirstAncestor("Foundation")
local colorModeModule = require(foundation.Enums.ColorMode)
local deviceModule = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local themeNameModule = require(foundation.Enums.ThemeName)
local t = {
	Common = function()
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.CommonAttribute)
	end,
	Dark = function()
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.DarkAttribute)
	end,
	Light = function()
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.LightAttribute)
	end,
	Console = function()
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.ConsoleAttribute)
	end,
	Desktop = function()
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.DesktopAttribute)
	end
}
local t_1 = {
	[themeNameModule.Default] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.Default.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.Default.LightAttribute)
		end
	},
	[themeNameModule.Kids] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.Kids.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.Kids.LightAttribute)
		end
	}
}

return function(p1, p2, p3)
	-- upvalues: themeNameModule (ref), t (ref), flagsModule (ref), t_1 (ref), colorModeModule (ref), deviceModule (ref)
	p1 = p1 or themeNameModule.Default
	local var1 = nil
	local _ = nil
	local _ = nil
	local var2 = t.Common()
	
	if flagsModule.FoundationThemeName then
		var1 = (t_1[p1] or t_1[themeNameModule.Default])[p2]()
	elseif p2 == colorModeModule.Dark then
		var1 = t.Dark()
	elseif p2 == colorModeModule.Light then
		var1 = t.Light()
	end
	local var3 = if p3 == deviceModule.Console and not flagsModule.FoundationDisableTokenScaling then t.Console() else t.Desktop()
	
	if not var1 or not var3 or not var2 then
		return {}
	end
	local cloned = table.clone(var3)
	
	for i, v in var2 do
		cloned[i] = v
	end
	for i_1, v_1 in var1 do
		cloned[i_1] = v_1
	end
	return cloned
end