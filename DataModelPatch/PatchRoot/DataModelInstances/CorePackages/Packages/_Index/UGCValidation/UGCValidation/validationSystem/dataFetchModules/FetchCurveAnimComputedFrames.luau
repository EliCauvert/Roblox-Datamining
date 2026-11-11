local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local CurveAnimationFrameCalculatorModule = require(Parent.util.CurveAnimationFrameCalculator)

return {
	getData = function(Entry)
		-- upvalues: CurveAnimationFrameCalculatorModule (copy)
		if #Entry == 0 then
			return nil
		else
			local Entry1 = Entry[1]
			local Success, Result, Result3, Result4, Result5 = pcall(function()
				-- upvalues: CurveAnimationFrameCalculatorModule (upval), Entry1 (copy)
				return CurveAnimationFrameCalculatorModule.calculateAnimFramesAtOrigin(Entry1)
			end)
			
			return if Success then {
				animFrames = Result,
				animLength = Result3,
				positionMagnitudeFrames = Result4,
				tracks = Result5
			} else nil
		end
	end
}