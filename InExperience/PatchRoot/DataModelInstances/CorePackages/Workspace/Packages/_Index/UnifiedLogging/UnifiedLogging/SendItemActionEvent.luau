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

local var7 = function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11)
	-- upvalues: discoveryEventErrorLogger (ref)
	if p0 then
		return {
			collectionComponentType = p8,
			itemComponentType = p9,
			collectionId = p5,
			collectionPosition = p4,
			totalNumberOfItems = p6,
			contentType = p3,
			itemId = p0.id,
			itemPosition = p1,
			positionInRow = p10,
			rowNumber = p2,
			feedRowNumber = p11,
			positionInTopic = p1,
			actionType = p7
		}
	end
	discoveryEventErrorLogger.reportError("SendItemActionEventNilEntry", `Entry at index {p1} was nil when sending item action event for collection {p5}`, { entryIndex = p1, collectionId = p5 })
	
	return {}
end

local _ = function(p12, p13)
	-- upvalues: userEntryUtilsModule (ref)
	local var8 = userEntryUtilsModule.extractFieldsFromUserEntry(p12)
	
	return {
		sourceCarousel = p13,
		presence = var8.presence,
		friendStatus = var8.friendStatus,
		presenceUniverseId = var8.presenceUniverseId
	}
end

return {
	sendFromItemCollection = if fFlagEnableTopSongsSort then function(p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24)
		-- upvalues: discoveryEventErrorLogger (ref), var7 (ref), itemActionEventModule (ref)
		if p14 and p15 then
			itemActionEventModule(p14, p19, p23, var7(p16, p18, p17, p23, p20, p21, p22, p24))
			
			return
		end
		discoveryEventErrorLogger.reportError("SendItemActionEventNilServiceItemCollection", "Event Ingest or App Analytics was nil when trying to send an itemActionEvent for collection", { eventIngest = p14, appAnalytics = p15 })
	end else nil,
	sendFromFriendsCarousel = function(p25, p26, p27, p28, p29, p30, p31, p32, p33, p34)
		-- upvalues: discoveryEventErrorLogger (ref), contentTypeModule (ref), var7 (ref), userEntryUtilsModule (ref), cryoModule (ref), itemActionEventModule (ref)
		if p25 and p26 then
			local user = contentTypeModule.User
			local var9 = userEntryUtilsModule.extractFieldsFromUserEntry(p27)
			itemActionEventModule(p25, p29, user, cryoModule.Dictionary.union(var7(p27, p28, 1, user, p30, p31, p32, p34), {
				sourceCarousel = p33,
				presence = var9.presence,
				friendStatus = var9.friendStatus,
				presenceUniverseId = var9.presenceUniverseId
			}))
			
			return
		end
		discoveryEventErrorLogger.reportError("SendItemActionEventNilService", `Event Ingest or App Analytics was nil when trying to send an itemActionEvent for collection {p31}`, { eventIngest = p25, appAnalytics = p26, sortId = p31 })
	end,
	sendFromServerDrivenUi = function(p35, p36, p37, p38, p39, p40, p41, p42, p43, p44, _, p45, p46, p47)
		-- upvalues: discoveryEventErrorLogger (ref), calculateRowPositionFieldsModule (ref), var7 (ref), cryoModule (ref), appStorageService (ref), itemActionEventModule (ref)
		if not p35 then
			discoveryEventErrorLogger.reportError("SendItemActionEventFromSduiNilService", `Event Ingest was nil when trying to send an itemActionEvent for collection {p40}`, { eventIngest = p35, collectionId = p40 })
			
			return
		end
		local var10 = calculateRowPositionFieldsModule(p37, p42, p47)
		local var11 = cryoModule.Dictionary.join(p38, p36, p46 or {}, var7(p36, p37, var10.rowInSort, p41, p43, p40, p44, p45, p38.collectionComponentType, p36.itemComponentType, var10.positionInRow, var10.rowOnPage))
		local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
		
		if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
			var11.mobileAdvertisingId = mobileAdvertisingIdItem
		end
		if var11.collectionId and type(var11.collectionId) == "string" and type(tonumber(var11.collectionId)) ~= "number" then
			var11.collectionIdStr = var11.collectionId
			var11.collectionId = nil
		end
		itemActionEventModule(p35, p39, p41, var11)
	end
}