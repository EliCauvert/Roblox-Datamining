local SignalsModule = require(script:FindFirstAncestor("FriendsCalling").Parent.Signals)

local function _(Player)
	return {
		userId = Player.UserId,
		status = Player.Status.Name,
		leaveReason = Player.LeaveReason.Name,
		volume = Player.Volume,
		isLocalMuted = Player.IsLocalMuted,
		isSpeaking = Player.IsSpeaking,
		error = Player.Error.Name
	}
end

local function readCall(Sound)
	local Participants = {}
	
	for _, FriendsCallingParticipant in Sound:GetChildren() do
		if FriendsCallingParticipant.ClassName == "FriendsCallingParticipant" then
			table.insert(Participants, {
				userId = FriendsCallingParticipant.UserId,
				status = FriendsCallingParticipant.Status.Name,
				leaveReason = FriendsCallingParticipant.LeaveReason.Name,
				volume = FriendsCallingParticipant.Volume,
				isLocalMuted = FriendsCallingParticipant.IsLocalMuted,
				isSpeaking = FriendsCallingParticipant.IsSpeaking,
				error = FriendsCallingParticipant.Error.Name
			})
		end
	end
	return {
		callId = Sound.CallId,
		phase = Sound.Phase.Name,
		initiatorUserId = Sound.InitiatorUserId,
		endReason = Sound.EndReason.Name,
		volume = Sound.Volume,
		isDeafened = Sound.IsDeafened,
		conversationId = Sound.ConversationId,
		participants = Participants
	}
end

local function disconnectObservedCall(p1)
	for _, connection in p1.connections do
		connection:Disconnect()
	end
	for _, participantConnection in p1.participantConnections do
		participantConnection:Disconnect()
	end
end

return function(Object)
	-- upvalues: SignalsModule (copy), readCall (copy), disconnectObservedCall (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal(0)
	local Computed = SignalsModule.createComputed(function(p2)
		-- upvalues: Signal (copy)
		return Signal(p2)[1]
	end)
	local Computed1 = SignalsModule.createComputed(function(p2)
		-- upvalues: Computed (copy)
		local ComputedResult = Computed(p2)
		
		return if ComputedResult then ComputedResult.callId else nil
	end)
	local Computed2 = SignalsModule.createComputed(function(p2): boolean
		-- upvalues: Computed (copy)
		return Computed(p2) ~= nil
	end)
	local Computed3 = SignalsModule.createComputed(function(p2)
		-- upvalues: Computed2 (copy), Signal1 (copy)
		return { hasCall = Computed2(p2), session = Signal1(p2) }
	end)
	local List = {}
	local ArrivalOrder = 0
	local Count = 0
	local Flag = false
	
	local function publish()
		-- upvalues: List (copy), readCall (upval), Flag (ref), Signal2 (copy), Count (ref), Signal2_1 (copy)
		local Copy = table.clone(List)
		table.sort(Copy, function(A, B): boolean
			return A.arrivalOrder < B.arrivalOrder
		end)
		local List1 = {}
		
		for _, value in Copy do
			table.insert(List1, (readCall(value.instance)))
		end
		local v1 = #List1 > 0
		local NoV25: boolean = Flag and not v1
		Flag = v1
		Signal2(List1)
		
		if NoV25 then
			Count += 1
			Signal2_1(Count)
		end
	end
	
	local function unobserveCall(FriendsCallingInstance)
		-- upvalues: List (copy), disconnectObservedCall (upval), publish (copy)
		for i, value in List do
			if value.instance == FriendsCallingInstance then
				disconnectObservedCall(value)
				table.remove(List, i)
				publish()
				break
			end
		end
	end
	
	local function observeCall(FriendsCallingInstance)
		-- upvalues: List (copy), ArrivalOrder (ref), publish (copy)
		for _, value in List do
			if value.instance == FriendsCallingInstance then return end
		end
		ArrivalOrder += 1
		local config = {
			instance = FriendsCallingInstance,
			arrivalOrder = ArrivalOrder,
			connections = {},
			participantConnections = {}
		}
		table.insert(List, config)
		
		local function _(FriendsCallingParticipant)
			-- upvalues: config (copy), publish (upval)
			if FriendsCallingParticipant.ClassName == "FriendsCallingParticipant" and not config.participantConnections[FriendsCallingParticipant] then
				config.participantConnections[FriendsCallingParticipant] = FriendsCallingParticipant.Changed:Connect(publish)
			end
		end
		
		local _ = function(p2)
			-- upvalues: config (copy)
			local ParticipantConnection = config.participantConnections[p2]
			
			if ParticipantConnection then
				ParticipantConnection:Disconnect()
				config.participantConnections[p2] = nil
			end
		end
		
		table.insert(config.connections, FriendsCallingInstance.Changed:Connect(publish))
		table.insert(config.connections, FriendsCallingInstance.ChildAdded:Connect(function(Child)
			-- upvalues: config (copy), publish (upval)
			if Child.ClassName == "FriendsCallingParticipant" and not config.participantConnections[Child] then
				config.participantConnections[Child] = Child.Changed:Connect(publish)
			end
			publish()
		end))
		table.insert(config.connections, FriendsCallingInstance.ChildRemoved:Connect(function(Child)
			-- upvalues: config (copy), publish (upval)
			local ParticipantConnection = config.participantConnections[Child]
			
			if ParticipantConnection then
				ParticipantConnection:Disconnect()
				config.participantConnections[Child] = nil
			end
			publish()
		end))
		
		for _, FriendsCallingParticipant in FriendsCallingInstance:GetChildren() do
			if FriendsCallingParticipant.ClassName == "FriendsCallingParticipant" and not config.participantConnections[FriendsCallingParticipant] then
				config.participantConnections[FriendsCallingParticipant] = FriendsCallingParticipant.Changed:Connect(publish)
			end
		end
		publish()
	end
	
	local ChildAddedConnection = Object.ChildAdded:Connect(function(Child)
		-- upvalues: observeCall (copy)
		if Child.ClassName == "FriendsCallingInstance" then
			observeCall(Child)
		end
	end)
	local ChildRemovedConnection = Object.ChildRemoved:Connect(function(Child)
		-- upvalues: unobserveCall (copy)
		if Child.ClassName == "FriendsCallingInstance" then
			unobserveCall(Child)
		end
	end)
	
	for _, FriendsCallingInstance in Object:GetChildren() do
		if FriendsCallingInstance.ClassName == "FriendsCallingInstance" then
			observeCall(FriendsCallingInstance)
		end
	end
	return {
		getCalls = Signal,
		getCall = Computed,
		getCallId = Computed1,
		getHasCall = Computed2,
		getSession = Signal1,
		getWindowView = Computed3,
		cleanup = function()
			-- upvalues: ChildAddedConnection (copy), ChildRemovedConnection (copy), List (copy), disconnectObservedCall (upval), Flag (ref), Signal2 (copy), Count (ref), Signal2_1 (copy)
			ChildAddedConnection:Disconnect()
			ChildRemovedConnection:Disconnect()
			
			for _, value in List do
				disconnectObservedCall(value)
			end
			table.clear(List)
			local Flag1: boolean = Flag
			Flag = false
			Signal2({})
			
			if Flag1 then
				Count += 1
				Signal2_1(Count)
			end
		end
	}
end