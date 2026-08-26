local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local peopleUtilityModule = require(parent.PeopleUtility)
local buttonVariant = require(parent_1.Foundation).Enums.ButtonVariant
local peopleBlockStatusStoreModule = require(script.Parent.PeopleBlockStatusStore)

return (function()
	-- upvalues: playersService (ref), signalsModule (ref), peopleUtilityModule (ref), peopleBlockStatusStoreModule (ref), buttonVariant (ref)
	local localPlayer = playersService.LocalPlayer
	local t = {}
	local friendStatusChangedConnection = nil
	
	local function _(p1)
		-- upvalues: localPlayer (ref), playersService (copy)
		if p1 and localPlayer then
			local ok, status = pcall(function()
				-- upvalues: playersService (copy), p1 (ref), localPlayer (copy)
				local var1 = playersService:GetPlayerByUserId(p1)
				
				return if var1 then localPlayer:GetFriendStatus(var1) else Enum.FriendStatus.Unknown
			end)
			
			return if ok then status else Enum.FriendStatus.Unknown
		end
		return Enum.FriendStatus.Unknown
	end
	
	local function getFriendStatusSignal(value)
		-- upvalues: signalsModule (copy), t (write), localPlayer (ref), playersService (copy)
		local unknown
		if not value then
			return signalsModule.createSignal(Enum.FriendStatus.Unknown)
		elseif t[value] then
			return t[value].getter
		elseif value and localPlayer then
			local ok, status = pcall(function()
				-- upvalues: playersService (copy), value (ref), localPlayer (copy)
				local var1 = playersService:GetPlayerByUserId(value)
				
				return if var1 then localPlayer:GetFriendStatus(var1) else Enum.FriendStatus.Unknown
			end)
			unknown = if ok then status else Enum.FriendStatus.Unknown
		else
			unknown = Enum.FriendStatus.Unknown
		end
		local var1, var2 = signalsModule.createSignal(unknown)
		t[value] = { getter = var1, setter = var2 }
		
		return var1
	end
	
	local function onFriendStatusChanged(p1, p2)
		-- upvalues: t (write)
		if t[p1.UserId] then
			t[p1.UserId].setter(p2)
		end
	end
	
	local function getShouldShowFriendButton(p1, p2)
		-- upvalues: signalsModule (copy), peopleUtilityModule (copy), peopleBlockStatusStoreModule (copy)
		return signalsModule.createComputed(function(p3)
			-- upvalues: peopleUtilityModule (copy), p2 (ref), p1 (ref), peopleBlockStatusStoreModule (copy)
			return if peopleUtilityModule.showPersonButtons(p2, p1) and p1 then not peopleBlockStatusStoreModule.getPlayerBlockStatus(p1)(p3) else false
		end)
	end
	
	local function getFriendButtonText(p1, p2)
		-- upvalues: signalsModule (copy), getFriendStatusSignal (ref)
		return if p1 then signalsModule.createComputed(function(p3)
			-- upvalues: getFriendStatusSignal (copy), p1 (ref), p2 (ref)
			local var1 = getFriendStatusSignal(p1)(p3)
			
			return if var1 == Enum.FriendStatus.Friend then p2.isFriend elseif var1 == Enum.FriendStatus.FriendRequestSent then p2.requestSent else p2.addPerson
		end) else signalsModule.createSignal(p2.addPerson)
	end
	
	local function getFriendButtonVariant(p1)
		-- upvalues: signalsModule (copy), buttonVariant (copy), getFriendStatusSignal (ref)
		return if p1 then signalsModule.createComputed(function(p2)
			-- upvalues: getFriendStatusSignal (copy), p1 (ref), buttonVariant (copy)
			local var1 = getFriendStatusSignal(p1)(p2)
			
			return if var1 == Enum.FriendStatus.Friend or var1 == Enum.FriendStatus.FriendRequestSent then buttonVariant.Text else buttonVariant.Subtle
		end) else signalsModule.createSignal(buttonVariant.Subtle)
	end
	
	local function getFriendStatus(p1)
		-- upvalues: signalsModule (copy), getFriendStatusSignal (ref)
		return if p1 then signalsModule.createComputed(function(p2)
			-- upvalues: getFriendStatusSignal (copy), p1 (ref)
			return getFriendStatusSignal(p1)(p2) == Enum.FriendStatus.Friend
		end) else signalsModule.createSignal(false)
	end
	
	local function getIsFriendButtonDisabled(p1)
		-- upvalues: signalsModule (copy), getFriendStatusSignal (ref)
		return if p1 then signalsModule.createComputed(function(p2)
			-- upvalues: getFriendStatusSignal (copy), p1 (ref)
			local var1 = getFriendStatusSignal(p1)(p2)
			
			return if var1 ~= Enum.FriendStatus.Friend then var1 == Enum.FriendStatus.FriendRequestSent else true
		end) else signalsModule.createSignal(false)
	end
	
	local function getIsFriendButtonGrayedOut(p1)
		-- upvalues: signalsModule (copy), getFriendStatusSignal (ref)
		return if p1 then signalsModule.createComputed(function(p2)
			-- upvalues: getFriendStatusSignal (copy), p1 (ref)
			return getFriendStatusSignal(p1)(p2) == Enum.FriendStatus.FriendRequestSent
		end) else signalsModule.createSignal(false)
	end
	
	local function sendFriendRequest(p1)
		-- upvalues: localPlayer (ref)
		if p1 and localPlayer then
			localPlayer:RequestFriendship(p1)
			
			return
		end
	end
	
	local _ = function()
		-- upvalues: localPlayer (ref), friendStatusChangedConnection (write), onFriendStatusChanged (ref)
		if localPlayer then
			friendStatusChangedConnection = localPlayer.FriendStatusChanged:Connect(onFriendStatusChanged)
		end
	end
	
	local function cleanup()
		-- upvalues: friendStatusChangedConnection (write), t (write)
		if friendStatusChangedConnection then
			friendStatusChangedConnection:Disconnect()
			friendStatusChangedConnection = nil
		end
		t = {}
	end
	
	if localPlayer then
		friendStatusChangedConnection = localPlayer.FriendStatusChanged:Connect(onFriendStatusChanged)
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
end)()