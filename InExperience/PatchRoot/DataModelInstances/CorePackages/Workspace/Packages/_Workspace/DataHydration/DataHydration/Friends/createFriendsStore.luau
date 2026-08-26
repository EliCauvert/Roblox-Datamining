local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local dataStatus = require(dataHydration.DataHydrationTypes).DataStatus
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local mergeListsWithoutDuplicates = require(dataHydration.DataHydrationUtils).mergeListsWithoutDuplicates
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local sharedFlagsModule = require(parent.SharedFlags)
local localUserIdStore = require(parent.LocalUserIdStore).LocalUserIdStore
local fFlagSduiRequestFriendshipAction = sharedFlagsModule.FFlagSduiRequestFriendshipAction
local fFlagEnableGetFriendshipStatus = sharedFlagsModule.FFlagEnableGetFriendshipStatus
local fFlagFriendsStoreSortOnlineFriendsByRank = sharedFlagsModule.FFlagFriendsStoreSortOnlineFriendsByRank
local fFlagAddFriendsPageTrustedFriendRequestSection = require(parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local fFlagFriendsCountDataHydrationMigrationEnabled = sharedFlagsModule.FFlagFriendsCountDataHydrationMigrationEnabled
local requestsModule = require(dataHydration.Friends.Requests)
local findFriendsSortModule = require(dataHydration.Friends.Enums.FindFriendsSort)
local mapFriendshipStatusToEnumModule = require(dataHydration.Friends.mapFriendshipStatusToEnum)
local presenceStoreModule = require(dataHydration.Presence.PresenceStore)
local normalizePresenceRawDataModule = require(dataHydration.Presence.normalizePresenceRawData)
local presenceTypeModule = require(dataHydration.Presence.Enums.PresenceType)
local _ = require(dataHydration.Presence.createPresenceStore)
game:DefineFastInt("FriendsStoreProcessDelaySec", 1)

local function _()
	return game:GetFastInt("FriendsStoreProcessDelaySec")
end

local onlineFriendsCacheTtlSec = game:DefineFastInt("OnlineFriendsCacheTtlSec", 0)
local isFriendsWithCacheTtlSec = game:DefineFastInt("IsFriendsWithCacheTtlSec", 0)
local allFriendsCacheTtlSec = game:DefineFastInt("AllFriendsCacheTtlSec", 0)
local friendshipStatusCacheTtlSec = game:DefineFastInt("FriendshipStatusCacheTtlSec", 0)
local friendsCountCacheTtlSec = game:DefineFastInt("FriendsCountCacheTtlSec", 0)

local _ = function(p1)
	return if p1 and p1 > 0 then p1 else 1e999
end

local friendsPageSize = game:DefineFastInt("FriendsPageSize", 50)
local initialFriendsPageSize = game:DefineFastInt("InitialFriendsPageSize", 20)

local _ = function(p1)
	return if p1 then tostring(p1) else nil
end

local function normalizeStoredOnlineFriendRow(p1)
	return if p1 and type(p1) == "table" and p1.id ~= nil then {
		id = tostring(p1.id),
		sortScore = tonumber(p1.sortScore) or 0
	} else nil
end

local function normalizePresenceFromOnlineFriendsRow(p1)
	-- upvalues: normalizePresenceRawDataModule (ref)
	if not p1 or type(p1) ~= "table" or p1.id == nil then
		return nil
	end
	local userPresence = p1.userPresence
	
	return if userPresence and type(userPresence) == "table" then normalizePresenceRawDataModule({
		userPresenceType = userPresence.UserPresenceType,
		lastLocation = userPresence.lastLocation,
		lastOnline = userPresence.lastOnline,
		gameId = userPresence.gameInstanceId,
		placeId = userPresence.placeId,
		rootPlaceId = userPresence.rootPlaceId,
		universeId = userPresence.universeId
	}, p1.id) else nil
end

local _ = function(p1)
	return if p1 == nil or p1 == "" then nil else p1
end

local function normalizeFindFriendsPageResponse(p1)
	local t = {}
	
	for i, v in if p1 and p1.PageItems then p1.PageItems else {} do
		local id = v.id
		local var1 = if not id then nil else tostring(id)
		
		if var1 then
			table.insert(t, { id = var1 })
		end
	end
	local var2 = if p1 then p1.NextCursor else nil
	local var3 = if var2 == nil or var2 == "" then nil else var2
	var2 = if p1 and p1.HasMore ~= nil then p1.HasMore else var3 ~= nil
	
	return { friends = t, nextCursor = var3, hasMore = var2 }
end

local function mergeListsWithoutDuplicates_1(p2, p3, p4)
	-- upvalues: cryoModule (ref)
	if p3 and #p3 ~= 0 then
		if p2 and #p2 ~= 0 then
			local var4 = cryoModule.List.toSet(cryoModule.List.map(p2, function(p5)
				-- upvalues: p4 (ref)
				return if p4 then p5[p4] else p5
			end))
			
			return cryoModule.List.join(table.clone(p2), cryoModule.List.filter(p3, function(p5)
				-- upvalues: p4 (ref), var4 (ref)
				return not var4[if p4 then p5[p4] else p5]
			end))
		end
		return p3
	else
		return p2 or {}
	end
end

local function mergeAllFriendsPage(p5, p6, p7)
	-- upvalues: fFlagAddFriendsPageTrustedFriendRequestSection (ref), mergeListsWithoutDuplicates (ref), mergeListsWithoutDuplicates_1 (ref)
	if not p5 then
		return {
			friends = p6.friends,
			nextCursor = p6.nextCursor,
			hasMore = p6.hasMore
		}
	end
	local nextCursor = p5.nextCursor
	local var5 = if nextCursor == nil or nextCursor == "" then nil else nextCursor
	nextCursor = if p7 == nil or p7 == "" then nil else p7
	
	return if var5 == nextCursor then {
		friends = if fFlagAddFriendsPageTrustedFriendRequestSection then mergeListsWithoutDuplicates(p5.friends, p6.friends, "id") else mergeListsWithoutDuplicates_1(p5.friends, p6.friends, "id"),
		nextCursor = p6.nextCursor,
		hasMore = p6.hasMore
	} else p5
end

local _ = function(p5)
	-- upvalues: localUserIdStore (ref), getLocalPlayerUserId (ref)
	local currentUserId = localUserIdStore.getCurrentUserId(p5)
	
	if currentUserId ~= "" then
		return currentUserId
	end
	local var5 = getLocalPlayerUserId()
	
	return if var5 then tostring(var5) else ""
end

return function()
	-- upvalues: presenceStoreModule (ref), createDataCacheModule (ref), onlineFriendsCacheTtlSec (ref), isFriendsWithCacheTtlSec (ref), allFriendsCacheTtlSec (ref), fFlagEnableGetFriendshipStatus (ref), fFlagSduiRequestFriendshipAction (ref), friendshipStatusCacheTtlSec (ref), fFlagFriendsCountDataHydrationMigrationEnabled (ref), friendsCountCacheTtlSec (ref), localUserIdStore (ref), getLocalPlayerUserId (ref), fFlagAddFriendsPageTrustedFriendRequestSection (ref), mergeListsWithoutDuplicates (ref), mergeListsWithoutDuplicates_1 (ref), normalizePresenceRawDataModule (ref), presenceTypeModule (ref), normalizeStoredOnlineFriendRow (ref), normalizePresenceFromOnlineFriendsRow (ref), createDataResolverModule (ref), requestsModule (ref), mapFriendshipStatusToEnumModule (ref), cryoModule (ref), friendsPageSize (ref), initialFriendsPageSize (ref), findFriendsSortModule (ref), normalizeFindFriendsPageResponse (ref), mergeAllFriendsPage (ref), signalsModule (ref), fFlagFriendsStoreSortOnlineFriendsByRank (ref), dataStatus (ref)
	local var5, var6
	local var7 = presenceStoreModule.get()
	local var8 = createDataCacheModule(if onlineFriendsCacheTtlSec and onlineFriendsCacheTtlSec > 0 then onlineFriendsCacheTtlSec else 1e999)
	local var9 = isFriendsWithCacheTtlSec
	local var10 = createDataCacheModule(if var9 and var9 > 0 then var9 else 1e999)
	var9 = if allFriendsCacheTtlSec and allFriendsCacheTtlSec > 0 then allFriendsCacheTtlSec else 1e999
	local var11 = createDataCacheModule(var9)
	var9 = false
	
	if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
		var5 = friendshipStatusCacheTtlSec
		var6 = createDataCacheModule(if var5 and var5 > 0 then var5 else 1e999)
	else
		var6 = nil
	end
	local var12
	if fFlagFriendsCountDataHydrationMigrationEnabled then
		local var13 = friendsCountCacheTtlSec
		var5 = if var13 and var13 > 0 then var13 else 1e999
		var12 = createDataCacheModule(var5)
	else
		var12 = nil
	end
	var5 = {}
	
	local function var39(p5)
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var11 (ref), fFlagAddFriendsPageTrustedFriendRequestSection (copy), mergeListsWithoutDuplicates (copy), mergeListsWithoutDuplicates_1 (copy)
		local var14
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var15 = getLocalPlayerUserId()
			var14 = if var15 then tostring(var15) else ""
		else
			var14 = currentUserId
		end
		local var16 = var11.getItem(var14).data(false)
		
		if var16 then
			local var17 = if fFlagAddFriendsPageTrustedFriendRequestSection then mergeListsWithoutDuplicates(var16.friends, { { id = p5 } }, "id") else mergeListsWithoutDuplicates_1(var16.friends, { { id = p5 } }, "id")
			
			if #var17 == #var16.friends then return end
			var11.replaceItem(var14, {
				friends = var17,
				nextCursor = var16.nextCursor,
				hasMore = var16.hasMore
			})
		end
	end
	
	local function UpdateIsFriendsWith(p5, p6)
		-- upvalues: var10 (ref), var13 (ref), fFlagEnableGetFriendshipStatus (copy), var6 (ref), var7 (ref)
		var10.replaceItem(p5, p6)
		
		if p6 then
			var13(p5)
			
			if fFlagEnableGetFriendshipStatus then
				var6.replaceItem(p5, Enum.FriendStatus.Friend)
			end
		end
		if not p6 then
			var7.UpdateUserPresence(p5, nil, { isUpdatedRealtime = false })
		end
	end
	
	local function _(p5, p6)
		-- upvalues: var7 (ref), var10 (ref), var13 (ref), fFlagEnableGetFriendshipStatus (copy), var6 (ref)
		var7.UpdateUserPresence(p5, p6, { isUpdatedRealtime = true })
		var10.replaceItem(p5, true)
		var13(p5)
		
		if fFlagEnableGetFriendshipStatus then
			var6.replaceItem(p5, Enum.FriendStatus.Friend)
		end
	end
	
	local function updateOfflineFriendDependencies(p5)
		-- upvalues: var7 (ref), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), var10 (ref), var13 (ref), fFlagEnableGetFriendshipStatus (copy), var6 (ref)
		var7.UpdateUserPresence(p5, var7.GetPresenceByUserId(p5, { skipFetch = true }).data(false) or normalizePresenceRawDataModule({ userPresenceType = presenceTypeModule.Offline }), { isUpdatedRealtime = true })
		var10.replaceItem(p5, true)
		var13(p5)
		
		if fFlagEnableGetFriendshipStatus then
			var6.replaceItem(p5, Enum.FriendStatus.Friend)
		end
	end
	
	local function applyGetOnlineFriendsResponseBody(p5)
		-- upvalues: normalizeStoredOnlineFriendRow (copy), normalizePresenceFromOnlineFriendsRow (copy), var7 (ref), var10 (ref), var13 (ref), fFlagEnableGetFriendshipStatus (copy), var6 (ref)
		local t = {}
		
		for i, v in if p5 then p5.data else {} do
			local id = v.id
			local var14 = if not id then nil else tostring(id)
			local var15 = normalizeStoredOnlineFriendRow(v)
			local var16 = normalizePresenceFromOnlineFriendsRow(v)
			
			if var14 then
				t[var14] = var15
				var7.UpdateUserPresence(var14, var16, { isUpdatedRealtime = true })
				var10.replaceItem(var14, true)
				var13(var14)
				
				if fFlagEnableGetFriendshipStatus then
					var6.replaceItem(var14, Enum.FriendStatus.Friend)
				end
			end
		end
		return t
	end
	
	local var17 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var8,
		fetchFn = function(p6, p7)
			-- upvalues: requestsModule (copy), var7 (ref), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), applyGetOnlineFriendsResponseBody (ref)
			local var18 = p7.data(false) or {}
			
			return requestsModule.GetOnlineFriends(p6):andThen(function(p8)
				-- upvalues: var18 (ref), var7 (copy), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), applyGetOnlineFriendsResponseBody (copy)
				for i, v in var18 do
					local id = v and v.id
					local var19 = if not id then nil else tostring(id)
					
					if var19 then
						var7.UpdateUserPresence(var19, normalizePresenceRawDataModule({ userPresenceType = presenceTypeModule.Offline }), { isUpdatedRealtime = true })
					end
				end
				return applyGetOnlineFriendsResponseBody(p8)
			end):catch(function(p9)
				error(p9)
			end)
		end
	})
	
	local _ = function(p8)
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), mapFriendshipStatusToEnumModule (copy)
		local var19
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var20 = getLocalPlayerUserId()
			var19 = if var20 then tostring(var20) else ""
		else
			var19 = currentUserId
		end
		return requestsModule.MultiGetFriendshipStatuses(var19, p8):andThen(function(p9)
			-- upvalues: mapFriendshipStatusToEnumModule (copy)
			local t = {}
			
			for i, v in if p9 then p9.data else {} do
				local id = v.id
				local var21 = if not id then nil else tostring(id)
				
				if var21 then
					t[var21] = mapFriendshipStatusToEnumModule(v.status)
				end
			end
			return t
		end)
	end
	
	local var22 = createDataResolverModule({
		cache = var10,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p10)
			-- upvalues: cryoModule (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), mapFriendshipStatusToEnumModule (copy), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var6 (ref)
			local var23
			local var24 = cryoModule.Dictionary.keys(p10)
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var25 = getLocalPlayerUserId()
				var23 = if var25 then tostring(var25) else ""
			else
				var23 = currentUserId
			end
			return requestsModule.MultiGetFriendshipStatuses(var23, var24):andThen(function(p11)
				-- upvalues: mapFriendshipStatusToEnumModule (copy)
				local t = {}
				
				for i, v in if p11 then p11.data else {} do
					local id = v.id
					local var26 = if not id then nil else tostring(id)
					
					if var26 then
						t[var26] = mapFriendshipStatusToEnumModule(v.status)
					end
				end
				return t
			end):andThen(function(p12)
				-- upvalues: fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var6 (copy)
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var6.replaceItems(p12)
				end
				local t = {}
				
				for i, v in p12 do
					t[i] = v == Enum.FriendStatus.Friend
				end
				return t
			end)
		end
	})
	local var27 = if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then createDataResolverModule({
		cache = var6,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p12)
			-- upvalues: cryoModule (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), mapFriendshipStatusToEnumModule (copy), var10 (ref)
			local var28
			local var29 = cryoModule.Dictionary.keys(p12)
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var30 = getLocalPlayerUserId()
				var28 = if var30 then tostring(var30) else ""
			else
				var28 = currentUserId
			end
			return requestsModule.MultiGetFriendshipStatuses(var28, var29):andThen(function(p13)
				-- upvalues: mapFriendshipStatusToEnumModule (copy)
				local t = {}
				
				for i, v in if p13 then p13.data else {} do
					local id = v.id
					local var31 = if not id then nil else tostring(id)
					
					if var31 then
						t[var31] = mapFriendshipStatusToEnumModule(v.status)
					end
				end
				return t
			end):andThen(function(p14)
				-- upvalues: var10 (copy)
				local t = {}
				
				for i, v in p14 do
					t[i] = v == Enum.FriendStatus.Friend
				end
				var10.replaceItems(t)
				
				return p14
			end)
		end
	}) else nil
	local var32 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var11,
		fetchFn = function(p14, p15)
			-- upvalues: var9 (write), friendsPageSize (copy), initialFriendsPageSize (copy), requestsModule (copy), findFriendsSortModule (copy), normalizeFindFriendsPageResponse (copy), updateOfflineFriendDependencies (ref), mergeAllFriendsPage (copy)
			local var33 = if var9 then nil else p15.data(false)
			var9 = false
			local var34 = if var33 then var33.nextCursor else nil
			
			return requestsModule.GetFindFriendsPage(p14, {
				limit = if var33 then friendsPageSize else initialFriendsPageSize,
				cursor = var34,
				sort = findFriendsSortModule.FriendshipScore
			}):andThen(function(p16)
				-- upvalues: normalizeFindFriendsPageResponse (copy), updateOfflineFriendDependencies (copy), mergeAllFriendsPage (copy), var33 (ref), var34 (ref)
				local var35 = normalizeFindFriendsPageResponse(p16)
				
				for i, v in var35.friends do
					updateOfflineFriendDependencies(v.id)
				end
				return mergeAllFriendsPage(var33, var35, var34)
			end):catch(function(p17)
				error(p17)
			end)
		end
	})
	local var35 = if fFlagFriendsCountDataHydrationMigrationEnabled then createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var12,
		fetchFn = function(p16)
			-- upvalues: requestsModule (copy)
			return requestsModule.GetFriendsCountFromUserId(p16):andThen(function(p17)
				return if p17 then p17.count else 0
			end)
		end
	}) else nil
	local var36 = signalsModule.createComputed(function(p16)
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var17 (ref), var7 (ref), var22 (ref), presenceTypeModule (copy), fFlagFriendsStoreSortOnlineFriendsByRank (copy)
		local var37
		local currentUserId = localUserIdStore.getCurrentUserId(p16)
		
		if currentUserId == "" then
			local var38 = getLocalPlayerUserId()
			var37 = if var38 then tostring(var38) else ""
		else
			var37 = currentUserId
		end
		local var39 = var17.getAndFetchItem(var37).data(p16)
		
		if var39 == nil then
			return nil
		end
		local t = {}
		
		for i, v in pairs(var39) do
			if v then
				local var40 = var7.GetPresenceByUserId(v.id, { skipFetch = true }).data(p16)
				
				if var22.getCachedItem(v.id).data(p16) and var40 and (var40.userPresenceType and var40.userPresenceType ~= presenceTypeModule.Offline) then
					table.insert(t, { id = v.id, sortScore = v.sortScore, presence = var40 })
				end
			end
		end
		if fFlagFriendsStoreSortOnlineFriendsByRank then
			table.sort(t, function(p17, p18)
				return p18.sortScore < p17.sortScore
			end)
		end
		return t
	end)
	
	local function GetOnlineFriends()
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var17 (ref), var36 (ref)
		local var41
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var42 = getLocalPlayerUserId()
			var41 = if var42 then tostring(var42) else ""
		else
			var41 = currentUserId
		end
		var17.getAndFetchItem(var41)
		
		return var36
	end
	
	local var41 = signalsModule.createComputed(function(p17)
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var17 (ref)
		local var42
		local currentUserId = localUserIdStore.getCurrentUserId(p17)
		
		if currentUserId == "" then
			local var43 = getLocalPlayerUserId()
			var42 = if var43 then tostring(var43) else ""
		else
			var42 = currentUserId
		end
		return var17.getCachedItem(var42).status(p17)
	end)
	
	local function GetOnlineFriendsStatus()
		-- upvalues: var41 (ref)
		return var41
	end
	
	local function GetOnlineFriendsByUniverseId(p17)
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var17 (ref), var5 (ref), signalsModule (copy), var36 (ref)
		local var42
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var43 = getLocalPlayerUserId()
			var42 = if var43 then tostring(var43) else ""
		else
			var42 = currentUserId
		end
		var17.getAndFetchItem(var42)
		local var44 = var5[p17]
		
		if var44 then
			return var44
		end
		local var45 = signalsModule.createComputed(function(p18)
			-- upvalues: var36 (copy), p17 (ref)
			local var46 = var36(p18)
			
			if not var46 then
				return {}
			end
			local t = {}
			
			for i, v in var46 do
				if v.presence and v.presence.universeId == p17 then
					table.insert(t, v)
				end
			end
			return t
		end)
		var5[p17] = var45
		
		return var45
	end
	
	local var46 = signalsModule.createComputed(function(p18)
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var32 (ref), cryoModule (copy), var22 (ref)
		local var47
		local currentUserId = localUserIdStore.getCurrentUserId(p18)
		
		if currentUserId == "" then
			local var48 = getLocalPlayerUserId()
			var47 = if var48 then tostring(var48) else ""
		else
			var47 = currentUserId
		end
		local var49 = var32.getAndFetchItem(var47).data(p18)
		
		return if var49 == nil then nil else {
			friends = cryoModule.List.filter(var49.friends or {}, function(p19)
				-- upvalues: var22 (copy), p18 (ref)
				return var22.getCachedItem(p19.id).data(p18)
			end),
			hasMore = var49.hasMore,
			nextCursor = var49.nextCursor
		}
	end)
	local var47 = signalsModule.createComputed(function(p18)
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var32 (ref)
		local var48
		local currentUserId = localUserIdStore.getCurrentUserId(p18)
		
		if currentUserId == "" then
			local var49 = getLocalPlayerUserId()
			var48 = if var49 then tostring(var49) else ""
		else
			var48 = currentUserId
		end
		return var32.getCachedItem(var48).status(p18)
	end)
	
	return {
		GetOnlineFriends = GetOnlineFriends,
		GetOnlineFriendsStatus = GetOnlineFriendsStatus,
		GetOnlineFriendsByUniverseId = GetOnlineFriendsByUniverseId,
		GetAllFriends = function()
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var32 (ref), var46 (ref)
			local var48
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var49 = getLocalPlayerUserId()
				var48 = if var49 then tostring(var49) else ""
			else
				var48 = currentUserId
			end
			var32.getAndFetchItem(var48)
			
			return var46
		end,
		GetAllFriendsStatus = function()
			-- upvalues: var47 (ref)
			return var47
		end,
		FetchMoreFriends = function()
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var32 (ref), dataStatus (copy)
			local var48
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var49 = getLocalPlayerUserId()
				var48 = if var49 then tostring(var49) else ""
			else
				var48 = currentUserId
			end
			local cachedItem = var32.getCachedItem(var48)
			local var50 = cachedItem.data(false)
			
			if var50 == nil or not var50.hasMore or var50.nextCursor == nil then return end
			if cachedItem.status(false) == dataStatus.NotReady then return end
			if var32.isRequestInQueueOrInFlight(var48) then
				return
			end
			var32.fetchItem(var48)
		end,
		RefetchAllFriends = function()
			-- upvalues: var9 (write), var32 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var48
			var9 = true
			local fetchItem = var32.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var49 = getLocalPlayerUserId()
				var48 = if var49 then tostring(var49) else ""
			else
				var48 = currentUserId
			end
			fetchItem(var48)
		end,
		GetIsFriendWith = function(p18)
			-- upvalues: var22 (ref)
			return var22.getAndFetchItem(p18)
		end,
		UpdateIsFriendsWith = UpdateIsFriendsWith,
		GetFriendshipStatus = function(p18, p19)
			-- upvalues: fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var27 (ref)
			return if not (not fFlagEnableGetFriendshipStatus and not fFlagSduiRequestFriendshipAction or p18 == "") then if fFlagEnableGetFriendshipStatus and p19 and p19.skipFetch then var27.getCachedItem(p18) else var27.getAndFetchItem(p18) else nil
		end,
		UpdateFriendshipStatus = function(p18, p19)
			-- upvalues: fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var6 (ref), UpdateIsFriendsWith (ref)
			if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
				var6.replaceItem(p18, p19)
				UpdateIsFriendsWith(p18, p19 == Enum.FriendStatus.Friend)
				
				return
			end
		end,
		RequestFriendship = function(p18, p19, p20)
			-- upvalues: fFlagEnableGetFriendshipStatus (copy), requestsModule (copy), fFlagSduiRequestFriendshipAction (copy), var6 (ref), UpdateIsFriendsWith (ref)
			return (if fFlagEnableGetFriendshipStatus and p20 and p20.isContact then requestsModule.RequestFriendshipFromContactId(p18) else requestsModule.RequestFriendshipFromUserId(p18, p19)):andThen(function()
				-- upvalues: p18 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var6 (copy), UpdateIsFriendsWith (copy)
				local friendRequestSent = Enum.FriendStatus.FriendRequestSent
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var6.replaceItem(p18, friendRequestSent)
					UpdateIsFriendsWith(p18, friendRequestSent == Enum.FriendStatus.Friend)
					
					return
				end
			end):catch(function(p21)
				-- upvalues: p18 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var6 (copy), UpdateIsFriendsWith (copy)
				if (if type(p21) == "table" then p21.firstErrorCode else nil) ~= 5 then
					error(p21)
					
					return
				end
				local var48 = p18
				local friend = Enum.FriendStatus.Friend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var6.replaceItem(var48, friend)
					UpdateIsFriendsWith(var48, friend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		AcceptFriendRequest = function(p18)
			-- upvalues: requestsModule (copy), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var6 (ref), UpdateIsFriendsWith (ref)
			return requestsModule.AcceptFriendRequestFromUserId(p18):andThen(function()
				-- upvalues: p18 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var6 (copy), UpdateIsFriendsWith (copy)
				local friend = Enum.FriendStatus.Friend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var6.replaceItem(p18, friend)
					UpdateIsFriendsWith(p18, friend == Enum.FriendStatus.Friend)
					
					return
				end
			end):catch(function(p19)
				-- upvalues: p18 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var6 (copy), UpdateIsFriendsWith (copy)
				if (if type(p19) == "table" then p19.firstErrorCode else nil) ~= 5 then
					error(p19)
					
					return
				end
				local var48 = p18
				local friend = Enum.FriendStatus.Friend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var6.replaceItem(var48, friend)
					UpdateIsFriendsWith(var48, friend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		DeclineFriendRequest = function(p18)
			-- upvalues: requestsModule (copy), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var6 (ref), UpdateIsFriendsWith (ref)
			return requestsModule.DeclineFriendRequestFromUserId(p18):andThen(function()
				-- upvalues: p18 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var6 (copy), UpdateIsFriendsWith (copy)
				local notFriend = Enum.FriendStatus.NotFriend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var6.replaceItem(p18, notFriend)
					UpdateIsFriendsWith(p18, notFriend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		Unfriend = function(p18)
			-- upvalues: requestsModule (copy), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var6 (ref), UpdateIsFriendsWith (ref)
			return requestsModule.UnfriendTargetUserId(p18):andThen(function()
				-- upvalues: p18 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var6 (copy), UpdateIsFriendsWith (copy)
				local notFriend = Enum.FriendStatus.NotFriend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var6.replaceItem(p18, notFriend)
					UpdateIsFriendsWith(p18, notFriend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		RefetchOnlineFriends = function()
			-- upvalues: var17 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var48
			local fetchItem = var17.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var49 = getLocalPlayerUserId()
				var48 = if var49 then tostring(var49) else ""
			else
				var48 = currentUserId
			end
			fetchItem(var48)
		end,
		GetFriendsCountByUserId = function(p18, p19)
			-- upvalues: fFlagFriendsCountDataHydrationMigrationEnabled (copy), var35 (ref)
			return if fFlagFriendsCountDataHydrationMigrationEnabled then if p19 and p19.skipFetch then var35.getCachedItem(p18) else var35.getAndFetchItem(p18) else nil
		end,
		RefreshFriendsCountByUserId = function(p18)
			-- upvalues: fFlagFriendsCountDataHydrationMigrationEnabled (copy), var35 (ref)
			if fFlagFriendsCountDataHydrationMigrationEnabled then
				var35.fetchItem(p18)
				
				return
			end
		end,
		clear = function()
			-- upvalues: var17 (ref), var22 (ref), var32 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var27 (ref), fFlagFriendsCountDataHydrationMigrationEnabled (copy), var35 (ref), var5 (ref)
			var17.clear()
			var22.clear()
			var32.clear()
			
			if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
				var27.clear()
			end
			if fFlagFriendsCountDataHydrationMigrationEnabled then
				var35.clear()
			end
			table.clear(var5)
		end,
		dispose = function()
			-- upvalues: var17 (ref), var22 (ref), var32 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var27 (ref), fFlagFriendsCountDataHydrationMigrationEnabled (copy), var35 (ref), var5 (ref)
			var17.dispose()
			var22.dispose()
			var32.dispose()
			
			if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
				var27.dispose()
			end
			if fFlagFriendsCountDataHydrationMigrationEnabled then
				var35.dispose()
			end
			table.clear(var5)
		end,
		_fetchOnlineFriendsAsync = function()
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), applyGetOnlineFriendsResponseBody (ref), var8 (ref)
			local var48
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var49 = getLocalPlayerUserId()
				var48 = if var49 then tostring(var49) else ""
			else
				var48 = currentUserId
			end
			return requestsModule.GetOnlineFriends(var48):andThen(function(p18)
				-- upvalues: applyGetOnlineFriendsResponseBody (copy), var8 (copy), var48 (ref)
				var8.replaceItems({ [var48] = applyGetOnlineFriendsResponseBody(p18) })
				
				return p18 or { data = nil }
			end):catch(function(p18)
				error(p18)
			end)
		end,
		_updateFriendsPresences = function(p18, p19, _)
			-- upvalues: normalizeStoredOnlineFriendRow (copy), normalizePresenceRawDataModule (copy), var7 (ref), var10 (ref), var13 (ref), fFlagEnableGetFriendshipStatus (copy), var6 (ref), var8 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			if not p18 then return end
			p19 = p19 or {}
			local t = {}
			
			for i, v in pairs(p18) do
				local userId = v.userId
				local var48 = if not userId then nil else tostring(userId)
				
				if var48 then
					local var49 = normalizePresenceRawDataModule(v)
					t[var48] = normalizeStoredOnlineFriendRow({ id = var48, sortScore = p19[var48] })
					var7.UpdateUserPresence(var48, var49, { isUpdatedRealtime = true })
					var10.replaceItem(var48, true)
					var13(var48)
					
					if fFlagEnableGetFriendshipStatus then
						var6.replaceItem(var48, Enum.FriendStatus.Friend)
					end
				end
			end
			local var50
			local updateItem = var8.updateItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var51 = getLocalPlayerUserId()
				var50 = if var51 then tostring(var51) else ""
			else
				var50 = currentUserId
			end
			updateItem(var50, t)
		end
	}
end