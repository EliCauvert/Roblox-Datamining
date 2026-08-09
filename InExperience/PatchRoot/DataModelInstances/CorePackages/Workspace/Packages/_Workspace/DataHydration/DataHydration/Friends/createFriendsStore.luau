local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local createDataCacheModule = require(dataHydration.createDataCache)
local createDataResolverModule = require(dataHydration.createDataResolver)
local dataStatus = require(dataHydration.DataHydrationTypes).DataStatus
local getLocalPlayerUserId = require(dataHydration.DataHydrationUtils).getLocalPlayerUserId
local cryoModule = require(parent.Cryo)
local signalsModule = require(parent.Signals)
local fFlagSduiRequestFriendshipAction = require(parent.SharedFlags).FFlagSduiRequestFriendshipAction
local requestsModule = require(dataHydration.Friends.Requests)
local findFriendsSortModule = require(dataHydration.Friends.Enums.FindFriendsSort)
local mapFriendshipStatusToEnumModule = require(dataHydration.Friends.mapFriendshipStatusToEnum)
local presenceStoreModule = require(dataHydration.Presence.PresenceStore)
local normalizePresenceRawDataModule = require(dataHydration.Presence.normalizePresenceRawData)
local presenceTypeModule = require(dataHydration.Presence.Enums.PresenceType)
local _ = require(dataHydration.Presence.createPresenceStore)
game:DefineFastInt("FriendsStoreProcessDelaySec", 1)

local function _() --[[ line: 110 | named "getFIntFriendsStoreProcessDelaySec" ]]
	return game:GetFastInt("FriendsStoreProcessDelaySec")
end

local onlineFriendsCacheTtlSec = game:DefineFastInt("OnlineFriendsCacheTtlSec", 0)
local isFriendsWithCacheTtlSec = game:DefineFastInt("IsFriendsWithCacheTtlSec", 0)
local allFriendsCacheTtlSec = game:DefineFastInt("AllFriendsCacheTtlSec", 0)
local friendshipStatusCacheTtlSec = game:DefineFastInt("FriendshipStatusCacheTtlSec", 0)

local _ = function(p0) --[[ line: 119 | named "getCacheTTL" ]]
	return if p0 and p0 > 0 then p0 else 1e999
end

local friendsPageSize = game:DefineFastInt("FriendsPageSize", 50)
local initialFriendsPageSize = game:DefineFastInt("InitialFriendsPageSize", 20)

local _ = function(p1) --[[ line: 126 | named "normalizeId" ]]
	return if p1 then tostring(p1) else nil
end

local function normalizeStoredOnlineFriendRow(p2) --[[ line: 134 ]]
	return if p2 and type(p2) == "table" and p2.id ~= nil then {
		id = tostring(p2.id),
		sortScore = tonumber(p2.sortScore) or 0
	} else nil
end

local function normalizePresenceFromOnlineFriendsRow(p3) --[[ line: 146 ]]
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

local _ = function(p4) --[[ line: 168 | named "normalizeFindFriendsNextCursor" ]]
	return if p4 == nil or p4 == "" then nil else p4
end

local function normalizeFindFriendsPageResponse(p5) --[[ line: 175 ]]
	local t = {}
	
	for i, v in if p5 and p5.PageItems then p5.PageItems else {} do
		local id = v.id
		local var25 = if not id then nil else tostring(id)
		
		if var25 then
			table.insert(t, { id = var25 })
		end
	end
	local var23 = if p5 then p5.NextCursor else nil
	local var24 = if var23 == nil or var23 == "" then nil else var23
	var23 = if p5 and p5.HasMore ~= nil then p5.HasMore else var24 ~= nil
	
	return { friends = t, nextCursor = var24, hasMore = var23 }
end

