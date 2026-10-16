local DefaultModule = require(script.Default)
local EnumsModule = require(script.enums)
local _ = require(script.types)

return {
	ColorMode = EnumsModule.ColorMode,
	Theme = EnumsModule.Theme,
	themes = {
		CircuitRush = function() --[[ Line: 16 ]]
			return require(script.CircuitRush)
		end,
		Classic = function() --[[ Line: 19 ]]
			return require(script.Classic)
		end,
		CosmicDust = function() --[[ Line: 22 ]]
			return require(script.CosmicDust)
		end,
		Default = function() --[[ Line: 25 ]]
			-- upvalues: DefaultModule (copy)
			return DefaultModule
		end,
		ElectricLime = function() --[[ Line: 28 ]]
			return require(script.ElectricLime)
		end,
		Halloween2026 = function() --[[ Line: 31 ]]
			return require(script.Halloween2026)
		end,
		HyperPlum = function() --[[ Line: 34 ]]
			return require(script.HyperPlum)
		end,
		InfernoBlast = function() --[[ Line: 37 ]]
			return require(script.InfernoBlast)
		end,
		Kids = function() --[[ Line: 40 ]]
			return require(script.Kids)
		end,
		KineticEnergy = function() --[[ Line: 43 ]]
			return require(script.KineticEnergy)
		end,
		LavaGlow = function() --[[ Line: 46 ]]
			return require(script.LavaGlow)
		end,
		NebulaDrift = function() --[[ Line: 49 ]]
			return require(script.NebulaDrift)
		end,
		NitroFrost = function() --[[ Line: 52 ]]
			return require(script.NitroFrost)
		end,
		PixelPop = function() --[[ Line: 55 ]]
			return require(script.PixelPop)
		end,
		PolarFreeze = function() --[[ Line: 58 ]]
			return require(script.PolarFreeze)
		end,
		QuantumPulse = function() --[[ Line: 61 ]]
			return require(script.QuantumPulse)
		end,
		StarBurst = function() --[[ Line: 64 ]]
			return require(script.StarBurst)
		end,
		SuperCharge = function() --[[ Line: 67 ]]
			return require(script.SuperCharge)
		end
	}
}