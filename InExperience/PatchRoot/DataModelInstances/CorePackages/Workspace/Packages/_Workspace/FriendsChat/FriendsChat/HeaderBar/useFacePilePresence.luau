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
local var7 = dataHydrationModule.Presence.PresenceStore.get()

local function _(p0) --[[ line: 33 | named "toUserPresence" ]]
	-- upvalues: presenceType (ref), userPresence (ref)
	return if p0 == presenceType.InGame then userPresence.InExperience elseif p0 == presenceType.InStudio or p0 == presenceType.Online then userPresence.Active else userPresence.None
end

local function aggregateGroupPresence(p1, p2) --[[ line: 50 ]]
	-- upvalues: var7 (ref), presenceType (ref), userPresence (ref)
	local var9 = false
	local var10 = false
	
	for i, v in p1 do
		local var11 = var7.GetPresenceByUserId(tostring(v)).data(p2)
		
		if var11 then
			local userPresenceType = var11.userPresenceType
			
			if userPresenceType == presenceType.InGame or userPresenceType == presenceType.InStudio then
				var9 = true
			elseif userPresenceType == presenceType.Online then
				var10 = true
			end
		end
	end
	return if var9 then userPresence.InExperience elseif var10 then userPresence.Active else userPresence.None
end

return function(p3) --[[ line: 74 | named "useFacePilePresence" ]]
	-- upvalues: fFlagFriendsChatFacePileGroupPresenceModule (ref), reactModule (ref), signalsModule (ref), aggregateGroupPresence (ref), userPresence (ref), var7 (ref), presenceType (ref), signalsReactModule (ref)
	local var12 = p3[1]
	local var13 = fFlagFriendsChatFacePileGroupPresenceModule and #p3 >= 2
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 91 ]]
		-- upvalues: signalsModule (copy), var13 (ref), aggregateGroupPresence (copy), p3 (ref), var12 (ref), userPresence (copy), var7 (copy), presenceType (copy)
		return signalsModule.createComputed(function(p4) --[[ line: 92 ]]
			-- upvalues: var13 (copy), aggregateGroupPresence (copy), p3 (copy), var12 (copy), userPresence (copy), var7 (copy), presenceType (copy)
			if var13 then
				return aggregateGroupPresence(p3, p4)
			elseif var12 == nil then
				return userPresence.None
			end
			local var14 = var7.GetPresenceByUserId(tostring(var12)).data(p4)
			local var15 = if var14 then var14.userPresenceType else nil
			
			return if var15 == presenceType.InGame then userPresence.InExperience elseif var15 == presenceType.InStudio or var15 == presenceType.Online then userPresence.Active else userPresence.None
		end)
	end, {
		if var13 then table.concat(p3, ",") elseif var12 ~= nil then "" else tostring(var12)
	}))
end