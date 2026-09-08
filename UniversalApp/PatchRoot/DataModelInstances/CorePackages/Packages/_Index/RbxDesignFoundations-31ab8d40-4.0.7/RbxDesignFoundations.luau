local defaultModule = require(script.Default)
local enumsModule = require(script.enums)
local _ = require(script.types)

return {
	ColorMode = enumsModule.ColorMode,
	Theme = enumsModule.Theme,
	themes = {
		CircuitRush = function()
			return require(script.CircuitRush)
		end,
		Classic = function()
			return require(script.Classic)
		end,
		CosmicDust = function()
			return require(script.CosmicDust)
		end,
		Default = function()
			-- upvalues: defaultModule (ref)
			return defaultModule
		end,
		ElectricLime = function()
			return require(script.ElectricLime)
		end,
		HyperPlum = function()
			return require(script.HyperPlum)
		end,
		InfernoBlast = function()
			return require(script.InfernoBlast)
		end,
		Kids = function()
			return require(script.Kids)
		end,
		KidsClassic = function()
			return require(script.KidsClassic)
		end,
		KineticEnergy = function()
			return require(script.KineticEnergy)
		end,
		LavaGlow = function()
			return require(script.LavaGlow)
		end,
		NebulaDrift = function()
			return require(script.NebulaDrift)
		end,
		NitroFrost = function()
			return require(script.NitroFrost)
		end,
		PixelPop = function()
			return require(script.PixelPop)
		end,
		PolarFreeze = function()
			return require(script.PolarFreeze)
		end,
		QuantumPulse = function()
			return require(script.QuantumPulse)
		end,
		StarBurst = function()
			return require(script.StarBurst)
		end,
		SuperCharge = function()
			return require(script.SuperCharge)
		end
	}
}