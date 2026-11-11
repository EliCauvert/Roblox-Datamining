local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local CreateDataCacheModule = require(DataHydration.createDataCache)
local CreateDataResolverModule = require(DataHydration.createDataResolver)
local DataStatus = require(DataHydration.DataHydrationTypes).DataStatus
local GetLocalPlayerUserIdFunction = require(DataHydration.DataHydrationUtils).getLocalPlayerUserId
local CryoModule = require(Parent.Cryo)
local SignalsModule = require(Parent.Signals)
local SharedFlagsModule = require(Parent.SharedFlags)
local LocalUserIdStore = require(Parent.UserLib).Stores.LocalUserIdStore
local FFlagSduiRequestFriendshipAction = SharedFlagsModule.FFlagSduiRequestFriendshipAction
local FFlagFriendSortedByPresenceSignalsImplementation = SharedFlagsModule.FFlagFriendSortedByPresenceSignalsImplementation
local RequestsModule = require(DataHydration.Friends.Requests)
local FindFriendsSortModule = require(DataHydration.Friends.Enums.FindFriendsSort)
local MapFriendshipStatusToEnumModule = require(DataHydration.Friends.mapFriendshipStatusToEnum)
local PresenceStoreModule = require(DataHydration.Presence.PresenceStore)
local NormalizePresenceRawDataModule = require(DataHydration.Presence.normalizePresenceRawData)
local PresenceTypeModule = require(DataHydration.Presence.Enums.PresenceType)
local _ = require(DataHydration.Presence.createPresenceStore)
game:DefineFastInt("FriendsStoreProcessDelaySec", 1)

local function _()
	return game:GetFastInt("FriendsStoreProcessDelaySec")
end

local OnlineFriendsCacheTtlSec = game:DefineFastInt("OnlineFriendsCacheTtlSec", 0)
local IsFriendsWithCacheTtlSec = game:DefineFastInt("IsFriendsWithCacheTtlSec", 0)
local AllFriendsCacheTtlSec = game:DefineFastInt("AllFriendsCacheTtlSec", 0)
local FriendshipStatusCacheTtlSec = game:DefineFastInt("FriendshipStatusCacheTtlSec", 0)

local _ = function(p1: number): number
	return if p1 and p1 > 0 then p1 else 1e999
end

local FriendsPageSize = game:DefineFastInt("FriendsPageSize", 50)
local InitialFriendsPageSize = game:DefineFastInt("InitialFriendsPageSize", 20)

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

local _ = function(p1)
	return if p1 == nil or p1 == "" then nil else p1
end

local function normalizeFindFriendsPageResponse(p1)
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

local function mergeListsWithoutDuplicates(Tbl, Friends, p2)
	-- upvalues: CryoModule (copy)
	if not Friends or #Friends == 0 then
		return if Tbl then Tbl else {}
	elseif Tbl and #Tbl ~= 0 then
		local Set = CryoModule.List.toSet(CryoModule.List.map(Tbl, function(p3)
			-- upvalues: p2 (copy)
			return if p2 then p3[p2] else p3
		end))
		
		return CryoModule.List.join(table.clone(Tbl), (CryoModule.List.filter(Friends, function(p3): boolean
			-- upvalues: p2 (copy), Set (copy)
			return not Set[if p2 then p3[p2] else p3]
		end)))
	else
		return Friends
	end
end

