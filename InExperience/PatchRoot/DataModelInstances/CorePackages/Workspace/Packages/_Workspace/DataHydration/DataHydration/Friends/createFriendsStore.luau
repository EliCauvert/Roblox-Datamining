local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local DataStatus = require(DataHydration.DataHydrationTypes).DataStatus
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local MergeListsWithoutDuplicatesFunction = require(DataHydration.DataHydrationUtils).mergeListsWithoutDuplicates
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local LocalUserIdStore = require(Parent.LocalUserIdStore).LocalUserIdStore
local FFlagSduiRequestFriendshipAction = SharedFlagsModule.FFlagSduiRequestFriendshipAction
local FFlagEnableGetFriendshipStatus = SharedFlagsModule.FFlagEnableGetFriendshipStatus
local FFlagEnableFriendsStoreChallengeInterceptor = SharedFlagsModule.FFlagEnableFriendsStoreChallengeInterceptor
local FFlagFriendSortedByPresenceSignalsImplementation = SharedFlagsModule.FFlagFriendSortedByPresenceSignalsImplementation
local FFlagFriendsStoreSortOnlineFriendsByRank = SharedFlagsModule.FFlagFriendsStoreSortOnlineFriendsByRank
local FFlagPresenceRefetchTelemetryEnabledModule = require(DataHydration.Flags.FFlagPresenceRefetchTelemetryEnabled)
local FFlagAddFriendsPageTrustedFriendRequestSection = require(Parent.SharedFlags).FFlagAddFriendsPageTrustedFriendRequestSection
local FFlagFriendsChatHasFriendsGate = SharedFlagsModule.FFlagFriendsChatHasFriendsGate
local FFlagFriendsCountDataHydrationMigrationEnabled = SharedFlagsModule.FFlagFriendsCountDataHydrationMigrationEnabled or FFlagFriendsChatHasFriendsGate
local RequestsModule = require(DataHydration.Friends.Requests)
local FindFriendsSortModule = require(DataHydration.Friends.Enums.FindFriendsSort)
local MapFriendshipStatusToEnumModule = require(DataHydration.Friends.mapFriendshipStatusToEnum)
local PresenceStoreModule = require(DataHydration.Presence.PresenceStore)
local NormalizePresenceRawDataModule = require(DataHydration.Presence.normalizePresenceRawData)
local PresenceTypeModule = require(DataHydration.Presence.Enums.PresenceType)
local _ = require(DataHydration.Presence.createPresenceStore)
game:DefineFastInt("FriendsStoreProcessDelaySec", 1)

local function _() --[[ Line: 145 | Named "getFIntFriendsStoreProcessDelaySec" ]]
	return game:GetFastInt("FriendsStoreProcessDelaySec")
end

local OnlineFriendsCacheTtlSec = game:DefineFastInt("OnlineFriendsCacheTtlSec", 0)
local IsFriendsWithCacheTtlSec = game:DefineFastInt("IsFriendsWithCacheTtlSec", 0)
local AllFriendsCacheTtlSec = game:DefineFastInt("AllFriendsCacheTtlSec", 0)
local FriendshipStatusCacheTtlSec = game:DefineFastInt("FriendshipStatusCacheTtlSec", 0)
local FriendsCountCacheTtlSec = game:DefineFastInt("FriendsCountCacheTtlSec", 0)

local _ = function(p1: number): number --[[ Line: 155 | Named "getCacheTTL" ]]
	return if p1 and p1 > 0 then p1 else 1e999
end

local FriendsPageSize = game:DefineFastInt("FriendsPageSize", 50)
local InitialFriendsPageSize = game:DefineFastInt("InitialFriendsPageSize", 20)

local _ = function(p1) --[[ Line: 162 | Named "normalizeId" ]]
	return if p1 then tostring(p1) else nil
end

local function normalizeStoredOnlineFriendRow(p1) --[[ Line: 170 ]]
	return if p1 and type(p1) == "table" and p1.id ~= nil then {
		id = tostring(p1.id),
		sortScore = tonumber(p1.sortScore) or 0
	} else nil
end

local function normalizePresenceFromOnlineFriendsRow(p1) --[[ Line: 182 ]]
	-- upvalues: NormalizePresenceRawDataModule (copy)
	if p1 and type(p1) == "table" and p1.id ~= nil then
		local UserPresence = p1.userPresence
		
		return if UserPresence and type(UserPresence) == "table" then NormalizePresenceRawDataModule({
			userPresenceType = UserPresence.UserPresenceType,
			lastLocation = UserPresence.lastLocation,
			lastOnline = UserPresence.lastOnline,
			gameId = UserPresence.gameInstanceId,
			placeId = UserPresence.placeId,
			rootPlaceId = UserPresence.rootPlaceId,
			universeId = UserPresence.universeId
		}, p1.id) else nil
	else
		return nil
	end
end

local _ = function(p1) --[[ Line: 204 | Named "normalizeFindFriendsNextCursor" ]]
	return if p1 == nil or p1 == "" then nil else p1
end

