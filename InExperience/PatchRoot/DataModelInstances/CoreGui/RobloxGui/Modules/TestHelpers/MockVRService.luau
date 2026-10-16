local MockVRService = {}
MockVRService.__index = MockVRService

function MockVRService:GetPropertyChangedSignal(p1) --[[ Line: 4 ]]
	if p1 == "VRDeviceAvailable" then
		return self._vrDeviceAvailableChanged.Event
	else
		error(("%s is not a valid property name"):format((tostring(p1))))
	end
end

function MockVRService:toggleHeadsetConnectionState() --[[ Line: 11 ]]
	local NoVRDeviceAvailable = not self.VRDeviceAvailable
	self.VRDeviceAvailable = NoVRDeviceAvailable
	self._vrDeviceAvailableChanged:Fire(NoVRDeviceAvailable)
end

function MockVRService.new() --[[ Line: 18 ]]
	-- upvalues: MockVRService (copy)
	local config = {
		VRDeviceAvailable = true,
		_vrDeviceAvailableChanged = Instance.new("BindableEvent")
	}
	setmetatable(config, { __index = MockVRService })
	
	return config
end

return MockVRService