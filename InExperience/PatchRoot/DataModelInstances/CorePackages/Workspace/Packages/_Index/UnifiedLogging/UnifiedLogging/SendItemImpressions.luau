local appStorageService = game:GetService("AppStorageService")
local unifiedLogging = script:FindFirstAncestor("UnifiedLogging")
local parent = unifiedLogging.Parent
local argCheckModule = require(parent.ArgCheck)
local cryoModule = require(parent.Cryo)
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local contentTypeModule = require(unifiedLogging.ContentType)
local itemImpressionsEventModule = require(unifiedLogging.itemImpressionsEvent)
local sduiCustomImpressionsEventModule = require(unifiedLogging.sduiCustomImpressionsEvent)
local userEntryUtilsModule = require(unifiedLogging.userEntryUtils)
local buildItemMetadataFieldsModule = require(unifiedLogging.buildItemMetadataFields)
local buildGameMetadataFieldsModule = require(unifiedLogging.buildGameMetadataFields)
local _ = require(unifiedLogging.SduiAnalyticsTypes)
local fFlagLuaAppDesktopFriendCarouselClicks = require(parent.SharedFlags).FFlagLuaAppDesktopFriendCarouselClicks
local fFlagProfilePlatformEnableImpressions = require(parent.SharedFlags).FFlagProfilePlatformEnableImpressions
local fFlagItemImpressionsAddGameMetadata = require(parent.SharedFlags).FFlagItemImpressionsAddGameMetadata
local fFlagEnableTopSongsSort = require(parent.SharedFlags).FFlagEnableTopSongsSort

