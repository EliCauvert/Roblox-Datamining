-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:49 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local curveAnimationFrameCalculatorModule = require(parent.util.CurveAnimationFrameCalculator)

return {
	getData = function(p0) --[[ line: 14 ]]
		-- upvalues: curveAnimationFrameCalculatorModule (ref)
		if #p0 == 0 then
			return nil
		end
		local var1 = p0[1]
		local ok, status, var2, var3, var4 = pcall(function() --[[ line: 22 ]]
			-- upvalues: curveAnimationFrameCalculatorModule (copy), var1 (ref)
			return curveAnimationFrameCalculatorModule.calculateAnimFramesAtOrigin(var1)
		end)
		
		return if ok then {
			animFrames = status,
			animLength = var2,
			positionMagnitudeFrames = var3,
			tracks = var4
		} else nil
	end
}