local Parent = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor").Parent
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local CameraMath = require(Parent.AvatarViewport).CameraMath
local YRotDegFromSliderValue = CameraMath.getYRotDegFromSliderValue(1)

return function(p1) --[[ Line: 30 | Named "useRotatableAvatarPreviewViewModel" ]]
	-- upvalues: ResponsiveModule (copy), ReactModule (copy), CameraMath (copy), YRotDegFromSliderValue (copy)
	local UseLastInputResult = ResponsiveModule.useLastInput()
	
	return {
		showCameraControlBar = not p1.isDisabled and UseLastInputResult ~= ResponsiveModule.Input.Touch,
		onZoomIn = ReactModule.useCallback(function() --[[ Line: 36 ]]
			-- upvalues: p1 (copy), CameraMath (upval)
			p1.onDistanceScaleChanged(CameraMath.adjustDistanceScaleBySliderStep(p1.distanceScale, 1))
		end, { p1.distanceScale, p1.onDistanceScaleChanged }),
		onZoomOut = ReactModule.useCallback(function() --[[ Line: 42 ]]
			-- upvalues: p1 (copy), CameraMath (upval)
			p1.onDistanceScaleChanged(CameraMath.adjustDistanceScaleBySliderStep(p1.distanceScale, -1))
		end, { p1.distanceScale, p1.onDistanceScaleChanged }),
		onRotateLeft = ReactModule.useCallback(function() --[[ Line: 48 ]]
			-- upvalues: p1 (copy), CameraMath (upval), YRotDegFromSliderValue (upval)
			p1.onYRotDegChanged(CameraMath.clampYRotDeg(p1.committedYRotDeg + YRotDegFromSliderValue))
		end, { p1.committedYRotDeg, p1.onYRotDegChanged }),
		onRotateRight = ReactModule.useCallback(function() --[[ Line: 52 ]]
			-- upvalues: p1 (copy), CameraMath (upval), YRotDegFromSliderValue (upval)
			p1.onYRotDegChanged(CameraMath.clampYRotDeg(p1.committedYRotDeg - YRotDegFromSliderValue))
		end, { p1.committedYRotDeg, p1.onYRotDegChanged })
	}
end