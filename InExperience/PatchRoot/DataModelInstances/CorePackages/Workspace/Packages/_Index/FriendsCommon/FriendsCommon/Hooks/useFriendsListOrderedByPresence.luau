local parent = script:FindFirstAncestor("FriendsCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useSignalState = require(parent.SignalsReact).useSignalState
local dataHydrationModule = require(parent.DataHydration)
local presenceType = dataHydrationModule.Presence.PresenceEnums.PresenceType
local usePresenceImpressionEventsModule = require(script.Parent.usePresenceImpressionEvents)
local useFriendsListOrderedByIdPresenceImpressionEventsEnabled = game:DefineFastFlag("UseFriendsListOrderedByIdPresenceImpressionEventsEnabled", false)
local var5 = dataHydrationModule.Friends.FriendsStore.get()

local _ = function(p0) --[[ line: 30 ]]
	-- upvalues: cryoModule (ref), presenceType (ref)
	return cryoModule.List.map(p0, function(p1) --[[ line: 31 ]]
		-- upvalues: presenceType (copy), cryoModule (copy)
		return if p1.presence and p1.presence.userPresenceType == presenceType.InGame and p1.presence.universeId == "" then cryoModule.Dictionary.join(p1, {
			presence = cryoModule.Dictionary.join(p1.presence, { userPresenceType = presenceType.Online })
		}) else p1
	end)
end

local var6 = function(p2, p3) --[[ line: 44 ]]
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in p2 do
		t[v.id] = v.presence
	end
	local _ = nil
	
	return cryoModule.List.sort(p2, function(p4, p5) --[[ line: 61 ]]
		return p5.sortScore < p4.sortScore
	end), cryoModule.List.filter(p3 or {}, function(p6) --[[ line: 54 ]]
		-- upvalues: t (ref)
		return not t[p6.id]
	end)
end

return function(_) --[[ line: 70 | named "useFriendsListOrderedByPresence" ]]
	-- upvalues: reactModule (ref), var5 (ref), useSignalState (ref), var6 (ref), cryoModule (ref), presenceType (ref), useFriendsListOrderedByIdPresenceImpressionEventsEnabled (ref), usePresenceImpressionEventsModule (ref), dataHydrationModule (ref)
	local var8 = useSignalState(reactModule.useMemo(function() --[[ line: 78 ]]
		-- upvalues: var5 (copy)
		return var5.GetOnlineFriends()
	end, {}))
	local var9 = useSignalState(reactModule.useMemo(function() --[[ line: 84 ]]
		-- upvalues: var5 (copy)
		return var5.GetAllFriends()
	end, {}))
	local var10 = useSignalState(reactModule.useMemo(function() --[[ line: 90 ]]
		-- upvalues: var5 (copy)
		return var5.GetAllFriendsStatus()
	end, {}))
	local var11 = if var9 then var9.friends else nil
	local var12 = if var9 then var9.hasMore else nil
	local var8_1 = var8 or {}
	local var14 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: var12 (ref), var5 (copy)
		if var12 then
			var5.FetchMoreFriends()
			
			return
		end
	end, { var12 })
	
	local var15 = function() --[[ line: 109 ]]
		-- upvalues: var5 (copy)
		var5.RefetchOnlineFriends()
		var5.RefetchAllFriends()
	end
	
	local var16, var17 = reactModule.useMemo(function() --[[ line: 114 ]]
		-- upvalues: var6 (copy), var8_1 (ref), cryoModule (copy), presenceType (copy), var11 (ref)
		return var6(cryoModule.List.map(var8_1, function(p7) --[[ line: 31 ]]
			-- upvalues: presenceType (copy), cryoModule (copy)
			return if p7.presence and p7.presence.userPresenceType == presenceType.InGame and p7.presence.universeId == "" then cryoModule.Dictionary.join(p7, {
				presence = cryoModule.Dictionary.join(p7.presence, { userPresenceType = presenceType.Online })
			}) else p7
		end), var11)
	end, { var8_1, var11 })
	
	if useFriendsListOrderedByIdPresenceImpressionEventsEnabled then
		usePresenceImpressionEventsModule(var8_1)
	end
	return {
		onlineFriends = var16,
		offlineFriends = var17,
		fetchMoreFriends = var14,
		refreshFriendsData = var15,
		isEndOfList = not var12,
		isLoading = var9 == nil and var10 == dataHydrationModule.DataStatus.NotReady
	}
end