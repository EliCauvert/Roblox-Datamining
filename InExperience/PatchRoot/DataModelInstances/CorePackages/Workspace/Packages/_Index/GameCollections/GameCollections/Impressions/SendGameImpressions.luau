local LocalizationService = game:GetService("LocalizationService")
local AppStorageService = game:GetService("AppStorageService")
local IXPService = game:GetService("IXPService")
local Parent = script:FindFirstAncestor("GameCollections").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local CryoModule = require(Parent.Cryo)
local GetGameTileLayoutDataFunction = require(Parent.GameTile).getGameTileLayoutData
local GetValidTileBadgesFunction = require(Parent.GameTile).getValidTileBadges
local GetTileBadgeByPositionConfigFromEntryFunction = require(Parent.GameTile).getTileBadgeByPositionConfigFromEntry
local GameTileModule = require(Parent.GameTile)
local ItemLayoutDataParsingUtils = GameTileModule.ItemLayoutDataParsingUtils
local CalculateRowPositionFieldsFunction = require(Parent.UnifiedLogging).calculateRowPositionFields
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local AppPage = require(Parent.RobloxAppEnums).AppPage
local AppUserLayers = require(Parent.ExperimentLayers).AppUserLayers
local GameImpressionsEventModule = require(script.Parent.gameImpressionsEvent)
local ReportGameImpressionCountsModule = require(script.Parent.reportGameImpressionCounts)
local FeedItemRowDataHitCounterModule = require(script.Parent.FeedItemRowDataHitCounter)
local FeedItemRowDataMissingCounterModule = require(script.Parent.FeedItemRowDataMissingCounter)
local FFlagLuaAppGameImpressionsMobileAdsId = require(Parent.SharedFlags).FFlagLuaAppGameImpressionsMobileAdsId
local FFlagLuaAppGameImpressionsAddUnifiedFields = require(Parent.SharedFlags).FFlagLuaAppGameImpressionsAddUnifiedFields
local FFlagSduiFixSearchTelemetry = require(Parent.SharedFlags).FFlagSduiFixSearchTelemetry
local FFlagLuaAppSponsoredGamePreviewVideo = require(Parent.SharedFlags).FFlagLuaAppSponsoredGamePreviewVideo
local FFlagLuaAppHomeMomentVideoFallback = require(Parent.SharedFlags).FFlagLuaAppHomeMomentVideoFallback
local FFlagLuaAppDiscoveryMomentVideoTelemetry = require(Parent.SharedFlags).FFlagLuaAppDiscoveryMomentVideoTelemetry

local function logSponsoredGamePreviewVideoExposureIfEligible(EntryIndexes, p1, PageContext)
	-- upvalues: AppPage (copy), IXPService (copy), AppUserLayers (copy), DiscoveryEventErrorLogger (copy)
	for _, entryIndex in ipairs(EntryIndexes) do
		local v1 = p1[entryIndex]
		
		if v1 and v1.isSponsored and v1.sponsoredGamePreviewVideoEligible == true then
			if PageContext == AppPage.Home then
				IXPService:LogUserLayerExposure(AppUserLayers.SponsoredGamePreviewVideo)
				break
			else
				DiscoveryEventErrorLogger.reportError("SponsoredGamePreviewVideoEligibleImpressionOutsideHome", "A sponsored GPV-eligible tile was impressed outside Home; exposure was suppressed", { pageContext = PageContext, entryIndex = entryIndex })
				break
			end
		end
	end
end

