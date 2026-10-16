local AppStorageService = game:GetService("AppStorageService")
local UnifiedLogging = script:FindFirstAncestor("UnifiedLogging")
local Parent = UnifiedLogging.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local CryoModule = require(Parent.Cryo)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local ContentTypeModule = require(UnifiedLogging.ContentType)
local ItemImpressionsEventModule = require(UnifiedLogging.itemImpressionsEvent)
local SduiCustomImpressionsEventModule = require(UnifiedLogging.sduiCustomImpressionsEvent)
local UserEntryUtilsModule = require(UnifiedLogging.userEntryUtils)
local BuildItemMetadataFieldsModule = require(UnifiedLogging.buildItemMetadataFields)
local BuildGameMetadataFieldsModule = require(UnifiedLogging.buildGameMetadataFields)
local _ = require(UnifiedLogging.SduiAnalyticsTypes)
local FFlagLuaAppDesktopFriendCarouselClicks = require(Parent.SharedFlags).FFlagLuaAppDesktopFriendCarouselClicks
local FFlagProfilePlatformEnableImpressions = require(Parent.SharedFlags).FFlagProfilePlatformEnableImpressions
local FFlagItemImpressionsAddGameMetadata = require(Parent.SharedFlags).FFlagItemImpressionsAddGameMetadata
local FFlagEnableTopSongsSort = require(Parent.SharedFlags).FFlagEnableTopSongsSort