local function normalizeFindFriendsPageResponse(p1) --[[ Line: 211 ]]
	local Friends = {}
	local PageItems = if p1 and p1.PageItems then p1.PageItems else {}
	for _, pageItem in PageItems do
		local Id = pageItem.id
		local Text = if Id then tostring(Id) else nil
		
		if Text then
			table.insert(Friends, { id = Text })
		end
	end
	local NextCursor = if p1 then p1.NextCursor else nil
	local NextCursor1 = if NextCursor == nil or NextCursor == "" then nil else NextCursor
	
	return {
		friends = Friends,
		nextCursor = NextCursor1,
		hasMore = if p1 and p1.HasMore ~= nil then p1.HasMore else NextCursor1 ~= nil
	}
end

local function mergeListsWithoutDuplicates(Tbl, Friends, p2) --[[ Line: 234 ]]
	-- upvalues: CryoModule (copy)
	if not Friends or #Friends == 0 then
		return if Tbl then Tbl else {}
	elseif Tbl and #Tbl ~= 0 then
		local Set = CryoModule.List.toSet(CryoModule.List.map(Tbl, function(p3) --[[ Line: 242 ]]
			-- upvalues: p2 (copy)
			return if p2 then p3[p2] else p3
		end))
		
		return CryoModule.List.join(table.clone(Tbl), (CryoModule.List.filter(Friends, function(p3): boolean --[[ Line: 247 ]]
			-- upvalues: p2 (copy), Set (copy)
			return not Set[if p2 then p3[p2] else p3]
		end)))
	else
		return Friends
	end
end

local function mergeAllFriendsPage(DataResult, p3, NextCursor) --[[ Line: 255 ]]
	-- upvalues: FFlagAddFriendsPageTrustedFriendRequestSection (copy), MergeListsWithoutDuplicatesFunction (copy), mergeListsWithoutDuplicates (copy)
	if DataResult then
		local NextCursor1 = DataResult.nextCursor
		local NextCursor2 = if NextCursor1 == nil or NextCursor1 == "" then nil else NextCursor1
		local NextCursor3 = if NextCursor == nil or NextCursor == "" then nil else NextCursor
		
		return if NextCursor2 == NextCursor3 then {
			friends = if FFlagAddFriendsPageTrustedFriendRequestSection then MergeListsWithoutDuplicatesFunction(DataResult.friends, p3.friends, "id") else mergeListsWithoutDuplicates(DataResult.friends, p3.friends, "id"),
			nextCursor = p3.nextCursor,
			hasMore = p3.hasMore
		} else DataResult
	else
		return {
			friends = p3.friends,
			nextCursor = p3.nextCursor,
			hasMore = p3.hasMore
		}
	end
end

local _ = function(p3) --[[ Line: 287 | Named "resolveLocalUserId" ]]
	-- upvalues: LocalUserIdStore (copy), GetLocalPlayerUserIdFunction (copy)
	local CurrentUserId = LocalUserIdStore.getCurrentUserId(p3)
	
	if CurrentUserId == "" then
		local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
		
		return if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
	else
		return CurrentUserId
	end
end

