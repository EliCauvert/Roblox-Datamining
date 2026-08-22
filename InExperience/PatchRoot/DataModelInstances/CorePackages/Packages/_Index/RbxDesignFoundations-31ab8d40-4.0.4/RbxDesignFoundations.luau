local defaultModule = require(script.Default)
local enumsModule = require(script.enums)
local _ = require(script.types)

return {
	ColorMode = enumsModule.ColorMode,
	Theme = enumsModule.Theme,
	themes = {
		CircuitRush = function() --[[ line: 16 ]]
			return require(script.CircuitRush)
		end,
		CosmicDust = function() --[[ line: 19 ]]
			return require(script.CosmicDust)
		end,
		Default = function() --[[ line: 22 ]]
			-- upvalues: defaultModule (ref)
			return defaultModule
		end,
		ElectricLime = function() --[[ line: 25 ]]
			return require(script.ElectricLime)
		end,
		HyperPlum = function() --[[ line: 28 ]]
			return require(script.HyperPlum)
		end,
		InfernoBlast = function() --[[ line: 31 ]]
			return require(script.InfernoBlast)
		end,
		Kids = function() --[[ line: 34 ]]
			return require(script.Kids)
		end,
		KineticEnergy = function() --[[ line: 37 ]]
			return require(script.KineticEnergy)
		end,
		LavaGlow = function() --[[ line: 40 ]]
			return require(script.LavaGlow)
		end,
		NebulaDrift = function() --[[ line: 43 ]]
			return require(script.NebulaDrift)
		end,
		NitroFrost = function() --[[ line: 46 ]]
			return require(script.NitroFrost)
		end,
		PixelPop = function() --[[ line: 49 ]]
			return require(script.PixelPop)
		end,
		PolarFreeze = function() --[[ line: 52 ]]
			return require(script.PolarFreeze)
		end,
		QuantumPulse = function() --[[ line: 55 ]]
			return require(script.QuantumPulse)
		end,
		StarBurst = function() --[[ line: 58 ]]
			return require(script.StarBurst)
		end,
		SuperCharge = function() --[[ line: 61 ]]
			return require(script.SuperCharge)
		end
	}
}