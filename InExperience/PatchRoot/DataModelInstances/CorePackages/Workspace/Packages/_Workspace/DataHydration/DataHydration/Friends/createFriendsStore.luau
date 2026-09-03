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
local fFlagFriendSortedByPresenceSignalsImplementation = sharedFlagsModule.FFlagFriendSortedByPresenceSignalsImplementation
local fFlagFriendsStoreSortOnlineFriendsByRank = sharedFlagsModule.FFlagFriendsStoreSortOnlineFriendsByRank
local fFlagAddFriendsPageTrustedFriendRequestSection = require(parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local fFlagFriendsCountDataHydrationMigrationEnabled = sharedFlagsModule.FFlagFriendsCountDataHydrationMigrationEnabled or sharedFlagsModule.FFlagFriendsChatHasFriendsGate
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
	-- upvalues: presenceStoreModule (ref), fFlagFriendSortedByPresenceSignalsImplementation (ref), getLocalPlayerUserId (ref), createDataCacheModule (ref), onlineFriendsCacheTtlSec (ref), isFriendsWithCacheTtlSec (ref), allFriendsCacheTtlSec (ref), fFlagEnableGetFriendshipStatus (ref), fFlagSduiRequestFriendshipAction (ref), friendshipStatusCacheTtlSec (ref), fFlagFriendsCountDataHydrationMigrationEnabled (ref), friendsCountCacheTtlSec (ref), localUserIdStore (ref), fFlagAddFriendsPageTrustedFriendRequestSection (ref), mergeListsWithoutDuplicates (ref), mergeListsWithoutDuplicates_1 (ref), normalizePresenceRawDataModule (ref), presenceTypeModule (ref), normalizeStoredOnlineFriendRow (ref), normalizePresenceFromOnlineFriendsRow (ref), createDataResolverModule (ref), requestsModule (ref), mapFriendshipStatusToEnumModule (ref), cryoModule (ref), friendsPageSize (ref), initialFriendsPageSize (ref), findFriendsSortModule (ref), normalizeFindFriendsPageResponse (ref), mergeAllFriendsPage (ref), signalsModule (ref), fFlagFriendsStoreSortOnlineFriendsByRank (ref), dataStatus (ref)
	local var5, var6
	local var7 = presenceStoreModule.get()
	local var8 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else tostring(getLocalPlayerUserId())
	local var9 = createDataCacheModule(if onlineFriendsCacheTtlSec and onlineFriendsCacheTtlSec > 0 then onlineFriendsCacheTtlSec else 1e999)
	local var10 = isFriendsWithCacheTtlSec
	local var11 = createDataCacheModule(if var10 and var10 > 0 then var10 else 1e999)
	var10 = if allFriendsCacheTtlSec and allFriendsCacheTtlSec > 0 then allFriendsCacheTtlSec else 1e999
	local var12 = createDataCacheModule(var10)
	var10 = false
	
	if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
		var5 = friendshipStatusCacheTtlSec
		var6 = createDataCacheModule(if var5 and var5 > 0 then var5 else 1e999)
	else
		var6 = nil
	end
	local var13
	if fFlagFriendsCountDataHydrationMigrationEnabled then
		local var14 = friendsCountCacheTtlSec
		var5 = if var14 and var14 > 0 then var14 else 1e999
		var13 = createDataCacheModule(var5)
	else
		var13 = nil
	end
	var5 = {}
	
	local function var41(p5)
		-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), var8 (ref), var12 (ref), fFlagAddFriendsPageTrustedFriendRequestSection (copy), mergeListsWithoutDuplicates (copy), mergeListsWithoutDuplicates_1 (copy)
		local var15
		if fFlagFriendSortedByPresenceSignalsImplementation then
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var16 = getLocalPlayerUserId()
				var15 = if var16 then tostring(var16) else ""
			else
				var15 = currentUserId
			end
		else
			var15 = var8
		end
		local var17 = var12.getItem(var15).data(false)
		
		if var17 then
			local var18 = if fFlagAddFriendsPageTrustedFriendRequestSection then mergeListsWithoutDuplicates(var17.friends, { { id = p5 } }, "id") else mergeListsWithoutDuplicates_1(var17.friends, { { id = p5 } }, "id")
			
			if #var18 == #var17.friends then return end
			var12.replaceItem(var15, {
				friends = var18,
				nextCursor = var17.nextCursor,
				hasMore = var17.hasMore
			})
		end
	end
	
	local function UpdateIsFriendsWith(p5, p6)
		-- upvalues: var11 (ref), var14 (ref), fFlagEnableGetFriendshipStatus (copy), var6 (ref), var7 (ref)
		var11.replaceItem(p5, p6)
		
		if p6 then
			var14(p5)
			
			if fFlagEnableGetFriendshipStatus then
				var6.replaceItem(p5, Enum.FriendStatus.Friend)
			end
		end
		if not p6 then
			var7.UpdateUserPresence(p5, nil, { isUpdatedRealtime = false })
		end
	end
	
	local function _(p5, p6)
		-- upvalues: var7 (ref), var11 (ref), var14 (ref), fFlagEnableGetFriendshipStatus (copy), var6 (ref)
		var7.UpdateUserPresence(p5, p6, { isUpdatedRealtime = true })
		var11.replaceItem(p5, true)
		var14(p5)
		
		if fFlagEnableGetFriendshipStatus then
			var6.replaceItem(p5, Enum.FriendStatus.Friend)
		end
	end
	
	local function updateOfflineFriendDependencies(p5)
		-- upvalues: var7 (ref), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), var11 (ref), var14 (ref), fFlagEnableGetFriendshipStatus (copy), var6 (ref)
		var7.UpdateUserPresence(p5, var7.GetPresenceByUserId(p5, { skipFetch = true }).data(false) or normalizePresenceRawDataModule({ userPresenceType = presenceTypeModule.Offline }), { isUpdatedRealtime = true })
		var11.replaceItem(p5, true)
		var14(p5)
		
		if fFlagEnableGetFriendshipStatus then
			var6.replaceItem(p5, Enum.FriendStatus.Friend)
		end
	end
	
	local function applyGetOnlineFriendsResponseBody(p5)
		-- upvalues: normalizeStoredOnlineFriendRow (copy), normalizePresenceFromOnlineFriendsRow (copy), var7 (ref), var11 (ref), var14 (ref), fFlagEnableGetFriendshipStatus (copy), var6 (ref)
		local t = {}
		
		for i, v in if p5 then p5.data else {} do
			local id = v.id
			local var15 = if not id then nil else tostring(id)
			local var16 = normalizeStoredOnlineFriendRow(v)
			local var17 = normalizePresenceFromOnlineFriendsRow(v)
			
			if var15 then
				t[var15] = var16
				var7.UpdateUserPresence(var15, var17, { isUpdatedRealtime = true })
				var11.replaceItem(var15, true)
				var14(var15)
				
				if fFlagEnableGetFriendshipStatus then
					var6.replaceItem(var15, Enum.FriendStatus.Friend)
				end
			end
		end
		return t
	end
	
	local var18 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var9,
		fetchFn = function(p6, p7)
			-- upvalues: requestsModule (copy), var7 (ref), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), applyGetOnlineFriendsResponseBody (ref)
			local var19 = p7.data(false) or {}
			
			return requestsModule.GetOnlineFriends(p6):andThen(function(p8)
				-- upvalues: var19 (ref), var7 (copy), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), applyGetOnlineFriendsResponseBody (copy)
				for i, v in var19 do
					local id = v and v.id
					local var20 = if not id then nil else tostring(id)
					
					if var20 then
						var7.UpdateUserPresence(var20, normalizePresenceRawDataModule({ userPresenceType = presenceTypeModule.Offline }), { isUpdatedRealtime = true })
					end
				end
				return applyGetOnlineFriendsResponseBody(p8)
			end):catch(function(p9)
				error(p9)
			end)
		end
	})
	
	local _ = function(p8)
		-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), var8 (ref), requestsModule (copy), mapFriendshipStatusToEnumModule (copy)
		local var20
		if fFlagFriendSortedByPresenceSignalsImplementation then
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var21 = getLocalPlayerUserId()
				var20 = if var21 then tostring(var21) else ""
			else
				var20 = currentUserId
			end
		else
			var20 = var8
		end
		return requestsModule.MultiGetFriendshipStatuses(var20, p8):andThen(function(p9)
			-- upvalues: mapFriendshipStatusToEnumModule (copy)
			local t = {}
			
			for i, v in if p9 then p9.data else {} do
				local id = v.id
				local var22 = if not id then nil else tostring(id)
				
				if var22 then
					t[var22] = mapFriendshipStatusToEnumModule(v.status)
				end
			end
			return t
		end)
	end
	
	local var23 = createDataResolverModule({
		cache = var11,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p10)
			-- upvalues: cryoModule (copy), fFlagFriendSortedByPresenceSignalsImplementation (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), var8 (ref), requestsModule (copy), mapFriendshipStatusToEnumModule (copy), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var6 (ref)
			local var24
			local var25 = cryoModule.Dictionary.keys(p10)
			
			if fFlagFriendSortedByPresenceSignalsImplementation then
				local currentUserId = localUserIdStore.getCurrentUserId(false)
				
				if currentUserId == "" then
					local var26 = getLocalPlayerUserId()
					var24 = if var26 then tostring(var26) else ""
				else
					var24 = currentUserId
				end
			else
				var24 = var8
			end
			return requestsModule.MultiGetFriendshipStatuses(var24, var25):andThen(function(p11)
				-- upvalues: mapFriendshipStatusToEnumModule (copy)
				local t = {}
				
				for i, v in if p11 then p11.data else {} do
					local id = v.id
					local var27 = if not id then nil else tostring(id)
					
					if var27 then
						t[var27] = mapFriendshipStatusToEnumModule(v.status)
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
	local var28 = if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then createDataResolverModule({
		cache = var6,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p12)
			-- upvalues: cryoModule (copy), fFlagFriendSortedByPresenceSignalsImplementation (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), var8 (ref), requestsModule (copy), mapFriendshipStatusToEnumModule (copy), var11 (ref)
			local var29
			local var30 = cryoModule.Dictionary.keys(p12)
			
			if fFlagFriendSortedByPresenceSignalsImplementation then
				local currentUserId = localUserIdStore.getCurrentUserId(false)
				
				if currentUserId == "" then
					local var31 = getLocalPlayerUserId()
					var29 = if var31 then tostring(var31) else ""
				else
					var29 = currentUserId
				end
			else
				var29 = var8
			end
			return requestsModule.MultiGetFriendshipStatuses(var29, var30):andThen(function(p13)
				-- upvalues: mapFriendshipStatusToEnumModule (copy)
				local t = {}
				
				for i, v in if p13 then p13.data else {} do
					local id = v.id
					local var32 = if not id then nil else tostring(id)
					
					if var32 then
						t[var32] = mapFriendshipStatusToEnumModule(v.status)
					end
				end
				return t
			end):andThen(function(p14)
				-- upvalues: var11 (copy)
				local t = {}
				
				for i, v in p14 do
					t[i] = v == Enum.FriendStatus.Friend
				end
				var11.replaceItems(t)
				
				return p14
			end)
		end
	}) else nil
	local var33 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var12,
		fetchFn = function(p14, p15)
			-- upvalues: var10 (write), friendsPageSize (copy), initialFriendsPageSize (copy), requestsModule (copy), findFriendsSortModule (copy), normalizeFindFriendsPageResponse (copy), updateOfflineFriendDependencies (ref), mergeAllFriendsPage (copy)
			local var34 = if var10 then nil else p15.data(false)
			var10 = false
			local var35 = if var34 then var34.nextCursor else nil
			
			return requestsModule.GetFindFriendsPage(p14, {
				limit = if var34 then friendsPageSize else initialFriendsPageSize,
				cursor = var35,
				sort = findFriendsSortModule.FriendshipScore
			}):andThen(function(p16)
				-- upvalues: normalizeFindFriendsPageResponse (copy), updateOfflineFriendDependencies (copy), mergeAllFriendsPage (copy), var34 (ref), var35 (ref)
				local var36 = normalizeFindFriendsPageResponse(p16)
				
				for i, v in var36.friends do
					updateOfflineFriendDependencies(v.id)
				end
				return mergeAllFriendsPage(var34, var36, var35)
			end):catch(function(p17)
				error(p17)
			end)
		end
	})
	local var36 = if fFlagFriendsCountDataHydrationMigrationEnabled then createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var13,
		fetchFn = function(p16)
			-- upvalues: requestsModule (copy)
			return requestsModule.GetFriendsCountFromUserId(p16):andThen(function(p17)
				return if p17 then p17.count else 0
			end)
		end
	}) else nil
	local var37 = signalsModule.createComputed(function(p16)
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var18 (ref), var7 (ref), var23 (ref), presenceTypeModule (copy), fFlagFriendsStoreSortOnlineFriendsByRank (copy)
		local var38
		local currentUserId = localUserIdStore.getCurrentUserId(p16)
		
		if currentUserId == "" then
			local var39 = getLocalPlayerUserId()
			var38 = if var39 then tostring(var39) else ""
		else
			var38 = currentUserId
		end
		local var40 = var18.getAndFetchItem(var38).data(p16)
		
		if var40 == nil then
			return nil
		end
		local t = {}
		
		for i, v in pairs(var40) do
			if v then
				local var41 = var7.GetPresenceByUserId(v.id, { skipFetch = true }).data(p16)
				
				if var23.getCachedItem(v.id).data(p16) and var41 and (var41.userPresenceType and var41.userPresenceType ~= presenceTypeModule.Offline) then
					table.insert(t, { id = v.id, sortScore = v.sortScore, presence = var41 })
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
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var18 (ref), var37 (ref)
		local var42
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var43 = getLocalPlayerUserId()
			var42 = if var43 then tostring(var43) else ""
		else
			var42 = currentUserId
		end
		var18.getAndFetchItem(var42)
		
		return var37
	end
	
	local var42 = signalsModule.createComputed(function(p17)
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var18 (ref)
		local var43
		local currentUserId = localUserIdStore.getCurrentUserId(p17)
		
		if currentUserId == "" then
			local var44 = getLocalPlayerUserId()
			var43 = if var44 then tostring(var44) else ""
		else
			var43 = currentUserId
		end
		return var18.getCachedItem(var43).status(p17)
	end)
	
	local function GetOnlineFriendsStatus()
		-- upvalues: var42 (ref)
		return var42
	end
	
	local function GetOnlineFriendsByUniverseId(p17)
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var18 (ref), var5 (ref), signalsModule (copy), var37 (ref)
		local var43
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var44 = getLocalPlayerUserId()
			var43 = if var44 then tostring(var44) else ""
		else
			var43 = currentUserId
		end
		var18.getAndFetchItem(var43)
		local var45 = var5[p17]
		
		if var45 then
			return var45
		end
		local var46 = signalsModule.createComputed(function(p18)
			-- upvalues: var37 (copy), p17 (ref)
			local var47 = var37(p18)
			
			if not var47 then
				return {}
			end
			local t = {}
			
			for i, v in var47 do
				if v.presence and v.presence.universeId == p17 then
					table.insert(t, v)
				end
			end
			return t
		end)
		var5[p17] = var46
		
		return var46
	end
	
	local var47 = signalsModule.createComputed(function(p18)
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var33 (ref), cryoModule (copy), var23 (ref)
		local var48
		local currentUserId = localUserIdStore.getCurrentUserId(p18)
		
		if currentUserId == "" then
			local var49 = getLocalPlayerUserId()
			var48 = if var49 then tostring(var49) else ""
		else
			var48 = currentUserId
		end
		local var50 = var33.getAndFetchItem(var48).data(p18)
		
		return if var50 == nil then nil else {
			friends = cryoModule.List.filter(var50.friends or {}, function(p19)
				-- upvalues: var23 (copy), p18 (ref)
				return var23.getCachedItem(p19.id).data(p18)
			end),
			hasMore = var50.hasMore,
			nextCursor = var50.nextCursor
		}
	end)
	local var48 = signalsModule.createComputed(function(p18)
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var33 (ref)
		local var49
		local currentUserId = localUserIdStore.getCurrentUserId(p18)
		
		if currentUserId == "" then
			local var50 = getLocalPlayerUserId()
			var49 = if var50 then tostring(var50) else ""
		else
			var49 = currentUserId
		end
		return var33.getCachedItem(var49).status(p18)
	end)
	
	return {
		GetOnlineFriends = GetOnlineFriends,
		GetOnlineFriendsStatus = GetOnlineFriendsStatus,
		GetOnlineFriendsByUniverseId = GetOnlineFriendsByUniverseId,
		GetAllFriends = function()
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var33 (ref), var47 (ref)
			local var49
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var50 = getLocalPlayerUserId()
				var49 = if var50 then tostring(var50) else ""
			else
				var49 = currentUserId
			end
			var33.getAndFetchItem(var49)
			
			return var47
		end,
		GetAllFriendsStatus = function()
			-- upvalues: var48 (ref)
			return var48
		end,
		FetchMoreFriends = function()
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var33 (ref), dataStatus (copy)
			local var49
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var50 = getLocalPlayerUserId()
				var49 = if var50 then tostring(var50) else ""
			else
				var49 = currentUserId
			end
			local cachedItem = var33.getCachedItem(var49)
			local var51 = cachedItem.data(false)
			
			if var51 == nil or not var51.hasMore or var51.nextCursor == nil then return end
			if cachedItem.status(false) == dataStatus.NotReady then return end
			if var33.isRequestInQueueOrInFlight(var49) then
				return
			end
			var33.fetchItem(var49)
		end,
		RefetchAllFriends = function()
			-- upvalues: var10 (write), var33 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var49
			var10 = true
			local fetchItem = var33.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var50 = getLocalPlayerUserId()
				var49 = if var50 then tostring(var50) else ""
			else
				var49 = currentUserId
			end
			fetchItem(var49)
		end,
		GetIsFriendWith = function(p18)
			-- upvalues: var23 (ref)
			return var23.getAndFetchItem(p18)
		end,
		UpdateIsFriendsWith = UpdateIsFriendsWith,
		GetFriendshipStatus = function(p18, p19)
			-- upvalues: fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var28 (ref)
			return if not (not fFlagEnableGetFriendshipStatus and not fFlagSduiRequestFriendshipAction or p18 == "") then if fFlagEnableGetFriendshipStatus and p19 and p19.skipFetch then var28.getCachedItem(p18) else var28.getAndFetchItem(p18) else nil
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
				local var49 = p18
				local friend = Enum.FriendStatus.Friend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var6.replaceItem(var49, friend)
					UpdateIsFriendsWith(var49, friend == Enum.FriendStatus.Friend)
					
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
				local var49 = p18
				local friend = Enum.FriendStatus.Friend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var6.replaceItem(var49, friend)
					UpdateIsFriendsWith(var49, friend == Enum.FriendStatus.Friend)
					
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
			-- upvalues: var18 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var49
			local fetchItem = var18.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var50 = getLocalPlayerUserId()
				var49 = if var50 then tostring(var50) else ""
			else
				var49 = currentUserId
			end
			fetchItem(var49)
		end,
		GetFriendsCountByUserId = function(p18, p19)
			-- upvalues: fFlagFriendsCountDataHydrationMigrationEnabled (copy), var36 (ref)
			return if fFlagFriendsCountDataHydrationMigrationEnabled then if p19 and p19.skipFetch then var36.getCachedItem(p18) else var36.getAndFetchItem(p18) else nil
		end,
		RefreshFriendsCountByUserId = function(p18)
			-- upvalues: fFlagFriendsCountDataHydrationMigrationEnabled (copy), var36 (ref)
			if fFlagFriendsCountDataHydrationMigrationEnabled then
				var36.fetchItem(p18)
				
				return
			end
		end,
		clear = function()
			-- upvalues: var18 (ref), var23 (ref), var33 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var28 (ref), fFlagFriendsCountDataHydrationMigrationEnabled (copy), var36 (ref), var5 (ref)
			var18.clear()
			var23.clear()
			var33.clear()
			
			if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
				var28.clear()
			end
			if fFlagFriendsCountDataHydrationMigrationEnabled then
				var36.clear()
			end
			table.clear(var5)
		end,
		dispose = function()
			-- upvalues: var18 (ref), var23 (ref), var33 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var28 (ref), fFlagFriendsCountDataHydrationMigrationEnabled (copy), var36 (ref), var5 (ref)
			var18.dispose()
			var23.dispose()
			var33.dispose()
			
			if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
				var28.dispose()
			end
			if fFlagFriendsCountDataHydrationMigrationEnabled then
				var36.dispose()
			end
			table.clear(var5)
		end,
		_fetchOnlineFriendsAsync = function()
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), applyGetOnlineFriendsResponseBody (ref), var9 (ref)
			local var49
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var50 = getLocalPlayerUserId()
				var49 = if var50 then tostring(var50) else ""
			else
				var49 = currentUserId
			end
			return requestsModule.GetOnlineFriends(var49):andThen(function(p18)
				-- upvalues: applyGetOnlineFriendsResponseBody (copy), var9 (copy), var49 (ref)
				var9.replaceItems({ [var49] = applyGetOnlineFriendsResponseBody(p18) })
				
				return p18 or { data = nil }
			end):catch(function(p18)
				error(p18)
			end)
		end,
		_updateFriendsPresences = function(p18, p19, _)
			-- upvalues: normalizeStoredOnlineFriendRow (copy), normalizePresenceRawDataModule (copy), var7 (ref), var11 (ref), var14 (ref), fFlagEnableGetFriendshipStatus (copy), var6 (ref), var9 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			if not p18 then return end
			p19 = p19 or {}
			local t = {}
			
			for i, v in pairs(p18) do
				local userId = v.userId
				local var49 = if not userId then nil else tostring(userId)
				
				if var49 then
					local var50 = normalizePresenceRawDataModule(v)
					t[var49] = normalizeStoredOnlineFriendRow({ id = var49, sortScore = p19[var49] })
					var7.UpdateUserPresence(var49, var50, { isUpdatedRealtime = true })
					var11.replaceItem(var49, true)
					var14(var49)
					
					if fFlagEnableGetFriendshipStatus then
						var6.replaceItem(var49, Enum.FriendStatus.Friend)
					end
				end
			end
			local var51
			local updateItem = var9.updateItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var52 = getLocalPlayerUserId()
				var51 = if var52 then tostring(var52) else ""
			else
				var51 = currentUserId
			end
			updateItem(var51, t)
		end
	}
end