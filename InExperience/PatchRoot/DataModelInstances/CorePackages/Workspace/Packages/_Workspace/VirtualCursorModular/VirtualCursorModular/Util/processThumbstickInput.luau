local propertiesModule = require(script.Parent.Parent.Properties)

return function(p0) --[[ line: 7 | named "processThumbstickInput" ]]
	-- upvalues: propertiesModule (ref)
	local var1 = 0
	local var2 = 0
	
	if propertiesModule.ThumbstickDeadzone <= p0.Magnitude then
		local var3 = math.atan2(p0.Y, p0.X)
		local absValue = math.abs(math.cos(var3) * propertiesModule.ThumbstickDeadzone)
		local absValue_1 = math.abs(math.sin(var3) * propertiesModule.ThumbstickDeadzone)
		var1 = math.max(math.abs(p0.X) - absValue, 0) / (1 - absValue) * math.sign(p0.X)
		var2 = math.max(math.abs(p0.Y) - absValue_1, 0) / (1 - absValue_1) * math.sign(p0.Y)
	end
	return Vector2.new(var1, -var2)
end