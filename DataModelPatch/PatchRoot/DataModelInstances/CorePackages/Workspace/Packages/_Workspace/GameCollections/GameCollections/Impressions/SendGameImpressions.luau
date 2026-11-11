local LocalizationService = game:GetService("LocalizationService")
local AppStorageService = game:GetService("AppStorageService")
local Parent = script:FindFirstAncestor("GameCollections").Parent
local ArgCheckModule = require(Parent.ArgCheck)
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local CryoModule = require(Parent.Cryo)
local GetGameTileLayoutDataFunction = require(Parent.GameTile).getGameTileLayoutData
local GetValidTileBadgesFunction = require(Parent.GameTile).getValidTileBadges
local GetTileBadgeByPositionConfigFromEntryFunction = require(Parent.GameTile).getTileBadgeByPositionConfigFromEntry
local ItemLayoutDataParsingUtils = require(Parent.GameTile).ItemLayoutDataParsingUtils
local CalculateRowPositionFieldsFunction = require(Parent.UnifiedLogging).calculateRowPositionFields
local DiscoveryEventErrorLogger = require(Parent.DiscoveryUtils).DiscoveryEventErrorLogger
local GameCollectionItemTypes = require(Parent.DiscoveryTypes).GameCollectionItemTypes
local GameImpressionsEventModule = require(script.Parent.gameImpressionsEvent)
local ReportGameImpressionCountsModule = require(script.Parent.reportGameImpressionCounts)
local FeedItemRowDataHitCounterModule = require(script.Parent.FeedItemRowDataHitCounter)
local FeedItemRowDataMissingCounterModule = require(script.Parent.FeedItemRowDataMissingCounter)
local FFlagLuaAppGameImpressionsMobileAdsId = require(Parent.SharedFlags).FFlagLuaAppGameImpressionsMobileAdsId
local FFlagEnableInGameExitModalNextUpUi = require(Parent.SharedFlags).FFlagEnableInGameExitModalNextUpUi
local FFlagTraversalHistoryDiscoveryTelemetry = require(Parent.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry
local FFlagLuaAppTileBadgeAnalyticsFix = require(Parent.SharedFlags).FFlagLuaAppTileBadgeAnalyticsFix
local FFlagLuaAppAddComponentTypeToSearchImpressions = require(Parent.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions
local FFlagLuaAppAddSubIdToHomeEvents = require(Parent.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents
local FFlagLuaAppFixSearchImpressions = require(Parent.SharedFlags).FFlagLuaAppFixSearchImpressions
local FFlagLuaAppGameImpressionsAddUnifiedFields = require(Parent.SharedFlags).FFlagLuaAppGameImpressionsAddUnifiedFields

local function addGameFields(EntryIndexes, p1, p2: number, p3, p4, GameSortId, p5, p6, PageContext)
	-- upvalues: FFlagLuaAppFixSearchImpressions (copy), GameCollectionItemTypes (copy), DiscoveryEventErrorLogger (copy), CalculateRowPositionFieldsFunction (copy), ArgCheckModule (copy), FFlagLuaAppTileBadgeAnalyticsFix (copy), GetGameTileLayoutDataFunction (copy), GetTileBadgeByPositionConfigFromEntryFunction (copy), GetValidTileBadgesFunction (copy), CryoModule (copy), ItemLayoutDataParsingUtils (copy), FFlagLuaAppGameImpressionsAddUnifiedFields (copy)
	local List = {}
	local List1 = {}
	local List2 = {}
	local List3 = {}
	local List4 = {}
	local List5 = {}
	local List6 = {}
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
		local v1 = p1[entryIndex]
		
		if v1 ~= nil then
			if FFlagLuaAppFixSearchImpressions and v1.gameCollectionItemTypeOverride == GameCollectionItemTypes.GameCollectionItemType.Blank then
				DiscoveryEventErrorLogger.reportError("InvalidGameImpressionCollectionItemType", "An impression for a blank tile was attempted to be logged, which should not happen.", {
					entryIndex = entryIndex,
					pageContext = PageContext,
					emphasisFlag = if p6 then p6.emphasisFlag else nil,
					sortPos = if p6 then p6.sortPos else nil,
					gameSortId = GameSortId
				})
				continue
			end
			local UiIndex = v1.uiIndex or entryIndex
			local TopicContentsIndex = v1.topicContentsIndex or entryIndex
			table.insert(List, v1.placeId or 0)
			table.insert(List1, entryIndex)
			table.insert(List3, v1.universeId or 0)
			table.insert(List2, TopicContentsIndex)
			
			if v1.isSponsored then
				HasSponsoredContent = true
				table.insert(List7, 1)
				table.insert(List8, v1.adId or 0)
			else
				table.insert(List7, 0)
				table.insert(List8, 0)
			end
			table.insert(List15, v1.gameCollectionItemTypeOverride or GameCollectionItemTypes.GameCollectionItemType.GameTile)
			local RowPositionFields = CalculateRowPositionFieldsFunction(UiIndex, p2, p4)
			
			if p2 and p2 > 0 then
				table.insert(List9, RowPositionFields.rowInSort)
				
				if p4 then
					table.insert(List10, RowPositionFields.rowOnPage)
					table.insert(List11, RowPositionFields.positionInRow)
				end
			else
				ArgCheckModule.assert(p2 ~= 0)
				
				if p4 then
					table.insert(List10, p4)
					table.insert(List11, UiIndex)
				end
			end
			local t1 = {}
			
			if FFlagLuaAppTileBadgeAnalyticsFix then
				t1 = GetGameTileLayoutDataFunction(v1, GameSortId)
				local TileBadgeByPositionConfigFromEntry = GetTileBadgeByPositionConfigFromEntryFunction(v1) or t1.tileBadgesByPosition
				local Joined = nil
				
				if v1.tileBadgeIds then
					Joined = v1.tileBadgeIds
				elseif TileBadgeByPositionConfigFromEntry then
					local List17 = {}
					
					for i, value in GetValidTileBadgesFunction(TileBadgeByPositionConfigFromEntry) do
						local MapResult = CryoModule.List.map(value, function(p7)
							return p7.analyticsId
						end)
						
						if #MapResult > 0 then
							table.insert(List17, i .. "=" .. table.concat(MapResult, "+"))
						end
					end
					if #List17 > 0 then
						Joined = table.concat(List17, "&")
					end
				end
				table.insert(List12, Joined or "0")
			end
			if p3 then
				if not FFlagLuaAppTileBadgeAnalyticsFix then
					t1 = GetGameTileLayoutDataFunction(v1, GameSortId)
				end
				if v1 and v1.thumbnailAssetId then
					table.insert(List4, v1.thumbnailAssetId)
				else
					table.insert(List4, (if v1 and v1.primaryWideImageAssetId then v1.primaryWideImageAssetId else ItemLayoutDataParsingUtils.getWideImageAssetId(t1)) or (v1 and v1.primaryWideAssetId or nil) or "0")
				end
				if v1 and v1.thumbnailListId then
					table.insert(List5, v1.thumbnailListId)
				else
					table.insert(List5, (if v1 and v1.primaryWideImageListId then v1.primaryWideImageListId else t1 and (t1.primaryMediaAsset and t1.primaryMediaAsset.wideImageListId)) or (v1 and v1.primaryWideListId or "0"))
				end
				if v1 and v1.videoThumbnailAssetId then
					table.insert(List6, v1.videoThumbnailAssetId)
				else
					table.insert(List6, (if v1 and v1.primaryWideVideoAssetId then v1.primaryWideVideoAssetId else t1 and (t1.primaryMediaAsset and t1.primaryMediaAsset.wideVideoAssetId)) or "0")
				end
				if not FFlagLuaAppTileBadgeAnalyticsFix then
					local Joined = nil
					
					if v1 and v1.tileBadgeIds then
						Joined = v1.tileBadgeIds
					elseif t1 and t1.tileBadgesByPosition then
						local List18 = {}
						
						for i1, value1 in GetValidTileBadgesFunction(t1.tileBadgesByPosition) do
							local MapResult = CryoModule.List.map(value1, function(p7)
								return p7.analyticsId
							end)
							
							if #MapResult > 0 then
								table.insert(List18, i1 .. "=" .. table.concat(MapResult, "+"))
							end
						end
						if #List18 > 0 then
							Joined = table.concat(List18, "&")
						end
					end
					table.insert(List12, Joined or "0")
				end
				local Analytics = nil
				
				if v1 and v1.footer and v1.footer.analytics then
					Analytics = v1.footer.analytics
				elseif t1 and t1.footer and t1.footer.analytics then
					Analytics = t1.footer.analytics
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
			local AnalyticsData = v1.analyticsData
			
			if AnalyticsData then
				for i2 in AnalyticsData do
					t[i2] = true
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
	if p3 and #List4 > 0 then
		config.thumbnailAssetIds = table.concat(List4, ",")
	end
	if p3 and #List5 > 0 then
		config.thumbnailListIds = table.concat(List5, ",")
	end
	if p3 and #List6 > 0 then
		config.videoThumbnailAssetIds = table.concat(List6, ",")
	end
	if FFlagLuaAppTileBadgeAnalyticsFix and #List12 > 0 or not FFlagLuaAppTileBadgeAnalyticsFix and (p3 and #List12 > 0) then
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
	local t2 = {}
	
	if next(t) then
		for i3 in t do
			local List19 = {}
			
			for _, value2 in List16 do
				table.insert(List19, value2[i3] or "0")
			end
			t2[`{i3}_arr`] = table.concat(List19, ",")
		end
	end
	local JoinResult = CryoModule.Dictionary.join(t2, p5 or {})
	
	if next(JoinResult) then
		config.analyticsData = JoinResult
	end
	return config, CountList
end

local function _(p7)
	-- upvalues: AppStorageService (copy)
	local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
	
	if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
		p7.mobileAdvertisingId = MobileAdvertisingIdItem
	end
end

local v2 = if FFlagEnableInGameExitModalNextUpUi then function(p7, p8, GameSetTypeId, p9, p10)
	-- upvalues: addGameFields (copy), CryoModule (copy), LocalizationService (copy), FFlagLuaAppGameImpressionsMobileAdsId (copy), AppStorageService (copy), GameImpressionsEventModule (copy), ReportGameImpressionCountsModule (copy)
	if not p7 or not p8 then return end
	if not p9 or #p9 == 0 then return end
	if not p10 or #p10 == 0 then return end
	local AddGameFieldsResult, AddGameFieldsResult2 = addGameFields(p9, p10)
	local JoinResult = CryoModule.Dictionary.join(AddGameFieldsResult, {
		gameSetTypeId = GameSetTypeId,
		locale = LocalizationService.RobloxLocaleId
	})
	
	if FFlagLuaAppGameImpressionsMobileAdsId then
		local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
		
		if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
			JoinResult.mobileAdvertisingId = MobileAdvertisingIdItem
		end
	end
	GameImpressionsEventModule(p7, "InGameExitPage", JoinResult)
	ReportGameImpressionCountsModule(p8, "InGameExitPage", AddGameFieldsResult2)
end else nil

return {
	sendFromTopicContents = function(p7, p8, p9, p10, p11, GameSetTypeId, SortPos, p12, GameSetTargetId, PageId, p13, p14, ComponentType, AppliedFilters, LoadSource, Callback: (any) -> (), p15, p16)
		-- upvalues: LoggingProtocolModule (copy), FeedItemRowDataHitCounterModule (copy), FeedItemRowDataMissingCounterModule (copy), addGameFields (copy), CryoModule (copy), LocalizationService (copy), FFlagLuaAppAddSubIdToHomeEvents (copy), FFlagLuaAppGameImpressionsMobileAdsId (copy), AppStorageService (copy), GameImpressionsEventModule (copy), ReportGameImpressionCountsModule (copy)
		if p7 and p8 then
			if p9 and #p9 ~= 0 then
				if p10 and #p10 ~= 0 then
					if p12 then
						LoggingProtocolModule.default:logRobloxTelemetryCounter(FeedItemRowDataHitCounterModule)
					else
						LoggingProtocolModule.default:logRobloxTelemetryCounter(FeedItemRowDataMissingCounterModule)
					end
					local AddGameFieldsResult, AddGameFieldsResult2 = addGameFields(p9, p10, p13, p14, p12, GameSetTypeId, p16)
					local JoinResult = CryoModule.Dictionary.join(AddGameFieldsResult, {
						sortPos = SortPos,
						gameSetTypeId = GameSetTypeId,
						gameSetTargetId = GameSetTargetId,
						pageId = PageId,
						componentType = ComponentType,
						locale = LocalizationService.RobloxLocaleId,
						appliedFilters = AppliedFilters,
						loadSource = LoadSource,
						sortSubId = if FFlagLuaAppAddSubIdToHomeEvents then p15 else nil
					})
					
					if FFlagLuaAppGameImpressionsMobileAdsId then
						local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
						
						if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
							JoinResult.mobileAdvertisingId = MobileAdvertisingIdItem
						end
					end
					GameImpressionsEventModule(p7, p11, JoinResult)
					ReportGameImpressionCountsModule(p8, p11, AddGameFieldsResult2)
					
					return
				elseif Callback then
					Callback(`Missing topicContentsEntries or topicContentsEntries == 0 {p10}`)
				end
				return
			elseif Callback then
				Callback(`Missing impressionsToSend or impressionsToSend == 0 {p9}`)
			end
			return
		elseif Callback then
			Callback(`Missing analytics service eventIngest: {p7} appAnalytics: {p8}`)
		end
	end,
	sendFromSearch = function(p7, p8, p9, p10, p11, p12, p13, p14, p15, ComponentType)
		-- upvalues: addGameFields (copy), FFlagLuaAppFixSearchImpressions (copy), FFlagLuaAppAddComponentTypeToSearchImpressions (copy), CryoModule (copy), LocalizationService (copy), FFlagLuaAppGameImpressionsMobileAdsId (copy), AppStorageService (copy), GameImpressionsEventModule (copy), ReportGameImpressionCountsModule (copy)
		if not p7 or not p8 then return end
		if not p9 or #p9 == 0 then return end
		if not p10 or #p10 == 0 then return end
		local AddGameFieldsResult, AddGameFieldsResult2 = addGameFields(p9, p10, p13, p15, p14, nil, nil, if FFlagLuaAppFixSearchImpressions then p12 else nil, if FFlagLuaAppFixSearchImpressions then p11 else nil)
		local JoinResult = nil
		
		if FFlagLuaAppAddComponentTypeToSearchImpressions then
			JoinResult = CryoModule.Dictionary.join(AddGameFieldsResult, p12, {
				locale = LocalizationService.RobloxLocaleId,
				componentType = ComponentType
			})
		else
			AddGameFieldsResult.locale = LocalizationService.RobloxLocaleId
			JoinResult = CryoModule.Dictionary.join(AddGameFieldsResult, p12)
		end
		if FFlagLuaAppGameImpressionsMobileAdsId then
			local JoinResult1 = JoinResult
			local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
			
			if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
				JoinResult1.mobileAdvertisingId = MobileAdvertisingIdItem
			end
		end
		GameImpressionsEventModule(p7, p11, JoinResult)
		ReportGameImpressionCountsModule(p8, p11, AddGameFieldsResult2)
	end,
	sendFromGameDetails = function(p7, p8, p9, p10, RefId)
		-- upvalues: addGameFields (copy), LocalizationService (copy), FFlagLuaAppGameImpressionsMobileAdsId (copy), AppStorageService (copy), GameImpressionsEventModule (copy), ReportGameImpressionCountsModule (copy)
		local AddGameFieldsResult, AddGameFieldsResult2 = addGameFields(p9, p10)
		AddGameFieldsResult.locale = LocalizationService.RobloxLocaleId
		AddGameFieldsResult.refId = RefId
		
		if FFlagLuaAppGameImpressionsMobileAdsId then
			local MobileAdvertisingIdItem = AppStorageService:GetItem("MobileAdvertisingId")
			
			if MobileAdvertisingIdItem and MobileAdvertisingIdItem ~= "" then
				AddGameFieldsResult.mobileAdvertisingId = MobileAdvertisingIdItem
			end
		end
		GameImpressionsEventModule(p7, "recommended", AddGameFieldsResult)
		ReportGameImpressionCountsModule(p8, "recommended", AddGameFieldsResult2)
	end,
	sendFromSeeAll = function(p7, p8, p9, p10, p11, GameSetTypeId, GameSetTargetId, PageId, AppliedFilters, p12)
		-- upvalues: addGameFields (copy), CryoModule (copy), LocalizationService (copy), FFlagLuaAppGameImpressionsMobileAdsId (copy), AppStorageService (copy), GameImpressionsEventModule (copy), ReportGameImpressionCountsModule (copy)
		if not p7 or not p8 then return end
		if not p9 or #p9 == 0 then return end
		if not p10 or #p10 == 0 then return end
		local AddGameFieldsResult, AddGameFieldsResult2 = addGameFields(p9, p10, nil, p12)
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
		GameImpressionsEventModule(p7, p11, JoinResult)
		ReportGameImpressionCountsModule(p8, p11, AddGameFieldsResult2, 1)
	end,
	sendFromInGameExitModal = if FFlagEnableInGameExitModalNextUpUi then v2 else nil,
	sendFromTraversalHistoryPage = if FFlagTraversalHistoryDiscoveryTelemetry then function(p7, p8, p9, p10, p11, p12)
		-- upvalues: addGameFields (copy), CryoModule (copy), LocalizationService (copy), GameImpressionsEventModule (copy), ReportGameImpressionCountsModule (copy)
		if p7 and p8 then
			local AddGameFieldsResult, AddGameFieldsResult2 = addGameFields(p9, p10, p11, false, p12)
			GameImpressionsEventModule(p7, "InExpHistoryPage", (CryoModule.Dictionary.join(AddGameFieldsResult, { locale = LocalizationService.RobloxLocaleId })))
			ReportGameImpressionCountsModule(p8, "InExpHistoryPage", AddGameFieldsResult2)
			
			return
		end
	end else nil
}