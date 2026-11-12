local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local SignalsModule = require(FriendsCalling.Parent.Signals)
local LoggerModule = require(FriendsCalling.Logger)
local _ = Enum.FriendsCallingEndReason
local _ = Enum.FriendsCallingParticipantStatus
local _ = Enum.FriendsCallingPhase

local function _(Player)
	return {
		userId = Player.UserId,
		status = Player.Status,
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
				status = FriendsCallingParticipant.Status,
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
		phase = Sound.Phase,
		initiatorUserId = Sound.InitiatorUserId,
		endReason = Sound.EndReason,
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
	-- upvalues: SignalsModule (copy), readCall (copy), LoggerModule (copy), disconnectObservedCall (copy)
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
		-- upvalues: List (copy), readCall (upval), Flag (ref), Signal2 (copy), Count (ref), Signal2_1 (copy), LoggerModule (upval)
		local Copy = table.clone(List)
		table.sort(Copy, function(A, B): boolean
			return A.arrivalOrder < B.arrivalOrder
		end)
		local List1 = {}
		
		for _, value in Copy do
			table.insert(List1, (readCall(value.instance)))
		end
		local v1 = #List1 > 0
		local NoV30: boolean = Flag and not v1
		Flag = v1
		Signal2(List1)
		
		if NoV30 then
			Count += 1
			Signal2_1(Count)
		end
		local Entry = List1[1]
		LoggerModule:debug("{} - published: hasCall={}, session={}, callId={}, phase={}, endReason={}, participants={}", script.Name, tostring(v1), Count, Entry and Entry.callId or "", if Entry then Entry.phase.Name else "", if Entry then Entry.endReason.Name else "", if Entry then #Entry.participants else 0)
	end
	
	local function unobserveCall(FriendsCallingInstance)
		-- upvalues: List (copy), LoggerModule (upval), disconnectObservedCall (upval), publish (copy)
		for i, value in List do
			if value.instance == FriendsCallingInstance then
				LoggerModule:debug("{} - unobserveCall: callId={}, phase={}", script.Name, FriendsCallingInstance.CallId or "", FriendsCallingInstance.Phase.Name)
				disconnectObservedCall(value)
				table.remove(List, i)
				publish()
				break
			end
		end
	end
	
	local function observeCall(FriendsCallingInstance)
		-- upvalues: List (copy), LoggerModule (upval), ArrivalOrder (ref), publish (copy)
		for _, value in List do
			if value.instance == FriendsCallingInstance then return end
		end
		LoggerModule:debug("{} - observeCall: callId={}, phase={}", script.Name, FriendsCallingInstance.CallId or "", FriendsCallingInstance.Phase.Name)
		ArrivalOrder += 1
		local config = {
			instance = FriendsCallingInstance,
			arrivalOrder = ArrivalOrder,
			connections = {},
			participantConnections = {}
		}
		table.insert(List, config)
		
		local function _(FriendsCallingParticipant)
			-- upvalues: config (copy), LoggerModule (upval), FriendsCallingInstance (copy), publish (upval)
			if FriendsCallingParticipant.ClassName == "FriendsCallingParticipant" and not config.participantConnections[FriendsCallingParticipant] then
				config.participantConnections[FriendsCallingParticipant] = FriendsCallingParticipant.Changed:Connect(function(Property)
					-- upvalues: LoggerModule (upval), FriendsCallingParticipant (copy), FriendsCallingInstance (upval), publish (upval)
					LoggerModule:debug("{} - child.Changed: property {}, userId={}, callId={}", script.Name, Property, FriendsCallingParticipant.UserId, FriendsCallingInstance.CallId or "")
					publish()
				end)
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
		
		table.insert(config.connections, FriendsCallingInstance.Changed:Connect(function(p2)
			-- upvalues: LoggerModule (upval), FriendsCallingInstance (copy), publish (upval)
			LoggerModule:debug("{} - call.Changed: property {}, callId={}, phase={}", script.Name, p2, FriendsCallingInstance.CallId or "", FriendsCallingInstance.Phase.Name)
			publish()
		end))
		table.insert(config.connections, FriendsCallingInstance.ChildAdded:Connect(function(Child: Player)
			-- upvalues: LoggerModule (upval), FriendsCallingInstance (copy), config (copy), publish (upval)
			if Child.ClassName == "FriendsCallingParticipant" then
				LoggerModule:debug("{} - call.ChildAdded: userId={}, callId={}", script.Name, Child.UserId, FriendsCallingInstance.CallId or "")
			end
			if Child.ClassName == "FriendsCallingParticipant" and not config.participantConnections[Child] then
				config.participantConnections[Child] = Child.Changed:Connect(function(Property)
					-- upvalues: LoggerModule (upval), Child (copy), FriendsCallingInstance (upval), publish (upval)
					LoggerModule:debug("{} - child.Changed: property {}, userId={}, callId={}", script.Name, Property, Child.UserId, FriendsCallingInstance.CallId or "")
					publish()
				end)
			end
			publish()
		end))
		table.insert(config.connections, FriendsCallingInstance.ChildRemoved:Connect(function(Child)
			-- upvalues: LoggerModule (upval), FriendsCallingInstance (copy), config (copy), publish (upval)
			if Child.ClassName == "FriendsCallingParticipant" then
				LoggerModule:debug("{} - call.ChildRemoved: userId={}, callId={}", script.Name, Child.UserId, FriendsCallingInstance.CallId or "")
			end
			local ParticipantConnection = config.participantConnections[Child]
			
			if ParticipantConnection then
				ParticipantConnection:Disconnect()
				config.participantConnections[Child] = nil
			end
			publish()
		end))
		
		for _, FriendsCallingParticipant in FriendsCallingInstance:GetChildren() do
			if FriendsCallingParticipant.ClassName == "FriendsCallingParticipant" and not config.participantConnections[FriendsCallingParticipant] then
				config.participantConnections[FriendsCallingParticipant] = FriendsCallingParticipant.Changed:Connect(function(Property)
					-- upvalues: LoggerModule (upval), FriendsCallingParticipant (copy), FriendsCallingInstance (copy), publish (upval)
					LoggerModule:debug("{} - child.Changed: property {}, userId={}, callId={}", script.Name, Property, FriendsCallingParticipant.UserId, FriendsCallingInstance.CallId or "")
					publish()
				end)
			end
		end
		publish()
	end
	
	LoggerModule:debug("{} - created: watching {} for FriendsCallingInstance", script.Name, Object.ClassName)
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
			-- upvalues: LoggerModule (upval), ChildAddedConnection (copy), ChildRemovedConnection (copy), List (copy), disconnectObservedCall (upval), Flag (ref), Signal2 (copy), Count (ref), Signal2_1 (copy)
			LoggerModule:debug("{} - store cleanup", script.Name)
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