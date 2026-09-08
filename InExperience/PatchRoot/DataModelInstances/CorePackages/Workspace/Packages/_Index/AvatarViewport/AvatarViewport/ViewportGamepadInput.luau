local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local constantsModule = require(avatarViewport.Constants)

return {
	getThumbstickAxis = function(p1, p2)
		if p1.Magnitude < p2 then
			return 0
		end
		local absValue = math.abs(math.cos(math.atan2(p1.Y, p1.X)) * p2)
		
		return math.max(math.abs(p1.X) - absValue, 0) / (1 - absValue) * math.sign(p1.X)
	end,
	getThumbstickAxisY = function(p1, p2)
		if p1.Magnitude < p2 then
			return 0
		end
		local absValue = math.abs(math.sin(math.atan2(p1.Y, p1.X)) * p2)
		
		return math.max(math.abs(p1.Y) - absValue, 0) / (1 - absValue) * math.sign(p1.Y)
	end,
	computeYawDeltaDegrees = function(p1, p2, p3, p4)
		local var1
		if p1.Magnitude < p4 then
			var1 = 0
		else
			local absValue = math.abs(math.cos(math.atan2(p1.Y, p1.X)) * p4)
			var1 = math.max(math.abs(p1.X) - absValue, 0) / (1 - absValue) * math.sign(p1.X)
		end
		return if var1 == 0 then 0 else -var1 * p3 * p2
	end,
	computeZoomGestureDelta = function(p1, p2, p3, p4, p5)
		local var1
		if p1.Magnitude < p4 then
			var1 = 0
		else
			local absValue = math.abs(math.sin(math.atan2(p1.Y, p1.X)) * p4)
			var1 = math.max(math.abs(p1.Y) - absValue, 0) / (1 - absValue) * math.sign(p1.Y)
		end
		return if math.abs(var1) < p5 then 0 else var1 * p3 * p2
	end,
	isRotating = function(p1, p2)
		local var1
		if p1.Magnitude < p2 then
			var1 = 0
		else
			local absValue = math.abs(math.cos(math.atan2(p1.Y, p1.X)) * p2)
			var1 = math.max(math.abs(p1.X) - absValue, 0) / (1 - absValue) * math.sign(p1.X)
		end
		return var1 ~= 0
	end,
	defaultDeadzone = constantsModule.GamepadThumbstickDeadzone,
	getDefaultYawSpeedDegPerSecond = require(avatarViewport.Flags.GetFIntAvatarViewportGamepadYawDegreesPerSecond),
	getDefaultZoomGestureSpeedPerSecond = require(avatarViewport.Flags.GetFIntAvatarViewportGamepadZoomGestureSpeedPerSecond),
	defaultZoomAxisThreshold = constantsModule.GamepadZoomAxisThreshold
}