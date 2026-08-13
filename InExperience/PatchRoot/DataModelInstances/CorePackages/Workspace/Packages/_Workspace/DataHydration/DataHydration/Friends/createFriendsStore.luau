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
local requestsModule = require(dataHydration.Friends.Requests)
local findFriendsSortModule = require(dataHydration.Friends.Enums.FindFriendsSort)
local mapFriendshipStatusToEnumModule = require(dataHydration.Friends.mapFriendshipStatusToEnum)
local presenceStoreModule = require(dataHydration.Presence.PresenceStore)
local normalizePresenceRawDataModule = require(dataHydration.Presence.normalizePresenceRawData)
local presenceTypeModule = require(dataHydration.Presence.Enums.PresenceType)
local _ = require(dataHydration.Presence.createPresenceStore)
game:DefineFastInt("FriendsStoreProcessDelaySec", 1)

local function _() --[[ line: 118 | named "getFIntFriendsStoreProcessDelaySec" ]]
	return game:GetFastInt("FriendsStoreProcessDelaySec")
end

local onlineFriendsCacheTtlSec = game:DefineFastInt("OnlineFriendsCacheTtlSec", 0)
local isFriendsWithCacheTtlSec = game:DefineFastInt("IsFriendsWithCacheTtlSec", 0)
local allFriendsCacheTtlSec = game:DefineFastInt("AllFriendsCacheTtlSec", 0)
local friendshipStatusCacheTtlSec = game:DefineFastInt("FriendshipStatusCacheTtlSec", 0)

local _ = function(p0) --[[ line: 127 | named "getCacheTTL" ]]
	return if p0 and p0 > 0 then p0 else 1e999
end

local friendsPageSize = game:DefineFastInt("FriendsPageSize", 50)
local initialFriendsPageSize = game:DefineFastInt("InitialFriendsPageSize", 20)

local _ = function(p1) --[[ line: 134 | named "normalizeId" ]]
	return if p1 then tostring(p1) else nil
end

local function normalizeStoredOnlineFriendRow(p2) --[[ line: 142 ]]
	return if p2 and type(p2) == "table" and p2.id ~= nil then {
		id = tostring(p2.id),
		sortScore = tonumber(p2.sortScore) or 0
	} else nil
end

local function normalizePresenceFromOnlineFriendsRow(p3) --[[ line: 154 ]]
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

local _ = function(p4) --[[ line: 176 | named "normalizeFindFriendsNextCursor" ]]
	return if p4 == nil or p4 == "" then nil else p4
end

local function normalizeFindFriendsPageResponse(p5) --[[ line: 183 ]]
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

local function mergeListsWithoutDuplicates_1(p6, p7, p8) --[[ line: 206 | named "mergeListsWithoutDuplicates" ]]
	-- upvalues: cryoModule (ref)
	if p7 and #p7 ~= 0 then
		if p6 and #p6 ~= 0 then
			local var27 = cryoModule.List.toSet(cryoModule.List.map(p6, function(p9) --[[ line: 214 ]]
				-- upvalues: p8 (ref)
				return if p8 then p9[p8] else p9
			end))
			
			return cryoModule.List.join(table.clone(p6), cryoModule.List.filter(p7, function(p10) --[[ line: 219 ]]
				-- upvalues: p8 (ref), var27 (ref)
				return not var27[if p8 then p10[p8] else p10]
			end))
		end
		return p7
	else
		return p6 or {}
	end
end

local function mergeAllFriendsPage(p11, p12, p13) --[[ line: 227 ]]
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

local _ = function(p14) --[[ line: 259 | named "resolveLocalUserId" ]]
	-- upvalues: localUserIdStore (ref), getLocalPlayerUserId (ref)
	local currentUserId = localUserIdStore.getCurrentUserId(p14)
	
	if currentUserId ~= "" then
		return currentUserId
	end
	local var30 = getLocalPlayerUserId()
	
	return if var30 then tostring(var30) else ""
end

