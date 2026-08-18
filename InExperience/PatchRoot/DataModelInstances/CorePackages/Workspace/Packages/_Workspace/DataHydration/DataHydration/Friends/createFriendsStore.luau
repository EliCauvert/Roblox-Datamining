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

local function _() --[[ line: 123 | named "getFIntFriendsStoreProcessDelaySec" ]]
	return game:GetFastInt("FriendsStoreProcessDelaySec")
end

local onlineFriendsCacheTtlSec = game:DefineFastInt("OnlineFriendsCacheTtlSec", 0)
local isFriendsWithCacheTtlSec = game:DefineFastInt("IsFriendsWithCacheTtlSec", 0)
local allFriendsCacheTtlSec = game:DefineFastInt("AllFriendsCacheTtlSec", 0)
local friendshipStatusCacheTtlSec = game:DefineFastInt("FriendshipStatusCacheTtlSec", 0)
local friendsCountCacheTtlSec = game:DefineFastInt("FriendsCountCacheTtlSec", 0)

local _ = function(p0) --[[ line: 133 | named "getCacheTTL" ]]
	return if p0 and p0 > 0 then p0 else 1e999
end

local friendsPageSize = game:DefineFastInt("FriendsPageSize", 50)
local initialFriendsPageSize = game:DefineFastInt("InitialFriendsPageSize", 20)

local _ = function(p1) --[[ line: 140 | named "normalizeId" ]]
	return if p1 then tostring(p1) else nil
end

local function normalizeStoredOnlineFriendRow(p2) --[[ line: 148 ]]
	return if p2 and type(p2) == "table" and p2.id ~= nil then {
		id = tostring(p2.id),
		sortScore = tonumber(p2.sortScore) or 0
	} else nil
end

local function normalizePresenceFromOnlineFriendsRow(p3) --[[ line: 160 ]]
	-- upvalues: normalizePresenceRawDataModule (ref)
	if not p3 or type(p3) ~= "table" or p3.id == nil then
		return nil
	end
	local userPresence = p3.userPresence
	
	return if userPresence and type(userPresence) == "table" then normalizePresenceRawDataModule({
		userPresenceType = userPresence.UserPresenceType,
		lastLocation = userPresence.lastLocation,
		lastOnline = userPresence.lastOnline,
		gameId = userPresence.gameInstanceId,
		placeId = userPresence.placeId,
		rootPlaceId = userPresence.rootPlaceId,
		universeId = userPresence.universeId
	}, p3.id) else nil
end

local _ = function(p4) --[[ line: 182 | named "normalizeFindFriendsNextCursor" ]]
	return if p4 == nil or p4 == "" then nil else p4
end

local function normalizeFindFriendsPageResponse(p5) --[[ line: 189 ]]
	local t = {}
	
	for i, v in if p5 and p5.PageItems then p5.PageItems else {} do
		local id = v.id
		local var27 = if not id then nil else tostring(id)
		
		if var27 then
			table.insert(t, { id = var27 })
		end
	end
	local var25 = if p5 then p5.NextCursor else nil
	local var26 = if var25 == nil or var25 == "" then nil else var25
	var25 = if p5 and p5.HasMore ~= nil then p5.HasMore else var26 ~= nil
	
	return { friends = t, nextCursor = var26, hasMore = var25 }
end

local function mergeListsWithoutDuplicates_1(p6, p7, p8) --[[ line: 212 | named "mergeListsWithoutDuplicates" ]]
	-- upvalues: cryoModule (ref)
	if p7 and #p7 ~= 0 then
		if p6 and #p6 ~= 0 then
			local var28 = cryoModule.List.toSet(cryoModule.List.map(p6, function(p9) --[[ line: 220 ]]
				-- upvalues: p8 (ref)
				return if p8 then p9[p8] else p9
			end))
			
			return cryoModule.List.join(table.clone(p6), cryoModule.List.filter(p7, function(p10) --[[ line: 225 ]]
				-- upvalues: p8 (ref), var28 (ref)
				return not var28[if p8 then p10[p8] else p10]
			end))
		end
		return p7
	else
		return p6 or {}
	end