local function mergeListsWithoutDuplicates(p6, p7, p8) --[[ line: 198 ]]
	-- upvalues: cryoModule (ref)
	if p7 and #p7 ~= 0 then
		if p6 and #p6 ~= 0 then
			local var26 = cryoModule.List.toSet(cryoModule.List.map(p6, function(p9) --[[ line: 206 ]]
				-- upvalues: p8 (ref)
				return if p8 then p9[p8] else p9
			end))
			
			return cryoModule.List.join(table.clone(p6), cryoModule.List.filter(p7, function(p10) --[[ line: 211 ]]
				-- upvalues: p8 (ref), var26 (ref)
				return not var26[if p8 then p10[p8] else p10]
			end))
		end
		return p7
	else
		return p6 or {}
	end
end

local function mergeAllFriendsPage(p11, p12, p13) --[[ line: 219 ]]
	-- upvalues: mergeListsWithoutDuplicates (ref)
	if not p11 then
		return {
			friends = p12.friends,
			nextCursor = p12.nextCursor,
			hasMore = p12.hasMore
		}
	end
	local nextCursor = p11.nextCursor
	local var27 = if nextCursor == nil or nextCursor == "" then nil else nextCursor
	nextCursor = if p13 == nil or p13 == "" then nil else p13
	
	return if var27 == nextCursor then {
		friends = mergeListsWithoutDuplicates(p11.friends, p12.friends, "id"),
		nextCursor = p12.nextCursor,
		hasMore = p12.hasMore
	} else p11
end