return function() --[[ line: 268 | named "createFriendsStore" ]]
	-- upvalues: presenceStoreModule (ref), createDataCacheModule (ref), onlineFriendsCacheTtlSec (ref), isFriendsWithCacheTtlSec (ref), allFriendsCacheTtlSec (ref), fFlagEnableGetFriendshipStatus (ref), fFlagSduiRequestFriendshipAction (ref), friendshipStatusCacheTtlSec (ref), localUserIdStore (ref), getLocalPlayerUserId (ref), fFlagAddFriendsPageTrustedFriendRequestSection (ref), mergeListsWithoutDuplicates (ref), mergeListsWithoutDuplicates_1 (ref), normalizePresenceRawDataModule (ref), presenceTypeModule (ref), normalizeStoredOnlineFriendRow (ref), normalizePresenceFromOnlineFriendsRow (ref), createDataResolverModule (ref), requestsModule (ref), mapFriendshipStatusToEnumModule (ref), cryoModule (ref), friendsPageSize (ref), initialFriendsPageSize (ref), findFriendsSortModule (ref), normalizeFindFriendsPageResponse (ref), mergeAllFriendsPage (ref), signalsModule (ref), fFlagFriendsStoreSortOnlineFriendsByRank (ref), dataStatus (ref)
	local var36
	local var31 = presenceStoreModule.get()
	local var32 = createDataCacheModule(if onlineFriendsCacheTtlSec and onlineFriendsCacheTtlSec > 0 then onlineFriendsCacheTtlSec else 1e999)
	local var33 = isFriendsWithCacheTtlSec
	local var34 = createDataCacheModule(if var33 and var33 > 0 then var33 else 1e999)
	var33 = if allFriendsCacheTtlSec and allFriendsCacheTtlSec > 0 then allFriendsCacheTtlSec else 1e999
	local var35 = createDataCacheModule(var33)
	var33 = false
	
	if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
		local var37 = friendshipStatusCacheTtlSec
		var36 = createDataCacheModule(if var37 and var37 > 0 then var37 else 1e999)
	else
		var36 = nil
	end
	local t = {}
	
	local function var37(p15) --[[ line: 308 | named "appendUserToAllFriends" ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var35 (ref), fFlagAddFriendsPageTrustedFriendRequestSection (copy), mergeListsWithoutDuplicates (copy), mergeListsWithoutDuplicates_1 (copy)
		local var54
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var55 = getLocalPlayerUserId()
			var54 = if var55 then tostring(var55) else ""
		else
			var54 = currentUserId
		end
		local var56 = var35.getItem(var54).data(false)
		
		if var56 then
			local var57 = if fFlagAddFriendsPageTrustedFriendRequestSection then mergeListsWithoutDuplicates(var56.friends, { { id = p15 } }, "id") else mergeListsWithoutDuplicates_1(var56.friends, { { id = p15 } }, "id")
			
			if #var57 == #var56.friends then return end
			var35.replaceItem(var54, {
				friends = var57,
				nextCursor = var56.nextCursor,
				hasMore = var56.hasMore
			})
		end
	end
	
	local function UpdateIsFriendsWith(p16, p17) --[[ line: 326 ]]
		-- upvalues: var34 (ref), var37 (ref), fFlagEnableGetFriendshipStatus (copy), var36 (ref), var31 (ref)
		var34.replaceItem(p16, p17)
		
		if p17 then
			var37(p16)
			
			if fFlagEnableGetFriendshipStatus then
				var36.replaceItem(p16, Enum.FriendStatus.Friend)
			end
		end
		if not p17 then
			var31.UpdateUserPresence(p16, nil, { isUpdatedRealtime = false })
		end
	end
	
	local function _(p18, p19) --[[ line: 344 | named "updateOnlineFriendDependecies" ]]
		-- upvalues: var31 (ref), var34 (ref), var37 (ref), fFlagEnableGetFriendshipStatus (copy), var36 (ref)
		var31.UpdateUserPresence(p18, p19, { isUpdatedRealtime = true })
		var34.replaceItem(p18, true)
		var37(p18)
		
		if fFlagEnableGetFriendshipStatus then
			var36.replaceItem(p18, Enum.FriendStatus.Friend)
		end
	end
	
	local function updateOfflineFriendDependencies(p20) --[[ line: 351 ]]
		-- upvalues: var31 (ref), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), var34 (ref), var37 (ref), fFlagEnableGetFriendshipStatus (copy), var36 (ref)
		var31.UpdateUserPresence(p20, var31.GetPresenceByUserId(p20, { skipFetch = true }).data(false) or normalizePresenceRawDataModule({ userPresenceType = presenceTypeModule.Offline }), { isUpdatedRealtime = true })
		var34.replaceItem(p20, true)
		var37(p20)
		
		if fFlagEnableGetFriendshipStatus then
			var36.replaceItem(p20, Enum.FriendStatus.Friend)
		end
	end
	
	local function applyGetOnlineFriendsResponseBody(p21) --[[ line: 365 ]]
		-- upvalues: normalizeStoredOnlineFriendRow (copy), normalizePresenceFromOnlineFriendsRow (copy), var31 (ref), var34 (ref), var37 (ref), fFlagEnableGetFriendshipStatus (copy), var36 (ref)
		local t = {}
		
		for i, v in if p21 then p21.data else {} do
			local id = v.id
			local var59 = if not id then nil else tostring(id)
			local var60 = normalizeStoredOnlineFriendRow(v)
			local var61 = normalizePresenceFromOnlineFriendsRow(v)
			
			if var59 then
				t[var59] = var60
				var31.UpdateUserPresence(var59, var61, { isUpdatedRealtime = true })
				var34.replaceItem(var59, true)
				var37(var59)
				
				if fFlagEnableGetFriendshipStatus then
					var36.replaceItem(var59, Enum.FriendStatus.Friend)
				end
			end
		end
		return t
	end
	
	local var42 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var32,
		fetchFn = function(p22, p23) --[[ line: 388 ]]
			-- upvalues: requestsModule (copy), var31 (ref), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), applyGetOnlineFriendsResponseBody (ref)
			local var62 = p23.data(false) or {}
			
			return requestsModule.GetOnlineFriends(p22):andThen(function(p25) --[[ line: 392 ]]
				-- upvalues: var62 (ref), var31 (copy), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), applyGetOnlineFriendsResponseBody (copy)
				for i, v in var62 do
					local id = v and v.id
					local var64 = if not id then nil else tostring(id)
					
					if var64 then
						var31.UpdateUserPresence(var64, normalizePresenceRawDataModule({ userPresenceType = presenceTypeModule.Offline }), { isUpdatedRealtime = true })
					end
				end
				return applyGetOnlineFriendsResponseBody(p25)
			end):catch(function(p24) --[[ line: 409 ]]
				error(p24)
			end)
		end
	})
	
	local _ = function(p26) --[[ line: 418 | named "fetchFriendshipStatuses" ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), mapFriendshipStatusToEnumModule (copy)
		local var66
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var67 = getLocalPlayerUserId()
			var66 = if var67 then tostring(var67) else ""
		else
			var66 = currentUserId
		end
		return requestsModule.MultiGetFriendshipStatuses(var66, p26):andThen(function(p27) --[[ line: 421 ]]
			-- upvalues: mapFriendshipStatusToEnumModule (copy)
			local t = {}
			
			for i, v in if p27 then p27.data else {} do
				local id = v.id
				local var69 = if not id then nil else tostring(id)
				
				if var69 then
					t[var69] = mapFriendshipStatusToEnumModule(v.status)
				end
			end
			return t
		end)
	end
	
	local var43 = createDataResolverModule({
		cache = var34,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p28) --[[ line: 440 ]]
			-- upvalues: cryoModule (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), mapFriendshipStatusToEnumModule (copy), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var36 (ref)
			local var72
			local var70 = cryoModule.Dictionary.keys(p28)
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var73 = getLocalPlayerUserId()
				var72 = if var73 then tostring(var73) else ""
			else
				var72 = currentUserId
			end
			return requestsModule.MultiGetFriendshipStatuses(var72, var70):andThen(function(p30) --[[ line: 421 ]]
				-- upvalues: mapFriendshipStatusToEnumModule (copy)
				local t = {}
				
				for i, v in if p30 then p30.data else {} do
					local id = v.id
					local var69 = if not id then nil else tostring(id)
					
					if var69 then
						t[var69] = mapFriendshipStatusToEnumModule(v.status)
					end
				end
				return t
			end):andThen(function(p29) --[[ line: 442 ]]
				-- upvalues: fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var36 (copy)
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var36.replaceItems(p29)
				end
				local t = {}
				
				for i, v in p29 do
					t[i] = v == Enum.FriendStatus.Friend
				end
				return t
			end)
		end
	})
	local var44 = if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then createDataResolverModule({
		cache = var36,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p31) --[[ line: 464 ]]
			-- upvalues: cryoModule (copy), localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), mapFriendshipStatusToEnumModule (copy), var34 (ref)
			local var77
			local var75 = cryoModule.Dictionary.keys(p31)
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var78 = getLocalPlayerUserId()
				var77 = if var78 then tostring(var78) else ""
			else
				var77 = currentUserId
			end
			return requestsModule.MultiGetFriendshipStatuses(var77, var75):andThen(function(p33) --[[ line: 421 ]]
				-- upvalues: mapFriendshipStatusToEnumModule (copy)
				local t = {}
				
				for i, v in if p33 then p33.data else {} do
					local id = v.id
					local var69 = if not id then nil else tostring(id)
					
					if var69 then
						t[var69] = mapFriendshipStatusToEnumModule(v.status)
					end
				end
				return t
			end):andThen(function(p32) --[[ line: 466 ]]
				-- upvalues: var34 (copy)
				local t = {}
				
				for i, v in p32 do
					t[i] = v == Enum.FriendStatus.Friend
				end
				var34.replaceItems(t)
				
				return p32
			end)
		end
	}) else nil
	local var45 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var35,
		fetchFn = function(p34, p35) --[[ line: 485 ]]
			-- upvalues: var33 (write), friendsPageSize (copy), initialFriendsPageSize (copy), requestsModule (copy), findFriendsSortModule (copy), normalizeFindFriendsPageResponse (copy), updateOfflineFriendDependencies (ref), mergeAllFriendsPage (copy)
			local var80 = if var33 then nil else p35.data(false)
			var33 = false
			local var81 = if var80 then var80.nextCursor else nil
			
			return requestsModule.GetFindFriendsPage(p34, {
				limit = if var80 then friendsPageSize else initialFriendsPageSize,
				cursor = var81,
				sort = findFriendsSortModule.FriendshipScore
			}):andThen(function(p37) --[[ line: 497 ]]
				-- upvalues: normalizeFindFriendsPageResponse (copy), updateOfflineFriendDependencies (copy), mergeAllFriendsPage (copy), var80 (ref), var81 (ref)
				local var82 = normalizeFindFriendsPageResponse(p37)
				
				for i, v in var82.friends do
					updateOfflineFriendDependencies(v.id)
				end
				return mergeAllFriendsPage(var80, var82, var81)
			end):catch(function(p36) --[[ line: 505 ]]
				error(p36)
			end)
		end
	})
	local var46 = signalsModule.createComputed(function(p38) --[[ line: 523 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var42 (ref), var31 (ref), var43 (ref), presenceTypeModule (copy), fFlagFriendsStoreSortOnlineFriendsByRank (copy)
		local var84
		local currentUserId = localUserIdStore.getCurrentUserId(p38)
		
		if currentUserId == "" then
			local var85 = getLocalPlayerUserId()
			var84 = if var85 then tostring(var85) else ""
		else
			var84 = currentUserId
		end
		local var86 = var42.getAndFetchItem(var84).data(p38)
		
		if var86 == nil then
			return nil
		end
		local t = {}
		
		for i, v in pairs(var86) do
			if v then
				local var88 = var31.GetPresenceByUserId(v.id, { skipFetch = true }).data(p38)
				
				if var43.getCachedItem(v.id).data(p38) and var88 and (var88.userPresenceType and var88.userPresenceType ~= presenceTypeModule.Offline) then
					table.insert(t, { id = v.id, sortScore = v.sortScore, presence = var88 })
				end
			end
		end
		if fFlagFriendsStoreSortOnlineFriendsByRank then
			table.sort(t, function(p39, p40) --[[ line: 555 ]]
				return p40.sortScore < p39.sortScore
			end)
		end
		return t
	end)
	
	local function GetOnlineFriends() --[[ line: 563 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var42 (ref), var46 (ref)
		local var90
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var91 = getLocalPlayerUserId()
			var90 = if var91 then tostring(var91) else ""
		else
			var90 = currentUserId
		end
		var42.getAndFetchItem(var90)
		
		return var46
	end
	
	local var48 = signalsModule.createComputed(function(p41) --[[ line: 570 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var42 (ref)
		local var93
		local currentUserId = localUserIdStore.getCurrentUserId(p41)
		
		if currentUserId == "" then
			local var94 = getLocalPlayerUserId()
			var93 = if var94 then tostring(var94) else ""
		else
			var93 = currentUserId
		end
		return var42.getCachedItem(var93).status(p41)
	end)
	
	local function GetOnlineFriendsStatus() --[[ line: 575 ]]
		-- upvalues: var48 (ref)
		return var48
	end
	
	local function GetOnlineFriendsByUniverseId(p42) --[[ line: 579 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var42 (ref), t (ref), signalsModule (copy), var46 (ref)
		local var96
		local currentUserId = localUserIdStore.getCurrentUserId(false)
		
		if currentUserId == "" then
			local var97 = getLocalPlayerUserId()
			var96 = if var97 then tostring(var97) else ""
		else
			var96 = currentUserId
		end
		var42.getAndFetchItem(var96)
		local var98 = t[p42]
		
		if var98 then
			return var98
		end
		local var99 = signalsModule.createComputed(function(p43) --[[ line: 588 ]]
			-- upvalues: var46 (copy), p42 (ref)
			local var100 = var46(p43)
			
			if not var100 then
				return {}
			end
			local t = {}
			
			for i, v in var100 do
				if v.presence and v.presence.universeId == p42 then
					table.insert(t, v)
				end
			end
			return t
		end)
		t[p42] = var99
		
		return var99
	end
	
	local var51 = signalsModule.createComputed(function(p44) --[[ line: 607 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var45 (ref), cryoModule (copy), var43 (ref)
		local var103
		local currentUserId = localUserIdStore.getCurrentUserId(p44)
		
		if currentUserId == "" then
			local var104 = getLocalPlayerUserId()
			var103 = if var104 then tostring(var104) else ""
		else
			var103 = currentUserId
		end
		local var105 = var45.getAndFetchItem(var103).data(p44)
		
		return if var105 == nil then nil else {
			friends = cryoModule.List.filter(var105.friends or {}, function(p45) --[[ line: 618 ]]
				-- upvalues: var43 (copy), p44 (ref)
				return var43.getCachedItem(p45.id).data(p44)
			end),
			hasMore = var105.hasMore,
			nextCursor = var105.nextCursor
		}
	end)
	local var52 = signalsModule.createComputed(function(p46) --[[ line: 629 ]]
		-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var45 (ref)
		local var107
		local currentUserId = localUserIdStore.getCurrentUserId(p46)
		
		if currentUserId == "" then
			local var108 = getLocalPlayerUserId()
			var107 = if var108 then tostring(var108) else ""
		else
			var107 = currentUserId
		end
		return var45.getCachedItem(var107).status(p46)
	end)
	
	return {
		GetOnlineFriends = GetOnlineFriends,
		GetOnlineFriendsStatus = GetOnlineFriendsStatus,
		GetOnlineFriendsByUniverseId = GetOnlineFriendsByUniverseId,
		GetAllFriends = function() --[[ line: 634 ]]
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var45 (ref), var51 (ref)
			local var110
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var111 = getLocalPlayerUserId()
				var110 = if var111 then tostring(var111) else ""
			else
				var110 = currentUserId
			end
			var45.getAndFetchItem(var110)
			
			return var51
		end,
		GetAllFriendsStatus = function() --[[ line: 641 ]]
			-- upvalues: var52 (ref)
			return var52
		end,
		FetchMoreFriends = function() --[[ line: 645 ]]
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), var45 (ref), dataStatus (copy)
			local var113
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var114 = getLocalPlayerUserId()
				var113 = if var114 then tostring(var114) else ""
			else
				var113 = currentUserId
			end
			local cachedItem = var45.getCachedItem(var113)
			local var116 = cachedItem.data(false)
			
			if var116 == nil or not var116.hasMore or var116.nextCursor == nil then return end
			if cachedItem.status(false) == dataStatus.NotReady then return end
			if var45.isRequestInQueueOrInFlight(var113) then
				return
			end
			var45.fetchItem(var113)
		end,
		RefetchAllFriends = function() --[[ line: 665 ]]
			-- upvalues: var33 (write), var45 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var118
			var33 = true
			local fetchItem = var45.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var119 = getLocalPlayerUserId()
				var118 = if var119 then tostring(var119) else ""
			else
				var118 = currentUserId
			end
			fetchItem(var118)
		end,
		GetIsFriendWith = function(p47) --[[ line: 671 ]]
			-- upvalues: var43 (ref)
			return var43.getAndFetchItem(p47)
		end,
		UpdateIsFriendsWith = UpdateIsFriendsWith,
		GetFriendshipStatus = function(p48, p49) --[[ line: 675 ]]
			-- upvalues: fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var44 (ref)
			return if not (not fFlagEnableGetFriendshipStatus and not fFlagSduiRequestFriendshipAction or p48 == "") then if fFlagEnableGetFriendshipStatus and p49 and p49.skipFetch then var44.getCachedItem(p48) else var44.getAndFetchItem(p48) else nil
		end,
		UpdateFriendshipStatus = function(p50, p51) --[[ line: 685 ]]
			-- upvalues: fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var36 (ref), UpdateIsFriendsWith (ref)
			if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
				var36.replaceItem(p50, p51)
				UpdateIsFriendsWith(p50, p51 == Enum.FriendStatus.Friend)
				
				return
			end
		end,
		RequestFriendship = function(p52, p53, p54) --[[ line: 694 ]]
			-- upvalues: fFlagEnableGetFriendshipStatus (copy), requestsModule (copy), fFlagSduiRequestFriendshipAction (copy), var36 (ref), UpdateIsFriendsWith (ref)
			return (if fFlagEnableGetFriendshipStatus and p54 and p54.isContact then requestsModule.RequestFriendshipFromContactId(p52) else requestsModule.RequestFriendshipFromUserId(p52, p53)):andThen(function() --[[ line: 701 ]]
				-- upvalues: p52 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var36 (copy), UpdateIsFriendsWith (copy)
				local friendRequestSent = Enum.FriendStatus.FriendRequestSent
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var36.replaceItem(p52, friendRequestSent)
					UpdateIsFriendsWith(p52, friendRequestSent == Enum.FriendStatus.Friend)
					
					return
				end
			end):catch(function(p55) --[[ line: 704 ]]
				-- upvalues: p52 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var36 (copy), UpdateIsFriendsWith (copy)
				if (if type(p55) == "table" then p55.firstErrorCode else nil) ~= 5 then
					error(p55)
					
					return
				end
				local var120 = p52
				local friend = Enum.FriendStatus.Friend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var36.replaceItem(var120, friend)
					UpdateIsFriendsWith(var120, friend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		AcceptFriendRequest = function(p56) --[[ line: 719 ]]
			-- upvalues: requestsModule (copy), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var36 (ref), UpdateIsFriendsWith (ref)
			return requestsModule.AcceptFriendRequestFromUserId(p56):andThen(function() --[[ line: 721 ]]
				-- upvalues: p56 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var36 (copy), UpdateIsFriendsWith (copy)
				local friend = Enum.FriendStatus.Friend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var36.replaceItem(p56, friend)
					UpdateIsFriendsWith(p56, friend == Enum.FriendStatus.Friend)
					
					return
				end
			end):catch(function(p57) --[[ line: 724 ]]
				-- upvalues: p56 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var36 (copy), UpdateIsFriendsWith (copy)
				if (if type(p57) == "table" then p57.firstErrorCode else nil) ~= 5 then
					error(p57)
					
					return
				end
				local var121 = p56
				local friend = Enum.FriendStatus.Friend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var36.replaceItem(var121, friend)
					UpdateIsFriendsWith(var121, friend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		DeclineFriendRequest = function(p58) --[[ line: 737 ]]
			-- upvalues: requestsModule (copy), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var36 (ref), UpdateIsFriendsWith (ref)
			return requestsModule.DeclineFriendRequestFromUserId(p58):andThen(function() --[[ line: 738 ]]
				-- upvalues: p58 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var36 (copy), UpdateIsFriendsWith (copy)
				local notFriend = Enum.FriendStatus.NotFriend
				
				if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
					var36.replaceItem(p58, notFriend)
					UpdateIsFriendsWith(p58, notFriend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		RefetchOnlineFriends = function() --[[ line: 743 ]]
			-- upvalues: var42 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			local var123
			local fetchItem = var42.fetchItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var124 = getLocalPlayerUserId()
				var123 = if var124 then tostring(var124) else ""
			else
				var123 = currentUserId
			end
			fetchItem(var123)
		end,
		clear = function() --[[ line: 791 ]]
			-- upvalues: var42 (ref), var43 (ref), var45 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var44 (ref), t (ref)
			var42.clear()
			var43.clear()
			var45.clear()
			
			if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
				var44.clear()
			end
			table.clear(t)
		end,
		dispose = function() --[[ line: 801 ]]
			-- upvalues: var42 (ref), var43 (ref), var45 (ref), fFlagEnableGetFriendshipStatus (copy), fFlagSduiRequestFriendshipAction (copy), var44 (ref), t (ref)
			var42.dispose()
			var43.dispose()
			var45.dispose()
			
			if fFlagEnableGetFriendshipStatus or fFlagSduiRequestFriendshipAction then
				var44.dispose()
			end
			table.clear(t)
		end,
		_fetchOnlineFriendsAsync = function() --[[ line: 749 ]]
			-- upvalues: localUserIdStore (copy), getLocalPlayerUserId (copy), requestsModule (copy), applyGetOnlineFriendsResponseBody (ref), var32 (ref)
			local var126
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var127 = getLocalPlayerUserId()
				var126 = if var127 then tostring(var127) else ""
			else
				var126 = currentUserId
			end
			return requestsModule.GetOnlineFriends(var126):andThen(function(p60) --[[ line: 752 ]]
				-- upvalues: applyGetOnlineFriendsResponseBody (copy), var32 (copy), var126 (ref)
				var32.replaceItems({ [var126] = applyGetOnlineFriendsResponseBody(p60) })
				
				return p60 or { data = nil }
			end):catch(function(p59) --[[ line: 757 ]]
				error(p59)
			end)
		end,
		_updateFriendsPresences = function(p61, p62, _) --[[ line: 762 ]]
			-- upvalues: normalizeStoredOnlineFriendRow (copy), normalizePresenceRawDataModule (copy), var31 (ref), var34 (ref), var37 (ref), fFlagEnableGetFriendshipStatus (copy), var36 (ref), var32 (ref), localUserIdStore (copy), getLocalPlayerUserId (copy)
			if not p61 then return end
			p62 = p62 or {}
			local t = {}
			
			for i, v in pairs(p61) do
				local userId = v.userId
				local var133 = if not userId then nil else tostring(userId)
				
				if var133 then
					local var134 = normalizePresenceRawDataModule(v)
					t[var133] = normalizeStoredOnlineFriendRow({ id = var133, sortScore = p62[var133] })
					var31.UpdateUserPresence(var133, var134, { isUpdatedRealtime = true })
					var34.replaceItem(var133, true)
					var37(var133)
					
					if fFlagEnableGetFriendshipStatus then
						var36.replaceItem(var133, Enum.FriendStatus.Friend)
					end
				end
			end
			local var131
			local updateItem = var32.updateItem
			local currentUserId = localUserIdStore.getCurrentUserId(false)
			
			if currentUserId == "" then
				local var132 = getLocalPlayerUserId()
				var131 = if var132 then tostring(var132) else ""
			else
				var131 = currentUserId
			end
			updateItem(var131, t)
		end
	}
end