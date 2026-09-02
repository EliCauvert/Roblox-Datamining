local parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local cameraMath = require(parent.AvatarViewport).CameraMath
local yRotDegFromSliderValue = cameraMath.getYRotDegFromSliderValue(1)

return function(p1)
	-- upvalues: responsiveModule (ref), reactModule (ref), cameraMath (ref), yRotDegFromSliderValue (ref)
	return {
		showCameraControlBar = not p1.isDisabled and responsiveModule.useLastInput() ~= responsiveModule.Input.Touch,
		onZoomIn = reactModule.useCallback(function()
			-- upvalues: p1 (ref), cameraMath (copy)
			p1.onDistanceScaleChanged(cameraMath.adjustDistanceScaleBySliderStep(p1.distanceScale, 1))
		end, { p1.distanceScale, p1.onDistanceScaleChanged }),
		onZoomOut = reactModule.useCallback(function()
			-- upvalues: p1 (ref), cameraMath (copy)
			p1.onDistanceScaleChanged(cameraMath.adjustDistanceScaleBySliderStep(p1.distanceScale, -1))
		end, { p1.distanceScale, p1.onDistanceScaleChanged }),
		onRotateLeft = reactModule.useCallback(function()
			-- upvalues: p1 (ref), cameraMath (copy), yRotDegFromSliderValue (copy)
			p1.onYRotDegChanged(cameraMath.clampYRotDeg(p1.committedYRotDeg + yRotDegFromSliderValue))
		end, { p1.committedYRotDeg, p1.onYRotDegChanged }),
		onRotateRight = reactModule.useCallback(function()
			-- upvalues: p1 (ref), cameraMath (copy), yRotDegFromSliderValue (copy)
			p1.onYRotDegChanged(cameraMath.clampYRotDeg(p1.committedYRotDeg - yRotDegFromSliderValue))
		end, { p1.committedYRotDeg, p1.onYRotDegChanged })
	}
end