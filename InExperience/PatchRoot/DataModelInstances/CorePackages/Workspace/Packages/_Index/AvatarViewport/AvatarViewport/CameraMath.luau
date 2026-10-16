local ConstantsModule = require(script.Parent.Constants)
local CameraMathModule = {
	clampYRotDeg = function(Value: number): number --[[ Line: 10 ]]
		-- upvalues: ConstantsModule (copy)
		return (math.clamp(Value, -ConstantsModule.YRotMaxDeg, ConstantsModule.YRotMaxDeg))
	end,
	clampDistanceScale = function(Value: number): number --[[ Line: 14 ]]
		-- upvalues: ConstantsModule (copy)
		return (math.clamp(Value, ConstantsModule.ZoomMinScale, ConstantsModule.ZoomMaxScale))
	end,
	getSliderValueFromYRotDeg = function(p1): number --[[ Line: 18 ]]
		-- upvalues: ConstantsModule (copy)
		return (math.clamp(p1 * ConstantsModule.SliderMax / ConstantsModule.YRotMaxDeg, -ConstantsModule.SliderMax, ConstantsModule.SliderMax))
	end,
	getYRotDegFromSliderValue = function(p1): number --[[ Line: 26 ]]
		-- upvalues: ConstantsModule (copy)
		return (math.clamp(p1 * ConstantsModule.YRotMaxDeg / ConstantsModule.SliderMax, -ConstantsModule.YRotMaxDeg, ConstantsModule.YRotMaxDeg))
	end,
	getCameraDistanceScaleFromSliderValue = function(ClampedValue): number --[[ Line: 35 ]]
		-- upvalues: ConstantsModule (copy)
		local NewSliderMax = -ClampedValue / ConstantsModule.SliderMax + 1
		
		return (1 - ConstantsModule.ZoomMinScale) * NewSliderMax * NewSliderMax + ConstantsModule.ZoomMinScale
	end,
	getSliderValueFromCameraDistanceScale = function(p1): number --[[ Line: 40 ]]
		-- upvalues: ConstantsModule (copy)
		return (math.clamp((math.sqrt((math.max(0, (p1 - ConstantsModule.ZoomMinScale) / (1 - ConstantsModule.ZoomMinScale)))) - 1) * -ConstantsModule.SliderMax, -ConstantsModule.SliderMax, ConstantsModule.SliderMax))
	end
}

function CameraMathModule.adjustDistanceScaleByZoomGesture(p1, p2: number) --[[ Line: 47 ]]
	-- upvalues: CameraMathModule (copy), ConstantsModule (copy)
	return CameraMathModule.clampDistanceScale(CameraMathModule.getCameraDistanceScaleFromSliderValue((math.clamp(CameraMathModule.getSliderValueFromCameraDistanceScale(p1) + p2 * 2, -ConstantsModule.SliderMax, ConstantsModule.SliderMax))))
end

function CameraMathModule.adjustDistanceScaleBySliderStep(p1, p2) --[[ Line: 55 ]]
	-- upvalues: CameraMathModule (copy), ConstantsModule (copy)
	return CameraMathModule.clampDistanceScale(CameraMathModule.getCameraDistanceScaleFromSliderValue((math.clamp(CameraMathModule.getSliderValueFromCameraDistanceScale(p1) + p2, -ConstantsModule.SliderMax, ConstantsModule.SliderMax))))
end

CameraMathModule.PINCH_DELTA_TO_ZOOM_DELTA = 0.05

return CameraMathModule