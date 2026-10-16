local AvatarViewport = script:FindFirstAncestor("AvatarViewport")
local ConstantsModule = require(AvatarViewport.Constants)

return {
	getThumbstickAxis = function(Offset, p1): number --[[ Line: 9 ]]
		if Offset.Magnitude < p1 then
			return 0
		else
			local Magnitude = math.abs(math.cos((math.atan2(Offset.Y, Offset.X))) * p1)
			
			return math.max(math.abs(Offset.X) - Magnitude, 0) / (1 - Magnitude) * math.sign(Offset.X)
		end
	end,
	getThumbstickAxisY = function(Offset, p1): number --[[ Line: 23 ]]
		if Offset.Magnitude < p1 then
			return 0
		else
			local Magnitude = math.abs(math.sin((math.atan2(Offset.Y, Offset.X))) * p1)
			
			return math.max(math.abs(Offset.Y) - Magnitude, 0) / (1 - Magnitude) * math.sign(Offset.Y)
		end
	end,
	computeYawDeltaDegrees = function(Offset, p1, p2, p3) --[[ Line: 36 ]]
		local ScaledLargest = nil
		if Offset.Magnitude < p3 then
			ScaledLargest = 0
		else
			local Magnitude = math.abs(math.cos((math.atan2(Offset.Y, Offset.X))) * p3)
			ScaledLargest = math.max(math.abs(Offset.X) - Magnitude, 0) / (1 - Magnitude) * math.sign(Offset.X)
		end
		return if ScaledLargest == 0 then 0 else -ScaledLargest * p2 * p1
	end,
	computeZoomGestureDelta = function(Offset, p1, p2, p3, p4) --[[ Line: 55 ]]
		local Value = nil
		if Offset.Magnitude < p3 then
			Value = 0
		else
			local Magnitude = math.abs(math.sin((math.atan2(Offset.Y, Offset.X))) * p3)
			Value = math.max(math.abs(Offset.Y) - Magnitude, 0) / (1 - Magnitude) * math.sign(Offset.Y)
		end
		return if math.abs(Value) < p4 then 0 else Value * p2 * p1
	end,
	isRotating = function(Offset, p1): boolean --[[ Line: 51 ]]
		local ScaledLargest = nil
		if Offset.Magnitude < p1 then
			ScaledLargest = 0
		else
			local Magnitude = math.abs(math.cos((math.atan2(Offset.Y, Offset.X))) * p1)
			ScaledLargest = math.max(math.abs(Offset.X) - Magnitude, 0) / (1 - Magnitude) * math.sign(Offset.X)
		end
		return ScaledLargest ~= 0
	end,
	defaultDeadzone = ConstantsModule.GamepadThumbstickDeadzone,
	getDefaultYawSpeedDegPerSecond = require(AvatarViewport.Flags.GetFIntAvatarViewportGamepadYawDegreesPerSecond),
	getDefaultZoomGestureSpeedPerSecond = require(AvatarViewport.Flags.GetFIntAvatarViewportGamepadZoomGestureSpeedPerSecond),
	defaultZoomAxisThreshold = ConstantsModule.GamepadZoomAxisThreshold
}