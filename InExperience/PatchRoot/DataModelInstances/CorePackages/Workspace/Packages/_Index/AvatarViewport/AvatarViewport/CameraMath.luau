local constantsModule = require(script.Parent.Constants)
local t = {
	clampYRotDeg = function(value) --[[ line: 10 ]]
		-- upvalues: constantsModule (ref)
		return math.clamp(value, -constantsModule.YRotMaxDeg, constantsModule.YRotMaxDeg)
	end,
	clampDistanceScale = function(value) --[[ line: 14 ]]
		-- upvalues: constantsModule (ref)
		return math.clamp(value, constantsModule.ZoomMinScale, constantsModule.ZoomMaxScale)
	end,
	getSliderValueFromYRotDeg = function(p0) --[[ line: 18 ]]
		-- upvalues: constantsModule (ref)
		return math.clamp(p0 * constantsModule.SliderMax / constantsModule.YRotMaxDeg, -constantsModule.SliderMax, constantsModule.SliderMax)
	end,
	getYRotDegFromSliderValue = function(p1) --[[ line: 26 ]]
		-- upvalues: constantsModule (ref)
		return math.clamp(p1 * constantsModule.YRotMaxDeg / constantsModule.SliderMax, -constantsModule.YRotMaxDeg, constantsModule.YRotMaxDeg)
	end,
	getCameraDistanceScaleFromSliderValue = function(p2) --[[ line: 35 ]]
		-- upvalues: constantsModule (ref)
		local var2 = -p2 / constantsModule.SliderMax + 1
		
		return (1 - constantsModule.ZoomMinScale) * var2 * var2 + constantsModule.ZoomMinScale
	end,
	getSliderValueFromCameraDistanceScale = function(p3) --[[ line: 40 ]]
		-- upvalues: constantsModule (ref)
		return math.clamp((math.sqrt(math.max(0, (p3 - constantsModule.ZoomMinScale) / (1 - constantsModule.ZoomMinScale))) - 1) * -constantsModule.SliderMax, -constantsModule.SliderMax, constantsModule.SliderMax)
	end
}

function t.adjustDistanceScaleByZoomGesture(p4, p5) --[[ line: 47 ]]
	-- upvalues: t (ref), constantsModule (ref)
	return t.clampDistanceScale(t.getCameraDistanceScaleFromSliderValue(math.clamp(t.getSliderValueFromCameraDistanceScale(p4) + p5 * 2, -constantsModule.SliderMax, constantsModule.SliderMax)))
end

t.PINCH_DELTA_TO_ZOOM_DELTA = 0.05

return t