local propertiesModule = require(script.Parent.Parent.Properties)

return function(p1)
	-- upvalues: propertiesModule (ref)
	local var1 = 0
	local var2 = 0
	
	if propertiesModule.ThumbstickDeadzone <= p1.Magnitude then
		local var3 = math.atan2(p1.Y, p1.X)
		local absValue = math.abs(math.cos(var3) * propertiesModule.ThumbstickDeadzone)
		local absValue_1 = math.abs(math.sin(var3) * propertiesModule.ThumbstickDeadzone)
		var1 = math.max(math.abs(p1.X) - absValue, 0) / (1 - absValue) * math.sign(p1.X)
		var2 = math.max(math.abs(p1.Y) - absValue_1, 0) / (1 - absValue_1) * math.sign(p1.Y)
	end
	return Vector2.new(var1, -var2)
end