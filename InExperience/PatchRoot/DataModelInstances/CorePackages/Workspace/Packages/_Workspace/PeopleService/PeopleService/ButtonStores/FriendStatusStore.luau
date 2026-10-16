local Players = game:GetService("Players")
local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local PeopleUtilityModule = require(Parent.PeopleUtility)
local ButtonVariant = require(Parent1.Foundation).Enums.ButtonVariant
local PeopleBlockStatusStoreModule = require(script.Parent.PeopleBlockStatusStore)

return ((function() --[[ Line: 31 | Named "createFriendStatusStore" ]]
	-- upvalues: Players (copy), SignalsModule (copy), PeopleUtilityModule (copy), PeopleBlockStatusStoreModule (copy), ButtonVariant (copy)
	local LocalPlayer = Players.LocalPlayer
	local t = {}
	local FriendStatusChangedConnection = nil
	
	local function _(UserId) --[[ Line: 42 | Named "getCurrentFriendStatus" ]]
		-- upvalues: LocalPlayer (copy), Players (upval)
		if UserId and LocalPlayer then
			local Success, Result = pcall(function() --[[ Line: 47 ]]
				-- upvalues: Players (upval), UserId (copy), LocalPlayer (upval)
				local Player = Players:GetPlayerByUserId(UserId)
				
				return if Player then LocalPlayer:GetFriendStatus(Player) else Enum.FriendStatus.Unknown
			end)
			
			return Success and Result or Enum.FriendStatus.Unknown
		else
			return Enum.FriendStatus.Unknown
		end
	end
	
	local function getFriendStatusSignal(UserId) --[[ Line: 60 ]]
		-- upvalues: SignalsModule (upval), t (ref), LocalPlayer (copy), Players (upval)
		if not UserId then
			return SignalsModule.createSignal(Enum.FriendStatus.Unknown)
		end
		if t[UserId] then
			return t[UserId].getter
		end
		local Unknown = nil
		if UserId and LocalPlayer then
			local Success, Result = pcall(function() --[[ Line: 47 ]]
				-- upvalues: Players (upval), UserId (copy), LocalPlayer (upval)
				local Player = Players:GetPlayerByUserId(UserId)
				
				return if Player then LocalPlayer:GetFriendStatus(Player) else Enum.FriendStatus.Unknown
			end)
			Unknown = Success and Result or Enum.FriendStatus.Unknown
		else
			Unknown = Enum.FriendStatus.Unknown
		end
		local Signal, Signal2 = SignalsModule.createSignal(Unknown)
		t[UserId] = { getter = Signal, setter = Signal2 }
		
		return Signal
	end
	
	local function onFriendStatusChanged(Player: Player, FriendStatus) --[[ Line: 86 ]]
		-- upvalues: t (ref)
		if t[Player.UserId] then
			t[Player.UserId].setter(FriendStatus)
		end
	end
	
	local function getShouldShowFriendButton(p1, p2) --[[ Line: 94 ]]
		-- upvalues: SignalsModule (upval), PeopleUtilityModule (upval), PeopleBlockStatusStoreModule (upval)
		return SignalsModule.createComputed(function(p3): boolean --[[ Line: 95 ]]
			-- upvalues: PeopleUtilityModule (upval), p2 (copy), p1 (copy), PeopleBlockStatusStoreModule (upval)
			return if PeopleUtilityModule.showPersonButtons(p2, p1) and p1 then not PeopleBlockStatusStoreModule.getPlayerBlockStatus(p1)(p3) else false
		end)
	end
	
	local function getFriendButtonText(UserId, p1) --[[ Line: 110 ]]
		-- upvalues: SignalsModule (upval), getFriendStatusSignal (copy)
		return if UserId then SignalsModule.createComputed(function(p2) --[[ Line: 115 ]]
			-- upvalues: getFriendStatusSignal (upval), UserId (copy), p1 (copy)
			local FriendStatus = getFriendStatusSignal(UserId)(p2)
			
			return if FriendStatus == Enum.FriendStatus.Friend then p1.isFriend elseif FriendStatus == Enum.FriendStatus.FriendRequestSent then p1.requestSent else p1.addPerson
		end) else SignalsModule.createSignal(p1.addPerson)
	end
	
	local function getFriendButtonVariant(UserId) --[[ Line: 130 ]]
		-- upvalues: SignalsModule (upval), ButtonVariant (upval), getFriendStatusSignal (copy)
		return if UserId then SignalsModule.createComputed(function(p1) --[[ Line: 135 ]]
			-- upvalues: getFriendStatusSignal (upval), UserId (copy), ButtonVariant (upval)
			local FriendStatus = getFriendStatusSignal(UserId)(p1)
			
			return if FriendStatus == Enum.FriendStatus.Friend or FriendStatus == Enum.FriendStatus.FriendRequestSent then ButtonVariant.Text else ButtonVariant.Subtle
		end) else SignalsModule.createSignal(ButtonVariant.Subtle)
	end
	
	local function getFriendStatus(UserId) --[[ Line: 147 ]]
		-- upvalues: SignalsModule (upval), getFriendStatusSignal (copy)
		return if UserId then SignalsModule.createComputed(function(p1): boolean --[[ Line: 152 ]]
			-- upvalues: getFriendStatusSignal (upval), UserId (copy)
			return getFriendStatusSignal(UserId)(p1) == Enum.FriendStatus.Friend
		end) else SignalsModule.createSignal(false)
	end
	
	local function getIsFriendButtonDisabled(UserId) --[[ Line: 159 ]]
		-- upvalues: SignalsModule (upval), getFriendStatusSignal (copy)
		return if UserId then SignalsModule.createComputed(function(p1): boolean --[[ Line: 164 ]]
			-- upvalues: getFriendStatusSignal (upval), UserId (copy)
			local FriendStatus = getFriendStatusSignal(UserId)(p1)
			
			return FriendStatus == Enum.FriendStatus.Friend or FriendStatus == Enum.FriendStatus.FriendRequestSent
		end) else SignalsModule.createSignal(false)
	end
	
	local function getIsFriendButtonGrayedOut(UserId) --[[ Line: 171 ]]
		-- upvalues: SignalsModule (upval), getFriendStatusSignal (copy)
		return if UserId then SignalsModule.createComputed(function(p1): boolean --[[ Line: 176 ]]
			-- upvalues: getFriendStatusSignal (upval), UserId (copy)
			return getFriendStatusSignal(UserId)(p1) == Enum.FriendStatus.FriendRequestSent
		end) else SignalsModule.createSignal(false)
	end
	
	local function sendFriendRequest(Player) --[[ Line: 183 ]]
		-- upvalues: LocalPlayer (copy)
		if Player and LocalPlayer then
			LocalPlayer:RequestFriendship(Player)
			
			return
		end
	end
	
	local _ = function() --[[ Line: 192 | Named "initializeFriendStatusListener" ]]
		-- upvalues: LocalPlayer (copy), FriendStatusChangedConnection (ref), onFriendStatusChanged (copy)
		if LocalPlayer then
			FriendStatusChangedConnection = LocalPlayer.FriendStatusChanged:Connect(onFriendStatusChanged)
		end
	end
	
	local function cleanup() --[[ Line: 199 ]]
		-- upvalues: FriendStatusChangedConnection (ref), t (ref)
		if FriendStatusChangedConnection then
			FriendStatusChangedConnection:Disconnect()
			FriendStatusChangedConnection = nil
		end
		t = {}
	end
	
	if LocalPlayer then
		FriendStatusChangedConnection = LocalPlayer.FriendStatusChanged:Connect(onFriendStatusChanged)
	end
	return {
		getShouldShowFriendButton = getShouldShowFriendButton,
		getFriendButtonText = getFriendButtonText,
		getFriendButtonVariant = getFriendButtonVariant,
		getFriendStatus = getFriendStatus,
		getIsFriendButtonDisabled = getIsFriendButtonDisabled,
		getIsFriendButtonGrayedOut = getIsFriendButtonGrayedOut,
		sendFriendRequest = sendFriendRequest,
		cleanup = cleanup
	}
end)())