end

local function mergeAllFriendsPage(p11, p12, p13) --[[ line: 233 ]]
	-- upvalues: fFlagAddFriendsPageTrustedFriendRequestSection (ref), mergeListsWithoutDuplicates (ref), mergeListsWithoutDuplicates_1 (ref)
	if not p11 then
		return {
			friends = p12.friends,
			nextCursor = p12.nextCursor,
			hasMore = p12.hasMore
		}
	end
	local nextCursor = p11.nextCursor
	local var29 = if nextCursor == nil or nextCursor == "" then nil else nextCursor
	nextCursor = if p13 == nil or p13 == "" then nil else p13
	
	return if var29 == nextCursor then {
		friends = if fFlagAddFriendsPageTrustedFriendRequestSection then mergeListsWithoutDuplicates(p11.friends, p12.friends, "id") else mergeListsWithoutDuplicates_1(p11.friends, p12.friends, "id"),
		nextCursor = p12.nextCursor,
		hasMore = p12.hasMore
	} else p11
end

local _ = function(p14) --[[ line: 265 | named "resolveLocalUserId" ]]
	-- upvalues: localUserIdStore (ref), getLocalPlayerUserId (ref)
	local currentUserId = localUserIdStore.getCurrentUserId(p14)
	
	if currentUserId ~= "" then
		return currentUserId
	end
	local var31 = getLocalPlayerUserId()
	
	return if var31 then tostring(var31) else ""
end

