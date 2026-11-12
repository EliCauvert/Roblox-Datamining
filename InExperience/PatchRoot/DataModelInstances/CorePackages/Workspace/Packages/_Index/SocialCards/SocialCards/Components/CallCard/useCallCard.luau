local Parent = script:FindFirstAncestor("SocialCards").Parent
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local CallCardStatusModule = require(script.Parent.CallCardStatus)
local GetCallCardModule = require(script.Parent.getCallCard)
local _ = require(script.Parent.mapCallCard)
local ParseCallCardModule = require(script.Parent.parseCallCard)
local config = {
	[CallCardStatusModule.Answered] = true,
	[CallCardStatusModule.Declined] = true,
	[CallCardStatusModule.Cancelled] = true,
	[CallCardStatusModule.Missed] = true
}
local FriendsCallingService = nil
pcall(function()
	-- upvalues: FriendsCallingService (ref)
	FriendsCallingService = game:GetService("FriendsCallingService")
end)
local Players = game:GetService("Players")

local function liveInstance(CallId)
	-- upvalues: FriendsCallingService (ref), CallCardStatusModule (copy)
	if FriendsCallingService == nil then
		return nil
	end
	for _, FriendsCallingInstance in FriendsCallingService:GetChildren() do
		if FriendsCallingInstance.ClassName == "FriendsCallingInstance" and FriendsCallingInstance.CallId ~= "" and FriendsCallingInstance.CallId == CallId then
			local Name = FriendsCallingInstance.Phase.Name
			local Ringing = if Name == "Ringing" then CallCardStatusModule.Ringing elseif Name == "Active" then CallCardStatusModule.Ongoing elseif Name == "Ended" then CallCardStatusModule.Ended else nil
			
			return if Ringing == nil then nil else {
				status = Ringing,
				initiatorUserId = FriendsCallingInstance.InitiatorUserId
			}
		end
	end
	return nil
end

local function _(UserId, p1)
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer == nil or UserId == 0 then p1 else LocalPlayer.UserId == UserId
end

return function(p1)
	-- upvalues: ReactModule (copy), liveInstance (copy), config (copy), GetCallCardModule (copy), ParseCallCardModule (copy), FriendsCallingService (ref), Players (copy), RealtimeDeliveryModule (copy)
	local CallId = p1.callId
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3 = if UseStateResult == nil or UseStateResult.callId ~= CallId then p1 else UseStateResult
	local UseRefResult1 = ReactModule.useRef(UseStateResult3)
	UseRefResult1.current = UseStateResult3
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: liveInstance (upval), CallId (copy), config (upval), UseRefResult1 (copy), UseRefResult (copy), GetCallCardModule (upval), UseStateResult2 (copy), ParseCallCardModule (upval), p1 (copy)
		if liveInstance(CallId) == nil and not config[UseRefResult1.current.status] then
			UseRefResult.current += 1
			local Current = UseRefResult.current
			GetCallCardModule(CallId, function(p2)
				-- upvalues: Current (copy), UseRefResult (upval), UseStateResult2 (upval), ParseCallCardModule (upval), p1 (upval)
				if Current == UseRefResult.current then
					UseStateResult2(ParseCallCardModule.applyCallCardRefresh(p1, p2))
					
					return
				end
			end)
			
			return
		end
	end, { CallId, p1 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current += 1
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: FriendsCallingService (upval), liveInstance (upval), CallId (copy), UseStateResult2_1 (copy), UseRefResult1 (copy), Players (upval), UseResult (copy)
		if FriendsCallingService == nil then return end
		local List = {}
		local Flag = true
		local v1 = false
		
		local function sync()
			-- upvalues: liveInstance (upval), CallId (upval), Flag (ref), v1 (ref), UseStateResult2_1 (upval), UseRefResult1 (upval), Players (upval), UseResult (upval)
			local LiveInstanceResult = liveInstance(CallId)
			local HasLiveInstanceResult = LiveInstanceResult ~= nil
			local NoHasLiveInstanceResult: boolean = not Flag and (v1 and not HasLiveInstanceResult)
			Flag = false
			v1 = HasLiveInstanceResult
			
			if LiveInstanceResult == nil then
				UseStateResult2_1(nil)
			else
				local InitiatorUserId = LiveInstanceResult.initiatorUserId
				local IsInitiator = UseRefResult1.current.isInitiator
				local LocalPlayer = Players.LocalPlayer
				UseStateResult2_1({
					callId = CallId,
					status = LiveInstanceResult.status,
					isInitiator = if LocalPlayer == nil or InitiatorUserId == 0 then IsInitiator else LocalPlayer.UserId == InitiatorUserId
				})
			end
			if NoHasLiveInstanceResult then
				UseResult()
			end
		end
		
		local function watch(FriendsCallingInstance)
			-- upvalues: List (copy), sync (copy)
			if FriendsCallingInstance.ClassName == "FriendsCallingInstance" then
				table.insert(List, FriendsCallingInstance:GetPropertyChangedSignal("CallId"):Connect(sync))
				table.insert(List, FriendsCallingInstance:GetPropertyChangedSignal("Phase"):Connect(sync))
				table.insert(List, FriendsCallingInstance:GetPropertyChangedSignal("InitiatorUserId"):Connect(sync))
				
				return
			end
		end
		
		for _, child in FriendsCallingService:GetChildren() do
			watch(child)
		end
		table.insert(List, FriendsCallingService.ChildAdded:Connect(function(Child)
			-- upvalues: watch (copy), sync (copy)
			watch(Child)
			sync()
		end))
		table.insert(List, FriendsCallingService.ChildRemoved:Connect(function()
			-- upvalues: sync (copy)
			sync()
		end))
		sync()
		
		return function()
			-- upvalues: List (copy)
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { CallId, UseResult })
	RealtimeDeliveryModule.useRealtimeNamespace("CallV2", function(p2)
		-- upvalues: CallId (copy), UseResult (copy)
		if p2.type == "CallCardUpdated" and p2.callId == CallId then
			UseResult()
		end
	end, { CallId, UseResult })
	RealtimeDeliveryModule.useRealtimeConnectionStateChanged("CallV2", function(ConnectionState, p2)
		-- upvalues: UseResult (copy)
		if ConnectionState == Enum.ConnectionState.Connected and p2 then
			UseResult()
		end
	end, { UseResult })
	
	return if UseStateResult1 == nil or UseStateResult1.callId ~= CallId then UseStateResult3 else {
		durationSeconds = nil,
		enableJoin = true,
		callId = UseStateResult3.callId,
		isInitiator = UseStateResult1.isInitiator,
		status = UseStateResult1.status
	}
end