local function addGameFields(EntryIndexes, p2, p3: number, p4, p5, GameSortId, p6, p7, PageContext)
	-- upvalues: FFlagLuaAppDiscoveryMomentVideoTelemetry (copy), GameCollectionItemTypes (copy), DiscoveryEventErrorLogger (copy), CalculateRowPositionFieldsFunction (copy), ArgCheckModule (copy), GetGameTileLayoutDataFunction (copy), GetTileBadgeByPositionConfigFromEntryFunction (copy), GetValidTileBadgesFunction (copy), CryoModule (copy), ItemLayoutDataParsingUtils (copy), FFlagLuaAppHomeMomentVideoFallback (copy), GameTileModule (copy), FFlagLuaAppGameImpressionsAddUnifiedFields (copy)
	local List = {}
	local List1 = {}
	local List2 = {}
	local List3 = {}
	local List4 = {}
	local List5 = {}
	local List6 = {}
	local T = if FFlagLuaAppDiscoveryMomentVideoTelemetry then {} else nil
	local List7 = {}
	local List8 = {}
	local List9 = {}
	local List10 = {}
	local List11 = {}
	local List12 = {}
	local List13 = {}
	local List14 = {}
	local List15 = {}
	local List16 = {}
	local t = {}
	local HasSponsoredContent = false
	
	for _, entryIndex in ipairs(EntryIndexes) do
		local v2 = p2[entryIndex]
		
		if v2 ~= nil then
			if v2.gameCollectionItemTypeOverride == GameCollectionItemTypes.GameCollectionItemType.Blank then
				DiscoveryEventErrorLogger.reportError("InvalidGameImpressionCollectionItemType", "An impression for a blank tile was attempted to be logged, which should not happen.", {
					entryIndex = entryIndex,
					pageContext = PageContext,
					emphasisFlag = if p7 then p7.emphasisFlag else nil,
					sortPos = if p7 then p7.sortPos else nil,
					gameSortId = GameSortId
				})
				continue
			end
			local UiIndex = v2.uiIndex or entryIndex
			local TopicContentsIndex = v2.topicContentsIndex or entryIndex
			table.insert(List, v2.placeId or 0)
			table.insert(List1, entryIndex)
			table.insert(List3, v2.universeId or 0)
			table.insert(List2, TopicContentsIndex)
			
			if v2.isSponsored then
				HasSponsoredContent = true
				table.insert(List7, 1)
				table.insert(List8, v2.adId or 0)
			else
				table.insert(List7, 0)
				table.insert(List8, 0)
			end
			table.insert(List15, v2.gameCollectionItemTypeOverride or GameCollectionItemTypes.GameCollectionItemType.GameTile)
			local RowPositionFields = CalculateRowPositionFieldsFunction(UiIndex, p3, p5)
			
			if p3 and p3 > 0 then
				table.insert(List9, RowPositionFields.rowInSort)
				
				if p5 then
					table.insert(List10, RowPositionFields.rowOnPage)
					table.insert(List11, RowPositionFields.positionInRow)
				end
			else
				ArgCheckModule.assert(p3 ~= 0)
				
				if p5 then
					table.insert(List10, p5)
					table.insert(List11, UiIndex)
				end
			end
			local GameTileLayoutData = GetGameTileLayoutDataFunction(v2, GameSortId)
			local TileBadgeByPositionConfigFromEntry = GetTileBadgeByPositionConfigFromEntryFunction(v2) or GameTileLayoutData.tileBadgesByPosition
			local Joined = nil
			
			if v2.tileBadgeIds then
				Joined = v2.tileBadgeIds
			elseif TileBadgeByPositionConfigFromEntry then
				local List18 = {}
				
				for i, value in GetValidTileBadgesFunction(TileBadgeByPositionConfigFromEntry) do
					local MapResult = CryoModule.List.map(value, function(p8)
						return p8.analyticsId
					end)
					
					if #MapResult > 0 then
						table.insert(List18, i .. "=" .. table.concat(MapResult, "+"))
					end
				end
				if #List18 > 0 then
					Joined = table.concat(List18, "&")
				end
			end
			table.insert(List12, Joined or "0")
			
			if p4 then
				if v2 and v2.thumbnailAssetId then
					table.insert(List4, v2.thumbnailAssetId)
				else
					table.insert(List4, (if v2 and v2.primaryWideImageAssetId then v2.primaryWideImageAssetId else ItemLayoutDataParsingUtils.getWideImageAssetId(GameTileLayoutData)) or (v2 and v2.primaryWideAssetId or nil) or "0")
				end
				if v2 and v2.thumbnailListId then
					table.insert(List5, v2.thumbnailListId)
				else
					table.insert(List5, (if v2 and v2.primaryWideImageListId then v2.primaryWideImageListId else GameTileLayoutData and (GameTileLayoutData.primaryMediaAsset and GameTileLayoutData.primaryMediaAsset.wideImageListId)) or (v2 and v2.primaryWideListId or "0"))
				end
				if v2 and v2.videoThumbnailAssetId then
					table.insert(List6, v2.videoThumbnailAssetId)
					
					if FFlagLuaAppDiscoveryMomentVideoTelemetry then
						table.insert(T, "0")
					end
				else
					local AssetId = nil
					if FFlagLuaAppHomeMomentVideoFallback then
						local LayoutDataVideo = GameTileModule.getLayoutDataVideo(GameTileLayoutData, v2 and v2.primaryWideVideoAssetId)
						AssetId = LayoutDataVideo and LayoutDataVideo.assetId
						
						if FFlagLuaAppDiscoveryMomentVideoTelemetry then
							table.insert(T, if LayoutDataVideo and LayoutDataVideo.isMoment then "1" else "0")
						end
					else
						AssetId = if v2 and v2.primaryWideVideoAssetId then v2.primaryWideVideoAssetId else GameTileLayoutData and (GameTileLayoutData.primaryMediaAsset and GameTileLayoutData.primaryMediaAsset.wideVideoAssetId)
					end
					table.insert(List6, AssetId or "0")
				end
				local Analytics = nil
				
				if v2 and v2.footer and v2.footer.analytics then
					Analytics = v2.footer.analytics
				elseif GameTileLayoutData and GameTileLayoutData.footer and GameTileLayoutData.footer.analytics then
					Analytics = GameTileLayoutData.footer.analytics
				end
				if Analytics and Analytics.textLiteral then
					table.insert(List13, Analytics.textLiteral)
				else
					table.insert(List13, "0")
				end
				if Analytics and Analytics.locKey then
					table.insert(List14, Analytics.locKey)
				else
					table.insert(List14, "0")
				end
			end
			local AnalyticsData = v2.analyticsData
			
			if AnalyticsData then
				for i1 in AnalyticsData do
					t[i1] = true
				end
			end
			table.insert(List16, AnalyticsData or {})
		end
	end
	local CountList = #List
	ArgCheckModule.assert(CountList == #List1)
	ArgCheckModule.assert(CountList == #List2)
	ArgCheckModule.assert(CountList == #List3)
	ArgCheckModule.assert(CountList == #List7)
	ArgCheckModule.assert(CountList == #List8)
	
	if #List9 > 0 then
		ArgCheckModule.assert(CountList == #List9)
	end
	if #List10 > 0 then
		ArgCheckModule.assert(CountList == #List10)
	end
	if #List11 > 0 then
		ArgCheckModule.assert(CountList == #List11)
	end
	local config = {
		rootPlaceIds = table.concat(List, ","),
		absPositions = table.concat(List1, ","),
		topicDataPositions = table.concat(List2, ","),
		universeIds = table.concat(List3, ",")
	}
	
	if HasSponsoredContent then
		config.adFlags = table.concat(List7, ",")
		config.adIds = table.concat(List8, ",")
	end
	if FFlagLuaAppGameImpressionsAddUnifiedFields then
		config.hasSponsoredContent = HasSponsoredContent
	end
	if #List9 > 0 then
		config.rows = table.concat(List9, ",")
	end
	if #List10 > 0 then
		config.rowsOnPage = table.concat(List10, ",")
	end
	if #List11 > 0 then
		config.positionsInRows = table.concat(List11, ",")
	end
	if p4 and #List4 > 0 then
		config.thumbnailAssetIds = table.concat(List4, ",")
	end
	if p4 and #List5 > 0 then
		config.thumbnailListIds = table.concat(List5, ",")
	end
	if p4 and #List6 > 0 then
		config.videoThumbnailAssetIds = table.concat(List6, ",")
	end
	if FFlagLuaAppDiscoveryMomentVideoTelemetry and #T > 0 and not t.videoIsMoment then
		config.videoIsMoment_arr = table.concat(T, ",")
	end
	if #List12 > 0 then
		config.tileBadgeContexts = table.concat(List12, ",")
	end
	if List13 and #List13 > 0 then
		config.footerTextLiterals = table.concat(List13, ",")
	end
	if List14 and #List14 > 0 then
		config.footerLocalizationKeys = table.concat(List14, ",")
	end
	if #List15 > 0 then
		config.tileTypes = table.concat(List15, ",")
	end
	local t1 = {}
	
	if next(t) then
		for i2 in t do
			local List17 = {}
			
			for _, value1 in List16 do
				table.insert(List17, value1[i2] or "0")
			end
			t1[`{i2}_arr`] = table.concat(List17, ",")
		end
	end
	local JoinResult = CryoModule.Dictionary.join(t1, p6 or {})
	
	if next(JoinResult) then
		config.analyticsData = JoinResult
	end
	return config, CountList
end

local function _(p8)
	-- upvalues: AppStorageService (copy)
	local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
	
	if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
		p8.mobileAdvertisingId = MobileAdvertisingIdItem
	end
end

local _ = function(p8): boolean
	-- upvalues: FFlagSduiFixSearchTelemetry (copy)
	return if FFlagSduiFixSearchTelemetry then not p8 or next(p8) == nil else not p8 or #p8 == 0
end

return {
	sendFromTopicContents = function(p8, p9, p10, p11, PageContext, GameSetTypeId, SortPos, p12, GameSetTargetId, PageId, p13, p14, ComponentType, AppliedFilters, LoadSource, Callback: (any) -> (), SortSubId, p15)
		-- upvalues: FFlagSduiFixSearchTelemetry (copy), FFlagLuaAppSponsoredGamePreviewVideo (copy), logSponsoredGamePreviewVideoExposureIfEligible (copy), LoggingProtocolModule (copy), FeedItemRowDataHitCounterModule (copy), FeedItemRowDataMissingCounterModule (copy), addGameFields (copy), CryoModule (copy), LocalizationService (copy), FFlagLuaAppGameImpressionsMobileAdsId (copy), AppStorageService (copy), GameImpressionsEventModule (copy), ReportGameImpressionCountsModule (copy)
		if p8 and p9 then
			if p10 and #p10 ~= 0 then
				if not (if FFlagSduiFixSearchTelemetry then not p11 or next(p11) == nil else not p11 or #p11 == 0) then
					if FFlagLuaAppSponsoredGamePreviewVideo then
						logSponsoredGamePreviewVideoExposureIfEligible(p10, p11, PageContext)
					end
					if p12 then
						LoggingProtocolModule.default:logRobloxTelemetryCounter(FeedItemRowDataHitCounterModule)
					else
						LoggingProtocolModule.default:logRobloxTelemetryCounter(FeedItemRowDataMissingCounterModule)
					end
					local AddGameFieldsResult, AddGameFieldsResult2 = addGameFields(p10, p11, p13, p14, p12, GameSetTypeId, p15)
					local JoinResult = CryoModule.Dictionary.join(AddGameFieldsResult, {
						sortPos = SortPos,
						gameSetTypeId = GameSetTypeId,
						gameSetTargetId = GameSetTargetId,
						pageId = PageId,
						componentType = ComponentType,
						locale = LocalizationService.RobloxLocaleId,
						appliedFilters = AppliedFilters,
						loadSource = LoadSource,
						sortSubId = SortSubId
					})
					
					if FFlagLuaAppGameImpressionsMobileAdsId then
						local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
						
						if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
							JoinResult.mobileAdvertisingId = MobileAdvertisingIdItem
						end
					end
					GameImpressionsEventModule(p8, PageContext, JoinResult)
					ReportGameImpressionCountsModule(p9, PageContext, AddGameFieldsResult2)
					
					return
				elseif Callback then
					Callback(`Missing topicContentsEntries or topicContentsEntries == 0 {p11}`)
				end
				return
			elseif Callback then
				Callback(`Missing impressionsToSend or impressionsToSend == 0 {p10}`)
			end
			return
		elseif Callback then
			Callback(`Missing analytics service eventIngest: {p8} appAnalytics: {p9}`)
		end
	end,
	sendFromSearch = function(p8, p9, p10, p11, PageContext, p12, p13, p14, p15, ComponentType)
		-- upvalues: FFlagSduiFixSearchTelemetry (copy), addGameFields (copy), CryoModule (copy), LocalizationService (copy), FFlagLuaAppGameImpressionsMobileAdsId (copy), AppStorageService (copy), GameImpressionsEventModule (copy), ReportGameImpressionCountsModule (copy)
		if not p8 or not p9 then return end
		if not p10 or #p10 == 0 then return end
		if if FFlagSduiFixSearchTelemetry then not p11 or next(p11) == nil else not p11 or #p11 == 0 then return end
		local AddGameFieldsResult, AddGameFieldsResult2 = addGameFields(p10, p11, p13, p15, p14, nil, nil, p12, PageContext)
		local JoinResult = CryoModule.Dictionary.join(AddGameFieldsResult, p12, {
			locale = LocalizationService.RobloxLocaleId,
			componentType = ComponentType
		})
		
		if FFlagLuaAppGameImpressionsMobileAdsId then
			local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
			
			if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
				JoinResult.mobileAdvertisingId = MobileAdvertisingIdItem
			end
		end
		GameImpressionsEventModule(p8, PageContext, JoinResult)
		ReportGameImpressionCountsModule(p9, PageContext, AddGameFieldsResult2)
	end,
	sendFromGameDetails = function(p8, p9, p10, p11, RefId)
		-- upvalues: addGameFields (copy), LocalizationService (copy), FFlagLuaAppGameImpressionsMobileAdsId (copy), AppStorageService (copy), GameImpressionsEventModule (copy), ReportGameImpressionCountsModule (copy)
		local AddGameFieldsResult, AddGameFieldsResult2 = addGameFields(p10, p11)
		AddGameFieldsResult.locale = LocalizationService.RobloxLocaleId
		AddGameFieldsResult.refId = RefId
		
		if FFlagLuaAppGameImpressionsMobileAdsId then
			local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
			
			if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
				AddGameFieldsResult.mobileAdvertisingId = MobileAdvertisingIdItem
			end
		end
		GameImpressionsEventModule(p8, "recommended", AddGameFieldsResult)
		ReportGameImpressionCountsModule(p9, "recommended", AddGameFieldsResult2)
	end,
	sendFromSeeAll = function(p8, p9, p10, p11, PageContext, GameSetTypeId, GameSetTargetId, PageId, AppliedFilters, p12)
		-- upvalues: FFlagSduiFixSearchTelemetry (copy), FFlagLuaAppSponsoredGamePreviewVideo (copy), logSponsoredGamePreviewVideoExposureIfEligible (copy), addGameFields (copy), CryoModule (copy), LocalizationService (copy), FFlagLuaAppGameImpressionsMobileAdsId (copy), AppStorageService (copy), GameImpressionsEventModule (copy), ReportGameImpressionCountsModule (copy)
		if not p8 or not p9 then return end
		if not p10 or #p10 == 0 then return end
		if if FFlagSduiFixSearchTelemetry then not p11 or next(p11) == nil else not p11 or #p11 == 0 then return end
		if FFlagLuaAppSponsoredGamePreviewVideo then
			logSponsoredGamePreviewVideoExposureIfEligible(p10, p11, PageContext)
		end
		local AddGameFieldsResult, AddGameFieldsResult2 = addGameFields(p10, p11, nil, p12)
		local JoinResult = CryoModule.Dictionary.join(AddGameFieldsResult, {
			seeAllFlag = 1,
			gameSetTypeId = GameSetTypeId,
			gameSetTargetId = GameSetTargetId,
			pageId = PageId,
			locale = LocalizationService.RobloxLocaleId,
			appliedFilters = AppliedFilters
		})
		
		if FFlagLuaAppGameImpressionsMobileAdsId then
			local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
			
			if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
				JoinResult.mobileAdvertisingId = MobileAdvertisingIdItem
			end
		end
		GameImpressionsEventModule(p8, PageContext, JoinResult)
		ReportGameImpressionCountsModule(p9, PageContext, AddGameFieldsResult2, 1)
	end,
	sendFromTraversalHistoryPage = if require(Parent.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry then function(p8, p9, p10, p11, p12, p13)
		-- upvalues: addGameFields (copy), CryoModule (copy), LocalizationService (copy), GameImpressionsEventModule (copy), ReportGameImpressionCountsModule (copy)
		if p8 and p9 then
			local AddGameFieldsResult, AddGameFieldsResult2 = addGameFields(p10, p11, p12, false, p13)
			GameImpressionsEventModule(p8, "InExpHistoryPage", (CryoModule.Dictionary.join(AddGameFieldsResult, { locale = LocalizationService.RobloxLocaleId })))
			ReportGameImpressionCountsModule(p9, "InExpHistoryPage", AddGameFieldsResult2)
			
			return
		end
	end else nil
}