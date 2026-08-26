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

local var1 = function(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: argCheckModule (ref), discoveryEventErrorLogger (ref), fFlagProfilePlatformEnableImpressions (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	
	for i, v in p1 do
		local var2 = if p2 then p2[v] else nil
		
		if var2 == nil then
			discoveryEventErrorLogger.reportError("SendItemImpressionsEventNilEntry", `Entry at index {v} was nil when sending item impressions for collection {p6}`, { entryIndex = v, collectionId = p6 })
			continue
		end
		local var3, var4
		table.insert(t, var2.id)
		table.insert(t_1, v)
		table.insert(t_3, v)
		local _ = nil
		local _ = nil
		
		if p4 and p4 > 0 then
			var3 = math.ceil(v / p4)
			var4 = v % p4
			
			if var4 == 0 then
				var4 = p4
			end
			table.insert(t_2, var3)
		else
			argCheckModule.assert(p4 ~= 0)
			var3 = 1
			var4 = v
		end
		if p10 then
			table.insert(t_4, p10 + var3 - 1)
			table.insert(t_5, var4)
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
		contentType = p3,
		itemIds = table.concat(t, ","),
		itemPositions = table.concat(t_1, ","),
		positionsInTopic = table.concat(t_3, ","),
		collectionPosition = p5,
		collectionId = p6,
		totalNumberOfItems = p7 or (if p2 then #p2 else 0),
		collectionComponentType = p8,
		collectionIdStr = if fFlagProfilePlatformEnableImpressions then p9 else nil
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

local var5 = function(p11, p12, p13)
	-- upvalues: fFlagLuaAppDesktopFriendCarouselClicks (ref), userEntryUtilsModule (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	
	for i, v in p11 do
		local var6 = if p12 then p12[v] else nil
		
		if var6 ~= nil then
			if fFlagLuaAppDesktopFriendCarouselClicks then
				local var7 = userEntryUtilsModule.extractFieldsFromUserEntry(var6)
				table.insert(t, var7.presence)
				table.insert(t_1, var7.friendStatus)
				table.insert(t_2, var7.presenceUniverseId)
			else
				table.insert(t, if var6.presence then var6.presence.userPresenceType else "")
				table.insert(t_1, if var6.isFriend then "friend" else "notFriend")
				table.insert(t_2, if var6.presence and var6.presence.universeId and var6.presence.universeId ~= "" then var6.presence.universeId else "-1")
			end
		end
	end
	return {
		sourceCarousel = p13,
		presences = table.concat(t, ","),
		friendStatuses = table.concat(t_1, ","),
		presenceUniverseIds = table.concat(t_2, ",")
	}
end

return {
	sendFromFriendsCarousel = function(p14, p15, p16, p17, p18, p19, p20, p21)
		-- upvalues: fFlagLuaAppDesktopFriendCarouselClicks (ref), discoveryEventErrorLogger (ref), contentTypeModule (ref), var1 (ref), var5 (ref), cryoModule (ref), itemImpressionsEventModule (ref)
		if p14 and p15 then
			if not p16 or #p16 == 0 then return end
			if p17 and #p17 ~= 0 then
				local user = contentTypeModule.User
				itemImpressionsEventModule(p14, p18, user, cryoModule.Dictionary.union(var1(p16, p17, user, #p17, p19, p20), var5(p16, p17, p21)))
				
				return
			end
			return
		elseif fFlagLuaAppDesktopFriendCarouselClicks then
			discoveryEventErrorLogger.reportError("SendItemImpressionsService", `Event Ingest or App Analytics was nil when trying to send itemImpressions for collection {p20}`, { eventIngest = p14, appAnalytics = p15, sortId = p20 })
		end
	end,
	sendFromItemCollection = if fFlagEnableTopSongsSort then function(p22, p23, p24, p25, p26, p27, p28, p29, p30, p31, p32)
		-- upvalues: discoveryEventErrorLogger (ref), var1 (ref), fFlagItemImpressionsAddGameMetadata (ref), contentTypeModule (ref), buildGameMetadataFieldsModule (ref), cryoModule (ref), itemImpressionsEventModule (ref)
		if not p22 or not p23 then
			discoveryEventErrorLogger.reportError("SendItemImpressionsService", `Event Ingest or App Analytics was nil when trying to send itemImpressions for collection {p31}`, { eventIngest = p22, appAnalytics = p23, sortId = p31 })
			
			return
		elseif not p24 or #p24 == 0 then return end
		if not p25 or #p25 == 0 then return end
		local var8 = var1(p24, p25, p29, p26, p28, p31, p30, nil, p32)
		
		if not fFlagItemImpressionsAddGameMetadata then
			itemImpressionsEventModule(p22, p27, p29, var8)
			
			return
		elseif p29 == contentTypeModule.Game then
			var8 = cryoModule.Dictionary.union(var8, buildGameMetadataFieldsModule(p24, p25, p32))
		end
		itemImpressionsEventModule(p22, p27, p29, var8)
	end else nil,
	sendFromProfile = if fFlagProfilePlatformEnableImpressions then if fFlagProfilePlatformEnableImpressions then function(p33, p34, p35, p36, p37, p38, p39, p40, p41)
		-- upvalues: discoveryEventErrorLogger (ref), var1 (ref), fFlagItemImpressionsAddGameMetadata (ref), contentTypeModule (ref), buildGameMetadataFieldsModule (ref), cryoModule (ref), itemImpressionsEventModule (ref)
		if not p33 or not p34 then
			discoveryEventErrorLogger.reportError("SendItemImpressionsFromProfile", `Event Ingest or App Analytics was nil when trying to send itemImpressions for collection {p41} on Profile Platform`, {
				eventIngest = p33,
				appAnalytics = p34,
				collectionIdStr = p41
			})
			
			return
		elseif not p35 or #p35 == 0 then return end
		if not p36 or #p36 == 0 then return end
		local var9 = var1(p35, p36, p39, p37, p40, nil, #p36, nil, p41)
		
		if not fFlagItemImpressionsAddGameMetadata then
			itemImpressionsEventModule(p33, p38, p39, var9)
			
			return
		end
		local var10 = var9
		
		if p39 == contentTypeModule.Game then
			var10 = cryoModule.Dictionary.union(var10, buildGameMetadataFieldsModule(p35, p36, p41))
		end
		itemImpressionsEventModule(p33, p38, p39, var10)
	end else nil else nil,
	sendFromServerDrivenUi = function(p42, p43, p44, p45, p46, p47, p48, p49, p50, p51, p52)
		-- upvalues: discoveryEventErrorLogger (ref), var1 (ref), buildItemMetadataFieldsModule (ref), cryoModule (ref), appStorageService (ref), sduiCustomImpressionsEventModule (ref), itemImpressionsEventModule (ref)
		if not p42 then
			discoveryEventErrorLogger.reportError("SendItemImpressionsFromSduiNilService", `Event Ingest was nil when trying to send itemImpressions for collection {p47}`, { collectionId = p47 })
			
			return
		elseif not p43 or #p43 == 0 then return end
		if not p44 or #p44 == 0 then return end
		if not p45 then return end
		local var11 = cryoModule.Dictionary.join(p45, buildItemMetadataFieldsModule(p43, p44, p47), var1(p43, p44, p48, p49, p50, p47, p45.totalNumberOfItems, p45.collectionComponentType, nil, p51))
		local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
		
		if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
			var11.mobileAdvertisingId = mobileAdvertisingIdItem
		end
		if var11.collectionId and type(var11.collectionId) == "string" and type(tonumber(var11.collectionId)) ~= "number" then
			var11.collectionIdStr = var11.collectionId
			var11.collectionId = nil
		end
		if p52 then
			sduiCustomImpressionsEventModule(p52, p46, var11)
			
			return
		end
		itemImpressionsEventModule(p42, p46, p48, var11)
	end
}