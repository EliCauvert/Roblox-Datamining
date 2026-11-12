local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local CurveAnimationFrameCalculatorModule = require(Parent.util.CurveAnimationFrameCalculator)
local GetFFlagUGCValidateRunValidationsOnSecondaryCurveAnimationsModule = require(Parent.flags.getFFlagUGCValidateRunValidationsOnSecondaryCurveAnimations)

return {
	getData = function(p1, p2)
		-- upvalues: GetFFlagUGCValidateRunValidationsOnSecondaryCurveAnimationsModule (copy), CurveAnimationFrameCalculatorModule (copy)
		if #p1 == 0 then
			return nil
		end
		local List = {}
		local FFlagUGCValidateRunValidationsOnSecondaryCurveAnimationsModule = GetFFlagUGCValidateRunValidationsOnSecondaryCurveAnimationsModule()
		local CountP0: number = if FFlagUGCValidateRunValidationsOnSecondaryCurveAnimationsModule then #p1 else 1
		for i = 1, CountP0 do
			local v1 = p1[i]
			local Success, Result, Result3, Result4, Result5 = pcall(function()
				-- upvalues: CurveAnimationFrameCalculatorModule (upval), v1 (copy)
				return CurveAnimationFrameCalculatorModule.calculateAnimFramesAtOrigin(v1)
			end)
			
			if not Success then
				return nil
			end
			table.insert(List, {
				animation = if FFlagUGCValidateRunValidationsOnSecondaryCurveAnimationsModule and p2 then p2[i] else nil,
				animFrames = Result,
				animLength = Result3,
				positionMagnitudeFrames = Result4,
				tracks = Result5
			})
		end
		return List
	end
}