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
local gameTileModule = require(parent.GameTile)
local itemLayoutDataParsingUtils = gameTileModule.ItemLayoutDataParsingUtils
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
local fFlagLuaAppFixSearchImpressions = require(parent.SharedFlags).FFlagLuaAppFixSearchImpressions
local fFlagLuaAppGameImpressionsAddUnifiedFields = require(parent.SharedFlags).FFlagLuaAppGameImpressionsAddUnifiedFields
local fFlagSduiFixSearchTelemetry = require(parent.SharedFlags).FFlagSduiFixSearchTelemetry
local fFlagLuaAppSponsoredGamePreviewVideo = require(parent.SharedFlags).FFlagLuaAppSponsoredGamePreviewVideo
local fFlagLuaAppHomeMomentVideoFallback = require(parent.SharedFlags).FFlagLuaAppHomeMomentVideoFallback
local fFlagLuaAppDiscoveryMomentVideoTelemetry = require(parent.SharedFlags).FFlagLuaAppDiscoveryMomentVideoTelemetry

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
	-- upvalues: fFlagLuaAppDiscoveryMomentVideoTelemetry (ref), fFlagLuaAppFixSearchImpressions (ref), gameCollectionItemTypes (ref), discoveryEventErrorLogger (ref), calculateRowPositionFields (ref), argCheckModule (ref), getGameTileLayoutData (ref), getTileBadgeByPositionConfigFromEntry (ref), getValidTileBadges (ref), cryoModule (ref), itemLayoutDataParsingUtils (ref), fFlagLuaAppHomeMomentVideoFallback (ref), gameTileModule (ref), fFlagLuaAppGameImpressionsAddUnifiedFields (ref)
	local v_1
	local t = {}
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local t_6 = {}
	local var2 = if fFlagLuaAppDiscoveryMomentVideoTelemetry then {} else nil
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
	local var3 = false
	
	for i, v in ipairs(p4) do
		local var4 = p5[v]
		
		if var4 ~= nil then
			if fFlagLuaAppFixSearchImpressions and var4.gameCollectionItemTypeOverride == gameCollectionItemTypes.GameCollectionItemType.Blank then
				discoveryEventErrorLogger.reportError("InvalidGameImpressionCollectionItemType", "An impression for a blank tile was attempted to be logged, which should not happen.", {
					entryIndex = v,
					pageContext = p12,
					emphasisFlag = if p11 then p11.emphasisFlag else nil,
					sortPos = if p11 then p11.sortPos else nil,
					gameSortId = p9
				})
				continue
			end
			local uiIndex = var4.uiIndex or v
			local topicContentsIndex = var4.topicContentsIndex or v
			table.insert(t, var4.placeId or 0)
			table.insert(t_1, v)
			table.insert(t_3, var4.universeId or 0)
			table.insert(t_2, topicContentsIndex)
			
			if var4.isSponsored then
				var3 = true
				table.insert(t_7, 1)
				table.insert(t_8, var4.adId or 0)
			else
				table.insert(t_7, 0)
				table.insert(t_8, 0)
			end
			table.insert(t_15, var4.gameCollectionItemTypeOverride or gameCollectionItemTypes.GameCollectionItemType.GameTile)
			local var5 = calculateRowPositionFields(uiIndex, p6, p8)
			
			if p6 and p6 > 0 then
				table.insert(t_9, var5.rowInSort)
				
				if p8 then
					table.insert(t_10, var5.rowOnPage)
					table.insert(t_11, var5.positionInRow)
				end
			else
				argCheckModule.assert(p6 ~= 0)
				
				if p8 then
					table.insert(t_10, p8)
					table.insert(t_11, uiIndex)
				end
			end
			local var6 = getGameTileLayoutData(var4, p9)
			local var7 = getTileBadgeByPositionConfigFromEntry(var4) or var6.tileBadgesByPosition
			local joined = nil
			
			if var4.tileBadgeIds then
				joined = var4.tileBadgeIds
			elseif var7 then
				v_1 = {}
				
				for i_1, v_2 in getValidTileBadges(var7) do
					local var8 = cryoModule.List.map(v_2, function(p13)
						return p13.analyticsId
					end)
					
					if #var8 > 0 then
						table.insert(v_1, i_1 .. "=" .. table.concat(var8, "+"))
					end
				end
				if #v_1 > 0 then
					joined = table.concat(v_1, "&")
				end
			end
			local i_2, var9
			table.insert(t_12, joined or "0")
			
			if not p7 then
				i_2 = var4.analyticsData
				
				if i_2 then
					for var9 in i_2 do
						t_17[var9] = true
					end
				end
				table.insert(t_16, i_2 or {})
			end
			if var4 and var4.thumbnailAssetId then
				table.insert(t_4, var4.thumbnailAssetId)
			else
				i_2 = if var4 and var4.primaryWideImageAssetId then var4.primaryWideImageAssetId else itemLayoutDataParsingUtils.getWideImageAssetId(var6)
				table.insert(t_4, i_2 or (if var4 then var4.primaryWideAssetId else nil) or "0")
			end
			if var4 and var4.thumbnailListId then
				table.insert(t_5, var4.thumbnailListId)
			else
				i_2 = if var4 and var4.primaryWideImageListId then var4.primaryWideImageListId else var6 and (var6.primaryMediaAsset and var6.primaryMediaAsset.wideImageListId)
				table.insert(t_5, i_2 or (if var4 then var4.primaryWideListId else "0"))
			end
			if var4 and var4.videoThumbnailAssetId then
				table.insert(t_6, var4.videoThumbnailAssetId)
				
				if fFlagLuaAppDiscoveryMomentVideoTelemetry then
					table.insert(var2, "0")
				end
			else
				i_2 = nil
				
				if fFlagLuaAppHomeMomentVideoFallback then
					v_1 = gameTileModule.getLayoutDataVideo(var6, var4 and var4.primaryWideVideoAssetId)
					i_2 = v_1 and v_1.assetId
					
					if fFlagLuaAppDiscoveryMomentVideoTelemetry then
						var9 = if v_1 and v_1.isMoment then "1" else "0"
						table.insert(var2, var9)
					end
				elseif var4 and var4.primaryWideVideoAssetId then
					i_2 = var4.primaryWideVideoAssetId
				else
					v_1 = var6 and (var6.primaryMediaAsset and var6.primaryMediaAsset.wideVideoAssetId)
					i_2 = v_1
				end
				table.insert(t_6, i_2 or "0")
			end
			i_2 = nil
			
			if var4 and var4.footer and var4.footer.analytics then
				i_2 = var4.footer.analytics
			elseif var6 and var6.footer and var6.footer.analytics then
				i_2 = var6.footer.analytics
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
	
	if var3 then
		t_18.adFlags = table.concat(t_7, ",")
		t_18.adIds = table.concat(t_8, ",")
	end
	if fFlagLuaAppGameImpressionsAddUnifiedFields then
		t_18.hasSponsoredContent = var3
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
	if fFlagLuaAppDiscoveryMomentVideoTelemetry and #var2 > 0 and not t_17.videoIsMoment then
		t_18.videoIsMoment_arr = table.concat(var2, ",")
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
	local var10 = cryoModule.Dictionary.join(t_19, p10 or {})
	
	if next(var10) then
		t_18.analyticsData = var10
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
				local var11
				if fFlagSduiFixSearchTelemetry then
					var11 = not p16
					
					if not var11 then
						var11 = next(p16) == nil
						var11 = nil
					end
				else
					var11 = not p16 or #p16 == 0
				end
				if var11 then
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
				local var12, var13 = addGameFields(p15, p16, p23, p24, p20, p18, p30)
				var12 = cryoModule.Dictionary.join(var12, {
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
					var12 = var12
					local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
					
					if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
						var12.mobileAdvertisingId = mobileAdvertisingIdItem
					end
				end
				gameImpressionsEventModule(p13, p17, var12)
				reportGameImpressionCountsModule(p14, p17, var13)
				
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
		-- upvalues: fFlagSduiFixSearchTelemetry (ref), addGameFields (ref), fFlagLuaAppFixSearchImpressions (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		local var11
		if not p13 or not p14 then return end
		if not p15 or #p15 == 0 then return end
		if fFlagSduiFixSearchTelemetry then
			var11 = not p16
			
			if not var11 then
				var11 = next(p16) == nil
				var11 = nil
			end
		else
			var11 = not p16 or #p16 == 0
		end
		if var11 then return end
		local var12, var13 = addGameFields(p15, p16, p19, p21, p20, nil, nil, if fFlagLuaAppFixSearchImpressions then p18 else nil, if fFlagLuaAppFixSearchImpressions then p17 else nil)
		local var14 = cryoModule.Dictionary.join(var12, p18, {
			locale = localizationService.RobloxLocaleId,
			componentType = p22
		})
		
		if fFlagLuaAppGameImpressionsMobileAdsId then
			var14 = var14
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var14.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p13, p17, var14)
		reportGameImpressionCountsModule(p14, p17, var13)
	end,
	sendFromGameDetails = function(p13, p14, p15, p16, p17)
		-- upvalues: addGameFields (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		local var11, var12 = addGameFields(p15, p16)
		var11.locale = localizationService.RobloxLocaleId
		var11.refId = p17
		
		if fFlagLuaAppGameImpressionsMobileAdsId then
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var11.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p13, "recommended", var11)
		reportGameImpressionCountsModule(p14, "recommended", var12)
	end,
	sendFromSeeAll = function(p13, p14, p15, p16, p17, p18, p19, p20, p21, p22)
		-- upvalues: fFlagSduiFixSearchTelemetry (ref), fFlagLuaAppSponsoredGamePreviewVideo (ref), logSponsoredGamePreviewVideoExposureIfEligible (ref), addGameFields (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		local var11
		if not p13 or not p14 then return end
		if not p15 or #p15 == 0 then return end
		if fFlagSduiFixSearchTelemetry then
			var11 = not p16
			
			if not var11 then
				var11 = next(p16) == nil
				var11 = nil
			end
		else
			var11 = not p16 or #p16 == 0
		end
		if var11 then return end
		if fFlagLuaAppSponsoredGamePreviewVideo then
			logSponsoredGamePreviewVideoExposureIfEligible(p15, p16, p17)
		end
		local var12, var13 = addGameFields(p15, p16, nil, p22)
		local var14 = cryoModule.Dictionary.join(var12, {
			seeAllFlag = 1,
			gameSetTypeId = p18,
			gameSetTargetId = p19,
			pageId = p20,
			locale = localizationService.RobloxLocaleId,
			appliedFilters = p21
		})
		
		if fFlagLuaAppGameImpressionsMobileAdsId then
			var14 = var14
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var14.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p13, p17, var14)
		reportGameImpressionCountsModule(p14, p17, var13, 1)
	end,
	sendFromTraversalHistoryPage = if fFlagTraversalHistoryDiscoveryTelemetry then function(p13, p14, p15, p16, p17, p18)
		-- upvalues: addGameFields (ref), cryoModule (ref), localizationService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if p13 and p14 then
			local var11, var12 = addGameFields(p15, p16, p17, false, p18)
			gameImpressionsEventModule(p13, "InExpHistoryPage", cryoModule.Dictionary.join(var11, { locale = localizationService.RobloxLocaleId }))
			reportGameImpressionCountsModule(p14, "InExpHistoryPage", var12)
			
			return
		end
	end else nil
}