local foundation = script:FindFirstAncestor("Foundation")
local colorModeModule = require(foundation.Enums.ColorMode)
local deviceModule = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local themeNameModule = require(foundation.Enums.ThemeName)
local t = {
	Common = function() --[[ line: 13 ]]
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.CommonAttribute)
	end,
	Dark = function() --[[ line: 17 ]]
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.DarkAttribute)
	end,
	Light = function() --[[ line: 20 ]]
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.LightAttribute)
	end,
	Console = function() --[[ line: 24 ]]
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.ConsoleAttribute)
	end,
	Desktop = function() --[[ line: 27 ]]
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.DesktopAttribute)
	end
}
local t_1 = {
	[themeNameModule.Default] = {
		Dark = function() --[[ line: 35 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.Default.DarkAttribute)
		end,
		Light = function() --[[ line: 38 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.Default.LightAttribute)
		end
	},
	[themeNameModule.Kids] = {
		Dark = function() --[[ line: 43 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.Kids.DarkAttribute)
		end,
		Light = function() --[[ line: 46 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.Kids.LightAttribute)
		end
	}
}

return function(p0, p1, p2) --[[ line: 52 | named "getGeneratedRules" ]]
	-- upvalues: themeNameModule (ref), t (ref), flagsModule (ref), t_1 (ref), colorModeModule (ref), deviceModule (ref)
	p0 = p0 or themeNameModule.Default
	local var8 = nil
	local _ = nil
	local _ = nil
	local var9 = t.Common()
	
	if flagsModule.FoundationThemeName then
		var8 = (t_1[p0] or t_1[themeNameModule.Default])[p1]()
	elseif p1 == colorModeModule.Dark then
		var8 = t.Dark()
	elseif p1 == colorModeModule.Light then
		var8 = t.Light()
	end
	local var10 = if p2 == deviceModule.Console and not flagsModule.FoundationDisableTokenScaling then t.Console() else t.Desktop()
	
	if not var8 or not var10 or not var9 then
		return {}
	end
	local cloned = table.clone(var10)
	
	for i, v in var9 do
		cloned[i] = v
	end
	for i_1, v_1 in var8 do
		cloned[i_1] = v_1
	end
	return cloned
end