return function() --[[ line: 247 | named "createFriendsStore" ]]
	-- upvalues: getLocalPlayerUserId (ref), presenceStoreModule (ref), createDataCacheModule (ref), onlineFriendsCacheTtlSec (ref), isFriendsWithCacheTtlSec (ref), allFriendsCacheTtlSec (ref), fFlagSduiRequestFriendshipAction (ref), friendshipStatusCacheTtlSec (ref), mergeListsWithoutDuplicates (ref), normalizePresenceRawDataModule (ref), presenceTypeModule (ref), normalizeStoredOnlineFriendRow (ref), normalizePresenceFromOnlineFriendsRow (ref), createDataResolverModule (ref), requestsModule (ref), mapFriendshipStatusToEnumModule (ref), cryoModule (ref), friendsPageSize (ref), initialFriendsPageSize (ref), findFriendsSortModule (ref), normalizeFindFriendsPageResponse (ref), mergeAllFriendsPage (ref), signalsModule (ref), dataStatus (ref)
	local var34
	local var28 = tostring(getLocalPlayerUserId())
	local var29 = presenceStoreModule.get()
	local var30 = createDataCacheModule(if onlineFriendsCacheTtlSec and onlineFriendsCacheTtlSec > 0 then onlineFriendsCacheTtlSec else 1e999)
	local var31 = isFriendsWithCacheTtlSec
	local var32 = createDataCacheModule(if var31 and var31 > 0 then var31 else 1e999)
	var31 = if allFriendsCacheTtlSec and allFriendsCacheTtlSec > 0 then allFriendsCacheTtlSec else 1e999
	local var33 = createDataCacheModule(var31)
	var31 = false
	
	if fFlagSduiRequestFriendshipAction then
		local var35 = friendshipStatusCacheTtlSec
		var34 = createDataCacheModule(if var35 and var35 > 0 then var35 else 1e999)
	else
		var34 = nil
	end
	local t = {}
	
	local function var35(p14) --[[ line: 287 | named "appendUserToAllFriends" ]]
		-- upvalues: var33 (ref), var28 (ref), mergeListsWithoutDuplicates (copy)
		local var46 = var33.getItem(var28).data(false)
		
		if var46 then
			local var47 = mergeListsWithoutDuplicates(var46.friends, { { id = p14 } }, "id")
			
			if #var47 == #var46.friends then return end
			var33.replaceItem(var28, {
				friends = var47,
				nextCursor = var46.nextCursor,
				hasMore = var46.hasMore
			})
		end
	end
	
	local function UpdateIsFriendsWith(p15, p16) --[[ line: 302 ]]
		-- upvalues: var32 (ref), var35 (ref), var29 (ref)
		var32.replaceItem(p15, p16)
		
		if p16 then
			var35(p15)
		end
		if not p16 then
			var29.UpdateUserPresence(p15, nil, { isUpdatedRealtime = false })
		end
	end
	
	local function _(p17, p18) --[[ line: 317 | named "updateOnlineFriendDependecies" ]]
		-- upvalues: var29 (ref), var32 (ref), var35 (ref)
		var29.UpdateUserPresence(p17, p18, { isUpdatedRealtime = true })
		var32.replaceItem(p17, true)
		var35(p17)
	end
	
	local function updateOfflineFriendDependencies(p19) --[[ line: 324 ]]
		-- upvalues: var29 (ref), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), var32 (ref), var35 (ref)
		var29.UpdateUserPresence(p19, var29.GetPresenceByUserId(p19, { skipFetch = true }).data(false) or normalizePresenceRawDataModule({ userPresenceType = presenceTypeModule.Offline }), { isUpdatedRealtime = true })
		var32.replaceItem(p19, true)
		var35(p19)
	end
	
	local function applyGetOnlineFriendsResponseBody(p20) --[[ line: 338 ]]
		-- upvalues: normalizeStoredOnlineFriendRow (copy), normalizePresenceFromOnlineFriendsRow (copy), var29 (ref), var32 (ref), var35 (ref)
		local t = {}
		
		for i, v in if p20 then p20.data else {} do
			local id = v.id
			local var49 = if not id then nil else tostring(id)
			local var50 = normalizeStoredOnlineFriendRow(v)
			local var51 = normalizePresenceFromOnlineFriendsRow(v)
			
			if var49 then
				t[var49] = var50
				var29.UpdateUserPresence(var49, var51, { isUpdatedRealtime = true })
				var32.replaceItem(var49, true)
				var35(var49)
			end
		end
		return t
	end
	
	local var40 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var30,
		fetchFn = function(_, p21) --[[ line: 361 ]]
			-- upvalues: requestsModule (copy), var28 (ref), var29 (ref), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), applyGetOnlineFriendsResponseBody (ref)
			local var52 = p21.data(false) or {}
			
			return requestsModule.GetOnlineFriends(var28):andThen(function(p23) --[[ line: 365 ]]
				-- upvalues: var52 (ref), var29 (copy), normalizePresenceRawDataModule (copy), presenceTypeModule (copy), applyGetOnlineFriendsResponseBody (copy)
				for i, v in var52 do
					local id = v and v.id
					local var54 = if not id then nil else tostring(id)
					
					if var54 then
						var29.UpdateUserPresence(var54, normalizePresenceRawDataModule({ userPresenceType = presenceTypeModule.Offline }), { isUpdatedRealtime = true })
					end
				end
				return applyGetOnlineFriendsResponseBody(p23)
			end):catch(function(p22) --[[ line: 382 ]]
				error(p22)
			end)
		end
	})
	
	local _ = function(p24) --[[ line: 391 | named "fetchFriendshipStatuses" ]]
		-- upvalues: requestsModule (copy), var28 (ref), mapFriendshipStatusToEnumModule (copy)
		return requestsModule.MultiGetFriendshipStatuses(var28, p24):andThen(function(p25) --[[ line: 393 ]]
			-- upvalues: mapFriendshipStatusToEnumModule (copy)
			local t = {}
			
			for i, v in if p25 then p25.data else {} do
				local id = v.id
				local var56 = if not id then nil else tostring(id)
				
				if var56 then
					t[var56] = mapFriendshipStatusToEnumModule(v.status)
				end
			end
			return t
		end)
	end
	
	local var41 = createDataResolverModule({
		cache = var32,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p26) --[[ line: 412 ]]
			-- upvalues: cryoModule (copy), requestsModule (copy), var28 (ref), mapFriendshipStatusToEnumModule (copy), fFlagSduiRequestFriendshipAction (copy), var34 (ref)
			return requestsModule.MultiGetFriendshipStatuses(var28, cryoModule.Dictionary.keys(p26)):andThen(function(p28) --[[ line: 393 ]]
				-- upvalues: mapFriendshipStatusToEnumModule (copy)
				local t = {}
				
				for i, v in if p28 then p28.data else {} do
					local id = v.id
					local var56 = if not id then nil else tostring(id)
					
					if var56 then
						t[var56] = mapFriendshipStatusToEnumModule(v.status)
					end
				end
				return t
			end):andThen(function(p27) --[[ line: 414 ]]
				-- upvalues: fFlagSduiRequestFriendshipAction (copy), var34 (copy)
				if fFlagSduiRequestFriendshipAction then
					var34.replaceItems(p27)
				end
				local t = {}
				
				for i, v in p27 do
					t[i] = v == Enum.FriendStatus.Friend
				end
				return t
			end)
		end
	})
	local var42 = if fFlagSduiRequestFriendshipAction then createDataResolverModule({
		cache = var34,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p29) --[[ line: 435 ]]
			-- upvalues: cryoModule (copy), requestsModule (copy), var28 (ref), mapFriendshipStatusToEnumModule (copy), var32 (ref)
			return requestsModule.MultiGetFriendshipStatuses(var28, cryoModule.Dictionary.keys(p29)):andThen(function(p31) --[[ line: 393 ]]
				-- upvalues: mapFriendshipStatusToEnumModule (copy)
				local t = {}
				
				for i, v in if p31 then p31.data else {} do
					local id = v.id
					local var56 = if not id then nil else tostring(id)
					
					if var56 then
						t[var56] = mapFriendshipStatusToEnumModule(v.status)
					end
				end
				return t
			end):andThen(function(p30) --[[ line: 437 ]]
				-- upvalues: var32 (copy)
				local t = {}
				
				for i, v in p30 do
					t[i] = v == Enum.FriendStatus.Friend
				end
				var32.replaceItems(t)
				
				return p30
			end)
		end
	}) else nil
	local var43 = createDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = var33,
		fetchFn = function(_, p32) --[[ line: 456 ]]
			-- upvalues: var31 (write), friendsPageSize (copy), initialFriendsPageSize (copy), requestsModule (copy), var28 (ref), findFriendsSortModule (copy), normalizeFindFriendsPageResponse (copy), updateOfflineFriendDependencies (ref), mergeAllFriendsPage (copy)
			local var59 = if var31 then nil else p32.data(false)
			var31 = false
			local var60 = if var59 then var59.nextCursor else nil
			
			return requestsModule.GetFindFriendsPage(var28, {
				limit = if var59 then friendsPageSize else initialFriendsPageSize,
				cursor = var60,
				sort = findFriendsSortModule.FriendshipScore
			}):andThen(function(p34) --[[ line: 468 ]]
				-- upvalues: normalizeFindFriendsPageResponse (copy), updateOfflineFriendDependencies (copy), mergeAllFriendsPage (copy), var59 (ref), var60 (ref)
				local var61 = normalizeFindFriendsPageResponse(p34)
				
				for i, v in var61.friends do
					updateOfflineFriendDependencies(v.id)
				end
				return mergeAllFriendsPage(var59, var61, var60)
			end):catch(function(p33) --[[ line: 476 ]]
				error(p33)
			end)
		end
	})
	local var44 = signalsModule.createComputed(function(p35) --[[ line: 494 ]]
		-- upvalues: var40 (ref), var28 (ref), var29 (ref), var41 (ref), presenceTypeModule (copy)
		local var62 = var40.getAndFetchItem(var28).data(p35)
		
		if var62 == nil then
			return nil
		end
		local t = {}
		
		for i, v in pairs(var62) do
			if v then
				local var64 = var29.GetPresenceByUserId(v.id, { skipFetch = true }).data(p35)
				
				if var41.getCachedItem(v.id).data(p35) and var64 and (var64.userPresenceType and var64.userPresenceType ~= presenceTypeModule.Offline) then
					table.insert(t, { id = v.id, sortScore = v.sortScore, presence = var64 })
				end
			end
		end
		return t
	end)
	local var45 = signalsModule.createComputed(function(p36) --[[ line: 558 ]]
		-- upvalues: var43 (ref), var28 (ref), cryoModule (copy), var41 (ref)
		local var65 = var43.getAndFetchItem(var28).data(p36)
		
		return if var65 == nil then nil else {
			friends = cryoModule.List.filter(var65.friends or {}, function(p37) --[[ line: 568 ]]
				-- upvalues: var41 (copy), p36 (ref)
				return var41.getCachedItem(p37.id).data(p36)
			end),
			hasMore = var65.hasMore,
			nextCursor = var65.nextCursor
		}
	end)
	
	return {
		GetOnlineFriends = function() --[[ line: 527 ]]
			-- upvalues: var40 (ref), var28 (ref), var44 (ref)
			var40.getAndFetchItem(var28)
			
			return var44
		end,
		GetOnlineFriendsByUniverseId = function(p38) --[[ line: 533 ]]
			-- upvalues: t (ref), signalsModule (copy), var44 (ref)
			local var66 = t[p38]
			
			if var66 then
				return var66
			end
			local var67 = signalsModule.createComputed(function(p39) --[[ line: 539 ]]
				-- upvalues: var44 (copy), p38 (ref)
				local var68 = var44(p39)
				
				if not var68 then
					return {}
				end
				local t = {}
				
				for i, v in var68 do
					if v.presence and v.presence.universeId == p38 then
						table.insert(t, v)
					end
				end
				return t
			end)
			t[p38] = var67
			
			return var67
		end,
		GetAllFriends = function() --[[ line: 579 ]]
			-- upvalues: var43 (ref), var28 (ref), var45 (ref)
			var43.getAndFetchItem(var28)
			
			return var45
		end,
		GetAllFriendsStatus = function() --[[ line: 585 ]]
			-- upvalues: var43 (ref), var28 (ref)
			return var43.getCachedItem(var28).status
		end,
		FetchMoreFriends = function() --[[ line: 589 ]]
			-- upvalues: var43 (ref), var28 (ref), dataStatus (copy)
			local cachedItem = var43.getCachedItem(var28)
			local var71 = cachedItem.data(false)
			
			if var71 == nil or not var71.hasMore or var71.nextCursor == nil then return end
			if cachedItem.status(false) == dataStatus.NotReady then return end
			if var43.isRequestInQueueOrInFlight(var28) then
				return
			end
			var43.fetchItem(var28)
		end,
		RefetchAllFriends = function() --[[ line: 608 ]]
			-- upvalues: var31 (write), var43 (ref), var28 (ref)
			var31 = true
			var43.fetchItem(var28)
		end,
		GetIsFriendWith = function(p40) --[[ line: 614 ]]
			-- upvalues: var41 (ref)
			return var41.getAndFetchItem(p40)
		end,
		UpdateIsFriendsWith = UpdateIsFriendsWith,
		GetFriendshipStatus = function(p41) --[[ line: 621 ]]
			-- upvalues: fFlagSduiRequestFriendshipAction (copy), var42 (ref)
			return if fFlagSduiRequestFriendshipAction and p41 ~= "" then var42.getAndFetchItem(p41) else nil
		end,
		UpdateFriendshipStatus = function(p42, p43) --[[ line: 630 ]]
			-- upvalues: fFlagSduiRequestFriendshipAction (copy), var34 (ref), UpdateIsFriendsWith (ref)
			if fFlagSduiRequestFriendshipAction then
				var34.replaceItem(p42, p43)
				UpdateIsFriendsWith(p42, p43 == Enum.FriendStatus.Friend)
				
				return
			end
		end,
		RequestFriendship = function(p44, p45) --[[ line: 642 ]]
			-- upvalues: requestsModule (copy), fFlagSduiRequestFriendshipAction (copy), var34 (ref), UpdateIsFriendsWith (ref)
			return requestsModule.RequestFriendshipFromUserId(p44, p45):andThen(function() --[[ line: 644 ]]
				-- upvalues: p44 (ref), fFlagSduiRequestFriendshipAction (copy), var34 (copy), UpdateIsFriendsWith (copy)
				local friendRequestSent = Enum.FriendStatus.FriendRequestSent
				
				if fFlagSduiRequestFriendshipAction then
					var34.replaceItem(p44, friendRequestSent)
					UpdateIsFriendsWith(p44, friendRequestSent == Enum.FriendStatus.Friend)
					
					return
				end
			end):catch(function(p46) --[[ line: 647 ]]
				-- upvalues: p44 (ref), fFlagSduiRequestFriendshipAction (copy), var34 (copy), UpdateIsFriendsWith (copy)
				if (if type(p46) == "table" then p46.firstErrorCode else nil) ~= 5 then
					error(p46)
					
					return
				end
				local var72 = p44
				local friend = Enum.FriendStatus.Friend
				
				if fFlagSduiRequestFriendshipAction then
					var34.replaceItem(var72, friend)
					UpdateIsFriendsWith(var72, friend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		RefetchOnlineFriends = function() --[[ line: 663 ]]
			-- upvalues: var40 (ref), var28 (ref)
			var40.fetchItem(var28)
		end,
		clear = function() --[[ line: 710 ]]
			-- upvalues: var40 (ref), var41 (ref), var43 (ref), fFlagSduiRequestFriendshipAction (copy), var42 (ref), t (ref)
			var40.clear()
			var41.clear()
			var43.clear()
			
			if fFlagSduiRequestFriendshipAction then
				var42.clear()
			end
			table.clear(t)
		end,
		dispose = function() --[[ line: 720 ]]
			-- upvalues: var40 (ref), var41 (ref), var43 (ref), fFlagSduiRequestFriendshipAction (copy), var42 (ref), t (ref)
			var40.dispose()
			var41.dispose()
			var43.dispose()
			
			if fFlagSduiRequestFriendshipAction then
				var42.dispose()
			end
			table.clear(t)
		end,
		_fetchOnlineFriendsAsync = function() --[[ line: 669 ]]
			-- upvalues: requestsModule (copy), var28 (ref), applyGetOnlineFriendsResponseBody (ref), var30 (ref)
			return requestsModule.GetOnlineFriends(var28):andThen(function(p48) --[[ line: 671 ]]
				-- upvalues: applyGetOnlineFriendsResponseBody (copy), var30 (copy), var28 (copy)
				var30.replaceItems({ [var28] = applyGetOnlineFriendsResponseBody(p48) })
				
				return p48 or { data = nil }
			end):catch(function(p47) --[[ line: 676 ]]
				error(p47)
			end)
		end,
		_updateFriendsPresences = function(p49, p50, _) --[[ line: 681 ]]
			-- upvalues: normalizeStoredOnlineFriendRow (copy), normalizePresenceRawDataModule (copy), var29 (ref), var32 (ref), var35 (ref), var30 (ref), var28 (ref)
			if not p49 then return end
			p50 = p50 or {}
			local t = {}
			
			for i, v in pairs(p49) do
				local userId = v.userId
				local var75 = if not userId then nil else tostring(userId)
				
				if var75 then
					local var76 = normalizePresenceRawDataModule(v)
					t[var75] = normalizeStoredOnlineFriendRow({ id = var75, sortScore = p50[var75] })
					var29.UpdateUserPresence(var75, var76, { isUpdatedRealtime = true })
					var32.replaceItem(var75, true)
					var35(var75)
				end
			end
			var30.updateItem(var28, t)
		end
	}
end