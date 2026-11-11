local MockReplicatedFirstService = {}
MockReplicatedFirstService.__index = MockReplicatedFirstService

function MockReplicatedFirstService:new()
	-- upvalues: MockReplicatedFirstService (copy)
	local BindableEvent = Instance.new("BindableEvent")
	local BindableEvent1 = Instance.new("BindableEvent")
	local config = {
		mockIsFinishedReplicating = false,
		mockIsDefaultLoadingGuiRemoved = false,
		finishedReplicatingEvent = BindableEvent,
		FinishedReplicating = BindableEvent.Event,
		IsFinishedReplicating = function(p1)
			return p1.mockIsFinishedReplicating
		end,
		removeDefaultLoadingGuiSignalEvent = BindableEvent1,
		RemoveDefaultLoadingGuiSignal = BindableEvent1.Event,
		IsDefaultLoadingGuiRemoved = function(p1)
			return p1.mockIsDefaultLoadingGuiRemoved
		end,
		SetDefaultLoadingGuiRemoved = function() end
	}
	setmetatable(config, { __index = MockReplicatedFirstService })
	
	return config
end

return MockReplicatedFirstService