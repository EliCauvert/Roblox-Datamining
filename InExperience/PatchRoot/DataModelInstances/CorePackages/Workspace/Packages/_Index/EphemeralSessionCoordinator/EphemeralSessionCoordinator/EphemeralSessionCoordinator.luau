local FriendsCallingService = game:GetService("FriendsCallingService")
local EphemeralSessionCoordinator = script:FindFirstAncestor("EphemeralSessionCoordinator")
local Parent = EphemeralSessionCoordinator.Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local RoactRodux = require(Parent.RoactUtils).Hooks.RoactRodux
local UseDispatchFunction = RoactRodux.useDispatch
local UseSelectorFunction = RoactRodux.useSelector
local GetFriendsCallingStoreModule = require(Parent.FriendsCalling.GetFriendsCallingStore)
local HttpModule = require(Parent.SquadsCore.Http)
local LeaveSquadFunction = require(Parent.SquadsCore.Thunks).leaveSquad
local UseCurrentSquadIdFunction = require(Parent.SquadsCore.Hooks).useCurrentSquadId
local SquadExternalContractContext = require(Parent.SquadsCore.SquadExternalContractProvider).SquadExternalContractContext
local LoggerModule = require(EphemeralSessionCoordinator.Logger)
local NetworkingSquads = HttpModule.NetworkingSquads
local NetworkStatus = HttpModule.RoduxNetworking.Enum.NetworkStatus
local config = { Call = "Call", Squad = "Squad", None = "None" }

local function selectIsSquadPaused(p1)
	local Squad = p1.Squad and p1.Squad.Squad
	
	return if Squad and Squad.currentSquadPersist then Squad.currentSquadPersist.isPaused else false
end

local function selectIsJoiningSquad(p1): boolean
	-- upvalues: NetworkingSquads (copy), NetworkStatus (copy)
	return p1.Squad ~= nil and (NetworkingSquads.JoinSquad.getStatus(p1, {}) == NetworkStatus.Fetching or (NetworkingSquads.CreateOrJoinSquad.getStatus(p1, {}) == NetworkStatus.Fetching or NetworkingSquads.ActOnPartyNudge.getStatus(p1, {}) == NetworkStatus.Fetching))
end

local function _(CallId)
	-- upvalues: FriendsCallingService (copy), LoggerModule (copy)
	local Success, Result = pcall(function()
		-- upvalues: FriendsCallingService (upval), CallId (copy)
		FriendsCallingService:EndCall(CallId, "LuaEndAction")
	end)
	
	if not Success then
		LoggerModule:warning("FriendsCallingService:EndCall failed for {}: {}", CallId, (tostring(Result)))
	end
	return Success
end

local function isCallLive(CallId): boolean
	-- upvalues: FriendsCallingService (copy)
	for _, FriendsCallingInstance in FriendsCallingService:GetChildren() do
		if FriendsCallingInstance.ClassName == "FriendsCallingInstance" and FriendsCallingInstance.CallId == CallId then
			return FriendsCallingInstance.Phase ~= Enum.FriendsCallingPhase.Ended
		end
	end
	return false
end

local _ = function(Current, CallId, SquadId, p1): string
	if Current == nil then
		return "Call"
	else
		local IsNotSquadIdMatch = if Current.callId == CallId then SquadId ~= p1 or Current.isJoiningSquad else Current.winner == "Squad" and Current.squadId == SquadId
		
		return if IsNotSquadIdMatch then "Squad" else "Call"
	end
end

local function resolveConflict(Current, CallId, SquadId, Current1)
	-- upvalues: config (copy), LoggerModule (copy), FriendsCallingService (copy), isCallLive (copy)
	if CallId == nil or SquadId == nil then
		return "None", false
	end
	if Current ~= nil and Current.callId == CallId and Current.squadId == SquadId then
		return Current.winner, false
	end
	local Call = nil
	if Current == nil then
		Call = config.Call
	else
		local IsNotSquadIdMatch = if Current.callId == CallId then SquadId ~= Current1 or Current.isJoiningSquad else Current.winner == config.Squad and Current.squadId == SquadId
		Call = if IsNotSquadIdMatch then config.Squad else config.Call
	end
	if Call == "Squad" then
		LoggerModule:info("Squad {} is newer than call {}, ending the call", SquadId, CallId)
		local Success, Result = pcall(function()
			-- upvalues: FriendsCallingService (upval), CallId (copy)
			FriendsCallingService:EndCall(CallId, "LuaEndAction")
		end)
		
		if not Success then
			LoggerModule:warning("FriendsCallingService:EndCall failed for {}: {}", CallId, (tostring(Result)))
		end
		if not Success then
			Call = if isCallLive(CallId) then "Call" else "None"
		end
	end
	return Call, Call == "Call"
end

return function()
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), SquadExternalContractContext (copy), UseSignalStateFunction (copy), GetFriendsCallingStoreModule (copy), UseCurrentSquadIdFunction (copy), UseSelectorFunction (copy), selectIsSquadPaused (copy), selectIsJoiningSquad (copy), resolveConflict (copy), LoggerModule (copy), LeaveSquadFunction (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseContextResult = ReactModule.useContext(SquadExternalContractContext)
	local UseSignalStateResult = UseSignalStateFunction(GetFriendsCallingStoreModule(false).getCallId)
	local UseCurrentSquadIdResult = UseCurrentSquadIdFunction()
	local UseSelectorResult = UseSelectorFunction(selectIsSquadPaused)
	local UseSelectorResult1 = UseSelectorFunction(selectIsJoiningSquad)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult (copy), UseRefResult (copy), UseSignalStateResult (copy), UseRefResult1 (copy), resolveConflict (upval), UseCurrentSquadIdResult (copy), UseSelectorResult1 (copy), LoggerModule (upval), UseDispatchResult (copy), LeaveSquadFunction (upval), UseContextResult (copy)
		if UseSelectorResult then
			UseRefResult.current = nil
			
			return
		end
		local Current = UseRefResult.current
		
		if Current == nil or Current.callId ~= UseSignalStateResult then
			UseRefResult1.current = nil
		end
		local ResolveConflictResult, ResolveConflictResult2 = resolveConflict(Current, UseSignalStateResult, UseCurrentSquadIdResult, UseRefResult1.current)
		UseRefResult.current = {
			callId = UseSignalStateResult,
			squadId = UseCurrentSquadIdResult,
			isJoiningSquad = UseSelectorResult1,
			winner = ResolveConflictResult
		}
		
		if ResolveConflictResult2 then
			LoggerModule:info("Call {} is active in squad {}, leaving the squad", UseSignalStateResult, UseCurrentSquadIdResult)
			UseRefResult1.current = UseCurrentSquadIdResult
			UseDispatchResult(LeaveSquadFunction(nil, UseContextResult.setSquadPrompt, nil, UseContextResult.squadLocation, true))
		end
	end, {
		UseSignalStateResult, UseCurrentSquadIdResult, UseSelectorResult,
		UseSelectorResult1, UseDispatchResult, UseContextResult.setSquadPrompt,
		UseContextResult.squadLocation
	})
	
	return nil
end