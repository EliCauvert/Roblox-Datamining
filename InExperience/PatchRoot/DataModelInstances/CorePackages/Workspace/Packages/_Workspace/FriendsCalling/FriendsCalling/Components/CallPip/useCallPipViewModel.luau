local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local _ = require(FriendsCalling.Components.CallParticipant.CallParticipantCard)
local GetFriendsCallingStoreModule = require(FriendsCalling.Stores.GetFriendsCallingStore)
local LoggerModule = require(FriendsCalling.Logger)
local FriendsCallingParticipantStatus = Enum.FriendsCallingParticipantStatus
local FriendsCallingPhase = Enum.FriendsCallingPhase
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local config = {
	userId = 0,
	name = "",
	statusText = nil,
	isMuted = false,
	isSpeaking = false,
	isDimmed = true,
	showStatusAnimation = false
}

local function _(p1): boolean
	-- upvalues: FriendsCallingParticipantStatus (copy)
	return p1.status == FriendsCallingParticipantStatus.Ringing
end

local _ = function()
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer then LocalPlayer.UserId else 0
end

local _ = function(p1): boolean
	-- upvalues: FriendsCallingPhase (copy), Players (copy)
	local InitiatorUserId = p1.initiatorUserId
	local Flag = false
	
	if p1.phase == FriendsCallingPhase.Ringing then
		Flag = false
		
		if InitiatorUserId ~= 0 then
			local LocalPlayer = Players.LocalPlayer
			Flag = InitiatorUserId ~= (if LocalPlayer then LocalPlayer.UserId else 0)
		end
	end
	return Flag
end

local function getOtherParticipant(p1)
	-- upvalues: Players (copy), FriendsCallingParticipantStatus (copy)
	local LocalPlayer = Players.LocalPlayer
	local UserId = if LocalPlayer then LocalPlayer.UserId else 0
	local v1 = nil
	
	for _, participant in p1.participants do
		if participant.userId ~= UserId then
			v1 = participant
			
			if participant.status == FriendsCallingParticipantStatus.Ringing then break end
		end
	end
	return v1
end

local function toCard(p2)
	-- upvalues: getOtherParticipant (copy), FriendsCallingPhase (copy), config (copy), FriendsCallingParticipantStatus (copy)
	local OtherParticipant = getOtherParticipant(p2)
	
	if OtherParticipant == nil then
		return if p2.phase == FriendsCallingPhase.Ringing then {
			userId = 0,
			name = "",
			statusText = "Ringing",
			isMuted = false,
			isSpeaking = false,
			isDimmed = true,
			showStatusAnimation = true
		} else config
	else
		local IsPhaseMatch = p2.phase == FriendsCallingPhase.Ended
		local IsStatusMatch = OtherParticipant.status == FriendsCallingParticipantStatus.Invited
		local IsPhaseMatch1 = p2.phase == FriendsCallingPhase.Ringing
		
		return {
			userId = OtherParticipant.userId,
			name = tostring(OtherParticipant.userId),
			statusText = if IsPhaseMatch1 then "Ringing" else nil,
			isMuted = OtherParticipant.isLocalMuted,
			isSpeaking = OtherParticipant.isSpeaking,
			isDimmed = IsPhaseMatch1 or (IsPhaseMatch or IsStatusMatch),
			showStatusAnimation = IsPhaseMatch1
		}
	end
end

return function()
	-- upvalues: GetFriendsCallingStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy), FriendsCallingPhase (copy), toCard (copy), config (copy), Players (copy), LoggerModule (copy)
	local FriendsCallingStoreModule = GetFriendsCallingStoreModule(false)
	local UseSignalStateResult = UseSignalStateFunction(FriendsCallingStoreModule.getWindowView)
	local UseSignalStateResult1 = UseSignalStateFunction(FriendsCallingStoreModule.getCall)
	local UseRefResult = ReactModule.useRef(nil)
	local At = nil
	
	if UseSignalStateResult1 and UseSignalStateResult1.phase == FriendsCallingPhase.Active then
		local Current = UseRefResult.current
		local Config = if Current == nil or Current.callId ~= UseSignalStateResult1.callId then { callId = UseSignalStateResult1.callId, at = os.clock() } else Current
		
		if Current ~= Config then
			UseRefResult.current = Config
		end
		At = Config.at
	end
	local Card = if UseSignalStateResult1 then toCard(UseSignalStateResult1) else config
	local HasCall = UseSignalStateResult.hasCall
	
	if HasCall then
		local Flag = false
		
		if UseSignalStateResult1 ~= nil then
			local InitiatorUserId = UseSignalStateResult1.initiatorUserId
			Flag = false
			
			if UseSignalStateResult1.phase == FriendsCallingPhase.Ringing then
				Flag = false
				
				if InitiatorUserId ~= 0 then
					local LocalPlayer = Players.LocalPlayer
					Flag = InitiatorUserId ~= (if LocalPlayer then LocalPlayer.UserId else 0)
				end
			end
		end
		HasCall = not Flag
	end
	local CallId = UseSignalStateResult1 and UseSignalStateResult1.callId or ""
	local Name = if UseSignalStateResult1 then UseSignalStateResult1.phase.Name else ""
	ReactModule.useEffect(function()
		-- upvalues: LoggerModule (upval), HasCall (copy), UseSignalStateResult (copy), CallId (copy), Name (copy), At (ref)
		LoggerModule:debug("{} - pip applied: enabled={}, session={}, callId={}, phase={}, connectedAt={}", script.Name, tostring(HasCall), UseSignalStateResult.session, CallId, Name, (tostring(At)))
	end, {
		CallId,
		At,
		HasCall,
		Name,
		UseSignalStateResult.session
	})
	
	return {
		enabled = HasCall,
		session = UseSignalStateResult.session,
		connectedAt = At,
		callId = if UseSignalStateResult1 then UseSignalStateResult1.callId else nil,
		participant = Card
	}
end