local function mergeAllFriendsPage(DataResult, p3, NextCursor)
	-- upvalues: mergeListsWithoutDuplicates (copy)
	if DataResult then
		local NextCursor1 = DataResult.nextCursor
		local NextCursor2 = if NextCursor1 == nil or NextCursor1 == "" then nil else NextCursor1
		local NextCursor3 = if NextCursor == nil or NextCursor == "" then nil else NextCursor
		
		return if NextCursor2 == NextCursor3 then {
			friends = mergeListsWithoutDuplicates(DataResult.friends, p3.friends, "id"),
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

local _ = function(p3)
	-- upvalues: LocalUserIdStore (copy), GetLocalPlayerUserIdFunction (copy)
	local CurrentUserId = LocalUserIdStore.getCurrentUserId(p3)
	
	if CurrentUserId == "" then
		local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
		
		return if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
	else
		return CurrentUserId
	end
end

return function()
	-- upvalues: PresenceStoreModule (copy), FFlagFriendSortedByPresenceSignalsImplementation (copy), GetLocalPlayerUserIdFunction (copy), CreateDataCacheModule (copy), OnlineFriendsCacheTtlSec (copy), IsFriendsWithCacheTtlSec (copy), AllFriendsCacheTtlSec (copy), FFlagSduiRequestFriendshipAction (copy), FriendshipStatusCacheTtlSec (copy), LocalUserIdStore (copy), mergeListsWithoutDuplicates (copy), NormalizePresenceRawDataModule (copy), PresenceTypeModule (copy), normalizeStoredOnlineFriendRow (copy), normalizePresenceFromOnlineFriendsRow (copy), CreateDataResolverModule (copy), RequestsModule (copy), MapFriendshipStatusToEnumModule (copy), CryoModule (copy), FriendsPageSize (copy), InitialFriendsPageSize (copy), FindFriendsSortModule (copy), normalizeFindFriendsPageResponse (copy), mergeAllFriendsPage (copy), SignalsModule (copy), DataStatus (copy)
	local GetResult = PresenceStoreModule.get()
	local Text = if FFlagFriendSortedByPresenceSignalsImplementation then nil else tostring(GetLocalPlayerUserIdFunction())
	local DataCacheModule = CreateDataCacheModule(if OnlineFriendsCacheTtlSec and OnlineFriendsCacheTtlSec > 0 then OnlineFriendsCacheTtlSec else 1e999)
	local IsFriendsWithCacheTtlSec1: number = IsFriendsWithCacheTtlSec
	local DataCacheModule1 = CreateDataCacheModule(if IsFriendsWithCacheTtlSec1 and IsFriendsWithCacheTtlSec1 > 0 then IsFriendsWithCacheTtlSec1 else 1e999)
	local DataCacheModule2 = CreateDataCacheModule(if AllFriendsCacheTtlSec and AllFriendsCacheTtlSec > 0 then AllFriendsCacheTtlSec else 1e999)
	local Flag = false
	local DataCacheModule3 = if FFlagSduiRequestFriendshipAction then CreateDataCacheModule(if FriendshipStatusCacheTtlSec and FriendshipStatusCacheTtlSec > 0 then FriendshipStatusCacheTtlSec else 1e999) else nil
	local Tbl = {}
	
	local function appendUserToAllFriends(Id)
		-- upvalues: FFlagFriendSortedByPresenceSignalsImplementation (upval), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), Text (copy), DataCacheModule2 (copy), mergeListsWithoutDuplicates (upval)
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
			local Id1 = mergeListsWithoutDuplicates(DataResult.friends, { { id = Id } }, "id")
			
			if #Id1 == #DataResult.friends then return end
			DataCacheModule2.replaceItem(Text1, {
				friends = Id1,
				nextCursor = DataResult.nextCursor,
				hasMore = DataResult.hasMore
			})
		end
	end
	
	local function UpdateIsFriendsWith(Id, IsFriendMatch)
		-- upvalues: DataCacheModule1 (copy), appendUserToAllFriends (copy), GetResult (copy)
		DataCacheModule1.replaceItem(Id, IsFriendMatch)
		
		if IsFriendMatch then
			appendUserToAllFriends(Id)
		end
		if not IsFriendMatch then
			GetResult.UpdateUserPresence(Id, nil, { isUpdatedRealtime = false })
		end
	end
	
	local function _(Id, p3)
		-- upvalues: GetResult (copy), DataCacheModule1 (copy), appendUserToAllFriends (copy)
		GetResult.UpdateUserPresence(Id, p3, { isUpdatedRealtime = true })
		DataCacheModule1.replaceItem(Id, true)
		appendUserToAllFriends(Id)
	end
	
	local function updateOfflineFriendDependencies(Id)
		-- upvalues: GetResult (copy), NormalizePresenceRawDataModule (upval), PresenceTypeModule (upval), DataCacheModule1 (copy), appendUserToAllFriends (copy)
		GetResult.UpdateUserPresence(Id, GetResult.GetPresenceByUserId(Id, { skipFetch = true }).data(false) or NormalizePresenceRawDataModule({ userPresenceType = PresenceTypeModule.Offline }), { isUpdatedRealtime = true })
		DataCacheModule1.replaceItem(Id, true)
		appendUserToAllFriends(Id)
	end
	
	local function applyGetOnlineFriendsResponseBody(p3)
		-- upvalues: normalizeStoredOnlineFriendRow (upval), normalizePresenceFromOnlineFriendsRow (upval), GetResult (copy), DataCacheModule1 (copy), appendUserToAllFriends (copy)
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
			end
		end
		return t
	end
	
	local DataResolverModule = CreateDataResolverModule({
		supportsMultiGet = false,
		replaceItems = true,
		cache = DataCacheModule,
		fetchFn = function(p4, p5)
			-- upvalues: RequestsModule (upval), GetResult (copy), NormalizePresenceRawDataModule (upval), PresenceTypeModule (upval), applyGetOnlineFriendsResponseBody (copy)
			local DataResult = p5.data(false) or {}
			
			return RequestsModule.GetOnlineFriends(p4):andThen(function(Result)
				-- upvalues: DataResult (copy), GetResult (upval), NormalizePresenceRawDataModule (upval), PresenceTypeModule (upval), applyGetOnlineFriendsResponseBody (upval)
				for _, value in DataResult do
					local Id = value and value.id
					local Text = if Id then tostring(Id) else nil
					
					if Text then
						GetResult.UpdateUserPresence(Text, NormalizePresenceRawDataModule({ userPresenceType = PresenceTypeModule.Offline }), { isUpdatedRealtime = true })
					end
				end
				return (applyGetOnlineFriendsResponseBody(Result))
			end):catch(function(Err)
				error(Err)
			end)
		end
	})
	
	local _ = function(p6)
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
		return RequestsModule.MultiGetFriendshipStatuses(Text1, p6):andThen(function(Result)
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
		fetchFn = function(p7)
			-- upvalues: CryoModule (upval), FFlagFriendSortedByPresenceSignalsImplementation (upval), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), Text (copy), RequestsModule (upval), MapFriendshipStatusToEnumModule (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (copy)
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
			return RequestsModule.MultiGetFriendshipStatuses(Text1, KeysResult):andThen(function(Result)
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
			end):andThen(function(Result)
				-- upvalues: FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (upval)
				if FFlagSduiRequestFriendshipAction then
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
	local DataResolverModule2 = if FFlagSduiRequestFriendshipAction then CreateDataResolverModule({
		cache = DataCacheModule3,
		queueProcessDelaySec = game:GetFastInt("FriendsStoreProcessDelaySec"),
		fetchFn = function(p8)
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
			return RequestsModule.MultiGetFriendshipStatuses(Text1, KeysResult):andThen(function(Result)
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
			end):andThen(function(Result)
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
		fetchFn = function(p9, p10)
			-- upvalues: Flag (ref), FriendsPageSize (upval), InitialFriendsPageSize (upval), RequestsModule (upval), FindFriendsSortModule (upval), normalizeFindFriendsPageResponse (upval), updateOfflineFriendDependencies (copy), mergeAllFriendsPage (upval)
			local DataResult = if Flag then nil else p10.data(false)
			Flag = false
			local NextCursor = if DataResult then DataResult.nextCursor else nil
			
			return RequestsModule.GetFindFriendsPage(p9, {
				limit = if DataResult then FriendsPageSize else InitialFriendsPageSize,
				cursor = NextCursor,
				sort = FindFriendsSortModule.FriendshipScore
			}):andThen(function(Result)
				-- upvalues: normalizeFindFriendsPageResponse (upval), updateOfflineFriendDependencies (upval), mergeAllFriendsPage (upval), DataResult (copy), NextCursor (copy)
				local NormalizeFindFriendsPageResponseResult = normalizeFindFriendsPageResponse(Result)
				
				for _, friend in NormalizeFindFriendsPageResponseResult.friends do
					updateOfflineFriendDependencies(friend.id)
				end
				return (mergeAllFriendsPage(DataResult, NormalizeFindFriendsPageResponseResult, NextCursor))
			end):catch(function(Err)
				error(Err)
			end)
		end
	})
	local Computed = SignalsModule.createComputed(function(p11)
		-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule (copy), GetResult (copy), DataResolverModule1 (copy), PresenceTypeModule (upval)
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
		return List
	end)
	local Computed1 = SignalsModule.createComputed(function(p12)
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
			friends = CryoModule.List.filter(DataResult.friends or {}, function(p13)
				-- upvalues: DataResolverModule1 (upval), p12 (copy)
				return DataResolverModule1.getCachedItem(p13.id).data(p12)
			end),
			hasMore = DataResult.hasMore,
			nextCursor = DataResult.nextCursor
		}
	end)
	local Computed2 = SignalsModule.createComputed(function(p12)
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
		GetOnlineFriends = function()
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
		GetOnlineFriendsByUniverseId = function(Key)
			-- upvalues: Tbl (copy), SignalsModule (upval), Computed (copy)
			local Entry = Tbl[Key]
			
			if Entry then
				return Entry
			else
				local Computed1 = SignalsModule.createComputed(function(p12)
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
		GetAllFriends = function()
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), DataResolverModule3 (copy), Computed1 (copy)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			DataResolverModule3.getAndFetchItem(CurrentUserId1)
			
			return Computed1
		end,
		GetAllFriendsStatus = function()
			-- upvalues: Computed2 (copy)
			return Computed2
		end,
		FetchMoreFriends = function()
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
		RefetchAllFriends = function()
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
		GetIsFriendWith = function(p12)
			-- upvalues: DataResolverModule1 (copy)
			return DataResolverModule1.getAndFetchItem(p12)
		end,
		UpdateIsFriendsWith = UpdateIsFriendsWith,
		GetFriendshipStatus = function(p12)
			-- upvalues: FFlagSduiRequestFriendshipAction (upval), DataResolverModule2 (copy)
			return if FFlagSduiRequestFriendshipAction and p12 ~= "" then DataResolverModule2.getAndFetchItem(p12) else nil
		end,
		UpdateFriendshipStatus = function(p12, FriendStatus)
			-- upvalues: FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (copy), UpdateIsFriendsWith (copy)
			if FFlagSduiRequestFriendshipAction then
				DataCacheModule3.replaceItem(p12, FriendStatus)
				UpdateIsFriendsWith(p12, FriendStatus == Enum.FriendStatus.Friend)
				
				return
			end
		end,
		RequestFriendship = function(p12, p13)
			-- upvalues: RequestsModule (upval), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (copy), UpdateIsFriendsWith (copy)
			return RequestsModule.RequestFriendshipFromUserId(p12, p13):andThen(function()
				-- upvalues: p12 (copy), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (upval), UpdateIsFriendsWith (upval)
				local FriendRequestSent = Enum.FriendStatus.FriendRequestSent
				
				if FFlagSduiRequestFriendshipAction then
					DataCacheModule3.replaceItem(p12, FriendRequestSent)
					UpdateIsFriendsWith(p12, FriendRequestSent == Enum.FriendStatus.Friend)
					
					return
				end
			end):catch(function(Err)
				-- upvalues: p12 (copy), FFlagSduiRequestFriendshipAction (upval), DataCacheModule3 (upval), UpdateIsFriendsWith (upval)
				if (if type(Err) == "table" then Err.firstErrorCode else nil) ~= 5 then
					error(Err)
					
					return
				end
				local Friend = Enum.FriendStatus.Friend
				
				if FFlagSduiRequestFriendshipAction then
					DataCacheModule3.replaceItem(p12, Friend)
					UpdateIsFriendsWith(p12, Friend == Enum.FriendStatus.Friend)
					
					return
				end
			end)
		end,
		RefetchOnlineFriends = function()
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
		clear = function()
			-- upvalues: DataResolverModule (copy), DataResolverModule1 (copy), DataResolverModule3 (copy), FFlagSduiRequestFriendshipAction (upval), DataResolverModule2 (copy), Tbl (copy)
			DataResolverModule.clear()
			DataResolverModule1.clear()
			DataResolverModule3.clear()
			
			if FFlagSduiRequestFriendshipAction then
				DataResolverModule2.clear()
			end
			table.clear(Tbl)
		end,
		dispose = function()
			-- upvalues: DataResolverModule (copy), DataResolverModule1 (copy), DataResolverModule3 (copy), FFlagSduiRequestFriendshipAction (upval), DataResolverModule2 (copy), Tbl (copy)
			DataResolverModule.dispose()
			DataResolverModule1.dispose()
			DataResolverModule3.dispose()
			
			if FFlagSduiRequestFriendshipAction then
				DataResolverModule2.dispose()
			end
			table.clear(Tbl)
		end,
		_fetchOnlineFriendsAsync = function()
			-- upvalues: LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval), RequestsModule (upval), applyGetOnlineFriendsResponseBody (copy), DataCacheModule (copy)
			local CurrentUserId = LocalUserIdStore.getCurrentUserId(false)
			local CurrentUserId1 = nil
			
			if CurrentUserId == "" then
				local LocalPlayerUserId = GetLocalPlayerUserIdFunction()
				CurrentUserId1 = if LocalPlayerUserId then tostring(LocalPlayerUserId) else ""
			else
				CurrentUserId1 = CurrentUserId
			end
			return RequestsModule.GetOnlineFriends(CurrentUserId1):andThen(function(Result)
				-- upvalues: applyGetOnlineFriendsResponseBody (upval), DataCacheModule (upval), CurrentUserId1 (copy)
				DataCacheModule.replaceItems({
					[CurrentUserId1] = applyGetOnlineFriendsResponseBody(Result)
				})
				
				return Result or { data = nil }
			end):catch(function(Err)
				error(Err)
			end)
		end,
		_updateFriendsPresences = function(List, p12, _)
			-- upvalues: normalizeStoredOnlineFriendRow (upval), NormalizePresenceRawDataModule (upval), GetResult (copy), DataCacheModule1 (copy), appendUserToAllFriends (copy), DataCacheModule (copy), LocalUserIdStore (upval), GetLocalPlayerUserIdFunction (upval)
			if not List then return end
			local P51 = p12 or {}
			local t = {}
			
			for _, value in pairs(List) do
				local UserId = value.userId
				local Text = if UserId then tostring(UserId) else nil
				
				if Text then
					t[Text] = normalizeStoredOnlineFriendRow({ id = Text, sortScore = P51[Text] })
					GetResult.UpdateUserPresence(Text, NormalizePresenceRawDataModule(value), { isUpdatedRealtime = true })
					DataCacheModule1.replaceItem(Text, true)
					appendUserToAllFriends(Text)
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
		end
	}
end