return function() --[[ Line: 296 | Named "createFriendsStore" ]]
	-- upvalues: PresenceStoreModule (copy), FFlagFriendSortedByPresenceSignalsImplementation (copy), GetLocalPlayerUserIdFunction (copy), CreateDataCacheModule (copy), OnlineFriendsCacheTtlSec (copy), IsFriendsWithCacheTtlSec (copy), AllFriendsCacheTtlSec (copy), FFlagEnableGetFriendshipStatus (copy), FFlagSduiRequestFriendshipAction (copy), FriendshipStatusCacheTtlSec (copy), FFlagFriendsCountDataHydrationMigrationEnabled (copy), FriendsCountCacheTtlSec (copy), LocalUserIdStore (copy), FFlagAddFriendsPageTrustedFriendRequestSection (copy), MergeListsWithoutDuplicatesFunction (copy), mergeListsWithoutDuplicates (copy), NormalizePresenceRawDataModule (copy), PresenceTypeModule (copy), normalizeStoredOnlineFriendRow (copy), normalizePresenceFromOnlineFriendsRow (copy), CreateDataResolverModule (copy), RequestsModule (copy), MapFriendshipStatusToEnumModule (copy), CryoModule (copy), FriendsPageSize (copy), InitialFriendsPageSize (copy), FindFriendsSortModule (copy), normalizeFindFriendsPageResponse (copy), mergeAllFriendsPage (copy), SignalsModule (copy), FFlagFriendsStoreSortOnlineFriendsByRank (copy), DataStatus (copy), FFlagEnableFriendsStoreChallengeInterceptor (copy), FFlagPresenceRefetchTelemetryEnabledModule (copy)
	local GetResult = PresenceStoreModule.get()
	local Text = if FFlagFriendSortedByPresenceSignalsImplementation then nil else tostring(GetLocalPlayerUserIdFunction())
	local DataCacheModule = CreateDataCacheModule(if OnlineFriendsCacheTtlSec and OnlineFriendsCacheTtlSec > 0 then OnlineFriendsCacheTtlSec else 1e999)
	local IsFriendsWithCacheTtlSec1: number = IsFriendsWithCacheTtlSec
	local DataCacheModule1 = CreateDataCacheModule(if IsFriendsWithCacheTtlSec1 and IsFriendsWithCacheTtlSec1 > 0 then IsFriendsWithCacheTtlSec1 else 1e999)
	local DataCacheModule2 = CreateDataCacheModule(if AllFriendsCacheTtlSec and AllFriendsCacheTtlSec > 0 then AllFriendsCacheTtlSec else 1e999)
	local Flag = false
	local DataCacheModule3 = if FFlagEnableGetFriendshipStatus or FFlagSduiRequestFriendshipAction then CreateDataCacheModule(if FriendshipStatusCacheTtlSec and FriendshipStatusCacheTtlSec > 0 then FriendshipStatusCacheTtlSec else 1e999) else nil
	local DataCacheModule4 = if FFlagFriendsCountDataHydrationMigrationEnabled then CreateDataCacheModule(if FriendsCountCacheTtlSec and FriendsCountCacheTtlSec > 0 then FriendsCountCacheTtlSec else 1e999) else nil
	local Tbl = {}
	
	local function appendUserToAllFriends(Id) --[[ Line: 348 ]]
		-- upvalues: FFlagFriendSortedByPresenceSignalsImplementation (upval), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), Text (copy), DataCacheModule2 (copy), FFlagAddFriendsPageTrustedFriendRequestSection (upval), MergeListsWithoutDuplicatesFunction (upval), mergeListsWithoutDuplicates (upval)
		local Text1 = nil
		if FFlagFriendSortedByPresenceSignalsImplementation then
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				Text1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				Text1 = CurrentUserId
			end
		else
			Text1 = Text
		end
		local DataResult = DataCacheModule2.getItem(Text1).data(false)
		
		if DataResult then
			local Id1 = if FFlagAddFriendsPageTrustedFriendRequestSection then MergeListsWithoutDuplicatesFunction(DataResult.friends, { { id = Id } }, "id") else mergeListsWithoutDuplicates(DataResult.friends, { { id = Id } }, "id")
			
			if #Id1 == #DataResult.friends then return end
			DataCacheModule2.replaceItem(Text1, {
				friends = Id1,
				nextCursor = DataResult.nextCursor,
				hasMore = DataResult.hasMore
			})
		end
	end
	
	local function UpdateIsFriendsWith(Id, IsFriendMatch) --[[ Line: 368 ]]
		-- upvalues: DataCacheModule1 (copy), appendUserToAllFriends (copy), FFlagEnableGetFriendshipStatus (upval), DataCacheModule3 (copy), GetResult (copy)
		DataCacheModule1.replaceItem(Id, IsFriendMatch)
		
		if IsFriendMatch then
			appendUserToAllFriends(Id)
			
			if FFlagEnableGetFriendshipStatus then
				DataCacheModule3.replaceItem(Id, Enum.FriendStatus.Friend)
			end
		end
		if not IsFriendMatch then
			GetResult.UpdateUserPresence(Id, nil, { isUpdatedRealtime = false })
		end
	end
	
	local function _(Id, p3) --[[ Line: 386 | Named "updateOnlineFriendDependecies" ]]
		-- upvalues: GetResult (copy), DataCacheModule1 (copy), appendUserToAllFriends (copy), FFlagEnableGetFriendshipStatus (upval), DataCacheModule3 (copy)
		GetResult.UpdateUserPresence(Id, p3, { isUpdatedRealtime = true })
		DataCacheModule1.replaceItem(Id, true)
		appendUserToAllFriends(Id)
		
		if FFlagEnableGetFriendshipStatus then
			DataCacheModule3.replaceItem(Id, Enum.FriendStatus.Friend)
		end
	end
	
	local function updateOfflineFriendDependencies(Id) --[[ Line: 393 ]]
		-- upvalues: GetResult (copy), NormalizePresenceRawDataModule (upval), PresenceTypeModule (upval), DataCacheModule1 (copy), appendUserToAllFriends (copy), FFlagEnableGetFriendshipStatus (upval), DataCacheModule3 (copy)
		GetResult.UpdateUserPresence(Id, GetResult.GetPresenceByUserId(Id, { skipFetch = true }).data(false) or NormalizePresenceRawDataModule({ userPresenceType = PresenceTypeModule.Offline }), { isUpdatedRealtime = true })
		DataCacheModule1.replaceItem(Id, true)
		appendUserToAllFriends(Id)
		
		if FFlagEnableGetFriendshipStatus then
			DataCacheModule3.replaceItem(Id, Enum.FriendStatus.Friend)
		end
	end
	
	local function applyGetOnlineFriendsResponseBody(p3) --[[ Line: 407 ]]
		-- upvalues: normalizeStoredOnlineFriendRow (upval), normalizePresenceFromOnlineFriendsRow (upval), GetResult (copy), DataCacheModule1 (copy), appendUserToAllFriends (copy), FFlagEnableGetFriendshipStatus (upval), DataCacheModule3 (copy)
		local t = {}
		
		for _, value in p3 and p3.data or {} do
			local Id = value.id
			local Text = if Id then tostring(Id) else nil
			local NormalizeStoredOnlineFriendRowResult = normalizeStoredOnlineFriendRow(value)
			local NormalizePresenceFromOnlineFriendsRowResult = normalizePresenceFromOnlineFriendsRow(value)
			
			if Text then
				t[Text] = NormalizeStoredOnlineFriendRowResult
				GetResult.UpdateUserPresence(Text, NormalizePresenceFromOnlineFriendsRowResult, { isUpdatedRealtime = true })
				DataCacheModule1.replaceItem(Text, true)
				appendUserToAllFriends(Text)
				
				if FFlagEnableGetFriendshipStatus then
					DataCacheModule3.replaceItem(Text, Enum.FriendStatus.Friend)
				end
			end
		end
		return t
	end
	
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule,
		fetchFn = function(p4, p5) --[[ Line: 430 ]]
			-- upvalues: RequestsModule (upval), GetResult (copy), NormalizePresenceRawDataModule (upval), PresenceTypeModule (upval), applyGetOnlineFriendsResponseBody (copy)
			local DataResult = p5.data(false) or {}
			
			return RequestsModule.GetOnlineFriends(p4):andThen(function(Result) --[[ Line: 434 ]]
				-- upvalues: DataResult (copy), GetResult (upval), NormalizePresenceRawDataModule (upval), PresenceTypeModule (upval), applyGetOnlineFriendsResponseBody (upval)
				for _, value in DataResult do
					local Id = value and value.id
					local Text = if Id then tostring(Id) else nil
					
					if Text then
						GetResult.UpdateUserPresence(Text, NormalizePresenceRawDataModule({ userPresenceType = PresenceTypeModule.Offline }), { isUpdatedRealtime = true })
					end
				end
				return (applyGetOnlineFriendsResponseBody(Result))
			end):catch(function(Err) --[[ Line: 451 ]]
				error(Err)
			end)
		end
	})
	
	local _ = function(p6) --[[ Line: 460 | Named "fetchFriendshipStatuses" ]]
		-- upvalues: FFlagFriendSortedByPresenceSignalsImplementation (upval), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), Text (copy), RequestsModule (upval), MapFriendshipStatusToEnumModule (upval)
		local Text1 = nil
		if FFlagFriendSortedByPresenceSignalsImplementation then
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				Text1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				Text1 = CurrentUserId
			end
		else
			Text1 = Text
		end
		return RequestsModule.MultiGetFriendshipStatuses(Text1, p6):andThen(function(Result) --[[ Line: 465 ]]
			-- upvalues: MapFriendshipStatusToEnumModule (upval)
			local t = {}
			
			for _, value in Result and Result.data or {} do
				local Id = value.id
				local Text = if Id then tostring(Id) else nil
				
				if Text then
					t[Text] = MapFriendshipStatusToEnumModule(value.status)
				end
			end
			return t
		end)
	end
	
	local DataResolverModule1 = CreateDataResolverModule({
		cache = DataCacheModule1,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p7) --[[ Line: 484 ]]
			-- upvalues: CryoModule (upval), FFlagFriendSortedByPresenceSignalsImplementation (upval), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), Text (copy), RequestsModule (upval), MapFriendshipStatusToEnumModule (upval), FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (copy)
			local KeysResult = CryoModule.Dictionary.keys(p7)
			local Text1 = nil
			
			if FFlagFriendSortedByPresenceSignalsImplementation then
				local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
				
				if CurrentUserId == "" then
					local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
					Text1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
				else
					Text1 = CurrentUserId
				end
			else
				Text1 = Text
			end
			return RequestsModule.MultiGetFriendshipStatuses(Text1, KeysResult):andThen(function(Result) --[[ Line: 465 ]]
				-- upvalues: MapFriendshipStatusToEnumModule (upval)
				local t = {}
				
				for _, value in Result and Result.data or {} do
					local Id = value.id
					local Text = if Id then tostring(Id) else nil
					
					if Text then
						t[Text] = MapFriendshipStatusToEnumModule(value.status)
					end
				end
				return t
			end):andThen(function(Result) --[[ Line: 486 ]]
				-- upvalues: FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (upval)
				if FFlagEnableGetFriendshipStatus or FFlagSduiRequestFriendshipAction then
					DataCacheModule3.replaceItems(Result)
				end
				local t = {}
				
				for i, value in Result do
					t[i] = value == Enum.FriendStatus.Friend
				end
				return t
			end)
		end
	})
	local DataResolverModule2 = if FFlagEnableGetFriendshipStatus or FFlagSduiRequestFriendshipAction then CreateDataResolverModule({
		cache = DataCacheModule3,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p8) --[[ Line: 508 ]]
			-- upvalues: CryoModule (upval), FFlagFriendSortedByPresenceSignalsImplementation (upval), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), Text (copy), RequestsModule (upval), MapFriendshipStatusToEnumModule (upval), DataCacheModule1 (copy)
			local KeysResult = CryoModule.Dictionary.keys(p8)
			local Text1 = nil
			
			if FFlagFriendSortedByPresenceSignalsImplementation then
				local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
				
				if CurrentUserId == "" then
					local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
					Text1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
				else
					Text1 = CurrentUserId
				end
			else
				Text1 = Text
			end
			return RequestsModule.MultiGetFriendshipStatuses(Text1, KeysResult):andThen(function(Result) --[[ Line: 465 ]]
				-- upvalues: MapFriendshipStatusToEnumModule (upval)
				local t = {}
				
				for _, value in Result and Result.data or {} do
					local Id = value.id
					local Text = if Id then tostring(Id) else nil
					
					if Text then
						t[Text] = MapFriendshipStatusToEnumModule(value.status)
					end
				end
				return t
			end):andThen(function(Result) --[[ Line: 510 ]]
				-- upvalues: DataCacheModule1 (upval)
				local t = {}
				
				for i, value in Result do
					t[i] = value == Enum.FriendStatus.Friend
				end
				DataCacheModule1.replaceItems(t)
				
				return Result
			end)
		end
	}) else nil
	local DataResolverModule3 = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule2,
		fetchFn = function(p9, p10) --[[ Line: 529 ]]
			-- upvalues: Flag (ref), FriendsPageSize (upval), InitialFriendsPageSize (upval), RequestsModule (upval), FindFriendsSortModule (upval), normalizeFindFriendsPageResponse (upval), updateOfflineFriendDependencies (copy), mergeAllFriendsPage (upval)
			local DataResult = if Flag then nil else p10.data(false)
			Flag = false
			local NextCursor = if DataResult then DataResult.nextCursor else nil
			
			return RequestsModule.GetFindFriendsPage(p9, {
				limit = if DataResult then FriendsPageSize else InitialFriendsPageSize,
				cursor = NextCursor,
				sort = FindFriendsSortModule.FriendshipScore
			}):andThen(function(Result) --[[ Line: 541 ]]
				-- upvalues: normalizeFindFriendsPageResponse (upval), updateOfflineFriendDependencies (upval), mergeAllFriendsPage (upval), DataResult (copy), NextCursor (copy)
				local NormalizeFindFriendsPageResponseResult = normalizeFindFriendsPageResponse(Result)
				
				for _, friend in NormalizeFindFriendsPageResponseResult.friends do
					updateOfflineFriendDependencies(friend.id)
				end
				return (mergeAllFriendsPage(DataResult, NormalizeFindFriendsPageResponseResult, NextCursor))
			end):catch(function(Err) --[[ Line: 549 ]]
				error(Err)
			end)
		end
	})
	local DataResolverModule4 = if FFlagFriendsCountDataHydrationMigrationEnabled then CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule4,
		fetchFn = function(p11) --[[ Line: 560 ]]
			-- upvalues: RequestsModule (upval)
			return RequestsModule.GetFriendsCountFromUserId(p11):andThen(function(Result) --[[ Line: 562 ]]
				return if Result then Result.count else 0
			end)
		end
	}) else nil
	local Computed = SignalsModule.createComputed(function(p11) --[[ Line: 581 ]]
		-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy), GetResult (copy), DataResolverModule1 (copy), PresenceTypeModule (upval), FFlagFriendsStoreSortOnlineFriendsByRank (upval)
		local CurrentUserId = LocalUserIdStore.getCurrentUserId(p11)
		local CurrentUserId1 = nil
		
		if CurrentUserId == "" then
			local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
			CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
		else
			CurrentUserId1 = CurrentUserId
		end
		local DataResult = DataResolverModule.getAndFetchItem(CurrentUserId1).data(p11)
		
		if DataResult == nil then
			return nil
		end
		local List = {}
		
		for _, value in pairs(DataResult) do
			if value then
				local DataResult1 = GetResult.GetPresenceByUserId(value.id, { skipFetch = true }).data(p11)
				
				if DataResolverModule1.getCachedItem(value.id).data(p11) and DataResult1 and DataResult1.userPresenceType and DataResult1.userPresenceType ~= PresenceTypeModule.Offline then
					table.insert(List, {
						id = value.id,
						sortScore = value.sortScore,
						presence = DataResult1
					})
				end
			end
		end
		if FFlagFriendsStoreSortOnlineFriendsByRank then
			table.sort(List, function(A, B): boolean --[[ Line: 613 ]]
				return B.sortScore < A.sortScore
			end)
		end
		return List
	end)
	local Computed1 = SignalsModule.createComputed(function(p12) --[[ Line: 628 ]]
		-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy)
		local CurrentUserId = LocalUserIdStore.getCurrentUserId(p12)
		local CurrentUserId1 = nil
		
		if CurrentUserId == "" then
			local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
			CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
		else
			CurrentUserId1 = CurrentUserId
		end
		return DataResolverModule.getCachedItem(CurrentUserId1).status(p12)
	end)
	local Computed2 = SignalsModule.createComputed(function(p12) --[[ Line: 665 ]]
		-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule3 (copy), CryoModule (upval), DataResolverModule1 (copy)
		local CurrentUserId = LocalUserIdStore.getCurrentUserId(p12)
		local CurrentUserId1 = nil
		
		if CurrentUserId == "" then
			local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
			CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
		else
			CurrentUserId1 = CurrentUserId
		end
		local DataResult = DataResolverModule3.getAndFetchItem(CurrentUserId1).data(p12)
		
		return if DataResult == nil then nil else {
			friends = CryoModule.List.filter(DataResult.friends or {}, function(p13) --[[ Line: 676 ]]
				-- upvalues: DataResolverModule1 (upval), p12 (copy)
				return DataResolverModule1.getCachedItem(p13.id).data(p12)
			end),
			hasMore = DataResult.hasMore,
			nextCursor = DataResult.nextCursor
		}
	end)
	local Computed3 = SignalsModule.createComputed(function(p12) --[[ Line: 687 ]]
		-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule3 (copy)
		local CurrentUserId = LocalUserIdStore.getCurrentUserId(p12)
		local CurrentUserId1 = nil
		
		if CurrentUserId == "" then
			local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
			CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
		else
			CurrentUserId1 = CurrentUserId
		end
		return DataResolverModule3.getCachedItem(CurrentUserId1).status(p12)
	end)
	
	return {
		GetOnlineFriends = function() --[[ Line: 621 ]]
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy), Computed (copy)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			DataResolverModule.getAndFetchItem(CurrentUserId1)
			
			return Computed
		end,
		GetOnlineFriendsStatus = function() --[[ Line: 633 ]]
			-- upvalues: Computed1 (copy)
			return Computed1
		end,
		RefetchOnlineFriends = function() --[[ Line: 813 ]]
			-- upvalues: DataResolverModule (copy), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval)
			local FetchItemFunction: (any) -> () = DataResolverModule.fetchItem
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			FetchItemFunction(CurrentUserId1)
		end,
		GetOnlineFriendsByUniverseId = function(Key) --[[ Line: 637 ]]
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy), Tbl (copy), SignalsModule (upval), Computed (copy)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			DataResolverModule.getAndFetchItem(CurrentUserId1)
			local Entry = Tbl[Key]
			
			if Entry then
				return Entry
			else
				local Computed1 = SignalsModule.createComputed(function(p12) --[[ Line: 646 ]]
					-- upvalues: Computed (upval), Key (copy)
					local ComputedResult = Computed(p12)
					
					if not ComputedResult then
						return {}
					end
					local List = {}
					
					for _, value in ComputedResult do
						if value.presence and value.presence.universeId == Key then
							table.insert(List, value)
						end
					end
					return List
				end)
				Tbl[Key] = Computed1
				
				return Computed1
			end
		end,
		GetAllFriends = function() --[[ Line: 692 ]]
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule3 (copy), Computed2 (copy)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			DataResolverModule3.getAndFetchItem(CurrentUserId1)
			
			return Computed2
		end,
		GetAllFriendsStatus = function() --[[ Line: 699 ]]
			-- upvalues: Computed3 (copy)
			return Computed3
		end,
		FetchMoreFriends = function() --[[ Line: 703 ]]
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule3 (copy), DataStatus (upval)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			local CachedItem = DataResolverModule3.getCachedItem(CurrentUserId1)
			local DataResult = CachedItem.data(false)
			
			if DataResult == nil or not DataResult.hasMore or DataResult.nextCursor == nil then return end
			if CachedItem.status(false) == DataStatus.NotReady then return end
			if not DataResolverModule3.isRequestInQueueOrInFlight(CurrentUserId1) then
				DataResolverModule3.fetchItem(CurrentUserId1)
				
				return
			end
		end,
		RefetchAllFriends = function() --[[ Line: 723 ]]
			-- upvalues: Flag (ref), DataResolverModule3 (copy), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval)
			Flag = true
			local FetchItemFunction: (any) -> () = DataResolverModule3.fetchItem
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			FetchItemFunction(CurrentUserId1)
		end,
		GetIsFriendWith = function(p12) --[[ Line: 729 ]]
			-- upvalues: DataResolverModule1 (copy)
			return DataResolverModule1.getAndFetchItem(p12)
		end,
		UpdateIsFriendsWith = UpdateIsFriendsWith,
		GetFriendsCountByUserId = function(p12, p13) --[[ Line: 817 ]]
			-- upvalues: FFlagFriendsCountDataHydrationMigrationEnabled (upval), DataResolverModule4 (copy)
			return if FFlagFriendsCountDataHydrationMigrationEnabled then if p13 and p13.skipFetch then DataResolverModule4.getCachedItem(p12) else DataResolverModule4.getAndFetchItem(p12) else nil
		end,
		RefreshFriendsCountByUserId = function(p12) --[[ Line: 827 ]]
			-- upvalues: FFlagFriendsCountDataHydrationMigrationEnabled (upval), DataResolverModule4 (copy)
			if FFlagFriendsCountDataHydrationMigrationEnabled then
				DataResolverModule4.fetchItem(p12)
				
				return
			end
		end,
		clear = function() --[[ Line: 933 ]]
			-- upvalues: DataResolverModule (copy), DataResolverModule1 (copy), DataResolverModule3 (copy), FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataResolverModule2 (copy), FFlagFriendsCountDataHydrationMigrationEnabled (upval), DataResolverModule4 (copy), Tbl (copy)
			DataResolverModule.clear()
			DataResolverModule1.clear()
			DataResolverModule3.clear()
			
			if FFlagEnableGetFriendshipStatus or FFlagSduiRequestFriendshipAction then
				DataResolverModule2.clear()
			end
			if FFlagFriendsCountDataHydrationMigrationEnabled then
				DataResolverModule4.clear()
			end
			table.clear(Tbl)
		end,
		dispose = function() --[[ Line: 946 ]]
			-- upvalues: DataResolverModule (copy), DataResolverModule1 (copy), DataResolverModule3 (copy), FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataResolverModule2 (copy), FFlagFriendsCountDataHydrationMigrationEnabled (upval), DataResolverModule4 (copy), Tbl (copy)
			DataResolverModule.dispose()
			DataResolverModule1.dispose()
			DataResolverModule3.dispose()
			
			if FFlagEnableGetFriendshipStatus or FFlagSduiRequestFriendshipAction then
				DataResolverModule2.dispose()
			end
			if FFlagFriendsCountDataHydrationMigrationEnabled then
				DataResolverModule4.dispose()
			end
			table.clear(Tbl)
		end,
		_fetchOnlineFriendsAsync = function() --[[ Line: 836 ]]
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), RequestsModule (upval), applyGetOnlineFriendsResponseBody (copy), DataCacheModule (copy)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			return RequestsModule.GetOnlineFriends(CurrentUserId1):andThen(function(Result) --[[ Line: 839 ]]
				-- upvalues: applyGetOnlineFriendsResponseBody (upval), DataCacheModule (upval), CurrentUserId1 (copy)
				DataCacheModule.replaceItems({
					[CurrentUserId1] = applyGetOnlineFriendsResponseBody(Result)
				})
				
				return Result or { data = nil }
			end):catch(function(Err) --[[ Line: 844 ]]
				error(Err)
			end)
		end,
		_getCachedFriendsPresences = function() --[[ Line: 849 ]]
			-- upvalues: FFlagPresenceRefetchTelemetryEnabledModule (upval), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy), GetResult (copy)
			if not FFlagPresenceRefetchTelemetryEnabledModule then
				return nil
			end
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			local DataResult = DataResolverModule.getCachedItem(CurrentUserId1).data(false)
			
			if DataResult == nil then
				return nil
			end
			local List = {}
			
			for _, value in pairs(DataResult) do
				if value then
					table.insert(List, {
						id = value.id,
						presence = GetResult.GetPresenceByUserId(value.id, { skipFetch = true }).data(false)
					})
				end
			end
			return List
		end,
		_getFetchedFriendIds = function() --[[ Line: 876 ]]
			-- upvalues: FFlagPresenceRefetchTelemetryEnabledModule (upval), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy), DataResolverModule3 (copy)
			if not FFlagPresenceRefetchTelemetryEnabledModule then
				return nil
			end
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			local DataResult = DataResolverModule.getCachedItem(CurrentUserId1).data(false)
			local DataResult1 = DataResolverModule3.getCachedItem(CurrentUserId1).data(false)
			
			if DataResult == nil and DataResult1 == nil then
				return nil
			end
			local t = {}
			
			if DataResult1 then
				for _, friend in DataResult1.friends do
					t[friend.id] = true
				end
			end
			if DataResult then
				for _, value in pairs(DataResult) do
					if value then
						t[value.id] = true
					end
				end
			end
			return t
		end,
		_updateFriendsPresences = function(List, p12, _) --[[ Line: 904 ]]
			-- upvalues: normalizeStoredOnlineFriendRow (upval), NormalizePresenceRawDataModule (upval), GetResult (copy), DataCacheModule1 (copy), appendUserToAllFriends (copy), FFlagEnableGetFriendshipStatus (upval), DataCacheModule3 (copy), DataCacheModule (copy), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval)
			if not List then return end
			local P66 = p12 or {}
			local t = {}
			
			for _, value in pairs(List) do
				local UserId = value.userId
				local Text = if UserId then tostring(UserId) else nil
				
				if Text then
					t[Text] = normalizeStoredOnlineFriendRow({ id = Text, sortScore = P66[Text] })
					GetResult.UpdateUserPresence(Text, NormalizePresenceRawDataModule(value), { isUpdatedRealtime = true })
					DataCacheModule1.replaceItem(Text, true)
					appendUserToAllFriends(Text)
					
					if FFlagEnableGetFriendshipStatus then
						DataCacheModule3.replaceItem(Text, Enum.FriendStatus.Friend)
					end
				end
			end
			local UpdateItemFunction: (any, any) -> () = DataCacheModule.updateItem
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			UpdateItemFunction(CurrentUserId1, t)
		end,
		GetFriendshipStatus = function(p13, p14) --[[ Line: 733 ]]
			-- upvalues: FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataResolverModule2 (copy)
			return if (FFlagEnableGetFriendshipStatus or FFlagSduiRequestFriendshipAction) and p13 ~= "" then if FFlagEnableGetFriendshipStatus and p14 and p14.skipFetch then DataResolverModule2.getCachedItem(p13) else DataResolverModule2.getAndFetchItem(p13) else nil
		end,
		UpdateFriendshipStatus = function(p13, FriendStatus) --[[ Line: 743 ]]
			-- upvalues: FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (copy), UpdateIsFriendsWith (copy)
			if FFlagEnableGetFriendshipStatus or FFlagSduiRequestFriendshipAction then
				DataCacheModule3.replaceItem(p13, FriendStatus)
				UpdateIsFriendsWith(p13, FriendStatus == Enum.FriendStatus.Friend)
				
				return
			end
		end,
		RequestFriendship = function(p13, p14, p15, p16) --[[ Line: 752 ]]
			-- upvalues: FFlagEnableFriendsStoreChallengeInterceptor (upval), FFlagEnableGetFriendshipStatus (upval), RequestsModule (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (copy), UpdateIsFriendsWith (copy)
			local v1 = if FFlagEnableFriendsStoreChallengeInterceptor then p16 else nil
			
			return (if FFlagEnableGetFriendshipStatus and p15 and p15.isContact then RequestsModule.RequestFriendshipFromContactId(p13, v1) else RequestsModule.RequestFriendshipFromUserId(p13, p14, v1)):andThen(function() --[[ Line: 765 ]]
				-- upvalues: p13 (copy), FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (upval), UpdateIsFriendsWith (upval)
				local FriendRequestSent = Enum.FriendStatus.FriendRequestSent
				
				if FFlagEnableGetFriendshipStatus or FFlagSduiRequestFriendshipAction then
					DataCacheModule3.replaceItem(p13, FriendRequestSent)
					UpdateIsFriendsWith(p13, FriendRequestSent == Enum.FriendStatus.Friend)
					
					return
				end
			end):catch(function(Err) --[[ Line: 768 ]]
				-- upvalues: p13 (copy), FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (upval), UpdateIsFriendsWith (upval)
				if (if type(Err) == "table" then Err.firstErrorCode else nil) ~= 5 then
					error(Err)
					
					return
				end
				local Friend = Enum.FriendStatus.Friend
				
				if FFlagEnableGetFriendshipStatus or FFlagSduiRequestFriendshipAction then
					DataCacheModule3.replaceItem(p13, Friend)
					UpdateIsFriendsWith(p13, Friend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		AcceptFriendRequest = function(p13) --[[ Line: 783 ]]
			-- upvalues: RequestsModule (upval), FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (copy), UpdateIsFriendsWith (copy)
			return RequestsModule.AcceptFriendRequestFromUserId(p13):andThen(function() --[[ Line: 785 ]]
				-- upvalues: p13 (copy), FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (upval), UpdateIsFriendsWith (upval)
				local Friend = Enum.FriendStatus.Friend
				
				if FFlagEnableGetFriendshipStatus or FFlagSduiRequestFriendshipAction then
					DataCacheModule3.replaceItem(p13, Friend)
					UpdateIsFriendsWith(p13, Friend == Enum.FriendStatus.Friend)
					
					return
				end
			end):catch(function(Err) --[[ Line: 788 ]]
				-- upvalues: p13 (copy), FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (upval), UpdateIsFriendsWith (upval)
				if (if type(Err) == "table" then Err.firstErrorCode else nil) ~= 5 then
					error(Err)
					
					return
				end
				local Friend = Enum.FriendStatus.Friend
				
				if FFlagEnableGetFriendshipStatus or FFlagSduiRequestFriendshipAction then
					DataCacheModule3.replaceItem(p13, Friend)
					UpdateIsFriendsWith(p13, Friend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		DeclineFriendRequest = function(p13) --[[ Line: 801 ]]
			-- upvalues: RequestsModule (upval), FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (copy), UpdateIsFriendsWith (copy)
			return RequestsModule.DeclineFriendRequestFromUserId(p13):andThen(function() --[[ Line: 802 ]]
				-- upvalues: p13 (copy), FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (upval), UpdateIsFriendsWith (upval)
				local NotFriend = Enum.FriendStatus.NotFriend
				
				if FFlagEnableGetFriendshipStatus or FFlagSduiRequestFriendshipAction then
					DataCacheModule3.replaceItem(p13, NotFriend)
					UpdateIsFriendsWith(p13, NotFriend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		Unfriend = function(p13) --[[ Line: 807 ]]
			-- upvalues: RequestsModule (upval), FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (copy), UpdateIsFriendsWith (copy)
			return RequestsModule.UnfriendTargetUserId(p13):andThen(function() --[[ Line: 808 ]]
				-- upvalues: p13 (copy), FFlagEnableGetFriendshipStatus (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (upval), UpdateIsFriendsWith (upval)
				local NotFriend = Enum.FriendStatus.NotFriend
				
				if FFlagEnableGetFriendshipStatus or FFlagSduiRequestFriendshipAction then
					DataCacheModule3.replaceItem(p13, NotFriend)
					UpdateIsFriendsWith(p13, NotFriend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end
	}
end