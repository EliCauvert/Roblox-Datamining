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
	[themeNameModule.CircuitRush] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.CircuitRush.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.CircuitRush.LightAttribute)
		end
	},
	[themeNameModule.CosmicDust] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.CosmicDust.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.CosmicDust.LightAttribute)
		end
	},
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
	[themeNameModule.ElectricLime] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.ElectricLime.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.ElectricLime.LightAttribute)
		end
	},
	[themeNameModule.HyperPlum] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.HyperPlum.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.HyperPlum.LightAttribute)
		end
	},
	[themeNameModule.InfernoBlast] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.InfernoBlast.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.InfernoBlast.LightAttribute)
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
	},
	[themeNameModule.KineticEnergy] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.KineticEnergy.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.KineticEnergy.LightAttribute)
		end
	},
	[themeNameModule.LavaGlow] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.LavaGlow.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.LavaGlow.LightAttribute)
		end
	},
	[themeNameModule.NebulaDrift] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.NebulaDrift.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.NebulaDrift.LightAttribute)
		end
	},
	[themeNameModule.NitroFrost] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.NitroFrost.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.NitroFrost.LightAttribute)
		end
	},
	[themeNameModule.PixelPop] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.PixelPop.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.PixelPop.LightAttribute)
		end
	},
	[themeNameModule.PolarFreeze] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.PolarFreeze.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.PolarFreeze.LightAttribute)
		end
	},
	[themeNameModule.QuantumPulse] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.QuantumPulse.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.QuantumPulse.LightAttribute)
		end
	},
	[themeNameModule.StarBurst] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.StarBurst.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.StarBurst.LightAttribute)
		end
	},
	[themeNameModule.SuperCharge] = {
		Dark = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.SuperCharge.DarkAttribute)
		end,
		Light = function()
			-- upvalues: foundation (ref)
			return require(foundation.Generated.StyleRules.SuperCharge.LightAttribute)
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