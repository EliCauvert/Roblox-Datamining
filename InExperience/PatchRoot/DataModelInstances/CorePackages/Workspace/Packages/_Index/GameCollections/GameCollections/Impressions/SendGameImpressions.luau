local localizationService = game:GetService("LocalizationService")
local appStorageService = game:GetService("AppStorageService")
local parent = script:FindFirstAncestor("GameCollections").Parent
local argCheckModule = require(parent.ArgCheck)
local loggingProtocolModule = require(parent.LoggingProtocol)
local cryoModule = require(parent.Cryo)
local getGameTileLayoutData = require(parent.GameTile).getGameTileLayoutData
local getValidTileBadges = require(parent.GameTile).getValidTileBadges
local getTileBadgeByPositionConfigFromEntry = require(parent.GameTile).getTileBadgeByPositionConfigFromEntry
local itemLayoutDataParsingUtils = require(parent.GameTile).ItemLayoutDataParsingUtils
local calculateRowPositionFields = require(parent.UnifiedLogging).calculateRowPositionFields
local discoveryEventErrorLogger = require(parent.DiscoveryUtils).DiscoveryEventErrorLogger
local gameCollectionItemTypes = require(parent.DiscoveryTypes).GameCollectionItemTypes
local gameImpressionsEventModule = require(script.Parent.gameImpressionsEvent)
local reportGameImpressionCountsModule = require(script.Parent.reportGameImpressionCounts)
local feedItemRowDataHitCounterModule = require(script.Parent.FeedItemRowDataHitCounter)
local feedItemRowDataMissingCounterModule = require(script.Parent.FeedItemRowDataMissingCounter)
local fFlagLuaAppGameImpressionsMobileAdsId = require(parent.SharedFlags).FFlagLuaAppGameImpressionsMobileAdsId
local fFlagTraversalHistoryDiscoveryTelemetry = require(parent.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry
local fFlagLuaAppAddComponentTypeToSearchImpressions = require(parent.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions
local fFlagLuaAppFixSearchImpressions = require(parent.SharedFlags).FFlagLuaAppFixSearchImpressions
local fFlagLuaAppGameImpressionsAddUnifiedFields = require(parent.SharedFlags).FFlagLuaAppGameImpressionsAddUnifiedFields
local fFlagSduiFixSearchTelemetry = require(parent.SharedFlags).FFlagSduiFixSearchTelemetry

local function addGameFields(p1, p2, p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: fFlagLuaAppFixSearchImpressions (ref), gameCollectionItemTypes (ref), discoveryEventErrorLogger (ref), calculateRowPositionFields (ref), argCheckModule (ref), getGameTileLayoutData (ref), getTileBadgeByPositionConfigFromEntry (ref), getValidTileBadges (ref), cryoModule (ref), itemLayoutDataParsingUtils (ref), fFlagLuaAppGameImpressionsAddUnifiedFields (ref)
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = {}
	local t_7 = {}
	local t_8 = {}
	local t_9 = {}
	local t_10 = {}
	local t_11 = {}
	local t_12 = {}
	local t_13 = {}
	local t_14 = {}
	local t_15 = {}
	local t_16 = {}
	local t_17 = {}
	local var1 = false
	
	for i, v in ipairs(p1) do
		local var2 = p2[v]
		
		if var2 ~= nil then
			if fFlagLuaAppFixSearchImpressions and var2.gameCollectionItemTypeOverride == gameCollectionItemTypes.GameCollectionItemType.Blank then
				discoveryEventErrorLogger.reportError("InvalidGameImpressionCollectionItemType", "An impression for a blank tile was attempted to be logged, which should not happen.", {
					entryIndex = v,
					pageContext = p9,
					emphasisFlag = if p8 then p8.emphasisFlag else nil,
					sortPos = if p8 then p8.sortPos else nil,
					gameSortId = p6
				})
				continue
			end
			local uiIndex = var2.uiIndex or v
			local topicContentsIndex = var2.topicContentsIndex or v
			table.insert(t, var2.placeId or 0)
			table.insert(t_1, v)
			table.insert(t_3, var2.universeId or 0)
			table.insert(t_2, topicContentsIndex)
			
			if var2.isSponsored then
				var1 = true
				table.insert(t_7, 1)
				table.insert(t_8, var2.adId or 0)
			else
				table.insert(t_7, 0)
				table.insert(t_8, 0)
			end
			table.insert(t_15, var2.gameCollectionItemTypeOverride or gameCollectionItemTypes.GameCollectionItemType.GameTile)
			local var3 = calculateRowPositionFields(uiIndex, p3, p5)
			
			if p3 and p3 > 0 then
				table.insert(t_9, var3.rowInSort)
				
				if p5 then
					table.insert(t_10, var3.rowOnPage)
					table.insert(t_11, var3.positionInRow)
				end
			else
				argCheckModule.assert(p3 ~= 0)
				
				if p5 then
					table.insert(t_10, p5)
					table.insert(t_11, uiIndex)
				end
			end
			local var4 = getGameTileLayoutData(var2, p6)
			local var5 = getTileBadgeByPositionConfigFromEntry(var2) or var4.tileBadgesByPosition
			local joined = nil
			
			if var2.tileBadgeIds then
				joined = var2.tileBadgeIds
			elseif var5 then
				local t_18 = {}
				
				for i_1, v_1 in getValidTileBadges(var5) do
					local var6 = cryoModule.List.map(v_1, function(p10)
						return p10.analyticsId
					end)
					
					if #var6 > 0 then
						table.insert(t_18, i_1 .. "=" .. table.concat(var6, "+"))
					end
				end
				if #t_18 > 0 then
					joined = table.concat(t_18, "&")
				end
			end
			local i_2
			table.insert(t_12, joined or "0")
			
			if not p4 then
				i_2 = var2.analyticsData
				
				if i_2 then
					for i_1 in i_2 do
						t_17[i_1] = true
					end
				end
				table.insert(t_16, i_2 or {})
			end
			if var2 and var2.thumbnailAssetId then
				table.insert(t_4, var2.thumbnailAssetId)
			else
				i_2 = if var2 and var2.primaryWideImageAssetId then var2.primaryWideImageAssetId else itemLayoutDataParsingUtils.getWideImageAssetId(var4)
				table.insert(t_4, i_2 or (if var2 then var2.primaryWideAssetId else nil) or "0")
			end
			if var2 and var2.thumbnailListId then
				table.insert(t_5, var2.thumbnailListId)
			else
				i_2 = if var2 and var2.primaryWideImageListId then var2.primaryWideImageListId else var4 and (var4.primaryMediaAsset and var4.primaryMediaAsset.wideImageListId)
				table.insert(t_5, i_2 or (if var2 then var2.primaryWideListId else "0"))
			end
			if var2 and var2.videoThumbnailAssetId then
				table.insert(t_6, var2.videoThumbnailAssetId)
			else
				i_2 = if var2 and var2.primaryWideVideoAssetId then var2.primaryWideVideoAssetId else var4 and (var4.primaryMediaAsset and var4.primaryMediaAsset.wideVideoAssetId)
				table.insert(t_6, i_2 or "0")
			end
			i_2 = nil
			
			if var2 and var2.footer and var2.footer.analytics then
				i_2 = var2.footer.analytics
			elseif var4 and var4.footer and var4.footer.analytics then
				i_2 = var4.footer.analytics
			end
			if i_2 and i_2.textLiteral then
				table.insert(t_13, i_2.textLiteral)
			else
				table.insert(t_13, "0")
			end
			if i_2 and i_2.locKey then
				table.insert(t_14, i_2.locKey)
			else
				table.insert(t_14, "0")
			end
		end
	end
	local tCount = #t
	argCheckModule.assert(tCount == #t_1)
	argCheckModule.assert(tCount == #t_2)
	argCheckModule.assert(tCount == #t_3)
	argCheckModule.assert(tCount == #t_7)
	argCheckModule.assert(tCount == #t_8)
	
	if #t_9 > 0 then
		argCheckModule.assert(tCount == #t_9)
	end
	if #t_10 > 0 then
		argCheckModule.assert(tCount == #t_10)
	end
	if #t_11 > 0 then
		argCheckModule.assert(tCount == #t_11)
	end
	local t_18 = {
		rootPlaceIds = table.concat(t, ","),
		absPositions = table.concat(t_1, ","),
		topicDataPositions = table.concat(t_2, ","),
		universeIds = table.concat(t_3, ",")
	}
	
	if var1 then
		t_18.adFlags = table.concat(t_7, ",")
		t_18.adIds = table.concat(t_8, ",")
	end
	if fFlagLuaAppGameImpressionsAddUnifiedFields then
		t_18.hasSponsoredContent = var1
	end
	if #t_9 > 0 then
		t_18.rows = table.concat(t_9, ",")
	end
	if #t_10 > 0 then
		t_18.rowsOnPage = table.concat(t_10, ",")
	end
	if #t_11 > 0 then
		t_18.positionsInRows = table.concat(t_11, ",")
	end
	if p4 and #t_4 > 0 then
		t_18.thumbnailAssetIds = table.concat(t_4, ",")
	end
	if p4 and #t_5 > 0 then
		t_18.thumbnailListIds = table.concat(t_5, ",")
	end
	if p4 and #t_6 > 0 then
		t_18.videoThumbnailAssetIds = table.concat(t_6, ",")
	end
	if #t_12 > 0 then
		t_18.tileBadgeContexts = table.concat(t_12, ",")
	end
	if t_13 and #t_13 > 0 then
		t_18.footerTextLiterals = table.concat(t_13, ",")
	end
	if t_14 and #t_14 > 0 then
		t_18.footerLocalizationKeys = table.concat(t_14, ",")
	end
	if #t_15 > 0 then
		t_18.tileTypes = table.concat(t_15, ",")
	end
	local t_19 = {}
	
	if next(t_17) then
		for i_1 in t_17 do
			local t_20 = {}
			
			for i_2, v_1 in t_16 do
				table.insert(t_20, v_1[i_1] or "0")
			end
			t_19[`{i_1}_arr`] = table.concat(t_20, ",")
		end
	end
	local var7 = cryoModule.Dictionary.join(t_19, p7 or {})
	
	if next(var7) then
		t_18.analyticsData = var7
	end
	return t_18, tCount
end

local function _(p10)
	-- upvalues: appStorageService (ref)
	local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
	
	if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
		p10.mobileAdvertisingId = mobileAdvertisingIdItem
	end
end

local _ = function(p10)
	-- upvalues: fFlagSduiFixSearchTelemetry (ref)
	return if fFlagSduiFixSearchTelemetry then not p10 or next(p10) == nil else not p10 or #p10 == 0
end

return {
	sendFromTopicContents = function(p10, p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27)
		-- upvalues: fFlagSduiFixSearchTelemetry (ref), loggingProtocolModule (ref), feedItemRowDataHitCounterModule (ref), feedItemRowDataMissingCounterModule (ref), addGameFields (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if p10 and p11 then
			if p12 and #p12 ~= 0 then
				local var8
				if fFlagSduiFixSearchTelemetry then
					var8 = not p13
					
					if not var8 then
						var8 = next(p13) == nil
						var8 = nil
					end
				else
					var8 = not p13 or #p13 == 0
				end
				if var8 then
					if p25 then
						p25(`Missing topicContentsEntries or topicContentsEntries == 0 {p13}`)
					end
					return
				elseif p17 then
					loggingProtocolModule.default:logRobloxTelemetryCounter(feedItemRowDataHitCounterModule)
				else
					loggingProtocolModule.default:logRobloxTelemetryCounter(feedItemRowDataMissingCounterModule)
				end
				local _ = nil
				local _ = nil
				local var9, var10 = addGameFields(p12, p13, p20, p21, p17, p15, p27)
				var9 = cryoModule.Dictionary.join(var9, {
					sortPos = p16,
					gameSetTypeId = p15,
					gameSetTargetId = p18,
					pageId = p19,
					componentType = p22,
					locale = localizationService.RobloxLocaleId,
					appliedFilters = p23,
					loadSource = p24,
					sortSubId = p26
				})
				
				if fFlagLuaAppGameImpressionsMobileAdsId then
					var9 = var9
					local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
					
					if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
						var9.mobileAdvertisingId = mobileAdvertisingIdItem
					end
				end
				gameImpressionsEventModule(p10, p14, var9)
				reportGameImpressionCountsModule(p11, p14, var10)
				
				return
			elseif p25 then
				p25(`Missing impressionsToSend or impressionsToSend == 0 {p12}`)
			end
			return
		elseif p25 then
			p25(`Missing analytics service eventIngest: {p10} appAnalytics: {p11}`)
		end
	end,
	sendFromSearch = function(p10, p11, p12, p13, p14, p15, p16, p17, p18, p19)
		-- upvalues: fFlagSduiFixSearchTelemetry (ref), addGameFields (ref), fFlagLuaAppFixSearchImpressions (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		local var8
		if not p10 or not p11 then return end
		if not p12 or #p12 == 0 then return end
		if fFlagSduiFixSearchTelemetry then
			var8 = not p13
			
			if not var8 then
				var8 = next(p13) == nil
				var8 = nil
			end
		else
			var8 = not p13 or #p13 == 0
		end
		if var8 then return end
		local var9, var10 = addGameFields(p12, p13, p16, p18, p17, nil, nil, if fFlagLuaAppFixSearchImpressions then p15 else nil, if fFlagLuaAppFixSearchImpressions then p14 else nil)
		
		if fFlagLuaAppAddComponentTypeToSearchImpressions then
			var9 = cryoModule.Dictionary.join(var9, p15, {
				locale = localizationService.RobloxLocaleId,
				componentType = p19
			})
		else
			var9.locale = localizationService.RobloxLocaleId
			var9 = cryoModule.Dictionary.join(var9, p15)
		end
		if fFlagLuaAppGameImpressionsMobileAdsId then
			local var11 = var9
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var11.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p10, p14, var9)
		reportGameImpressionCountsModule(p11, p14, var10)
	end,
	sendFromGameDetails = function(p10, p11, p12, p13, p14)
		-- upvalues: addGameFields (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		local var8, var9 = addGameFields(p12, p13)
		var8.locale = localizationService.RobloxLocaleId
		var8.refId = p14
		
		if fFlagLuaAppGameImpressionsMobileAdsId then
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var8.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p10, "recommended", var8)
		reportGameImpressionCountsModule(p11, "recommended", var9)
	end,
	sendFromSeeAll = function(p10, p11, p12, p13, p14, p15, p16, p17, p18, p19)
		-- upvalues: fFlagSduiFixSearchTelemetry (ref), addGameFields (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		local var8
		if not p10 or not p11 then return end
		if not p12 or #p12 == 0 then return end
		if fFlagSduiFixSearchTelemetry then
			var8 = not p13
			
			if not var8 then
				var8 = next(p13) == nil
				var8 = nil
			end
		else
			var8 = not p13 or #p13 == 0
		end
		if var8 then return end
		local var9, var10 = addGameFields(p12, p13, nil, p19)
		local var11 = cryoModule.Dictionary.join(var9, {
			seeAllFlag = 1,
			gameSetTypeId = p15,
			gameSetTargetId = p16,
			pageId = p17,
			locale = localizationService.RobloxLocaleId,
			appliedFilters = p18
		})
		
		if fFlagLuaAppGameImpressionsMobileAdsId then
			var11 = var11
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var11.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p10, p14, var11)
		reportGameImpressionCountsModule(p11, p14, var10, 1)
	end,
	sendFromTraversalHistoryPage = if fFlagTraversalHistoryDiscoveryTelemetry then function(p10, p11, p12, p13, p14, p15)
		-- upvalues: addGameFields (ref), cryoModule (ref), localizationService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if p10 and p11 then
			local var8, var9 = addGameFields(p12, p13, p14, false, p15)
			gameImpressionsEventModule(p10, "InExpHistoryPage", cryoModule.Dictionary.join(var8, { locale = localizationService.RobloxLocaleId }))
			reportGameImpressionCountsModule(p11, "InExpHistoryPage", var9)
			
			return
		end
	end else nil
}