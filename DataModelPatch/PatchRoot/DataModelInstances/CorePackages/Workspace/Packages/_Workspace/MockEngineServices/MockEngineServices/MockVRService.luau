local MockVRService = {}
MockVRService.__index = MockVRService

function MockVRService:new()
	-- upvalues: MockVRService (copy)
	local config = {
		VREnabled = false,
		QuestDisplayRefreshRate = 90,
		events = {},
		GetPropertyChangedSignal = function(p1, p2)
			local BindableEvent = Instance.new("BindableEvent")
			p1.events[p2] = p1.events[p2] or {}
			table.insert(p1.events[p2], BindableEvent)
			
			return BindableEvent.Event
		end,
		callPropertyChanged = function(p1, p2)
			local Event = p1.events[p2]
			
			if Event then
				for _, Signal in Event do
					Signal:Fire()
				end
			end
		end
	}
	setmetatable(config, { __index = MockVRService })
	
	return config
end

return MockVRService