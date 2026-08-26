local friendsChat = script:FindFirstAncestor("FriendsChat")
local parent = friendsChat.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local foundationModule = require(parent.Foundation)
local dataHydrationModule = require(parent.DataHydration)
local fFlagFriendsChatFacePileGroupPresenceModule = require(friendsChat.Flags.FFlagFriendsChatFacePileGroupPresence)
local userPresence = foundationModule.Enums.UserPresence
local presenceType = dataHydrationModule.Presence.PresenceEnums.PresenceType
local var1 = dataHydrationModule.Presence.PresenceStore.get()

local function _(p1)
	-- upvalues: presenceType (ref), userPresence (ref)
	return if p1 == presenceType.InGame then userPresence.InExperience elseif p1 == presenceType.InStudio or p1 == presenceType.Online then userPresence.Active else userPresence.None
end

local function aggregateGroupPresence(p1, p2)
	-- upvalues: var1 (ref), presenceType (ref), userPresence (ref)
	local var2 = false
	local var3 = false
	
	for i, v in p1 do
		local var4 = var1.GetPresenceByUserId(tostring(v)).data(p2)
		
		if var4 then
			local userPresenceType = var4.userPresenceType
			
			if userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio then
				var2 = true
			elseif userPresenceType == presenceType.Online then
				var3 = true
			end
		end
	end
	return if var2 then userPresence.InExperience elseif var3 then userPresence.Active else userPresence.None
end

return function(p3)
	-- upvalues: fFlagFriendsChatFacePileGroupPresenceModule (ref), reactModule (ref), signalsModule (ref), aggregateGroupPresence (ref), userPresence (ref), var1 (ref), presenceType (ref), signalsReactModule (ref)
	local var5 = p3[1]
	local var6 = fFlagFriendsChatFacePileGroupPresenceModule and #p3 >= 2
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var6 (ref), aggregateGroupPresence (copy), p3 (ref), var5 (ref), userPresence (copy), var1 (copy), presenceType (copy)
		return signalsModule.createComputed(function(p4)
			-- upvalues: var6 (copy), aggregateGroupPresence (copy), p3 (copy), var5 (copy), userPresence (copy), var1 (copy), presenceType (copy)
			if var6 then
				return aggregateGroupPresence(p3, p4)
			elseif var5 == nil then
				return userPresence.None
			end
			local var7 = var1.GetPresenceByUserId(tostring(var5)).data(p4)
			local var8 = if var7 then var7.userPresenceType else nil
			
			return if var8 == presenceType.InGame then userPresence.InExperience elseif var8 == presenceType.InStudio or var8 == presenceType.Online then userPresence.Active else userPresence.None
		end)
	end, {
		if var6 then table.concat(p3, ",") elseif var5 ~= nil then "" else tostring(var5)
	}))
end