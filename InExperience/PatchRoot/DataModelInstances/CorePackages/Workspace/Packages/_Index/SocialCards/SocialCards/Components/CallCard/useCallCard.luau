local Parent = script:FindFirstAncestor("SocialCards").Parent
local ReactModule = require(Parent.React)
local RealtimeDeliveryModule = require(Parent.RealtimeDelivery)
local SignalsModule = require(Parent.Signals)
local CallCardStatusModule = require(script.Parent.CallCardStatus)
local GetCallCardModule = require(script.Parent.getCallCard)
local _ = require(script.Parent.mapCallCard)
local ParseCallCardModule = require(script.Parent.parseCallCard)
local GetFriendsCallingStoreModule = require(Parent.FriendsCalling.GetFriendsCallingStore)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local config = {
	[CallCardStatusModule.Answered] = true,
	[CallCardStatusModule.Declined] = true,
	[CallCardStatusModule.Cancelled] = true,
	[CallCardStatusModule.Missed] = true
}
local FriendsCallingPhase = Enum.FriendsCallingPhase
local config1 = {
	[FriendsCallingPhase.Ringing] = CallCardStatusModule.Ringing,
	[FriendsCallingPhase.Active] = CallCardStatusModule.Ongoing,
	[FriendsCallingPhase.Ended] = CallCardStatusModule.Ended
}

local function sameSnapshot(p1, p2): boolean
	return if p1 == nil or p2 == nil then p1 == p2 else p1.callId == p2.callId and (p1.status == p2.status and p1.otherCallId == p2.otherCallId) and p1.initiatorUserId == p2.initiatorUserId
end

return function(p1)
	-- upvalues: ReactModule (copy), SignalsModule (copy), GetFriendsCallingStoreModule (copy), config1 (copy), sameSnapshot (copy), UseSignalStateFunction (copy), config (copy), GetCallCardModule (copy), ParseCallCardModule (copy), RealtimeDeliveryModule (copy)
	local CallId = p1.callId
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(0)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseStateResult1 = if UseStateResult == nil or UseStateResult.callId ~= CallId then p1 else UseStateResult
	local UseRefResult2 = ReactModule.useRef(UseStateResult1)
	UseRefResult2.current = UseStateResult1
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: SignalsModule (upval), GetFriendsCallingStoreModule (upval), CallId (copy), config1 (upval), sameSnapshot (upval)
		return SignalsModule.createComputed(function(p2)
			-- upvalues: GetFriendsCallingStoreModule (upval), CallId (upval), config1 (upval)
			local v1 = nil
			local CallId1 = nil
			
			for _, value in GetFriendsCallingStoreModule(p2).getCalls(p2) do
				if value.callId == CallId then
					v1 = value
				elseif value.callId ~= "" and CallId1 == nil then
					CallId1 = value.callId
				end
			end
			return {
				callId = CallId,
				status = if v1 == nil then nil else config1[v1.phase],
				otherCallId = CallId1,
				initiatorUserId = if v1 == nil then nil else v1.initiatorUserId
			}
		end, sameSnapshot)
	end, { CallId })
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult)
	local UseSignalStateResult1 = if UseSignalStateResult.callId == CallId then UseSignalStateResult else nil
	local Status = if UseSignalStateResult1 == nil then nil else UseSignalStateResult1.status
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseMemoResult (copy), config (upval), UseRefResult2 (copy), UseRefResult (copy), GetCallCardModule (upval), CallId (copy), UseStateResult2 (copy), ParseCallCardModule (upval), p1 (copy)
		if UseMemoResult(false).status == nil and not config[UseRefResult2.current.status] then
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
	end, { CallId, UseMemoResult, p1 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy)
		return function()
			-- upvalues: UseRefResult (upval)
			UseRefResult.current += 1
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: Status (copy), CallId (copy), UseRefResult1 (copy), UseResult (copy)
		local CallId1 = if Status == nil then nil else CallId
		
		if UseRefResult1.current == CallId and CallId1 == nil then
			UseResult()
		end
		UseRefResult1.current = CallId1
	end, { CallId, Status, UseResult })
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
	local OtherCallId = if UseSignalStateResult1 == nil then nil else UseSignalStateResult1.otherCallId
	local InitiatorUserId = if UseSignalStateResult1 == nil then nil else UseSignalStateResult1.initiatorUserId
	local LocalPlayer = game:GetService("Players").LocalPlayer
	local IsInitiator = if InitiatorUserId == nil or InitiatorUserId == 0 or LocalPlayer == nil then UseStateResult1.isInitiator else LocalPlayer.UserId == InitiatorUserId
	
	if Status == nil then
		return UseStateResult1, OtherCallId, false
	else
		return {
			durationSeconds = nil,
			callId = UseStateResult1.callId,
			isInitiator = IsInitiator,
			status = Status,
			enableJoin = UseStateResult1.enableJoin
		}, OtherCallId, true
	end
end