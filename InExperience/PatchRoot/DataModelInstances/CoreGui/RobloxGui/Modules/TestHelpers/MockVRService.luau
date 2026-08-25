local t = {}
t.__index = t

function t:GetPropertyChangedSignal(p0)
	if p0 == "VRDeviceAvailable" then
		return self._vrDeviceAvailableChanged.Event
	end
	error(("%s is not a valid property name"):format(tostring(p0)))
end

function t:toggleHeadsetConnectionState()
	local var1 = not self.VRDeviceAvailable
	self.VRDeviceAvailable = var1
	self._vrDeviceAvailableChanged:Fire(var1)
end

function t.new()
	-- upvalues: t (ref)
	local t_1 = {
		VRDeviceAvailable = true,
		_vrDeviceAvailableChanged = Instance.new("BindableEvent")
	}
	setmetatable(t_1, { __index = t })
	
	return t_1
end

return t