local var10 = function(p0, p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: argCheckModule (ref), discoveryEventErrorLogger (ref), fFlagProfilePlatformEnableImpressions (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	
	for i, v in p0 do
		local var20 = if p1 then p1[v] else nil
		
		if var20 == nil then
			discoveryEventErrorLogger.reportError("SendItemImpressionsEventNilEntry", `Entry at index {v} was nil when sending item impressions for collection {p5}`, { entryIndex = v, collectionId = p5 })
			continue
		end
		local var21, var22
		table.insert(t, var20.id)
		table.insert(t_1, v)
		table.insert(t_3, v)
		local _ = nil
		local _ = nil
		
		if p3 and p3 > 0 then
			var21 = math.ceil(v / p3)
			var22 = v % p3
			
			if var22 == 0 then
				var22 = p3
			end
			table.insert(t_2, var21)
		else
			argCheckModule.assert(p3 ~= 0)
			var21 = 1
			var22 = v
		end
		if p9 then
			table.insert(t_4, p9 + var21 - 1)
			table.insert(t_5, var22)
		end
	end
	local tCount = #t
	argCheckModule.assert(tCount == #t_1)
	
	if #t_2 > 0 then
		argCheckModule.assert(tCount == #t_2)
	end
	if #t_4 > 0 then
		argCheckModule.assert(tCount == #t_4)
	end
	if #t_5 > 0 then
		argCheckModule.assert(tCount == #t_5)
	end
	local t_6 = {
		contentType = p2,
		itemIds = table.concat(t, ","),
		itemPositions = table.concat(t_1, ","),
		positionsInTopic = table.concat(t_3, ","),
		collectionPosition = p4,
		collectionId = p5,
		totalNumberOfItems = p6 or (if p1 then #p1 else 0),
		collectionComponentType = p7,
		collectionIdStr = if fFlagProfilePlatformEnableImpressions then p8 else nil
	}
	
	if #t_2 > 0 then
		t_6.rowNumbers = table.concat(t_2, ",")
	end
	if #t_4 > 0 then
		t_6.feedRowNumbers = table.concat(t_4, ",")
	end
	if #t_5 > 0 then
		t_6.positionsInRow = table.concat(t_5, ",")
	end
	return t_6
end

local var11 = function(p10, p11, p12)
	-- upvalues: fFlagLuaAppDesktopFriendCarouselClicks (ref), userEntryUtilsModule (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p10 do
		local var26 = if p11 then p11[v] else nil
		
		if var26 ~= nil then
			if fFlagLuaAppDesktopFriendCarouselClicks then
				local var27 = userEntryUtilsModule.extractFieldsFromUserEntry(var26)
				table.insert(t, var27.presence)
				table.insert(t_1, var27.friendStatus)
				table.insert(t_2, var27.presenceUniverseId)
			else
				table.insert(t, if var26.presence then var26.presence.userPresenceType else "")
				table.insert(t_1, if var26.isFriend then "friend" else "notFriend")
				table.insert(t_2, if var26.presence and var26.presence.universeId and var26.presence.universeId ~= "" then var26.presence.universeId else "-1")
			end
		end
	end
	return {
		sourceCarousel = p12,
		presences = table.concat(t, ","),
		friendStatuses = table.concat(t_1, ","),
		presenceUniverseIds = table.concat(t_2, ",")
	}
end

return {
	sendFromFriendsCarousel = function(p13, p14, p15, p16, p17, p18, p19, p20)
		-- upvalues: fFlagLuaAppDesktopFriendCarouselClicks (ref), discoveryEventErrorLogger (ref), contentTypeModule (ref), var10 (ref), var11 (ref), cryoModule (ref), itemImpressionsEventModule (ref)
		if p13 and p14 then
			if not p15 or #p15 == 0 then return end
			if p16 and #p16 ~= 0 then
				local user = contentTypeModule.User
				itemImpressionsEventModule(p13, p17, user, cryoModule.Dictionary.union(var10(p15, p16, user, #p16, p18, p19), var11(p15, p16, p20)))
				
				return
			end
			return
		elseif fFlagLuaAppDesktopFriendCarouselClicks then
			discoveryEventErrorLogger.reportError("SendItemImpressionsService", `Event Ingest or App Analytics was nil when trying to send itemImpressions for collection {p19}`, { eventIngest = p13, appAnalytics = p14, sortId = p19 })
		end
	end,
	sendFromItemCollection = if fFlagEnableTopSongsSort then function(p21, p22, p23, p24, p25, p26, p27, p28, p29, p30, p31)
		-- upvalues: discoveryEventErrorLogger (ref), var10 (ref), fFlagItemImpressionsAddGameMetadata (ref), contentTypeModule (ref), buildGameMetadataFieldsModule (ref), cryoModule (ref), itemImpressionsEventModule (ref)
		if not p21 or not p22 then
			discoveryEventErrorLogger.reportError("SendItemImpressionsService", `Event Ingest or App Analytics was nil when trying to send itemImpressions for collection {p30}`, { eventIngest = p21, appAnalytics = p22, sortId = p30 })
			
			return
		elseif not p23 or #p23 == 0 then return end
		if not p24 or #p24 == 0 then return end
		local var28 = var10(p23, p24, p28, p25, p27, p30, p29, nil, p31)
		
		if not fFlagItemImpressionsAddGameMetadata then
			itemImpressionsEventModule(p21, p26, p28, var28)
			
			return
		elseif p28 == contentTypeModule.Game then
			var28 = cryoModule.Dictionary.union(var28, buildGameMetadataFieldsModule(p23, p24, p31))
		end
		itemImpressionsEventModule(p21, p26, p28, var28)
	end else nil,
	sendFromProfile = if fFlagProfilePlatformEnableImpressions then if fFlagProfilePlatformEnableImpressions then function(p32, p33, p34, p35, p36, p37, p38, p39, p40)
		-- upvalues: discoveryEventErrorLogger (ref), var10 (ref), fFlagItemImpressionsAddGameMetadata (ref), contentTypeModule (ref), buildGameMetadataFieldsModule (ref), cryoModule (ref), itemImpressionsEventModule (ref)
		if not p32 or not p33 then
			discoveryEventErrorLogger.reportError("SendItemImpressionsFromProfile", `Event Ingest or App Analytics was nil when trying to send itemImpressions for collection {p40} on Profile Platform`, {
				eventIngest = p32,
				appAnalytics = p33,
				collectionIdStr = p40
			})
			
			return
		elseif not p34 or #p34 == 0 then return end
		if not p35 or #p35 == 0 then return end
		local var29 = var10(p34, p35, p38, p36, p39, nil, #p35, nil, p40)
		
		if not fFlagItemImpressionsAddGameMetadata then
			itemImpressionsEventModule(p32, p37, p38, var29)
			
			return
		end
		local var30 = var29
		
		if p38 == contentTypeModule.Game then
			var30 = cryoModule.Dictionary.union(var30, buildGameMetadataFieldsModule(p34, p35, p40))
		end
		itemImpressionsEventModule(p32, p37, p38, var30)
	end else nil else nil,
	sendFromServerDrivenUi = function(p41, p42, p43, p44, p45, p46, p47, p48, p49, p50, p51)
		-- upvalues: discoveryEventErrorLogger (ref), var10 (ref), buildItemMetadataFieldsModule (ref), cryoModule (ref), appStorageService (ref), sduiCustomImpressionsEventModule (ref), itemImpressionsEventModule (ref)
		if not p41 then
			discoveryEventErrorLogger.reportError("SendItemImpressionsFromSduiNilService", `Event Ingest was nil when trying to send itemImpressions for collection {p46}`, { collectionId = p46 })
			
			return
		elseif not p42 or #p42 == 0 then return end
		if not p43 or #p43 == 0 then return end
		if not p44 then return end
		local var31 = cryoModule.Dictionary.join(p44, buildItemMetadataFieldsModule(p42, p43, p46), var10(p42, p43, p47, p48, p49, p46, p44.totalNumberOfItems, p44.collectionComponentType, nil, p50))
		local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
		
		if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
			var31.mobileAdvertisingId = mobileAdvertisingIdItem
		end
		if var31.collectionId and type(var31.collectionId) == "string" and type(tonumber(var31.collectionId)) ~= "number" then
			var31.collectionIdStr = var31.collectionId
			var31.collectionId = nil
		end
		if p51 then
			sduiCustomImpressionsEventModule(p51, p45, var31)
			
			return
		end
		itemImpressionsEventModule(p41, p45, p47, var31)
	end
}