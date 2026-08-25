local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local curveAnimationFrameCalculatorModule = require(parent.util.CurveAnimationFrameCalculator)

return {
	getData = function(p0)
		-- upvalues: curveAnimationFrameCalculatorModule (ref)
		if #p0 == 0 then
			return nil
		end
		local var1 = p0[1]
		local ok, status, var2, var3, var4 = pcall(function()
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