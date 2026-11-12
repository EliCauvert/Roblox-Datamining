local Foundation = script:FindFirstAncestor("Foundation")
local _ = require(Foundation.Enums.ColorMode)
local DeviceModule = require(Foundation.Enums.Device)
local FlagsModule = require(Foundation.Utility.Flags)
local FontNameModule = require(Foundation.Enums.FontName)
local ThemeNameModule = require(Foundation.Enums.ThemeName)
local TypographyVariantsModule = require(Foundation.Generated.StyleRules.TypographyVariants)
local config = {
	Common = function()
		-- upvalues: Foundation (copy)
		return require(Foundation.Generated.StyleRules.CommonAttribute)
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
local config1 = {
	[ThemeNameModule.CircuitRush] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.CircuitRush.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.CircuitRush.LightAttribute)
		end
	},
	[ThemeNameModule.Classic] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Classic.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Classic.LightAttribute)
		end
	},
	[ThemeNameModule.CosmicDust] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.CosmicDust.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.CosmicDust.LightAttribute)
		end
	},
	[ThemeNameModule.Default] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Default.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Default.LightAttribute)
		end
	},
	[ThemeNameModule.ElectricLime] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.ElectricLime.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.ElectricLime.LightAttribute)
		end
	},
	[ThemeNameModule.Halloween2026] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Halloween2026.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Halloween2026.LightAttribute)
		end
	},
	[ThemeNameModule.HyperPlum] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.HyperPlum.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.HyperPlum.LightAttribute)
		end
	},
	[ThemeNameModule.InfernoBlast] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.InfernoBlast.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.InfernoBlast.LightAttribute)
		end
	},
	[ThemeNameModule.Kids] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Kids.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Kids.LightAttribute)
		end
	},
	[ThemeNameModule.KineticEnergy] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.KineticEnergy.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.KineticEnergy.LightAttribute)
		end
	},
	[ThemeNameModule.LavaGlow] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.LavaGlow.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.LavaGlow.LightAttribute)
		end
	},
	[ThemeNameModule.NebulaDrift] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.NebulaDrift.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.NebulaDrift.LightAttribute)
		end
	},
	[ThemeNameModule.NitroFrost] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.NitroFrost.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.NitroFrost.LightAttribute)
		end
	},
	[ThemeNameModule.PixelPop] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.PixelPop.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.PixelPop.LightAttribute)
		end
	},
	[ThemeNameModule.PolarFreeze] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.PolarFreeze.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.PolarFreeze.LightAttribute)
		end
	},
	[ThemeNameModule.QuantumPulse] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.QuantumPulse.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.QuantumPulse.LightAttribute)
		end
	},
	[ThemeNameModule.StarBurst] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.StarBurst.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.StarBurst.LightAttribute)
		end
	},
	[ThemeNameModule.SuperCharge] = {
		Dark = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.SuperCharge.DarkAttribute)
		end,
		Light = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.SuperCharge.LightAttribute)
		end
	}
}
local BuilderSans = FontNameModule.BuilderSans
local config2 = {
	[FontNameModule.BuilderSans] = {
		Desktop = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Typography.BuilderSans.DesktopAttribute)
		end,
		Console = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Typography.BuilderSans.ConsoleAttribute)
		end
	},
	[FontNameModule.Cartoon] = {
		Desktop = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Typography.Cartoon.DesktopAttribute)
		end,
		Console = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Typography.Cartoon.ConsoleAttribute)
		end
	}
}
local config3 = {
	[FontNameModule.BuilderSans] = {
		Desktop = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Legacy.Typography.BuilderSans.DesktopAttribute)
		end,
		Console = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Legacy.Typography.BuilderSans.ConsoleAttribute)
		end
	},
	[FontNameModule.Cartoon] = {
		Desktop = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Legacy.Typography.Cartoon.DesktopAttribute)
		end,
		Console = function()
			-- upvalues: Foundation (copy)
			return require(Foundation.Generated.StyleRules.Legacy.Typography.Cartoon.ConsoleAttribute)
		end
	}
}

return function(p1, p2, Console)
	-- upvalues: ThemeNameModule (copy), config (copy), config1 (copy), DeviceModule (copy), FlagsModule (copy), TypographyVariantsModule (copy), BuilderSans (copy), config2 (copy), config3 (copy)
	local P0 = p1 or ThemeNameModule.Default
	local CommonResult = config.Common()
	local v1 = (config1[P0] or config1[ThemeNameModule.Default])[p2]()
	local Tbl = if Console == DeviceModule.Console and not FlagsModule.FoundationDisableTokenScaling then config[DeviceModule.Console]() else config[DeviceModule.Desktop]()
	
	if not v1 or not Tbl or not CommonResult then
		return {}
	end
	local Copy = table.clone(Tbl)
	
	for i, value in CommonResult do
		Copy[i] = value
	end
	for i1, value1 in v1 do
		Copy[i1] = value1
	end
	local TypographyVariantsModuleEntry = TypographyVariantsModule[P0] or BuilderSans
	local Entry = (if FlagsModule.FoundationFontFaceMigration then config2[TypographyVariantsModuleEntry] or config2[BuilderSans] else config3[TypographyVariantsModuleEntry] or config3[BuilderSans])[if Console == DeviceModule.Console and not FlagsModule.FoundationDisableTokenScaling then DeviceModule.Console else DeviceModule.Desktop]
	
	if Entry then
		local EntryResult = Entry()
		
		if EntryResult then
			for i2, value2 in EntryResult do
				Copy[i2] = value2
			end
		end
	end
	return Copy
end