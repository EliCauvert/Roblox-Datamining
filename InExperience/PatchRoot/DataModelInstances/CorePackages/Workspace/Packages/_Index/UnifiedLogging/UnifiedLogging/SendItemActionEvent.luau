local appStorageService = game:GetService("AppStorageService")
local unifiedLogging = script:FindFirstAncestor("UnifiedLogging")
local parent = unifiedLogging.Parent
local cryoModule = require(parent.Cryo)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local contentTypeModule = require(unifiedLogging.ContentType)
local itemActionEventModule = require(unifiedLogging.itemActionEvent)
local userEntryUtilsModule = require(unifiedLogging.userEntryUtils)
local _ = require(unifiedLogging.SduiAnalyticsTypes)
local calculateRowPositionFieldsModule = require(unifiedLogging.calculateRowPositionFields)
local fFlagEnableTopSongsSort = require(parent.SharedFlags).FFlagEnableTopSongsSort

local var1 = function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
	-- upvalues: discoveryEventErrorLogger (ref)
	if p1 then
		return {
			collectionComponentType = p9,
			itemComponentType = p10,
			collectionId = p6,
			collectionPosition = p5,
			totalNumberOfItems = p7,
			contentType = p4,
			itemId = p1.id,
			itemPosition = p2,
			positionInRow = p11,
			rowNumber = p3,
			feedRowNumber = p12,
			positionInTopic = p2,
			actionType = p8
		}
	end
	discoveryEventErrorLogger.reportError("SendItemActionEventNilEntry", `Entry at index {p2} was nil when sending item action event for collection {p6}`, { entryIndex = p2, collectionId = p6 })
	
	return {}
end

local _ = function(p13, p14)
	-- upvalues: userEntryUtilsModule (ref)
	local var2 = userEntryUtilsModule.extractFieldsFromUserEntry(p13)
	
	return {
		sourceCarousel = p14,
		presence = var2.presence,
		friendStatus = var2.friendStatus,
		presenceUniverseId = var2.presenceUniverseId
	}
end

return {
	sendFromItemCollection = if fFlagEnableTopSongsSort then function(p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23)
		-- upvalues: discoveryEventErrorLogger (ref), var1 (ref), itemActionEventModule (ref)
		if p13 and p14 then
			itemActionEventModule(p13, p18, p22, var1(p15, p17, p16, p22, p19, p20, p21, p23))
			
			return
		end
		discoveryEventErrorLogger.reportError("SendItemActionEventNilServiceItemCollection", "Event Ingest or App Analytics was nil when trying to send an itemActionEvent for collection", { eventIngest = p13, appAnalytics = p14 })
	end else nil,
	sendFromFriendsCarousel = function(p13, p14, p15, p16, p17, p18, p19, p20, p21, p22)
		-- upvalues: discoveryEventErrorLogger (ref), contentTypeModule (ref), var1 (ref), userEntryUtilsModule (ref), cryoModule (ref), itemActionEventModule (ref)
		if p13 and p14 then
			local user = contentTypeModule.User
			local var2 = userEntryUtilsModule.extractFieldsFromUserEntry(p15)
			itemActionEventModule(p13, p17, user, cryoModule.Dictionary.union(var1(p15, p16, 1, user, p18, p19, p20, p22), {
				sourceCarousel = p21,
				presence = var2.presence,
				friendStatus = var2.friendStatus,
				presenceUniverseId = var2.presenceUniverseId
			}))
			
			return
		end
		discoveryEventErrorLogger.reportError("SendItemActionEventNilService", `Event Ingest or App Analytics was nil when trying to send an itemActionEvent for collection {p19}`, { eventIngest = p13, appAnalytics = p14, sortId = p19 })
	end,
	sendFromServerDrivenUi = function(p23, p24, p25, p26, p27, p28, p29, p30, p31, p32, _, p33, p34, p35)
		-- upvalues: discoveryEventErrorLogger (ref), calculateRowPositionFieldsModule (ref), var1 (ref), cryoModule (ref), appStorageService (ref), itemActionEventModule (ref)
		if not p23 then
			discoveryEventErrorLogger.reportError("SendItemActionEventFromSduiNilService", `Event Ingest was nil when trying to send an itemActionEvent for collection {p28}`, { eventIngest = p23, collectionId = p28 })
			
			return
		end
		local var3 = calculateRowPositionFieldsModule(p25, p30, p35)
		local var4 = cryoModule.Dictionary.join(p26, p24, p34 or {}, var1(p24, p25, var3.rowInSort, p29, p31, p28, p32, p33, p26.collectionComponentType, p24.itemComponentType, var3.positionInRow, var3.rowOnPage))
		local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
		
		if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
			var4.mobileAdvertisingId = mobileAdvertisingIdItem
		end
		if var4.collectionId and type(var4.collectionId) == "string" and type(tonumber(var4.collectionId)) ~= "number" then
			var4.collectionIdStr = var4.collectionId
			var4.collectionId = nil
		end
		itemActionEventModule(p23, p27, p29, var4)
	end
}