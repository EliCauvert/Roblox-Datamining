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
local fFlagFriendSortedByPresenceSignalsImplementation = sharedFlagsModule.FFlagFriendSortedByPresenceSignalsImplementation
local fFlagAddFriendsPageTrustedFriendRequestSection = require(parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local requestsModule = require(dataHydration.Friends.Requests)
local findFriendsSortModule = require(dataHydration.Friends.Enums.FindFriendsSort)
local mapFriendshipStatusToEnumModule = require(dataHydration.Friends.mapFriendshipStatusToEnum)
local presenceStoreModule = require(dataHydration.Presence.PresenceStore)
local normalizePresenceRawDataModule = require(dataHydration.Presence.normalizePresenceRawData)
local presenceTypeModule = require(dataHydration.Presence.Enums.PresenceType)
local _ = require(dataHydration.Presence.createPresenceStore)
game:DefineFastInt("FriendsStoreProcessDelaySec", 1)

local function _() --[[ line: 124 | named "getFIntFriendsStoreProcessDelaySec" ]]
	return game:GetFastInt("FriendsStoreProcessDelaySec")
end

local onlineFriendsCacheTtlSec = game:DefineFastInt("OnlineFriendsCacheTtlSec", 0)
local isFriendsWithCacheTtlSec = game:DefineFastInt("IsFriendsWithCacheTtlSec", 0)
local allFriendsCacheTtlSec = game:DefineFastInt("AllFriendsCacheTtlSec", 0)
local friendshipStatusCacheTtlSec = game:DefineFastInt("FriendshipStatusCacheTtlSec", 0)

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
		local var26 = if not id then nil else tostring(id)
		
		if var26 then
			table.insert(t, { id = var26 })
		end
	end
	local var24 = if p5 then p5.NextCursor else nil
	local var25 = if var24 == nil or var24 == "" then nil else var24
	var24 = if p5 and p5.HasMore ~= nil then p5.HasMore else var25 ~= nil
	
	return { friends = t, nextCursor = var25, hasMore = var24 }
end

local function mergeListsWithoutDuplicates_1(p6, p7, p8) --[[ line: 212 | named "mergeListsWithoutDuplicates" ]]
	-- upvalues: cryoModule (ref)
	if p7 and #p7 ~= 0 then
		if p6 and #p6 ~= 0 then
			local var27 = cryoModule.List.toSet(cryoModule.List.map(p6, function(p9) --[[ line: 220 ]]
				-- upvalues: p8 (ref)
				return if p8 then p9[p8] else p9
			end))
			
			return cryoModule.List.join(table.clone(p6), cryoModule.List.filter(p7, function(p10) --[[ line: 225 ]]
				-- upvalues: p8 (ref), var27 (ref)
				return not var27[if p8 then p10[p8] else p10]
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
	local var28 = if nextCursor == nil or nextCursor == "" then nil else nextCursor
	nextCursor = if p13 == nil or p13 == "" then nil else p13
	
	return if var28 == nextCursor then {
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
	local var30 = getLocalPlayerUserId()
	
	return if var30 then tostring(var30) else ""
end

return function() --[[ line: 274 | named "createFriendsStore" ]]
	-- upvalues: presenceStoreModule (ref), fFlagFriendSortedByPresenceSignalsImplementation (ref), getLocalPlayerUserId (ref), createDataCacheModule (ref), onlineFriendsCacheTtlSec (ref), isFriendsWithCacheTtlSec (ref), allFriendsCacheTtlSec (ref), fFlagSduiRequestFriendshipAction (ref), friendshipStatusCacheTtlSec (ref), localUserIdStore (ref), fFlagAddFriendsPageTrustedFriendRequestSection (ref), mergeListsWithoutDuplicates (ref), mergeListsWithoutDuplicates_1 (ref), normalizePresenceRawDataModule (ref), presenceTypeModule (ref), normalizeStoredOnlineFriendRow (ref), normalizePresenceFromOnlineFriendsRow (ref), createDataResolverModule (ref), requestsModule (ref), mapFriendshipStatusToEnumModule (ref), cryoModule (ref), friendsPageSize (ref), initialFriendsPageSize (ref), findFriendsSortModule (ref), normalizeFindFriendsPageResponse (ref), mergeAllFriendsPage (ref), signalsModule (ref), dataStatus (ref)
	local var37
	local var31 = presenceStoreModule.get()
	local var32 = if fFlagFriendSortedByPresenceSignalsImplementation then nil else tostring(getLocalPlayerUserId())
	local var33 = createDataCacheModule(if onlineFriendsCacheTtlSec and onlineFriendsCacheTtlSec > 0 then onlineFriendsCacheTtlSec else 1e999)
	local var34 = isFriendsWithCacheTtlSec
	local var35 = createDataCacheModule(if var34 and var34 > 0 then var34 else 1e999)
	var34 = if allFriendsCacheTtlSec and allFriendsCacheTtlSec > 0 then allFriendsCacheTtlSec else 1e999
	local var36 = createDataCacheModule(var34)
	var34 = false
	
	if fFlagSduiRequestFriendshipAction then
		local var38 = friendshipStatusCacheTtlSec
		var37 = createDataCacheModule(if var38 and var38 > 0 then var38 else 1e999)
	else
		var37 = nil
	end
	local t = {}
	
	local function var38(p15) --[[ line: 317 | named "appendUserToAllFriends" ]]
		-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), var32 (ref), var36 (ref), fFlagAddFriendsPageTrustedFriendRequestSection (copy), mergeListsWithoutDuplicates (copy), mergeListsWithoutDuplicates_1 (copy)
		local var55
		if fFlagFriendSortedByPresenceSignalsImplementation then
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var56 = getLocalPlayerUserId()
				var55 = if var56 then tostring(var56) else ""
			else
				var55 = currentUserId
			end
		else
			var55 = var32
		end
		local var57 = var36.getItem(var55).data(false)
		
		if var57 then
			local var58 = if fFlagAddFriendsPageTrustedFriendRequestSection then mergeListsWithoutDuplicates(var57.friends, { { id = p15 } }, "id") else mergeListsWithoutDuplicates_1(var57.friends, { { id = p15 } }, "id")
			
			if #var58 == #var57.friends then return end
			var36.replaceItem(var55, {
				friends = var58,
				nextCursor = var57.nextCursor,
				hasMore = var57.hasMore
			})
		end
	end
	
	local function UpdateIsFriendsWith(p16, p17) --[[ line: 337 ]]
		-- upvalues: var35 (ref), var38 (ref), var31 (ref)
		var35.replaceItem(p16, p17)
		
		if p17 then
			var38(p16)
		end
		if not p17 then
			var31.UpdateUserPresence(p16, nil, { isUpdatedRealtime = false })
		end
	end
	
	local function _(p18, p19) --[[ line: 352 | named "updateOnlineFriendDependecies" ]]
		-- upvalues: var31 (ref), var35 (ref), var38 (ref)
		var31.UpdateUserPresence(p18, p19, { isUpdatedRealtime = true })
		var35.replaceItem(p18, true)
		var38(p18)
	end
	
	local function updateOfflineFriendDependencies(p20) --[[ line: 359 ]]
		-- upvalues: var31 (ref), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), var35 (ref), var38 (ref)
		var31.UpdateUserPresence(p20, var31.GetPresenceByUserId(p20, { skipFetch = true }).data(false) or normalizePresenceRawDataModule({ userPresenceType = presenceTypeModule.Offline }), { isUpdatedRealtime = true })
		var35.replaceItem(p20, true)
		var38(p20)
	end
	
	local function applyGetOnlineFriendsResponseBody(p21) --[[ line: 373 ]]
		-- upvalues: normalizeStoredOnlineFriendRow (copy), normalizePresenceFromOnlineFriendsRow (copy), var31 (ref), var35 (ref), var38 (ref)
		local t = {}
		
		for i, v in if p21 then p21.data else {} do
			local id = v.id
			local var60 = if not id then nil else tostring(id)
			local var61 = normalizeStoredOnlineFriendRow(v)
			local var62 = normalizePresenceFromOnlineFriendsRow(v)
			
			if var60 then
				t[var60] = var61
				var31.UpdateUserPresence(var60, var62, { isUpdatedRealtime = true })
				var35.replaceItem(var60, true)
				var38(var60)
			end
		end
		return t
	end
	
	local var43 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var33,
		fetchFn = function(p22, p23) --[[ line: 396 ]]
			-- upvalues: requestsModule (copy), var31 (ref), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), applyGetOnlineFriendsResponseBody (ref)
			local var63 = p23.data(false) or {}
			
			return requestsModule.GetOnlineFriends(p22):andThen(function(p25) --[[ line: 400 ]]
				-- upvalues: var63 (ref), var31 (copy), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), applyGetOnlineFriendsResponseBody (copy)
				for i, v in var63 do
					local id = v and v.id
					local var65 = if not id then nil else tostring(id)
					
					if var65 then
						var31.UpdateUserPresence(var65, normalizePresenceRawDataModule({ userPresenceType = presenceTypeModule.Offline }), { isUpdatedRealtime = true })
					end
				end
				return applyGetOnlineFriendsResponseBody(p25)
			end):catch(function(p24) --[[ line: 417 ]]
				error(p24)
			end)
		end
	})
	
	local _ = function(p26) --[[ line: 426 | named "fetchFriendshipStatuses" ]]
		-- upvalues: fFlagFriendSortedByPresenceSignalsImplementation (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), var32 (ref), requestsModule (copy), mapFriendshipStatusToEnumModule (copy)
		local var67
		if fFlagFriendSortedByPresenceSignalsImplementation then
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var68 = getLocalPlayerUserId()
				var67 = if var68 then tostring(var68) else ""
			else
				var67 = currentUserId
			end
		else
			var67 = var32
		end
		return requestsModule.MultiGetFriendshipStatuses(var67, p26):andThen(function(p27) --[[ line: 431 ]]
			-- upvalues: mapFriendshipStatusToEnumModule (copy)
			local t = {}
			
			for i, v in if p27 then p27.data else {} do
				local id = v.id
				local var70 = if not id then nil else tostring(id)
				
				if var70 then
					t[var70] = mapFriendshipStatusToEnumModule(v.status)
				end
			end
			return t
		end)
	end
	
	local var44 = createDataResolverModule({
		cache = var35,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p28) --[[ line: 450 ]]
			-- upvalues: cryoModule (copy), fFlagFriendSortedByPresenceSignalsImplementation (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), var32 (ref), requestsModule (copy), mapFriendshipStatusToEnumModule (copy), fFlagSduiRequestFriendshipAction (copy), var37 (ref)
			local var73
			local var71 = cryoModule.Dictionary.keys(p28)
			
			if fFlagFriendSortedByPresenceSignalsImplementation then
				local currentUserId = localUserIdStore.getCurrentUserId(false)
				
				if currentUserId == "" then
					local var74 = getLocalPlayerUserId()
					var73 = if var74 then tostring(var74) else ""
				else
					var73 = currentUserId
				end
			else
				var73 = var32
			end
			return requestsModule.MultiGetFriendshipStatuses(var73, var71):andThen(function(p30) --[[ line: 431 ]]
				-- upvalues: mapFriendshipStatusToEnumModule (copy)
				local t = {}
				
				for i, v in if p30 then p30.data else {} do
					local id = v.id
					local var70 = if not id then nil else tostring(id)
					
					if var70 then
						t[var70] = mapFriendshipStatusToEnumModule(v.status)
					end
				end
				return t
			end):andThen(function(p29) --[[ line: 452 ]]
				-- upvalues: fFlagSduiRequestFriendshipAction (copy), var37 (copy)
				if fFlagSduiRequestFriendshipAction then
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
	local var45 = if fFlagSduiRequestFriendshipAction then createDataResolverModule({
		cache = var37,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p31) --[[ line: 473 ]]
			-- upvalues: cryoModule (copy), fFlagFriendSortedByPresenceSignalsImplementation (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), var32 (ref), requestsModule (copy), mapFriendshipStatusToEnumModule (copy), var35 (ref)
			local var78
			local var76 = cryoModule.Dictionary.keys(p31)
			
			if fFlagFriendSortedByPresenceSignalsImplementation then
				local currentUserId = localUserIdStore.getCurrentUserId(false)
				
				if currentUserId == "" then
					local var79 = getLocalPlayerUserId()
					var78 = if var79 then tostring(var79) else ""
				else
					var78 = currentUserId
				end
			else
				var78 = var32
			end
			return requestsModule.MultiGetFriendshipStatuses(var78, var76):andThen(function(p33) --[[ line: 431 ]]
				-- upvalues: mapFriendshipStatusToEnumModule (copy)
				local t = {}
				
				for i, v in if p33 then p33.data else {} do
					local id = v.id
					local var70 = if not id then nil else tostring(id)
					
					if var70 then
						t[var70] = mapFriendshipStatusToEnumModule(v.status)
					end
				end
				return t
			end):andThen(function(p32) --[[ line: 475 ]]
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
	local var46 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var36,
		fetchFn = function(p34, p35) --[[ line: 494 ]]
			-- upvalues: var34 (write), friendsPageSize (copy), initialFriendsPageSize (copy), requestsModule (copy), findFriendsSortModule (copy), normalizeFindFriendsPageResponse (copy), updateOfflineFriendDependencies (ref), mergeAllFriendsPage (copy)
			local var81 = if var34 then nil else p35.data(false)
			var34 = false
			local var82 = if var81 then var81.nextCursor else nil
			
			return requestsModule.GetFindFriendsPage(p34, {
				limit = if var81 then friendsPageSize else initialFriendsPageSize,
				cursor = var82,
				sort = findFriendsSortModule.FriendshipScore
			}):andThen(function(p37) --[[ line: 506 ]]
				-- upvalues: normalizeFindFriendsPageResponse (copy), updateOfflineFriendDependencies (copy), mergeAllFriendsPage (copy), var81 (ref), var82 (ref)
				local var83 = normalizeFindFriendsPageResponse(p37)
				
				for i, v in var83.friends do
					updateOfflineFriendDependencies(v.id)
				end
				return mergeAllFriendsPage(var81, var83, var82)
			end):catch(function(p36) --[[ line: 514 ]]
				error(p36)
			end)
		end
	})
	local var47 = signalsModule.createComputed(function(p38) --[[ line: 532 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var43 (ref), var31 (ref), var44 (ref), presenceTypeModule (copy)
		local var85
		local currentUserId = localUserIdStore.getCurrentUserId(p38)
		
		if currentUserId == "" then
			local var86 = getLocalPlayerUserId()
			var85 = if var86 then tostring(var86) else ""
		else
			var85 = currentUserId
		end
		local var87 = var43.getAndFetchItem(var85).data(p38)
		
		if var87 == nil then
			return nil
		end
		local t = {}
		
		for i, v in pairs(var87) do
			if v then
				local var89 = var31.GetPresenceByUserId(v.id, { skipFetch = true }).data(p38)
				
				if var44.getCachedItem(v.id).data(p38) and var89 and (var89.userPresenceType and var89.userPresenceType ~= presenceTypeModule.Offline) then
					table.insert(t, { id = v.id, sortScore = v.sortScore, presence = var89 })
				end
			end
		end
		return t
	end)
	
	local function GetOnlineFriends() --[[ line: 566 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var43 (ref), var47 (ref)
		local var91
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var92 = getLocalPlayerUserId()
			var91 = if var92 then tostring(var92) else ""
		else
			var91 = currentUserId
		end
		var43.getAndFetchItem(var91)
		
		return var47
	end
	
	local var49 = signalsModule.createComputed(function(p39) --[[ line: 573 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var43 (ref)
		local var94
		local currentUserId = localUserIdStore.getCurrentUserId(p39)
		
		if currentUserId == "" then
			local var95 = getLocalPlayerUserId()
			var94 = if var95 then tostring(var95) else ""
		else
			var94 = currentUserId
		end
		return var43.getCachedItem(var94).status(p39)
	end)
	
	local function GetOnlineFriendsStatus() --[[ line: 578 ]]
		-- upvalues: var49 (ref)
		return var49
	end
	
	local function GetOnlineFriendsByUniverseId(p40) --[[ line: 582 ]]
		-- upvalues: t (ref), signalsModule (copy), var47 (ref)
		local var96 = t[p40]
		
		if var96 then
			return var96
		end
		local var97 = signalsModule.createComputed(function(p41) --[[ line: 588 ]]
			-- upvalues: var47 (copy), p40 (ref)
			local var98 = var47(p41)
			
			if not var98 then
				return {}
			end
			local t = {}
			
			for i, v in var98 do
				if v.presence and v.presence.universeId == p40 then
					table.insert(t, v)
				end
			end
			return t
		end)
		t[p40] = var97
		
		return var97
	end
	
	local var52 = signalsModule.createComputed(function(p42) --[[ line: 607 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var46 (ref), cryoModule (copy), var44 (ref)
		local var101
		local currentUserId = localUserIdStore.getCurrentUserId(p42)
		
		if currentUserId == "" then
			local var102 = getLocalPlayerUserId()
			var101 = if var102 then tostring(var102) else ""
		else
			var101 = currentUserId
		end
		local var103 = var46.getAndFetchItem(var101).data(p42)
		
		return if var103 == nil then nil else {
			friends = cryoModule.List.filter(var103.friends or {}, function(p43) --[[ line: 618 ]]
				-- upvalues: var44 (copy), p42 (ref)
				return var44.getCachedItem(p43.id).data(p42)
			end),
			hasMore = var103.hasMore,
			nextCursor = var103.nextCursor
		}
	end)
	local var53 = signalsModule.createComputed(function(p44) --[[ line: 629 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var46 (ref)
		local var105
		local currentUserId = localUserIdStore.getCurrentUserId(p44)
		
		if currentUserId == "" then
			local var106 = getLocalPlayerUserId()
			var105 = if var106 then tostring(var106) else ""
		else
			var105 = currentUserId
		end
		return var46.getCachedItem(var105).status(p44)
	end)
	
	return {
		GetOnlineFriends = GetOnlineFriends,
		GetOnlineFriendsStatus = GetOnlineFriendsStatus,
		GetOnlineFriendsByUniverseId = GetOnlineFriendsByUniverseId,
		GetAllFriends = function() --[[ line: 634 ]]
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var46 (ref), var52 (ref)
			local var108
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var109 = getLocalPlayerUserId()
				var108 = if var109 then tostring(var109) else ""
			else
				var108 = currentUserId
			end
			var46.getAndFetchItem(var108)
			
			return var52
		end,
		GetAllFriendsStatus = function() --[[ line: 641 ]]
			-- upvalues: var53 (ref)
			return var53
		end,
		FetchMoreFriends = function() --[[ line: 645 ]]
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var46 (ref), dataStatus (copy)
			local var111
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var112 = getLocalPlayerUserId()
				var111 = if var112 then tostring(var112) else ""
			else
				var111 = currentUserId
			end
			local cachedItem = var46.getCachedItem(var111)
			local var114 = cachedItem.data(false)
			
			if var114 == nil or not var114.hasMore or var114.nextCursor == nil then return end
			if cachedItem.status(false) == dataStatus.NotReady then return end
			if var46.isRequestInQueueOrInFlight(var111) then
				return
			end
			var46.fetchItem(var111)
		end,
		RefetchAllFriends = function() --[[ line: 665 ]]
			-- upvalues: var34 (write), var46 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var116
			var34 = true
			local fetchItem = var46.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var117 = getLocalPlayerUserId()
				var116 = if var117 then tostring(var117) else ""
			else
				var116 = currentUserId
			end
			fetchItem(var116)
		end,
		GetIsFriendWith = function(p45) --[[ line: 671 ]]
			-- upvalues: var44 (ref)
			return var44.getAndFetchItem(p45)
		end,
		UpdateIsFriendsWith = UpdateIsFriendsWith,
		GetFriendshipStatus = function(p46) --[[ line: 678 ]]
			-- upvalues: fFlagSduiRequestFriendshipAction (copy), var45 (ref)
			return if fFlagSduiRequestFriendshipAction and p46 ~= "" then var45.getAndFetchItem(p46) else nil
		end,
		UpdateFriendshipStatus = function(p47, p48) --[[ line: 687 ]]
			-- upvalues: fFlagSduiRequestFriendshipAction (copy), var37 (ref), UpdateIsFriendsWith (ref)
			if fFlagSduiRequestFriendshipAction then
				var37.replaceItem(p47, p48)
				UpdateIsFriendsWith(p47, p48 == Enum.FriendStatus.Friend)
				
				return
			end
		end,
		RequestFriendship = function(p49, p50) --[[ line: 699 ]]
			-- upvalues: requestsModule (copy), fFlagSduiRequestFriendshipAction (copy), var37 (ref), UpdateIsFriendsWith (ref)
			return requestsModule.RequestFriendshipFromUserId(p49, p50):andThen(function() --[[ line: 701 ]]
				-- upvalues: p49 (ref), fFlagSduiRequestFriendshipAction (copy), var37 (copy), UpdateIsFriendsWith (copy)
				local friendRequestSent = Enum.FriendStatus.FriendRequestSent
				
				if fFlagSduiRequestFriendshipAction then
					var37.replaceItem(p49, friendRequestSent)
					UpdateIsFriendsWith(p49, friendRequestSent == Enum.FriendStatus.Friend)
					
					return
				end
			end):catch(function(p51) --[[ line: 704 ]]
				-- upvalues: p49 (ref), fFlagSduiRequestFriendshipAction (copy), var37 (copy), UpdateIsFriendsWith (copy)
				if (if type(p51) == "table" then p51.firstErrorCode else nil) ~= 5 then
					error(p51)
					
					return
				end
				local var118 = p49
				local friend = Enum.FriendStatus.Friend
				
				if fFlagSduiRequestFriendshipAction then
					var37.replaceItem(var118, friend)
					UpdateIsFriendsWith(var118, friend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		AcceptFriendRequest = function(p52) --[[ line: 725 ]]
			-- upvalues: requestsModule (copy), fFlagSduiRequestFriendshipAction (copy), var37 (ref), UpdateIsFriendsWith (ref)
			return requestsModule.AcceptFriendRequestFromUserId(p52):andThen(function() --[[ line: 727 ]]
				-- upvalues: p52 (ref), fFlagSduiRequestFriendshipAction (copy), var37 (copy), UpdateIsFriendsWith (copy)
				local friend = Enum.FriendStatus.Friend
				
				if fFlagSduiRequestFriendshipAction then
					var37.replaceItem(p52, friend)
					UpdateIsFriendsWith(p52, friend == Enum.FriendStatus.Friend)
					
					return
				end
			end):catch(function(p53) --[[ line: 730 ]]
				-- upvalues: p52 (ref), fFlagSduiRequestFriendshipAction (copy), var37 (copy), UpdateIsFriendsWith (copy)
				if (if type(p53) == "table" then p53.firstErrorCode else nil) ~= 5 then
					error(p53)
					
					return
				end
				local var119 = p52
				local friend = Enum.FriendStatus.Friend
				
				if fFlagSduiRequestFriendshipAction then
					var37.replaceItem(var119, friend)
					UpdateIsFriendsWith(var119, friend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		DeclineFriendRequest = function(p54) --[[ line: 748 ]]
			-- upvalues: requestsModule (copy), fFlagSduiRequestFriendshipAction (copy), var37 (ref), UpdateIsFriendsWith (ref)
			return requestsModule.DeclineFriendRequestFromUserId(p54):andThen(function() --[[ line: 749 ]]
				-- upvalues: p54 (ref), fFlagSduiRequestFriendshipAction (copy), var37 (copy), UpdateIsFriendsWith (copy)
				local notFriend = Enum.FriendStatus.NotFriend
				
				if fFlagSduiRequestFriendshipAction then
					var37.replaceItem(p54, notFriend)
					UpdateIsFriendsWith(p54, notFriend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		RefetchOnlineFriends = function() --[[ line: 754 ]]
			-- upvalues: var43 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var121
			local fetchItem = var43.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var122 = getLocalPlayerUserId()
				var121 = if var122 then tostring(var122) else ""
			else
				var121 = currentUserId
			end
			fetchItem(var121)
		end,
		clear = function() --[[ line: 802 ]]
			-- upvalues: var43 (ref), var44 (ref), var46 (ref), fFlagSduiRequestFriendshipAction (copy), var45 (ref), t (ref)
			var43.clear()
			var44.clear()
			var46.clear()
			
			if fFlagSduiRequestFriendshipAction then
				var45.clear()
			end
			table.clear(t)
		end,
		dispose = function() --[[ line: 812 ]]
			-- upvalues: var43 (ref), var44 (ref), var46 (ref), fFlagSduiRequestFriendshipAction (copy), var45 (ref), t (ref)
			var43.dispose()
			var44.dispose()
			var46.dispose()
			
			if fFlagSduiRequestFriendshipAction then
				var45.dispose()
			end
			table.clear(t)
		end,
		_fetchOnlineFriendsAsync = function() --[[ line: 760 ]]
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), applyGetOnlineFriendsResponseBody (ref), var33 (ref)
			local var124
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var125 = getLocalPlayerUserId()
				var124 = if var125 then tostring(var125) else ""
			else
				var124 = currentUserId
			end
			return requestsModule.GetOnlineFriends(var124):andThen(function(p56) --[[ line: 763 ]]
				-- upvalues: applyGetOnlineFriendsResponseBody (copy), var33 (copy), var124 (ref)
				var33.replaceItems({ [var124] = applyGetOnlineFriendsResponseBody(p56) })
				
				return p56 or { data = nil }
			end):catch(function(p55) --[[ line: 768 ]]
				error(p55)
			end)
		end,
		_updateFriendsPresences = function(p57, p58, _) --[[ line: 773 ]]
			-- upvalues: normalizeStoredOnlineFriendRow (copy), normalizePresenceRawDataModule (copy), var31 (ref), var35 (ref), var38 (ref), var33 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			if not p57 then return end
			p58 = p58 or {}
			local t = {}
			
			for i, v in pairs(p57) do
				local userId = v.userId
				local var131 = if not userId then nil else tostring(userId)
				
				if var131 then
					local var132 = normalizePresenceRawDataModule(v)
					t[var131] = normalizeStoredOnlineFriendRow({ id = var131, sortScore = p58[var131] })
					var31.UpdateUserPresence(var131, var132, { isUpdatedRealtime = true })
					var35.replaceItem(var131, true)
					var38(var131)
				end
			end
			local var129
			local updateItem = var33.updateItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var130 = getLocalPlayerUserId()
				var129 = if var130 then tostring(var130) else ""
			else
				var129 = currentUserId
			end
			updateItem(var129, t)
		end
	}
end