return function() --[[ line: 274 | named "createFriendsStore" ]]
	-- upvalues: presenceStoreModule (ref), createDataCacheModule (ref), onlineFriendsCacheTtlSec (ref), isFriendsWithCacheTtlSec (ref), allFriendsCacheTtlSec (ref), fFlagEnableGetFriendshipStatus (ref), fFlagSduiRequestFriendshipAction (ref), friendshipStatusCacheTtlSec (ref), fFlagFriendsCountDataHydrationMigrationEnabled (ref), friendsCountCacheTtlSec (ref), localUserIdStore (ref), getLocalPlayerUserId (ref), fFlagAddFriendsPageTrustedFriendRequestSection (ref), mergeListsWithoutDuplicates (ref), mergeListsWithoutDuplicates_1 (ref), normalizePresenceRawDataModule (ref), presenceTypeModule (ref), normalizeStoredOnlineFriendRow (ref), normalizePresenceFromOnlineFriendsRow (ref), createDataResolverModule (ref), requestsModule (ref), mapFriendshipStatusToEnumModule (ref), cryoModule (ref), friendsPageSize (ref), initialFriendsPageSize (ref), findFriendsSortModule (ref), normalizeFindFriendsPageResponse (ref), mergeAllFriendsPage (ref), signalsModule (ref), fFlagFriendsStoreSortOnlineFriendsByRank (ref), dataStatus (ref)
	local var38, var37
	local var32 = presenceStoreModule.get()
	local var33 = createDataCacheModule(if onlineFriendsCacheTtlSec and onlineFriendsCacheTtlSec > 0 then onlineFriendsCacheTtlSec else 1e999)
	local var34 = isFriendsWithCacheTtlSec
	local var35 = createDataCacheModule(if var34 and var34 > 0 then var34 else 1e999)
	var34 = if allFriendsCacheTtlSec and allFriendsCacheTtlSec > 0 then allFriendsCacheTtlSec else 1e999
	local var36 = createDataCacheModule(var34)
	var34 = false
	
	if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
		var38 = friendshipStatusCacheTtlSec
		var37 = createDataCacheModule(if var38 and var38 > 0 then var38 else 1e999)
	else
		var37 = nil
	end
	local var40
	if fFlagFriendsCountDataHydrationMigrationEnabled then
		local var39 = friendsCountCacheTtlSec
		var38 = if var39 and var39 > 0 then var39 else 1e999
		var40 = createDataCacheModule(var38)
	else
		var40 = nil
	end
	var38 = {}
	
	local function var39(p15) --[[ line: 322 | named "appendUserToAllFriends" ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var36 (ref), fFlagAddFriendsPageTrustedFriendRequestSection (copy), mergeListsWithoutDuplicates (copy), mergeListsWithoutDuplicates_1 (copy)
		local var57
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var58 = getLocalPlayerUserId()
			var57 = if var58 then tostring(var58) else ""
		else
			var57 = currentUserId
		end
		local var59 = var36.getItem(var57).data(false)
		
		if var59 then
			local var60 = if fFlagAddFriendsPageTrustedFriendRequestSection then mergeListsWithoutDuplicates(var59.friends, { { id = p15 } }, "id") else mergeListsWithoutDuplicates_1(var59.friends, { { id = p15 } }, "id")
			
			if #var60 == #var59.friends then return end
			var36.replaceItem(var57, {
				friends = var60,
				nextCursor = var59.nextCursor,
				hasMore = var59.hasMore
			})
		end
	end
	
	local function UpdateIsFriendsWith(p16, p17) --[[ line: 340 ]]
		-- upvalues: var35 (ref), var39 (ref), fFlagEnableGetFriendshipStatus (copy), var37 (ref), var32 (ref)
		var35.replaceItem(p16, p17)
		
		if p17 then
			var39(p16)
			
			if fFlagEnableGetFriendshipStatus then
				var37.replaceItem(p16, Enum.FriendStatus.Friend)
			end
		end
		if not p17 then
			var32.UpdateUserPresence(p16, nil, { isUpdatedRealtime = false })
		end
	end
	
	local function _(p18, p19) --[[ line: 358 | named "updateOnlineFriendDependecies" ]]
		-- upvalues: var32 (ref), var35 (ref), var39 (ref), fFlagEnableGetFriendshipStatus (copy), var37 (ref)
		var32.UpdateUserPresence(p18, p19, { isUpdatedRealtime = true })
		var35.replaceItem(p18, true)
		var39(p18)
		
		if fFlagEnableGetFriendshipStatus then
			var37.replaceItem(p18, Enum.FriendStatus.Friend)
		end
	end
	
	local function updateOfflineFriendDependencies(p20) --[[ line: 365 ]]
		-- upvalues: var32 (ref), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), var35 (ref), var39 (ref), fFlagEnableGetFriendshipStatus (copy), var37 (ref)
		var32.UpdateUserPresence(p20, var32.GetPresenceByUserId(p20, { skipFetch = true }).data(false) or normalizePresenceRawDataModule({ userPresenceType = presenceTypeModule.Offline }), { isUpdatedRealtime = true })
		var35.replaceItem(p20, true)
		var39(p20)
		
		if fFlagEnableGetFriendshipStatus then
			var37.replaceItem(p20, Enum.FriendStatus.Friend)
		end
	end
	
	local function applyGetOnlineFriendsResponseBody(p21) --[[ line: 379 ]]
		-- upvalues: normalizeStoredOnlineFriendRow (copy), normalizePresenceFromOnlineFriendsRow (copy), var32 (ref), var35 (ref), var39 (ref), fFlagEnableGetFriendshipStatus (copy), var37 (ref)
		local t = {}
		
		for i, v in if p21 then p21.data else {} do
			local id = v.id
			local var62 = if not id then nil else tostring(id)
			local var63 = normalizeStoredOnlineFriendRow(v)
			local var64 = normalizePresenceFromOnlineFriendsRow(v)
			
			if var62 then
				t[var62] = var63
				var32.UpdateUserPresence(var62, var64, { isUpdatedRealtime = true })
				var35.replaceItem(var62, true)
				var39(var62)
				
				if fFlagEnableGetFriendshipStatus then
					var37.replaceItem(var62, Enum.FriendStatus.Friend)
				end
			end
		end
		return t
	end
	
	local var44 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var33,
		fetchFn = function(p22, p23) --[[ line: 402 ]]
			-- upvalues: requestsModule (copy), var32 (ref), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), applyGetOnlineFriendsResponseBody (ref)
			local var65 = p23.data(false) or {}
			
			return requestsModule.GetOnlineFriends(p22):andThen(function(p25) --[[ line: 406 ]]
				-- upvalues: var65 (ref), var32 (copy), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), applyGetOnlineFriendsResponseBody (copy)
				for i, v in var65 do
					local id = v and v.id
					local var67 = if not id then nil else tostring(id)
					
					if var67 then
						var32.UpdateUserPresence(var67, normalizePresenceRawDataModule({ userPresenceType = presenceTypeModule.Offline }), { isUpdatedRealtime = true })
					end
				end
				return applyGetOnlineFriendsResponseBody(p25)
			end):catch(function(p24) --[[ line: 423 ]]
				error(p24)
			end)
		end
	})
	
	local _ = function(p26) --[[ line: 432 | named "fetchFriendshipStatuses" ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), mapFriendshipStatusToEnumModule (copy)
		local var69
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var70 = getLocalPlayerUserId()
			var69 = if var70 then tostring(var70) else ""
		else
			var69 = currentUserId
		end
		return requestsModule.MultiGetFriendshipStatuses(var69, p26):andThen(function(p27) --[[ line: 435 ]]
			-- upvalues: mapFriendshipStatusToEnumModule (copy)
			local t = {}
			
			for i, v in if p27 then p27.data else {} do
				local id = v.id
				local var72 = if not id then nil else tostring(id)
				
				if var72 then
					t[var72] = mapFriendshipStatusToEnumModule(v.status)
				end
			end
			return t
		end)
	end
	
	local var45 = createDataResolverModule({
		cache = var35,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p28) --[[ line: 454 ]]
			-- upvalues: cryoModule (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), mapFriendshipStatusToEnumModule (copy), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var37 (ref)
			local var75
			local var73 = cryoModule.Dictionary.keys(p28)
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var76 = getLocalPlayerUserId()
				var75 = if var76 then tostring(var76) else ""
			else
				var75 = currentUserId
			end
			return requestsModule.MultiGetFriendshipStatuses(var75, var73):andThen(function(p30) --[[ line: 435 ]]
				-- upvalues: mapFriendshipStatusToEnumModule (copy)
				local t = {}
				
				for i, v in if p30 then p30.data else {} do
					local id = v.id
					local var72 = if not id then nil else tostring(id)
					
					if var72 then
						t[var72] = mapFriendshipStatusToEnumModule(v.status)
					end
				end
				return t
			end):andThen(function(p29) --[[ line: 456 ]]
				-- upvalues: fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var37 (copy)
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var37.replaceItems(p29)
				end
				local t = {}
				
				for i, v in p29 do
					t[i] = v == Enum.FriendStatus.Friend
				end
				return t
			end)
		end
	})
	local var46 = if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then createDataResolverModule({
		cache = var37,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p31) --[[ line: 478 ]]
			-- upvalues: cryoModule (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), mapFriendshipStatusToEnumModule (copy), var35 (ref)
			local var80
			local var78 = cryoModule.Dictionary.keys(p31)
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var81 = getLocalPlayerUserId()
				var80 = if var81 then tostring(var81) else ""
			else
				var80 = currentUserId
			end
			return requestsModule.MultiGetFriendshipStatuses(var80, var78):andThen(function(p33) --[[ line: 435 ]]
				-- upvalues: mapFriendshipStatusToEnumModule (copy)
				local t = {}
				
				for i, v in if p33 then p33.data else {} do
					local id = v.id
					local var72 = if not id then nil else tostring(id)
					
					if var72 then
						t[var72] = mapFriendshipStatusToEnumModule(v.status)
					end
				end
				return t
			end):andThen(function(p32) --[[ line: 480 ]]
				-- upvalues: var35 (copy)
				local t = {}
				
				for i, v in p32 do
					t[i] = v == Enum.FriendStatus.Friend
				end
				var35.replaceItems(t)
				
				return p32
			end)
		end
	}) else nil
	local var47 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var36,
		fetchFn = function(p34, p35) --[[ line: 499 ]]
			-- upvalues: var34 (write), friendsPageSize (copy), initialFriendsPageSize (copy), requestsModule (copy), findFriendsSortModule (copy), normalizeFindFriendsPageResponse (copy), updateOfflineFriendDependencies (ref), mergeAllFriendsPage (copy)
			local var83 = if var34 then nil else p35.data(false)
			var34 = false
			local var84 = if var83 then var83.nextCursor else nil
			
			return requestsModule.GetFindFriendsPage(p34, {
				limit = if var83 then friendsPageSize else initialFriendsPageSize,
				cursor = var84,
				sort = findFriendsSortModule.FriendshipScore
			}):andThen(function(p37) --[[ line: 511 ]]
				-- upvalues: normalizeFindFriendsPageResponse (copy), updateOfflineFriendDependencies (copy), mergeAllFriendsPage (copy), var83 (ref), var84 (ref)
				local var85 = normalizeFindFriendsPageResponse(p37)
				
				for i, v in var85.friends do
					updateOfflineFriendDependencies(v.id)
				end
				return mergeAllFriendsPage(var83, var85, var84)
			end):catch(function(p36) --[[ line: 519 ]]
				error(p36)
			end)
		end
	})
	local var48 = if fFlagFriendsCountDataHydrationMigrationEnabled then createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var40,
		fetchFn = function(p38) --[[ line: 530 ]]
			-- upvalues: requestsModule (copy)
			return requestsModule.GetFriendsCountFromUserId(p38):andThen(function(p39) --[[ line: 532 ]]
				return if p39 then p39.count else 0
			end)
		end
	}) else nil
	local var49 = signalsModule.createComputed(function(p40) --[[ line: 551 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var44 (ref), var32 (ref), var45 (ref), presenceTypeModule (copy), fFlagFriendsStoreSortOnlineFriendsByRank (copy)
		local var87
		local currentUserId = localUserIdStore.getCurrentUserId(p40)
		
		if currentUserId == "" then
			local var88 = getLocalPlayerUserId()
			var87 = if var88 then tostring(var88) else ""
		else
			var87 = currentUserId
		end
		local var89 = var44.getAndFetchItem(var87).data(p40)
		
		if var89 == nil then
			return nil
		end
		local t = {}
		
		for i, v in pairs(var89) do
			if v then
				local var91 = var32.GetPresenceByUserId(v.id, { skipFetch = true }).data(p40)
				
				if var45.getCachedItem(v.id).data(p40) and var91 and (var91.userPresenceType and var91.userPresenceType ~= presenceTypeModule.Offline) then
					table.insert(t, { id = v.id, sortScore = v.sortScore, presence = var91 })
				end
			end
		end
		if fFlagFriendsStoreSortOnlineFriendsByRank then
			table.sort(t, function(p41, p42) --[[ line: 583 ]]
				return p42.sortScore < p41.sortScore
			end)
		end
		return t
	end)
	
	local function GetOnlineFriends() --[[ line: 591 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var44 (ref), var49 (ref)
		local var93
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var94 = getLocalPlayerUserId()
			var93 = if var94 then tostring(var94) else ""
		else
			var93 = currentUserId
		end
		var44.getAndFetchItem(var93)
		
		return var49
	end
	
	local var51 = signalsModule.createComputed(function(p43) --[[ line: 598 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var44 (ref)
		local var96
		local currentUserId = localUserIdStore.getCurrentUserId(p43)
		
		if currentUserId == "" then
			local var97 = getLocalPlayerUserId()
			var96 = if var97 then tostring(var97) else ""
		else
			var96 = currentUserId
		end
		return var44.getCachedItem(var96).status(p43)
	end)
	
	local function GetOnlineFriendsStatus() --[[ line: 603 ]]
		-- upvalues: var51 (ref)
		return var51
	end
	
	local function GetOnlineFriendsByUniverseId(p44) --[[ line: 607 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var44 (ref), var38 (ref), signalsModule (copy), var49 (ref)
		local var99
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var100 = getLocalPlayerUserId()
			var99 = if var100 then tostring(var100) else ""
		else
			var99 = currentUserId
		end
		var44.getAndFetchItem(var99)
		local var101 = var38[p44]
		
		if var101 then
			return var101
		end
		local var102 = signalsModule.createComputed(function(p45) --[[ line: 616 ]]
			-- upvalues: var49 (copy), p44 (ref)
			local var103 = var49(p45)
			
			if not var103 then
				return {}
			end
			local t = {}
			
			for i, v in var103 do
				if v.presence and v.presence.universeId == p44 then
					table.insert(t, v)
				end
			end
			return t
		end)
		var38[p44] = var102
		
		return var102
	end
	
	local var54 = signalsModule.createComputed(function(p46) --[[ line: 635 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var47 (ref), cryoModule (copy), var45 (ref)
		local var106
		local currentUserId = localUserIdStore.getCurrentUserId(p46)
		
		if currentUserId == "" then
			local var107 = getLocalPlayerUserId()
			var106 = if var107 then tostring(var107) else ""
		else
			var106 = currentUserId
		end
		local var108 = var47.getAndFetchItem(var106).data(p46)
		
		return if var108 == nil then nil else {
			friends = cryoModule.List.filter(var108.friends or {}, function(p47) --[[ line: 646 ]]
				-- upvalues: var45 (copy), p46 (ref)
				return var45.getCachedItem(p47.id).data(p46)
			end),
			hasMore = var108.hasMore,
			nextCursor = var108.nextCursor
		}
	end)
	local var55 = signalsModule.createComputed(function(p48) --[[ line: 657 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var47 (ref)
		local var110
		local currentUserId = localUserIdStore.getCurrentUserId(p48)
		
		if currentUserId == "" then
			local var111 = getLocalPlayerUserId()
			var110 = if var111 then tostring(var111) else ""
		else
			var110 = currentUserId
		end
		return var47.getCachedItem(var110).status(p48)
	end)
	
	return {
		GetOnlineFriends = GetOnlineFriends,
		GetOnlineFriendsStatus = GetOnlineFriendsStatus,
		GetOnlineFriendsByUniverseId = GetOnlineFriendsByUniverseId,
		GetAllFriends = function() --[[ line: 662 ]]
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var47 (ref), var54 (ref)
			local var113
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var114 = getLocalPlayerUserId()
				var113 = if var114 then tostring(var114) else ""
			else
				var113 = currentUserId
			end
			var47.getAndFetchItem(var113)
			
			return var54
		end,
		GetAllFriendsStatus = function() --[[ line: 669 ]]
			-- upvalues: var55 (ref)
			return var55
		end,
		FetchMoreFriends = function() --[[ line: 673 ]]
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var47 (ref), dataStatus (copy)
			local var116
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var117 = getLocalPlayerUserId()
				var116 = if var117 then tostring(var117) else ""
			else
				var116 = currentUserId
			end
			local cachedItem = var47.getCachedItem(var116)
			local var119 = cachedItem.data(false)
			
			if var119 == nil or not var119.hasMore or var119.nextCursor == nil then return end
			if cachedItem.status(false) == dataStatus.NotReady then return end
			if var47.isRequestInQueueOrInFlight(var116) then
				return
			end
			var47.fetchItem(var116)
		end,
		RefetchAllFriends = function() --[[ line: 693 ]]
			-- upvalues: var34 (write), var47 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var121
			var34 = true
			local fetchItem = var47.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var122 = getLocalPlayerUserId()
				var121 = if var122 then tostring(var122) else ""
			else
				var121 = currentUserId
			end
			fetchItem(var121)
		end,
		GetIsFriendWith = function(p49) --[[ line: 699 ]]
			-- upvalues: var45 (ref)
			return var45.getAndFetchItem(p49)
		end,
		UpdateIsFriendsWith = UpdateIsFriendsWith,
		GetFriendshipStatus = function(p50, p51) --[[ line: 703 ]]
			-- upvalues: fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var46 (ref)
			return if not (not fFlagEnableGetFriendshipStatus and not fFlagSduiRequestFriendshipAction or p50 == "") then if fFlagEnableGetFriendshipStatus and p51 and p51.skipFetch then var46.getCachedItem(p50) else var46.getAndFetchItem(p50) else nil
		end,
		UpdateFriendshipStatus = function(p52, p53) --[[ line: 713 ]]
			-- upvalues: fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var37 (ref), UpdateIsFriendsWith (ref)
			if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
				var37.replaceItem(p52, p53)
				UpdateIsFriendsWith(p52, p53 == Enum.FriendStatus.Friend)
				
				return
			end
		end,
		RequestFriendship = function(p54, p55, p56) --[[ line: 722 ]]
			-- upvalues: fFlagEnableGetFriendshipStatus (copy), requestsModule (copy), fFlagSduiRequestFriendshipAction (copy), var37 (ref), UpdateIsFriendsWith (ref)
			return (if fFlagEnableGetFriendshipStatus and p56 and p56.isContact then requestsModule.RequestFriendshipFromContactId(p54) else requestsModule.RequestFriendshipFromUserId(p54, p55)):andThen(function() --[[ line: 729 ]]
				-- upvalues: p54 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var37 (copy), UpdateIsFriendsWith (copy)
				local friendRequestSent = Enum.FriendStatus.FriendRequestSent
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var37.replaceItem(p54, friendRequestSent)
					UpdateIsFriendsWith(p54, friendRequestSent == Enum.FriendStatus.Friend)
					
					return
				end
			end):catch(function(p57) --[[ line: 732 ]]
				-- upvalues: p54 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var37 (copy), UpdateIsFriendsWith (copy)
				if (if type(p57) == "table" then p57.firstErrorCode else nil) ~= 5 then
					error(p57)
					
					return
				end
				local var123 = p54
				local friend = Enum.FriendStatus.Friend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var37.replaceItem(var123, friend)
					UpdateIsFriendsWith(var123, friend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		AcceptFriendRequest = function(p58) --[[ line: 747 ]]
			-- upvalues: requestsModule (copy), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var37 (ref), UpdateIsFriendsWith (ref)
			return requestsModule.AcceptFriendRequestFromUserId(p58):andThen(function() --[[ line: 749 ]]
				-- upvalues: p58 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var37 (copy), UpdateIsFriendsWith (copy)
				local friend = Enum.FriendStatus.Friend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var37.replaceItem(p58, friend)
					UpdateIsFriendsWith(p58, friend == Enum.FriendStatus.Friend)
					
					return
				end
			end):catch(function(p59) --[[ line: 752 ]]
				-- upvalues: p58 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var37 (copy), UpdateIsFriendsWith (copy)
				if (if type(p59) == "table" then p59.firstErrorCode else nil) ~= 5 then
					error(p59)
					
					return
				end
				local var124 = p58
				local friend = Enum.FriendStatus.Friend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var37.replaceItem(var124, friend)
					UpdateIsFriendsWith(var124, friend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		DeclineFriendRequest = function(p60) --[[ line: 765 ]]
			-- upvalues: requestsModule (copy), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var37 (ref), UpdateIsFriendsWith (ref)
			return requestsModule.DeclineFriendRequestFromUserId(p60):andThen(function() --[[ line: 766 ]]
				-- upvalues: p60 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var37 (copy), UpdateIsFriendsWith (copy)
				local notFriend = Enum.FriendStatus.NotFriend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var37.replaceItem(p60, notFriend)
					UpdateIsFriendsWith(p60, notFriend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		RefetchOnlineFriends = function() --[[ line: 771 ]]
			-- upvalues: var44 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var126
			local fetchItem = var44.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var127 = getLocalPlayerUserId()
				var126 = if var127 then tostring(var127) else ""
			else
				var126 = currentUserId
			end
			fetchItem(var126)
		end,
		GetFriendsCountByUserId = function(p61, p62) --[[ line: 775 ]]
			-- upvalues: fFlagFriendsCountDataHydrationMigrationEnabled (copy), var48 (ref)
			return if fFlagFriendsCountDataHydrationMigrationEnabled then if p62 and p62.skipFetch then var48.getCachedItem(p61) else var48.getAndFetchItem(p61) else nil
		end,
		RefreshFriendsCountByUserId = function(p63) --[[ line: 785 ]]
			-- upvalues: fFlagFriendsCountDataHydrationMigrationEnabled (copy), var48 (ref)
			if fFlagFriendsCountDataHydrationMigrationEnabled then
				var48.fetchItem(p63)
				
				return
			end
		end,
		clear = function() --[[ line: 836 ]]
			-- upvalues: var44 (ref), var45 (ref), var47 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var46 (ref), fFlagFriendsCountDataHydrationMigrationEnabled (copy), var48 (ref), var38 (ref)
			var44.clear()
			var45.clear()
			var47.clear()
			
			if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
				var46.clear()
			end
			if fFlagFriendsCountDataHydrationMigrationEnabled then
				var48.clear()
			end
			table.clear(var38)
		end,
		dispose = function() --[[ line: 849 ]]
			-- upvalues: var44 (ref), var45 (ref), var47 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var46 (ref), fFlagFriendsCountDataHydrationMigrationEnabled (copy), var48 (ref), var38 (ref)
			var44.dispose()
			var45.dispose()
			var47.dispose()
			
			if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
				var46.dispose()
			end
			if fFlagFriendsCountDataHydrationMigrationEnabled then
				var48.dispose()
			end
			table.clear(var38)
		end,
		_fetchOnlineFriendsAsync = function() --[[ line: 794 ]]
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), applyGetOnlineFriendsResponseBody (ref), var33 (ref)
			local var129
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var130 = getLocalPlayerUserId()
				var129 = if var130 then tostring(var130) else ""
			else
				var129 = currentUserId
			end
			return requestsModule.GetOnlineFriends(var129):andThen(function(p65) --[[ line: 797 ]]
				-- upvalues: applyGetOnlineFriendsResponseBody (copy), var33 (copy), var129 (ref)
				var33.replaceItems({ [var129] = applyGetOnlineFriendsResponseBody(p65) })
				
				return p65 or { data = nil }
			end):catch(function(p64) --[[ line: 802 ]]
				error(p64)
			end)
		end,
		_updateFriendsPresences = function(p66, p67, _) --[[ line: 807 ]]
			-- upvalues: normalizeStoredOnlineFriendRow (copy), normalizePresenceRawDataModule (copy), var32 (ref), var35 (ref), var39 (ref), fFlagEnableGetFriendshipStatus (copy), var37 (ref), var33 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			if not p66 then return end
			p67 = p67 or {}
			local t = {}
			
			for i, v in pairs(p66) do
				local userId = v.userId
				local var136 = if not userId then nil else tostring(userId)
				
				if var136 then
					local var137 = normalizePresenceRawDataModule(v)
					t[var136] = normalizeStoredOnlineFriendRow({ id = var136, sortScore = p67[var136] })
					var32.UpdateUserPresence(var136, var137, { isUpdatedRealtime = true })
					var35.replaceItem(var136, true)
					var39(var136)
					
					if fFlagEnableGetFriendshipStatus then
						var37.replaceItem(var136, Enum.FriendStatus.Friend)
					end
				end
			end
			local var134
			local updateItem = var33.updateItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var135 = getLocalPlayerUserId()
				var134 = if var135 then tostring(var135) else ""
			else
				var134 = currentUserId
			end
			updateItem(var134, t)
		end
	}
end