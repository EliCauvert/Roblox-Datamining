local localizationService = game:GetService("LocalizationService")
local gameCollections = script:FindFirstAncestor("GameCollections")
local appStorageService = game:GetService("AppStorageService")
local IXPService = game:GetService("IXPService")
local parent = gameCollections.Parent
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
local appPage = require(parent.RobloxAppEnums).AppPage
local appUserLayers = require(parent.ExperimentLayers).AppUserLayers
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
local fFlagLuaAppSponsoredGamePreviewVideo = require(parent.SharedFlags).FFlagLuaAppSponsoredGamePreviewVideo

local function logSponsoredGamePreviewVideoExposureIfEligible(p1, p2, p3)
	-- upvalues: appPage (ref), IXPService (ref), appUserLayers (ref), discoveryEventErrorLogger (ref)
	for i, v in ipairs(p1) do
		local var1 = p2[v]
		
		if var1 and var1.isSponsored and var1.sponsoredGamePreviewVideoEligible == true then
			if p3 == appPage.Home then
				IXPService:LogUserLayerExposure(appUserLayers.SponsoredGamePreviewVideo)
				
				return
			end
			discoveryEventErrorLogger.reportError("SponsoredGamePreviewVideoEligibleImpressionOutsideHome", "A sponsored GPV-eligible tile was impressed outside Home; exposure was suppressed", { pageContext = p3, entryIndex = v })
			
			return
		end
	end
end

local function addGameFields(p4, p5, p6, p7, p8, p9, p10, p11, p12)
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
	local var2 = false
	
	for i, v in ipairs(p4) do
		local var3 = p5[v]
		
		if var3 ~= nil then
			if fFlagLuaAppFixSearchImpressions and var3.gameCollectionItemTypeOverride == gameCollectionItemTypes.GameCollectionItemType.Blank then
				discoveryEventErrorLogger.reportError("InvalidGameImpressionCollectionItemType", "An impression for a blank tile was attempted to be logged, which should not happen.", {
					entryIndex = v,
					pageContext = p12,
					emphasisFlag = if p11 then p11.emphasisFlag else nil,
					sortPos = if p11 then p11.sortPos else nil,
					gameSortId = p9
				})
				continue
			end
			local uiIndex = var3.uiIndex or v
			local topicContentsIndex = var3.topicContentsIndex or v
			table.insert(t, var3.placeId or 0)
			table.insert(t_1, v)
			table.insert(t_3, var3.universeId or 0)
			table.insert(t_2, topicContentsIndex)
			
			if var3.isSponsored then
				var2 = true
				table.insert(t_7, 1)
				table.insert(t_8, var3.adId or 0)
			else
				table.insert(t_7, 0)
				table.insert(t_8, 0)
			end
			table.insert(t_15, var3.gameCollectionItemTypeOverride or gameCollectionItemTypes.GameCollectionItemType.GameTile)
			local var4 = calculateRowPositionFields(uiIndex, p6, p8)
			
			if p6 and p6 > 0 then
				table.insert(t_9, var4.rowInSort)
				
				if p8 then
					table.insert(t_10, var4.rowOnPage)
					table.insert(t_11, var4.positionInRow)
				end
			else
				argCheckModule.assert(p6 ~= 0)
				
				if p8 then
					table.insert(t_10, p8)
					table.insert(t_11, uiIndex)
				end
			end
			local var5 = getGameTileLayoutData(var3, p9)
			local var6 = getTileBadgeByPositionConfigFromEntry(var3) or var5.tileBadgesByPosition
			local joined = nil
			
			if var3.tileBadgeIds then
				joined = var3.tileBadgeIds
			elseif var6 then
				local t_18 = {}
				
				for i_1, v_1 in getValidTileBadges(var6) do
					local var7 = cryoModule.List.map(v_1, function(p13)
						return p13.analyticsId
					end)
					
					if #var7 > 0 then
						table.insert(t_18, i_1 .. "=" .. table.concat(var7, "+"))
					end
				end
				if #t_18 > 0 then
					joined = table.concat(t_18, "&")
				end
			end
			local i_2
			table.insert(t_12, joined or "0")
			
			if not p7 then
				i_2 = var3.analyticsData
				
				if i_2 then
					for i_1 in i_2 do
						t_17[i_1] = true
					end
				end
				table.insert(t_16, i_2 or {})
			end
			if var3 and var3.thumbnailAssetId then
				table.insert(t_4, var3.thumbnailAssetId)
			else
				i_2 = if var3 and var3.primaryWideImageAssetId then var3.primaryWideImageAssetId else itemLayoutDataParsingUtils.getWideImageAssetId(var5)
				table.insert(t_4, i_2 or (if var3 then var3.primaryWideAssetId else nil) or "0")
			end
			if var3 and var3.thumbnailListId then
				table.insert(t_5, var3.thumbnailListId)
			else
				i_2 = if var3 and var3.primaryWideImageListId then var3.primaryWideImageListId else var5 and (var5.primaryMediaAsset and var5.primaryMediaAsset.wideImageListId)
				table.insert(t_5, i_2 or (if var3 then var3.primaryWideListId else "0"))
			end
			if var3 and var3.videoThumbnailAssetId then
				table.insert(t_6, var3.videoThumbnailAssetId)
			else
				i_2 = if var3 and var3.primaryWideVideoAssetId then var3.primaryWideVideoAssetId else var5 and (var5.primaryMediaAsset and var5.primaryMediaAsset.wideVideoAssetId)
				table.insert(t_6, i_2 or "0")
			end
			i_2 = nil
			
			if var3 and var3.footer and var3.footer.analytics then
				i_2 = var3.footer.analytics
			elseif var5 and var5.footer and var5.footer.analytics then
				i_2 = var5.footer.analytics
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
	
	if var2 then
		t_18.adFlags = table.concat(t_7, ",")
		t_18.adIds = table.concat(t_8, ",")
	end
	if fFlagLuaAppGameImpressionsAddUnifiedFields then
		t_18.hasSponsoredContent = var2
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
	if p7 and #t_4 > 0 then
		t_18.thumbnailAssetIds = table.concat(t_4, ",")
	end
	if p7 and #t_5 > 0 then
		t_18.thumbnailListIds = table.concat(t_5, ",")
	end
	if p7 and #t_6 > 0 then
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
	local var8 = cryoModule.Dictionary.join(t_19, p10 or {})
	
	if next(var8) then
		t_18.analyticsData = var8
	end
	return t_18, tCount
