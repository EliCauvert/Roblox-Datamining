local AppStorageService = game:GetService("AppStorageService")
local UnifiedLogging = script:FindFirstAncestor("UnifiedLogging")
local Parent = UnifiedLogging.Parent
local CryoModule = require(Parent.Cryo)
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local ContentTypeModule = require(UnifiedLogging.ContentType)
local ItemActionEventModule = require(UnifiedLogging.itemActionEvent)
local UserEntryUtilsModule = require(UnifiedLogging.userEntryUtils)
local _ = require(UnifiedLogging.SduiAnalyticsTypes)
local CalculateRowPositionFieldsModule = require(UnifiedLogging.calculateRowPositionFields)

local function v10(p1, EntryIndex, RowNumber, ContentType, CollectionPosition, CollectionId, TotalNumberOfItems, ActionType, CollectionComponentType, ItemComponentType, PositionInRow, FeedRowNumber) --[[ Line: 19 ]]
	-- upvalues: DiscoveryEventErrorLogger (copy)
	if p1 then
		return {
			collectionComponentType = CollectionComponentType,
			itemComponentType = ItemComponentType,
			collectionId = CollectionId,
			collectionPosition = CollectionPosition,
			totalNumberOfItems = TotalNumberOfItems,
			contentType = ContentType,
			itemId = p1.id,
			itemPosition = EntryIndex,
			positionInRow = PositionInRow,
			rowNumber = RowNumber,
			feedRowNumber = FeedRowNumber,
			positionInTopic = EntryIndex,
			actionType = ActionType
		}
	else
		DiscoveryEventErrorLogger.reportError("SendItemActionEventNilEntry", `Entry at index {EntryIndex} was nil when sending item action event for collection {CollectionId}`, { entryIndex = EntryIndex, collectionId = CollectionId })
		
		return {}
	end
end

local function _(p2, SourceCarousel) --[[ Line: 62 ]]
	-- upvalues: UserEntryUtilsModule (copy)
	local ExtractFieldsFromUserEntryResult = UserEntryUtilsModule.extractFieldsFromUserEntry(p2)
	
	return {
		sourceCarousel = SourceCarousel,
		presence = ExtractFieldsFromUserEntryResult.presence,
		friendStatus = ExtractFieldsFromUserEntryResult.friendStatus,
		presenceUniverseId = ExtractFieldsFromUserEntryResult.presenceUniverseId
	}
end

local function v12(EventIngest, AppAnalytics, p2, RowNumber, EntryIndex, p3, CollectionPosition, CollectionId, TotalNumberOfItems, ContentType, ActionType) --[[ Line: 186 ]]
	-- upvalues: DiscoveryEventErrorLogger (copy), v10 (copy), ItemActionEventModule (copy)
	if EventIngest and AppAnalytics then
		ItemActionEventModule(EventIngest, p3, ContentType, (v10(p2, EntryIndex, RowNumber, ContentType, CollectionPosition, CollectionId, TotalNumberOfItems, ActionType)))
		
		return
	else
		DiscoveryEventErrorLogger.reportError("SendItemActionEventNilServiceItemCollection", "Event Ingest or App Analytics was nil when trying to send an itemActionEvent for collection", { eventIngest = EventIngest, appAnalytics = AppAnalytics })
	end
end

return {
	sendFromItemCollection = if require(Parent.SharedFlags).FFlagEnableTopSongsSort then v12 else nil,
	sendFromFriendsCarousel = function(EventIngest, AppAnalytics, p2, EntryIndex, p3, CollectionPosition, SortId, TotalNumberOfItems, SourceCarousel, ActionType) --[[ Line: 73 ]]
		-- upvalues: DiscoveryEventErrorLogger (copy), ContentTypeModule (copy), v10 (copy), UserEntryUtilsModule (copy), CryoModule (copy), ItemActionEventModule (copy)
		if EventIngest and AppAnalytics then
			local User = ContentTypeModule.User
			local ExtractFieldsFromUserEntryResult = UserEntryUtilsModule.extractFieldsFromUserEntry(p2)
			ItemActionEventModule(EventIngest, p3, User, (CryoModule.Dictionary.union(v10(p2, EntryIndex, 1, User, CollectionPosition, SortId, TotalNumberOfItems, ActionType), {
				sourceCarousel = SourceCarousel,
				presence = ExtractFieldsFromUserEntryResult.presence,
				friendStatus = ExtractFieldsFromUserEntryResult.friendStatus,
				presenceUniverseId = ExtractFieldsFromUserEntryResult.presenceUniverseId
			})))
			
			return
		else
			DiscoveryEventErrorLogger.reportError("SendItemActionEventNilService", `Event Ingest or App Analytics was nil when trying to send an itemActionEvent for collection {SortId}`, {
				eventIngest = EventIngest,
				appAnalytics = AppAnalytics,
				sortId = SortId
			})
		end
	end,
	sendFromServerDrivenUi = function(EventIngest, p4, EntryIndex, p5, p6, CollectionId, ContentType, p7, CollectionPosition, TotalNumberOfItems, _, ActionType, p8, p9) --[[ Line: 119 ]]
		-- upvalues: DiscoveryEventErrorLogger (copy), CalculateRowPositionFieldsModule (copy), v10 (copy), CryoModule (copy), AppStorageService (copy), ItemActionEventModule (copy)
		if not EventIngest then
			DiscoveryEventErrorLogger.reportError("SendItemActionEventFromSduiNilService", `Event Ingest was nil when trying to send an itemActionEvent for collection {CollectionId}`, { eventIngest = EventIngest, collectionId = CollectionId })
			
			return
		end
		local RowPositionFieldsModule = CalculateRowPositionFieldsModule(EntryIndex, p7, p9)
		local JoinResult = CryoModule.Dictionary.join(p5, p4, p8 or {}, (v10(p4, EntryIndex, RowPositionFieldsModule.rowInSort, ContentType, CollectionPosition, CollectionId, TotalNumberOfItems, ActionType, p5.collectionComponentType, p4.itemComponentType, RowPositionFieldsModule.positionInRow, RowPositionFieldsModule.rowOnPage)))
		local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
		
		if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
			JoinResult.mobileAdvertisingId = MobileAdvertisingIdItem
		end
		if JoinResult.collectionId and type(JoinResult.collectionId) == "string" and type((tonumber(JoinResult.collectionId))) ~= "number" then
			JoinResult.collectionIdStr = JoinResult.collectionId
			JoinResult.collectionId = nil
		end
		ItemActionEventModule(EventIngest, p6, ContentType, JoinResult)
	end
}