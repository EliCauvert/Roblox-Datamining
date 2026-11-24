local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local SignalsModule = require(FriendsCalling.Parent.Signals)
local FFlagFriendsCallingCallEndedSnackbarModule = require(FriendsCalling.Flags.FFlagFriendsCallingCallEndedSnackbar)
local LoggerModule = require(FriendsCalling.Logger)
local IsRingingForSomeoneElseModule = require(FriendsCalling.Utils.isRingingForSomeoneElse)
local FriendsCallingEndReason = Enum.FriendsCallingEndReason
local _ = Enum.FriendsCallingParticipantStatus
local FriendsCallingPhase = Enum.FriendsCallingPhase
local config = {
	[FriendsCallingEndReason.Failed] = true,
	[FriendsCallingEndReason.RemoteHangup] = true
}

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
		conversationId = tostring(Sound.ConversationId),
		participants = Participants
	}
end

local _ = function(p1): boolean
	-- upvalues: FriendsCallingPhase (copy), IsRingingForSomeoneElseModule (copy)
	return p1.phase ~= FriendsCallingPhase.Ended and not IsRingingForSomeoneElseModule(p1)
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
	-- upvalues: SignalsModule (copy), FFlagFriendsCallingCallEndedSnackbarModule (copy), readCall (copy), FriendsCallingPhase (copy), IsRingingForSomeoneElseModule (copy), LoggerModule (copy), config (copy), disconnectObservedCall (copy)
	local Signal, Signal2 = SignalsModule.createSignal({})
	local Signal1, Signal2_1 = SignalsModule.createSignal(nil)
	local Signal3, Signal2_2 = SignalsModule.createSignal(true)
	local Computed = SignalsModule.createComputed(function(p2)
		-- upvalues: Signal1 (copy)
		local SignalResult = Signal1(p2)
		
		return if SignalResult then SignalResult.callId else nil
	end)
	local Computed1 = SignalsModule.createComputed(function(p2): boolean
		-- upvalues: Signal1 (copy)
		return Signal1(p2) ~= nil
	end)
	local List = {}
	local ArrivalOrder = 0
	local v1 = nil
	local Signal2_3 = nil
	
	if FFlagFriendsCallingCallEndedSnackbarModule then
		local Signal4
		Signal4, Signal2_3 = SignalsModule.createSignal(nil)
	else
		local function Signal4(_)
			return nil
		end
		
		Signal2_3 = function(_) end
	end
	local function clearCallEndedReason()
		-- upvalues: Signal2_3 (ref)
		Signal2_3(nil)
	end
	
	local function publish()
		-- upvalues: List (copy), readCall (upval), FriendsCallingPhase (upval), IsRingingForSomeoneElseModule (upval), v1 (ref), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), LoggerModule (upval)
		local Copy = table.clone(List)
		table.sort(Copy, function(A, B): boolean
			return A.arrivalOrder < B.arrivalOrder
		end)
		local List1 = {}
		local Call = nil
		local v2 = nil
		
		for _, value in Copy do
			local Call1 = readCall(value.instance)
			table.insert(List1, Call1)
			
			if Call == nil and (Call1.phase ~= FriendsCallingPhase.Ended and not IsRingingForSomeoneElseModule(Call1)) then
				Call = Call1
				v2 = value
			end
		end
		local v3 = v1
		v1 = v2
		Signal2(List1)
		Signal2_1(Call)
		
		if v3 ~= nil and v3 ~= v2 then
			Signal2_2(true)
		end
		LoggerModule:debug("{} - published: calls={}, hasCall={}, callId={}, phase={}, endReason={}, participants={}", script.Name, #List1, tostring(Call ~= nil), Call and Call.callId or "", if Call then Call.phase.Name else "", if Call then Call.endReason.Name else "", if Call then #Call.participants else 0)
	end
	
	local function unobserveCall(FriendsCallingInstance)
		-- upvalues: List (copy), FFlagFriendsCallingCallEndedSnackbarModule (upval), FriendsCallingPhase (upval), config (upval), LoggerModule (upval), disconnectObservedCall (upval), Signal2_3 (ref), publish (copy)
		for i, value in List do
			if value.instance == FriendsCallingInstance then
				local EndReason = if FFlagFriendsCallingCallEndedSnackbarModule and FriendsCallingInstance.Phase == FriendsCallingPhase.Ended and config[FriendsCallingInstance.EndReason] then FriendsCallingInstance.EndReason else nil
				LoggerModule:debug("{} - unobserveCall: callId={}, phase={}", script.Name, FriendsCallingInstance.CallId or "", FriendsCallingInstance.Phase.Name)
				disconnectObservedCall(value)
				table.remove(List, i)
				
				if EndReason ~= nil then
					Signal2_3(EndReason)
				end
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
		getCall = Signal1,
		getCallId = Computed,
		getHasCall = Computed1,
		getCallEndedReason = Signal4,
		getIsExpanded = Signal3,
		expand = function()
			-- upvalues: Signal2_2 (copy)
			Signal2_2(true)
		end,
		collapse = function()
			-- upvalues: Signal2_2 (copy)
			Signal2_2(false)
		end,
		clearCallEndedReason = clearCallEndedReason,
		cleanup = function()
			-- upvalues: LoggerModule (upval), ChildAddedConnection (copy), ChildRemovedConnection (copy), List (copy), disconnectObservedCall (upval), v1 (ref), Signal2 (copy), Signal2_1 (copy), Signal2_2 (copy), FFlagFriendsCallingCallEndedSnackbarModule (upval), Signal2_3 (ref)
			LoggerModule:debug("{} - store cleanup", script.Name)
			ChildAddedConnection:Disconnect()
			ChildRemovedConnection:Disconnect()
			
			for _, value in List do
				disconnectObservedCall(value)
			end
			table.clear(List)
			local v4 = v1 ~= nil
			v1 = nil
			Signal2({})
			Signal2_1(nil)
			
			if v4 then
				Signal2_2(true)
			end
			if FFlagFriendsCallingCallEndedSnackbarModule then
				Signal2_3(nil)
			end
		end
	}
end