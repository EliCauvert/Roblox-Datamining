local foundation = script:FindFirstAncestor("Foundation")
local colorModeModule = require(foundation.Enums.ColorMode)
local deviceModule = require(foundation.Enums.Device)
local flagsModule = require(foundation.Utility.Flags)
local t = {
	Common = function() --[[ line: 11 ]]
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.CommonAttribute)
	end,
	Dark = function() --[[ line: 14 ]]
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.DarkAttribute)
	end,
	Light = function() --[[ line: 17 ]]
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.LightAttribute)
	end,
	Console = function() --[[ line: 20 ]]
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.ConsoleAttribute)
	end,
	Desktop = function() --[[ line: 23 ]]
		-- upvalues: foundation (ref)
		return require(foundation.Generated.StyleRules.DesktopAttribute)
	end
}

return function(p0, p1) --[[ line: 28 | named "getGeneratedRules" ]]
	-- upvalues: t (ref), colorModeModule (ref), deviceModule (ref), flagsModule (ref)
	local var5 = nil
	local _ = nil
	local _ = nil
	local var6 = t.Common()
	
	if p0 == colorModeModule.Dark then
		var5 = t.Dark()
	elseif p0 == colorModeModule.Light then
		var5 = t.Light()
	end
	local var7 = if p1 == deviceModule.Console and not flagsModule.FoundationDisableTokenScaling then t.Console() else t.Desktop()
	
	if not var5 or not var7 or not var6 then
		return {}
	end
	local cloned = table.clone(var7)
	
	for i, v in var6 do
		cloned[i] = v
	end
	for i_1, v_1 in var5 do
		cloned[i_1] = v_1
	end
	return cloned
end