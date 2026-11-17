local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(FriendsCalling.Components.CallParticipant.CallParticipantCard)
local GetFriendsCallingStoreModule = require(FriendsCalling.Stores.GetFriendsCallingStore)
local LoggerModule = require(FriendsCalling.Logger)
local GetLocalUserIdModule = require(FriendsCalling.Utils.getLocalUserId)
local FriendsCallingParticipantStatus = Enum.FriendsCallingParticipantStatus
local FriendsCallingPhase = Enum.FriendsCallingPhase
local UseSignalStateFunction = SignalsReactModule.useSignalState

local function _(p1): boolean
	-- upvalues: FriendsCallingParticipantStatus (copy)
	return p1.status == FriendsCallingParticipantStatus.Ringing
end

local function toCard(p1, Card)
	-- upvalues: FriendsCallingParticipantStatus (copy), FriendsCallingPhase (copy)
	local IsStatusMatch = Card.status == FriendsCallingParticipantStatus.Invited
	local IsPhaseMatch = p1.phase == FriendsCallingPhase.Ringing
	
	return {
		userId = Card.userId,
		name = tostring(Card.userId),
		statusText = if IsPhaseMatch then "Ringing" else nil,
		isMuted = Card.status == FriendsCallingParticipantStatus.Muted,
		isSpeaking = Card.isSpeaking,
		isDimmed = IsPhaseMatch or IsStatusMatch,
		showStatusAnimation = IsPhaseMatch
	}
end

local function toCards(p1)
	-- upvalues: GetLocalUserIdModule (copy), toCard (copy), FriendsCallingParticipantStatus (copy)
	local LocalUserIdModule = GetLocalUserIdModule()
	local List = {}
	local List1 = {}
	
	for _, participant in p1.participants do
		if participant.userId ~= LocalUserIdModule then
			local Card = toCard(p1, participant)
			
			if participant.status == FriendsCallingParticipantStatus.Ringing then
				table.insert(List, Card)
			else
				table.insert(List1, Card)
			end
		end
	end
	for _, value in List1 do
		table.insert(List, value)
	end
	return List
end

local _ = function(p2)
	-- upvalues: GetLocalUserIdModule (copy)
	local LocalUserIdModule = GetLocalUserIdModule()
	
	for _, participant in p2.participants do
		if participant.userId == LocalUserIdModule then
			return participant
		end
	end
	return nil
end

return function(p3)
	-- upvalues: GetFriendsCallingStoreModule (copy), UseSignalStateFunction (copy), FriendsCallingPhase (copy), ReactModule (copy), LoggerModule (copy), toCards (copy), GetLocalUserIdModule (copy)
	local FriendsCallingStoreModule = GetFriendsCallingStoreModule(false)
	local UseSignalStateResult = UseSignalStateFunction(FriendsCallingStoreModule.getIsExpanded)
	local IsPhaseMatch = p3.phase == FriendsCallingPhase.Active
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: IsPhaseMatch (copy)
		return if IsPhaseMatch then os.clock() else nil
	end)
	
	if IsPhaseMatch and UseStateResult == nil then
		UseStateResult2(os.clock())
	end
	local UseStateResult1 = if IsPhaseMatch then UseStateResult else nil
	local CallId = p3.callId
	local Name = p3.phase.Name
	ReactModule.useEffect(function()
		-- upvalues: LoggerModule (upval), CallId (copy), Name (copy), UseStateResult1 (copy)
		LoggerModule:debug("{} - pip applied: callId={}, phase={}, connectedAt={}", script.Name, CallId, Name, (tostring(UseStateResult1)))
	end, { CallId, UseStateResult1, Name })
	local config = {
		isExpanded = UseSignalStateResult,
		onExpand = FriendsCallingStoreModule.expand,
		onCollapse = FriendsCallingStoreModule.collapse,
		connectedAt = UseStateResult1,
		isRinging = p3.phase == FriendsCallingPhase.Ringing,
		participants = toCards(p3)
	}
	local LocalUserIdModule = GetLocalUserIdModule()
	local SelfParticipant = nil
	
	for _, participant in p3.participants do
		if participant.userId == LocalUserIdModule then
			SelfParticipant = participant
			break
		end
	end
	config.selfParticipant = SelfParticipant
	
	return config
end