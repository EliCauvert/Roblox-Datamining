local parent = script:FindFirstAncestor("FriendsCommon").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local useSignalState = require(parent.SignalsReact).useSignalState
local dataHydrationModule = require(parent.DataHydration)
local presenceType = dataHydrationModule.Presence.PresenceEnums.PresenceType
local usePresenceImpressionEventsModule = require(script.Parent.usePresenceImpressionEvents)
local useFriendsListOrderedByIdPresenceImpressionEventsEnabled = game:DefineFastFlag("UseFriendsListOrderedByIdPresenceImpressionEventsEnabled", false)
local var1 = dataHydrationModule.Friends.FriendsStore.get()

local _ = function(p1)
	-- upvalues: cryoModule (ref), presenceType (ref)
	return cryoModule.List.map(p1, function(p2)
		-- upvalues: presenceType (copy), cryoModule (copy)
		return if p2.presence and p2.presence.userPresenceType == presenceType.InGame and p2.presence.universeId == "" then cryoModule.Dictionary.join(p2, {
			presence = cryoModule.Dictionary.join(p2.presence, { userPresenceType = presenceType.Online })
		}) else p2
	end)
end

local var2 = function(p1, p2)
	-- upvalues: cryoModule (ref)
	local t = {}
	
	for i, v in p1 do
		t[v.id] = v.presence
	end
	local _ = nil
	
	return cryoModule.List.sort(p1, function(p3, p4)
		return p4.sortScore < p3.sortScore
	end), cryoModule.List.filter(p2 or {}, function(p3)
		-- upvalues: t (ref)
		return not t[p3.id]
	end)
end

return function(_)
	-- upvalues: reactModule (ref), var1 (ref), useSignalState (ref), var2 (ref), cryoModule (ref), presenceType (ref), useFriendsListOrderedByIdPresenceImpressionEventsEnabled (ref), usePresenceImpressionEventsModule (ref), dataHydrationModule (ref)
	local var3 = useSignalState(reactModule.useMemo(function()
		-- upvalues: var1 (copy)
		return var1.GetOnlineFriends()
	end, {}))
	local var4 = useSignalState(reactModule.useMemo(function()
		-- upvalues: var1 (copy)
		return var1.GetAllFriends()
	end, {}))
	local var5 = useSignalState(reactModule.useMemo(function()
		-- upvalues: var1 (copy)
		return var1.GetAllFriendsStatus()
	end, {}))
	local var6 = if var4 then var4.friends else nil
	local var7 = if var4 then var4.hasMore else nil
	local var8 = var3 or {}
	local var9 = reactModule.useCallback(function()
		-- upvalues: var7 (ref), var1 (copy)
		if var7 then
			var1.FetchMoreFriends()
			
			return
		end
	end, { var7 })
	
	local var10 = function()
		-- upvalues: var1 (copy)
		var1.RefetchOnlineFriends()
		var1.RefetchAllFriends()
	end
	
	local var11, var12 = reactModule.useMemo(function()
		-- upvalues: var2 (copy), var8 (ref), cryoModule (copy), presenceType (copy), var6 (ref)
		return var2(cryoModule.List.map(var8, function(p3)
			-- upvalues: presenceType (copy), cryoModule (copy)
			return if p3.presence and p3.presence.userPresenceType == presenceType.InGame and p3.presence.universeId == "" then cryoModule.Dictionary.join(p3, {
				presence = cryoModule.Dictionary.join(p3.presence, { userPresenceType = presenceType.Online })
			}) else p3
		end), var6)
	end, { var8, var6 })
	
	if useFriendsListOrderedByIdPresenceImpressionEventsEnabled then
		usePresenceImpressionEventsModule(var8)
	end
	return {
		onlineFriends = var11,
		offlineFriends = var12,
		fetchMoreFriends = var9,
		refreshFriendsData = var10,
		isEndOfList = not var7,
		isLoading = var4 == nil and var5 == dataHydrationModule.DataStatus.NotReady
	}
end