local function v17(EntryIndexes, p1, ContentType, Count: number, CollectionPosition, CollectionId, TotalNumberOfItems, CollectionComponentType, CollectionIdStr, p2: number) --[[ Line: 25 ]]
	-- upvalues: ArgCheckModule (copy), DiscoveryEventErrorLogger (copy), FFlagProfilePlatformEnableImpressions (copy)
	local List = {}
	local List1 = {}
	local List2 = {}
	local List3 = {}
	local List4 = {}
	local List5 = {}
	
	for _, entryIndex in EntryIndexes do
		local v1 = p1 and p1[entryIndex] or nil
		
		if v1 == nil then
			DiscoveryEventErrorLogger.reportError("SendItemImpressionsEventNilEntry", `Entry at index {entryIndex} was nil when sending item impressions for collection {CollectionId}`, { entryIndex = entryIndex, collectionId = CollectionId })
			continue
		end
		table.insert(List, v1.id)
		table.insert(List1, entryIndex)
		table.insert(List3, entryIndex)
		local Ceiled = nil
		local EntryIndex = nil
		
		if Count and Count > 0 then
			Ceiled = math.ceil(entryIndex / Count)
			EntryIndex = entryIndex % Count
			
			if EntryIndex == 0 then
				EntryIndex = Count
			end
			table.insert(List2, Ceiled)
		else
			ArgCheckModule.assert(Count ~= 0)
			Ceiled = 1
			EntryIndex = entryIndex
		end
		if p2 then
			table.insert(List4, p2 + Ceiled - 1)
			table.insert(List5, EntryIndex)
		end
	end
	local CountList = #List
	ArgCheckModule.assert(CountList == #List1)
	
	if #List2 > 0 then
		ArgCheckModule.assert(CountList == #List2)
	end
	if #List4 > 0 then
		ArgCheckModule.assert(CountList == #List4)
	end
	if #List5 > 0 then
		ArgCheckModule.assert(CountList == #List5)
	end
	local config = {
		contentType = ContentType,
		itemIds = table.concat(List, ","),
		itemPositions = table.concat(List1, ","),
		positionsInTopic = table.concat(List3, ","),
		collectionPosition = CollectionPosition,
		collectionId = CollectionId,
		totalNumberOfItems = if TotalNumberOfItems then TotalNumberOfItems elseif p1 then #p1 else 0,
		collectionComponentType = CollectionComponentType,
		collectionIdStr = if FFlagProfilePlatformEnableImpressions then CollectionIdStr else nil
	}
	
	if #List2 > 0 then
		config.rowNumbers = table.concat(List2, ",")
	end
	if #List4 > 0 then
		config.feedRowNumbers = table.concat(List4, ",")
	end
	if #List5 > 0 then
		config.positionsInRow = table.concat(List5, ",")
	end
	return config
end

local function v18(List, p3, SourceCarousel) --[[ Line: 125 ]]
	-- upvalues: FFlagLuaAppDesktopFriendCarouselClicks (copy), UserEntryUtilsModule (copy)
	local List1 = {}
	local List2 = {}
	local List3 = {}
	
	for _, value in List do
		local v2 = p3 and p3[value] or nil
		
		if v2 ~= nil then
			if FFlagLuaAppDesktopFriendCarouselClicks then
				local ExtractFieldsFromUserEntryResult = UserEntryUtilsModule.extractFieldsFromUserEntry(v2)
				table.insert(List1, ExtractFieldsFromUserEntryResult.presence)
				table.insert(List2, ExtractFieldsFromUserEntryResult.friendStatus)
				table.insert(List3, ExtractFieldsFromUserEntryResult.presenceUniverseId)
			else
				table.insert(List1, v2.presence and v2.presence.userPresenceType or "")
				table.insert(List2, if v2.isFriend then "friend" else "notFriend")
				table.insert(List3, if v2.presence and v2.presence.universeId and v2.presence.universeId ~= "" then v2.presence.universeId else "-1")
			end
		end
	end
	return {
		sourceCarousel = SourceCarousel,
		presences = table.concat(List1, ","),
		friendStatuses = table.concat(List2, ","),
		presenceUniverseIds = table.concat(List3, ",")
	}
end

local v3 = if FFlagProfilePlatformEnableImpressions then function(EventIngest, AppAnalytics, p4, p5, p6, p7, ContentType, CollectionPosition, CollectionIdStr) --[[ Line: 214 ]]
	-- upvalues: DiscoveryEventErrorLogger (copy), v17 (copy), FFlagItemImpressionsAddGameMetadata (copy), ContentTypeModule (copy), BuildGameMetadataFieldsModule (copy), CryoModule (copy), ItemImpressionsEventModule (copy)
	if not EventIngest or not AppAnalytics then
		DiscoveryEventErrorLogger.reportError("SendItemImpressionsFromProfile", `Event Ingest or App Analytics was nil when trying to send itemImpressions for collection {CollectionIdStr} on Profile Platform`, {
			eventIngest = EventIngest,
			appAnalytics = AppAnalytics,
			collectionIdStr = CollectionIdStr
		})
		
		return
	end
	if not p4 or #p4 == 0 then return end
	if not p5 or #p5 == 0 then return end
	local v4 = v17(p4, p5, ContentType, p6, CollectionPosition, nil, #p5, nil, CollectionIdStr)
	
	if not FFlagItemImpressionsAddGameMetadata then
		ItemImpressionsEventModule(EventIngest, p7, ContentType, v4)
		
		return
	end
	local UnionResult = v4
	
	if ContentType == ContentTypeModule.Game then
		UnionResult = CryoModule.Dictionary.union(UnionResult, (BuildGameMetadataFieldsModule(p4, p5, CollectionIdStr)))
	end
	ItemImpressionsEventModule(EventIngest, p7, ContentType, UnionResult)
end else nil

local function v20(EventIngest, AppAnalytics, p8, p9, p10, p11, CollectionPosition, ContentType, p12, SortId, p13) --[[ Line: 346 ]]
	-- upvalues: DiscoveryEventErrorLogger (copy), v17 (copy), FFlagItemImpressionsAddGameMetadata (copy), ContentTypeModule (copy), BuildGameMetadataFieldsModule (copy), CryoModule (copy), ItemImpressionsEventModule (copy)
	if not EventIngest or not AppAnalytics then
		DiscoveryEventErrorLogger.reportError("SendItemImpressionsService", `Event Ingest or App Analytics was nil when trying to send itemImpressions for collection {SortId}`, {
			eventIngest = EventIngest,
			appAnalytics = AppAnalytics,
			sortId = SortId
		})
		
		return
	end
	if not p8 or #p8 == 0 then return end
	if not p9 or #p9 == 0 then return end
	local UnionResult = v17(p8, p9, ContentType, p10, CollectionPosition, SortId, p12, nil, p13)
	
	if not FFlagItemImpressionsAddGameMetadata then
		ItemImpressionsEventModule(EventIngest, p11, ContentType, UnionResult)
		
		return
	end
	if ContentType == ContentTypeModule.Game then
		UnionResult = CryoModule.Dictionary.union(UnionResult, (BuildGameMetadataFieldsModule(p8, p9, p13)))
	end
	ItemImpressionsEventModule(EventIngest, p11, ContentType, UnionResult)
end

return {
	sendFromFriendsCarousel = function(EventIngest, AppAnalytics, p14, p15, p16, CollectionPosition, SortId, SourceCarousel) --[[ Line: 166 ]]
		-- upvalues: FFlagLuaAppDesktopFriendCarouselClicks (copy), DiscoveryEventErrorLogger (copy), ContentTypeModule (copy), v17 (copy), v18 (copy), CryoModule (copy), ItemImpressionsEventModule (copy)
		if EventIngest and AppAnalytics then
			if not p14 or #p14 == 0 then return end
			if p15 and #p15 ~= 0 then
				local User = ContentTypeModule.User
				ItemImpressionsEventModule(EventIngest, p16, User, (CryoModule.Dictionary.union(v17(p14, p15, User, #p15, CollectionPosition, SortId), (v18(p14, p15, SourceCarousel)))))
				
				return
			end
			return
		elseif FFlagLuaAppDesktopFriendCarouselClicks then
			DiscoveryEventErrorLogger.reportError("SendItemImpressionsService", `Event Ingest or App Analytics was nil when trying to send itemImpressions for collection {SortId}`, {
				eventIngest = EventIngest,
				appAnalytics = AppAnalytics,
				sortId = SortId
			})
		end
	end,
	sendFromItemCollection = if FFlagEnableTopSongsSort then v20 else nil,
	sendFromProfile = if FFlagProfilePlatformEnableImpressions then v3 else nil,
	sendFromServerDrivenUi = function(p17, p18, p19, p20, p21, CollectionId, ContentType, p22, CollectionPosition, p23, p24) --[[ Line: 273 ]]
		-- upvalues: DiscoveryEventErrorLogger (copy), v17 (copy), BuildItemMetadataFieldsModule (copy), CryoModule (copy), AppStorageService (copy), SduiCustomImpressionsEventModule (copy), ItemImpressionsEventModule (copy)
		if not p17 then
			DiscoveryEventErrorLogger.reportError("SendItemImpressionsFromSduiNilService", `Event Ingest was nil when trying to send itemImpressions for collection {CollectionId}`, { collectionId = CollectionId })
			
			return
		end
		if not p18 or #p18 == 0 then return end
		if not p19 or #p19 == 0 then return end
		if not p20 then return end
		local JoinResult = CryoModule.Dictionary.join(p20, BuildItemMetadataFieldsModule(p18, p19, CollectionId), (v17(p18, p19, ContentType, p22, CollectionPosition, CollectionId, p20.totalNumberOfItems, p20.collectionComponentType, nil, p23)))
		local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
		
		if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
			JoinResult.mobileAdvertisingId = MobileAdvertisingIdItem
		end
		if JoinResult.collectionId and type(JoinResult.collectionId) == "string" and type((tonumber(JoinResult.collectionId))) ~= "number" then
			JoinResult.collectionIdStr = JoinResult.collectionId
			JoinResult.collectionId = nil
		end
		if p24 then
			SduiCustomImpressionsEventModule(p24, p21, JoinResult)
			
			return
		else
			ItemImpressionsEventModule(p17, p21, ContentType, JoinResult)
		end
	end
}