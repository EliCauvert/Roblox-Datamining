local playersService = game:GetService("Players")
local parent = script.Parent.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local peopleUtilityModule = require(parent.PeopleUtility)
local buttonVariant = require(parent_1.Foundation).Enums.ButtonVariant
local peopleBlockStatusStoreModule = require(script.Parent.PeopleBlockStatusStore)

return (function() --[[ line: 31 | named "createFriendStatusStore" ]]
	-- upvalues: playersService (ref), signalsModule (ref), peopleUtilityModule (ref), peopleBlockStatusStoreModule (ref), buttonVariant (ref)
	local localPlayer = playersService.LocalPlayer
	local t = {}
	local friendStatusChangedConnection = nil
	
	local function _(p0) --[[ line: 42 | named "getCurrentFriendStatus" ]]
		-- upvalues: localPlayer (ref), playersService (copy)
		if p0 and localPlayer then
			local ok, status = pcall(function() --[[ line: 47 ]]
				-- upvalues: playersService (copy), p0 (ref), localPlayer (copy)
				local var16 = playersService:GetPlayerByUserId(p0)
				
				return if var16 then localPlayer:GetFriendStatus(var16) else Enum.FriendStatus.Unknown
			end)
			
			return if ok then status else Enum.FriendStatus.Unknown
		end
		return Enum.FriendStatus.Unknown
	end
	
	local function getFriendStatusSignal(value) --[[ line: 60 ]]
		-- upvalues: signalsModule (copy), t (write), localPlayer (ref), playersService (copy)
		local unknown
		if not value then
			return signalsModule.createSignal(Enum.FriendStatus.Unknown)
		elseif t[value] then
			return t[value].getter
		elseif value and localPlayer then
			local ok, status = pcall(function() --[[ line: 47 ]]
				-- upvalues: playersService (copy), value (ref), localPlayer (copy)
				local var16 = playersService:GetPlayerByUserId(value)
				
				return if var16 then localPlayer:GetFriendStatus(var16) else Enum.FriendStatus.Unknown
			end)
			unknown = if ok then status else Enum.FriendStatus.Unknown
		else
			unknown = Enum.FriendStatus.Unknown
		end
		local var17, var18 = signalsModule.createSignal(unknown)
		t[value] = { getter = var17, setter = var18 }
		
		return var17
	end
	
	local function onFriendStatusChanged(p1, p2) --[[ line: 86 ]]
		-- upvalues: t (write)
		if t[p1.UserId] then
			t[p1.UserId].setter(p2)
		end
	end
	
	local function getShouldShowFriendButton(p3, p4) --[[ line: 94 ]]
		-- upvalues: signalsModule (copy), peopleUtilityModule (copy), peopleBlockStatusStoreModule (copy)
		return signalsModule.createComputed(function(p5) --[[ line: 95 ]]
			-- upvalues: peopleUtilityModule (copy), p4 (ref), p3 (ref), peopleBlockStatusStoreModule (copy)
			return if peopleUtilityModule.showPersonButtons(p4, p3) and p3 then not peopleBlockStatusStoreModule.getPlayerBlockStatus(p3)(p5) else false
		end)
	end
	
	local function getFriendButtonText(p6, p7) --[[ line: 110 ]]
		-- upvalues: signalsModule (copy), getFriendStatusSignal (ref)
		return if p6 then signalsModule.createComputed(function(p8) --[[ line: 115 ]]
			-- upvalues: getFriendStatusSignal (copy), p6 (ref), p7 (ref)
			local var19 = getFriendStatusSignal(p6)(p8)
			
			return if var19 == Enum.FriendStatus.Friend then p7.isFriend elseif var19 == Enum.FriendStatus.FriendRequestSent then p7.requestSent else p7.addPerson
		end) else signalsModule.createSignal(p7.addPerson)
	end
	
	local function getFriendButtonVariant(p9) --[[ line: 130 ]]
		-- upvalues: signalsModule (copy), buttonVariant (copy), getFriendStatusSignal (ref)
		return if p9 then signalsModule.createComputed(function(p10) --[[ line: 135 ]]
			-- upvalues: getFriendStatusSignal (copy), p9 (ref), buttonVariant (copy)
			local var20 = getFriendStatusSignal(p9)(p10)
			
			return if var20 == Enum.FriendStatus.Friend or var20 == Enum.FriendStatus.FriendRequestSent then buttonVariant.Text else buttonVariant.Subtle
		end) else signalsModule.createSignal(buttonVariant.Subtle)
	end
	
	local function getFriendStatus(p11) --[[ line: 147 ]]
		-- upvalues: signalsModule (copy), getFriendStatusSignal (ref)
		return if p11 then signalsModule.createComputed(function(p12) --[[ line: 152 ]]
			-- upvalues: getFriendStatusSignal (copy), p11 (ref)
			return getFriendStatusSignal(p11)(p12) == Enum.FriendStatus.Friend
		end) else signalsModule.createSignal(false)
	end
	
	local function getIsFriendButtonDisabled(p13) --[[ line: 159 ]]
		-- upvalues: signalsModule (copy), getFriendStatusSignal (ref)
		return if p13 then signalsModule.createComputed(function(p14) --[[ line: 164 ]]
			-- upvalues: getFriendStatusSignal (copy), p13 (ref)
			local var21 = getFriendStatusSignal(p13)(p14)
			
			return if var21 ~= Enum.FriendStatus.Friend then var21 == Enum.FriendStatus.FriendRequestSent else true
		end) else signalsModule.createSignal(false)
	end
	
	local function getIsFriendButtonGrayedOut(p15) --[[ line: 171 ]]
		-- upvalues: signalsModule (copy), getFriendStatusSignal (ref)
		return if p15 then signalsModule.createComputed(function(p16) --[[ line: 176 ]]
			-- upvalues: getFriendStatusSignal (copy), p15 (ref)
			return getFriendStatusSignal(p15)(p16) == Enum.FriendStatus.FriendRequestSent
		end) else signalsModule.createSignal(false)
	end
	
	local function sendFriendRequest(p17) --[[ line: 183 ]]
		-- upvalues: localPlayer (ref)
		if p17 and localPlayer then
			localPlayer:RequestFriendship(p17)
			
			return
		end
	end
	
	local _ = function() --[[ line: 192 | named "initializeFriendStatusListener" ]]
		-- upvalues: localPlayer (ref), friendStatusChangedConnection (write), onFriendStatusChanged (ref)
		if localPlayer then
			friendStatusChangedConnection = localPlayer.FriendStatusChanged:Connect(onFriendStatusChanged)
		end
	end
	
	local function cleanup() --[[ line: 199 ]]
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