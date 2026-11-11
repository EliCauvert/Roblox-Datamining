local MockUserInputService = { events = {} }
MockUserInputService.__index = MockUserInputService

function MockUserInputService:GetPropertyChangedSignal(p1)
	local BindableEvent = Instance.new("BindableEvent")
	self.events[p1] = self.events[p1] or {}
	table.insert(self.events[p1], BindableEvent)
	
	return BindableEvent.Event
end

function MockUserInputService:callPropertyChanged(p1)
	if not self.events[p1] then return end
	for _, Signal in self.events[p1] do
		Signal:Fire()
	end
end

function MockUserInputService:new()
	-- upvalues: MockUserInputService (copy)
	local config = {
		GamepadEnabled = false,
		KeyboardEnabled = false,
		MouseEnabled = false,
		TouchEnabled = false,
		PreferredInput = Enum.PreferredInput.KeyboardAndMouse,
		events = {}
	}
	setmetatable(config, MockUserInputService)
	
	return config
end

return MockUserInputService