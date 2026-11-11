local WaitForEventsFunction = require(script:FindFirstAncestor("MockEngineServices").Parent.TestUtils).DeferredLuaHelpers.waitForEvents

local function GetVoiceChatAvailableCB() end

local function _(p1)
	return function()
		-- upvalues: p1 (copy)
		return p1
	end
end

local BindableEvent = Instance.new("BindableEvent")
local BindableEvent1 = Instance.new("BindableEvent")
local BindableEvent2 = Instance.new("BindableEvent")
local v1 = 0

return {
	groupId = 10000,
	publishPaused = false,
	available = true,
	joinCalled = false,
	policyMapper = nil,
	makeMockUser = function(p1, p2)
		return {
			isMuted = false,
			userId = tostring(p1),
			UserId = tostring(p1),
			isMutedLocally = not not p2
		}
	end,
	ParticipantsStateChanged = BindableEvent.Event,
	StateChanged = BindableEvent2.Event,
	LocalPlayerModerated = BindableEvent1.Event,
	GetVoiceChatApiVersionCB = function()
		-- upvalues: v1 (copy)
		return v1
	end,
	GetVoiceChatAvailableCB = GetVoiceChatAvailableCB,
	IsSubscribePausedCB = GetVoiceChatAvailableCB,
	SubscribePauseCB = GetVoiceChatAvailableCB,
	SubscribeBlockCB = GetVoiceChatAvailableCB,
	SubscribeUnblockCB = GetVoiceChatAvailableCB,
	SubscribePauseAllCB = GetVoiceChatAvailableCB,
	Disconnect = function(_) end,
	Leave = function(_) end,
	GetGroupId = function(p1)
		return p1.groupId
	end,
	IsPublishPaused = function(p1)
		return p1.publishPaused
	end,
	JoinByGroupIdToken = function(p1): boolean
		p1.joinCalled = true
		
		return true
	end,
	IsSubscribePaused = function(p1)
		return p1.IsSubscribePausedCB()
	end,
	SubscribePause = function(p1, p2)
		return p1.SubscribePauseCB(p2)
	end,
	GetVoiceChatApiVersion = function(p1)
		return p1.GetVoiceChatApiVersionCB()
	end,
	GetVoiceChatAvailable = function(p1)
		return p1.GetVoiceChatAvailableCB()
	end,
	SubscribeBlock = function(p1)
		return p1.SubscribeBlockCB()
	end,
	SubscribePauseAll = function(p1)
		return p1.SubscribePauseAllCB()
	end,
	SubscribeUnblock = function(p1)
		return p1.SubscribeUnblockCB()
	end,
	kickUsers = function(_, p1)
		-- upvalues: BindableEvent (ref), WaitForEventsFunction (copy)
		BindableEvent:Fire(p1, {}, {})
		WaitForEventsFunction()
	end,
	ModerateLocalPlayer = function(_)
		-- upvalues: BindableEvent1 (ref), WaitForEventsFunction (copy)
		BindableEvent1:Fire()
		WaitForEventsFunction()
	end,
	addUsers = function(_, p1)
		-- upvalues: BindableEvent (ref), WaitForEventsFunction (copy)
		BindableEvent:Fire({}, {}, p1)
		WaitForEventsFunction()
	end,
	setUserStates = function(_, p1)
		-- upvalues: BindableEvent (ref), WaitForEventsFunction (copy)
		BindableEvent:Fire({}, {}, p1)
		WaitForEventsFunction()
	end,
	GetSessionId = function(_): number
		return 1
	end,
	GetChannelId = function(_): number
		return 1
	end,
	resetMocks = function(p1)
		-- upvalues: BindableEvent (ref), BindableEvent2 (ref), BindableEvent1 (ref)
		BindableEvent = Instance.new("BindableEvent")
		BindableEvent2 = Instance.new("BindableEvent")
		BindableEvent1 = Instance.new("BindableEvent")
		p1.LocalPlayerModerated = BindableEvent1.Event
		p1.ParticipantsStateChanged = BindableEvent.Event
		p1.StateChanged = BindableEvent2.Event
		p1.joinCalled = false
	end
}