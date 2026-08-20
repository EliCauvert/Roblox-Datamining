local avatarViewport = script:FindFirstAncestor("AvatarViewport")
local constantsModule = require(avatarViewport.Constants)

return {
	getThumbstickAxis = function(p0, p1) --[[ line: 9 ]]
		if p0.Magnitude < p1 then
			return 0
		end
		local absValue = math.abs(math.cos(math.atan2(p0.Y, p0.X)) * p1)
		
		return math.max(math.abs(p0.X) - absValue, 0) / (1 - absValue) * math.sign(p0.X)
	end,
	getThumbstickAxisY = function(p2, p3) --[[ line: 23 ]]
		if p2.Magnitude < p3 then
			return 0
		end
		local absValue = math.abs(math.sin(math.atan2(p2.Y, p2.X)) * p3)
		
		return math.max(math.abs(p2.Y) - absValue, 0) / (1 - absValue) * math.sign(p2.Y)
	end,
	computeYawDeltaDegrees = function(p4, p5, p6, p7) --[[ line: 36 ]]
		local var4
		if p4.Magnitude < p7 then
			var4 = 0
		else
			local absValue = math.abs(math.cos(math.atan2(p4.Y, p4.X)) * p7)
			var4 = math.max(math.abs(p4.X) - absValue, 0) / (1 - absValue) * math.sign(p4.X)
		end
		return if var4 == 0 then 0 else -var4 * p6 * p5
	end,
	computeZoomGestureDelta = function(p8, p9, p10, p11, p12) --[[ line: 55 ]]
		local var6
		if p8.Magnitude < p11 then
			var6 = 0
		else
			local absValue = math.abs(math.sin(math.atan2(p8.Y, p8.X)) * p11)
			var6 = math.max(math.abs(p8.Y) - absValue, 0) / (1 - absValue) * math.sign(p8.Y)
		end
		return if math.abs(var6) < p12 then 0 else var6 * p10 * p9
	end,
	isRotating = function(p13, p14) --[[ line: 51 ]]
		local var8
		if p13.Magnitude < p14 then
			var8 = 0
		else
			local absValue = math.abs(math.cos(math.atan2(p13.Y, p13.X)) * p14)
			var8 = math.max(math.abs(p13.X) - absValue, 0) / (1 - absValue) * math.sign(p13.X)
		end
		return var8 ~= 0
	end,
	defaultDeadzone = constantsModule.GamepadThumbstickDeadzone,
	getDefaultYawSpeedDegPerSecond = require(avatarViewport.Flags.GetFIntAvatarViewportGamepadYawDegreesPerSecond),
	getDefaultZoomGestureSpeedPerSecond = require(avatarViewport.Flags.GetFIntAvatarViewportGamepadZoomGestureSpeedPerSecond),
	defaultZoomAxisThreshold = constantsModule.GamepadZoomAxisThreshold
}