local constantsModule = require(script.Parent.Constants)
local t = {
	clampYRotDeg = function(value)
		-- upvalues: constantsModule (ref)
		return math.clamp(value, -constantsModule.YRotMaxDeg, constantsModule.YRotMaxDeg)
	end,
	clampDistanceScale = function(value)
		-- upvalues: constantsModule (ref)
		return math.clamp(value, constantsModule.ZoomMinScale, constantsModule.ZoomMaxScale)
	end,
	getSliderValueFromYRotDeg = function(p1)
		-- upvalues: constantsModule (ref)
		return math.clamp(p1 * constantsModule.SliderMax / constantsModule.YRotMaxDeg, -constantsModule.SliderMax, constantsModule.SliderMax)
	end,
	getYRotDegFromSliderValue = function(p1)
		-- upvalues: constantsModule (ref)
		return math.clamp(p1 * constantsModule.YRotMaxDeg / constantsModule.SliderMax, -constantsModule.YRotMaxDeg, constantsModule.YRotMaxDeg)
	end,
	getCameraDistanceScaleFromSliderValue = function(p1)
		-- upvalues: constantsModule (ref)
		local var1 = -p1 / constantsModule.SliderMax + 1
		
		return (1 - constantsModule.ZoomMinScale) * var1 * var1 + constantsModule.ZoomMinScale
	end,
	getSliderValueFromCameraDistanceScale = function(p1)
		-- upvalues: constantsModule (ref)
		return math.clamp((math.sqrt(math.max(0, (p1 - constantsModule.ZoomMinScale) / (1 - constantsModule.ZoomMinScale))) - 1) * -constantsModule.SliderMax, -constantsModule.SliderMax, constantsModule.SliderMax)
	end
}

function t.adjustDistanceScaleByZoomGesture(p1, p2)
	-- upvalues: t (ref), constantsModule (ref)
	return t.clampDistanceScale(t.getCameraDistanceScaleFromSliderValue(math.clamp(t.getSliderValueFromCameraDistanceScale(p1) + p2 * 2, -constantsModule.SliderMax, constantsModule.SliderMax)))
end

function t.adjustDistanceScaleBySliderStep(p1, p2)
	-- upvalues: t (ref), constantsModule (ref)
	return t.clampDistanceScale(t.getCameraDistanceScaleFromSliderValue(math.clamp(t.getSliderValueFromCameraDistanceScale(p1) + p2, -constantsModule.SliderMax, constantsModule.SliderMax)))
end

t.PINCH_DELTA_TO_ZOOM_DELTA = 0.05

return t