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
	[themeNameModule.CircuitRush] = {
		Dark = function() --[[ line: 35 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.CircuitRush.DarkAttribute)
		end,
		Light = function() --[[ line: 38 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.CircuitRush.LightAttribute)
		end
	},
	[themeNameModule.CosmicDust] = {
		Dark = function() --[[ line: 43 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.CosmicDust.DarkAttribute)
		end,
		Light = function() --[[ line: 46 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.CosmicDust.LightAttribute)
		end
	},
	[themeNameModule.Default] = {
		Dark = function() --[[ line: 51 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.Default.DarkAttribute)
		end,
		Light = function() --[[ line: 54 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.Default.LightAttribute)
		end
	},
	[themeNameModule.ElectricLime] = {
		Dark = function() --[[ line: 59 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.ElectricLime.DarkAttribute)
		end,
		Light = function() --[[ line: 62 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.ElectricLime.LightAttribute)
		end
	},
	[themeNameModule.HyperPlum] = {
		Dark = function() --[[ line: 67 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.HyperPlum.DarkAttribute)
		end,
		Light = function() --[[ line: 70 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.HyperPlum.LightAttribute)
		end
	},
	[themeNameModule.InfernoBlast] = {
		Dark = function() --[[ line: 75 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.InfernoBlast.DarkAttribute)
		end,
		Light = function() --[[ line: 78 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.InfernoBlast.LightAttribute)
		end
	},
	[themeNameModule.Kids] = {
		Dark = function() --[[ line: 83 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.Kids.DarkAttribute)
		end,
		Light = function() --[[ line: 86 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.Kids.LightAttribute)
		end
	},
	[themeNameModule.KineticEnergy] = {
		Dark = function() --[[ line: 91 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.KineticEnergy.DarkAttribute)
		end,
		Light = function() --[[ line: 94 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.KineticEnergy.LightAttribute)
		end
	},
	[themeNameModule.LavaGlow] = {
		Dark = function() --[[ line: 99 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.LavaGlow.DarkAttribute)
		end,
		Light = function() --[[ line: 102 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.LavaGlow.LightAttribute)
		end
	},
	[themeNameModule.NebulaDrift] = {
		Dark = function() --[[ line: 107 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.NebulaDrift.DarkAttribute)
		end,
		Light = function() --[[ line: 110 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.NebulaDrift.LightAttribute)
		end
	},
	[themeNameModule.NitroFrost] = {
		Dark = function() --[[ line: 115 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.NitroFrost.DarkAttribute)
		end,
		Light = function() --[[ line: 118 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.NitroFrost.LightAttribute)
		end
	},
	[themeNameModule.PixelPop] = {
		Dark = function() --[[ line: 123 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.PixelPop.DarkAttribute)
		end,
		Light = function() --[[ line: 126 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.PixelPop.LightAttribute)
		end
	},
	[themeNameModule.PolarFreeze] = {
		Dark = function() --[[ line: 131 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.PolarFreeze.DarkAttribute)
		end,
		Light = function() --[[ line: 134 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.PolarFreeze.LightAttribute)
		end
	},
	[themeNameModule.QuantumPulse] = {
		Dark = function() --[[ line: 139 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.QuantumPulse.DarkAttribute)
		end,
		Light = function() --[[ line: 142 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.QuantumPulse.LightAttribute)
		end
	},
	[themeNameModule.StarBurst] = {
		Dark = function() --[[ line: 147 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.StarBurst.DarkAttribute)
		end,
		Light = function() --[[ line: 150 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.StarBurst.LightAttribute)
		end
	},
	[themeNameModule.SuperCharge] = {
		Dark = function() --[[ line: 155 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.SuperCharge.DarkAttribute)
		end,
		Light = function() --[[ line: 158 ]]
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.SuperCharge.LightAttribute)
		end
	}
}

return function(p0, p1, p2) --[[ line: 164 | named "getGeneratedRules" ]]
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