end

local function _(p13)
	-- upvalues: appStorageService (ref)
	local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
	
	if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
		p13.mobileAdvertisingId = mobileAdvertisingIdItem
	end
end

local _ = function(p13)
	-- upvalues: fFlagSduiFixSearchTelemetry (ref)
	return if fFlagSduiFixSearchTelemetry then not p13 or next(p13) == nil else not p13 or #p13 == 0
end

return {
	sendFromTopicContents = function(p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29, p30)
		-- upvalues: fFlagSduiFixSearchTelemetry (ref), fFlagLuaAppSponsoredGamePreviewVideo (ref), logSponsoredGamePreviewVideoExposureIfEligible (ref), loggingProtocolModule (ref), feedItemRowDataHitCounterModule (ref), feedItemRowDataMissingCounterModule (ref), addGameFields (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if p13 and p14 then
			if p15 and #p15 ~= 0 then
				local var9
				if fFlagSduiFixSearchTelemetry then
					var9 = not p16
					
					if not var9 then
						var9 = next(p16) == nil
						var9 = nil
					end
				else
					var9 = not p16 or #p16 == 0
				end
				if var9 then
					if p28 then
						p28(`Missing topicContentsEntries or topicContentsEntries == 0 {p16}`)
					end
					return
				elseif fFlagLuaAppSponsoredGamePreviewVideo then
					logSponsoredGamePreviewVideoExposureIfEligible(p15, p16, p17)
				end
				if p20 then
					loggingProtocolModule.default:logRobloxTelemetryCounter(feedItemRowDataHitCounterModule)
				else
					loggingProtocolModule.default:logRobloxTelemetryCounter(feedItemRowDataMissingCounterModule)
				end
				local _ = nil
				local _ = nil
				local var10, var11 = addGameFields(p15, p16, p23, p24, p20, p18, p30)
				var10 = cryoModule.Dictionary.join(var10, {
					sortPos = p19,
					gameSetTypeId = p18,
					gameSetTargetId = p21,
					pageId = p22,
					componentType = p25,
					locale = localizationService.RobloxLocaleId,
					appliedFilters = p26,
					loadSource = p27,
					sortSubId = p29
				})
				
				if fFlagLuaAppGameImpressionsMobileAdsId then
					var10 = var10
					local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
					
					if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
						var10.mobileAdvertisingId = mobileAdvertisingIdItem
					end
				end
				gameImpressionsEventModule(p13, p17, var10)
				reportGameImpressionCountsModule(p14, p17, var11)
				
				return
			elseif p28 then
				p28(`Missing impressionsToSend or impressionsToSend == 0 {p15}`)
			end
			return
		elseif p28 then
			p28(`Missing analytics service eventIngest: {p13} appAnalytics: {p14}`)
		end
	end,
	sendFromSearch = function(p13, p14, p15, p16, p17, p18, p19, p20, p21, p22)
		-- upvalues: fFlagSduiFixSearchTelemetry (ref), addGameFields (ref), fFlagLuaAppFixSearchImpressions (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		local var9
		if not p13 or not p14 then return end
		if not p15 or #p15 == 0 then return end
		if fFlagSduiFixSearchTelemetry then
			var9 = not p16
			
			if not var9 then
				var9 = next(p16) == nil
				var9 = nil
			end
		else
			var9 = not p16 or #p16 == 0
		end
		if var9 then return end
		local var10, var11 = addGameFields(p15, p16, p19, p21, p20, nil, nil, if fFlagLuaAppFixSearchImpressions then p18 else nil, if fFlagLuaAppFixSearchImpressions then p17 else nil)
		
		if fFlagLuaAppAddComponentTypeToSearchImpressions then
			var10 = cryoModule.Dictionary.join(var10, p18, {
				locale = localizationService.RobloxLocaleId,
				componentType = p22
			})
		else
			var10.locale = localizationService.RobloxLocaleId
			var10 = cryoModule.Dictionary.join(var10, p18)
		end
		if fFlagLuaAppGameImpressionsMobileAdsId then
			local var12 = var10
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var12.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p13, p17, var10)
		reportGameImpressionCountsModule(p14, p17, var11)
	end,
	sendFromGameDetails = function(p13, p14, p15, p16, p17)
		-- upvalues: addGameFields (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		local var9, var10 = addGameFields(p15, p16)
		var9.locale = localizationService.RobloxLocaleId
		var9.refId = p17
		
		if fFlagLuaAppGameImpressionsMobileAdsId then
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var9.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p13, "recommended", var9)
		reportGameImpressionCountsModule(p14, "recommended", var10)
	end,
	sendFromSeeAll = function(p13, p14, p15, p16, p17, p18, p19, p20, p21, p22)
		-- upvalues: fFlagSduiFixSearchTelemetry (ref), fFlagLuaAppSponsoredGamePreviewVideo (ref), logSponsoredGamePreviewVideoExposureIfEligible (ref), addGameFields (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		local var9
		if not p13 or not p14 then return end
		if not p15 or #p15 == 0 then return end
		if fFlagSduiFixSearchTelemetry then
			var9 = not p16
			
			if not var9 then
				var9 = next(p16) == nil
				var9 = nil
			end
		else
			var9 = not p16 or #p16 == 0
		end
		if var9 then return end
		if fFlagLuaAppSponsoredGamePreviewVideo then
			logSponsoredGamePreviewVideoExposureIfEligible(p15, p16, p17)
		end
		local var10, var11 = addGameFields(p15, p16, nil, p22)
		local var12 = cryoModule.Dictionary.join(var10, {
			seeAllFlag = 1,
			gameSetTypeId = p18,
			gameSetTargetId = p19,
			pageId = p20,
			locale = localizationService.RobloxLocaleId,
			appliedFilters = p21
		})
		
		if fFlagLuaAppGameImpressionsMobileAdsId then
			var12 = var12
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var12.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p13, p17, var12)
		reportGameImpressionCountsModule(p14, p17, var11, 1)
	end,
	sendFromTraversalHistoryPage = if fFlagTraversalHistoryDiscoveryTelemetry then function(p13, p14, p15, p16, p17, p18)
		-- upvalues: addGameFields (ref), cryoModule (ref), localizationService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if p13 and p14 then
			local var9, var10 = addGameFields(p15, p16, p17, false, p18)
			gameImpressionsEventModule(p13, "InExpHistoryPage", cryoModule.Dictionary.join(var9, { locale = localizationService.RobloxLocaleId }))
			reportGameImpressionCountsModule(p14, "InExpHistoryPage", var10)
			
			return
		end
	end else nil
}