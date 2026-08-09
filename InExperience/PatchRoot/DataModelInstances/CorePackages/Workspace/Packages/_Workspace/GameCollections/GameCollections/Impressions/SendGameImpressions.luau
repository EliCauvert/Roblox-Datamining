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
local fFlagEnableInGameExitModalNextUpUi = require(parent.SharedFlags).FFlagEnableInGameExitModalNextUpUi
local fFlagTraversalHistoryDiscoveryTelemetry = require(parent.SharedFlags).FFlagTraversalHistoryDiscoveryTelemetry
local fFlagLuaAppTileBadgeAnalyticsFix = require(parent.SharedFlags).FFlagLuaAppTileBadgeAnalyticsFix
local fFlagLuaAppAddComponentTypeToSearchImpressions = require(parent.SharedFlags).FFlagLuaAppAddComponentTypeToSearchImpressions
local fFlagLuaAppAddSubIdToHomeEvents = require(parent.SharedFlags).FFlagLuaAppAddSubIdToHomeEvents
local fFlagLuaAppFixSearchImpressions = require(parent.SharedFlags).FFlagLuaAppFixSearchImpressions
local fFlagLuaAppGameImpressionsAddUnifiedFields = require(parent.SharedFlags).FFlagLuaAppGameImpressionsAddUnifiedFields

local function addGameFields(p0, p1, p2, p3, p4, p5, p6, p7, p8) --[[ line: 60 ]]
	-- upvalues: fFlagLuaAppFixSearchImpressions (ref), gameCollectionItemTypes (ref), discoveryEventErrorLogger (ref), calculateRowPositionFields (ref), argCheckModule (ref), fFlagLuaAppTileBadgeAnalyticsFix (ref), getGameTileLayoutData (ref), getTileBadgeByPositionConfigFromEntry (ref), getValidTileBadges (ref), cryoModule (ref), itemLayoutDataParsingUtils (ref), fFlagLuaAppGameImpressionsAddUnifiedFields (ref)
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
	local var28 = false
	
	for i, v in ipairs(p0) do
		local var34 = p1[v]
		
		if var34 ~= nil then
			if fFlagLuaAppFixSearchImpressions and var34.gameCollectionItemTypeOverride == gameCollectionItemTypes.GameCollectionItemType.Blank then
				discoveryEventErrorLogger.reportError("InvalidGameImpressionCollectionItemType", "An impression for a blank tile was attempted to be logged, which should not happen.", {
					entryIndex = v,
					pageContext = p8,
					emphasisFlag = if p7 then p7.emphasisFlag else nil,
					sortPos = if p7 then p7.sortPos else nil,
					gameSortId = p5
				})
				continue
			end
			local uiIndex = var34.uiIndex or v
			local topicContentsIndex = var34.topicContentsIndex or v
			table.insert(t, var34.placeId or 0)
			table.insert(t_1, v)
			table.insert(t_3, var34.universeId or 0)
			table.insert(t_2, topicContentsIndex)
			
			if var34.isSponsored then
				var28 = true
				table.insert(t_7, 1)
				table.insert(t_8, var34.adId or 0)
			else
				table.insert(t_7, 0)
				table.insert(t_8, 0)
			end
			table.insert(t_15, var34.gameCollectionItemTypeOverride or gameCollectionItemTypes.GameCollectionItemType.GameTile)
			local var37 = calculateRowPositionFields(uiIndex, p2, p4)
			
			if p2 and p2 > 0 then
				table.insert(t_9, var37.rowInSort)
				
				if p4 then
					table.insert(t_10, var37.rowOnPage)
					table.insert(t_11, var37.positionInRow)
				end
			else
				argCheckModule.assert(p2 ~= 0)
				
				if p4 then
					table.insert(t_10, p4)
					table.insert(t_11, uiIndex)
				end
			end
			local var39, v_1
			local t_18 = {}
			
			if fFlagLuaAppTileBadgeAnalyticsFix then
				t_18 = getGameTileLayoutData(var34, p5)
				var39 = getTileBadgeByPositionConfigFromEntry(var34) or t_18.tileBadgesByPosition
				local joined = nil
				
				if var34.tileBadgeIds then
					joined = var34.tileBadgeIds
				elseif var39 then
					local t_19 = {}
					
					for i_1, v_1 in getValidTileBadges(var39) do
						local var42 = cryoModule.List.map(v_1, function(p9) --[[ line: 179 ]]
							return p9.analyticsId
						end)
						
						if #var42 > 0 then
							table.insert(t_19, i_1 .. "=" .. table.concat(var42, "+"))
						end
					end
					if #t_19 > 0 then
						joined = table.concat(t_19, "&")
					end
				end
				table.insert(t_12, joined or "0")
			end
			if not p3 then
				var39 = var34.analyticsData
				
				if var39 then
					for i_2 in var39 do
						t_17[i_2] = true
					end
				end
				table.insert(t_16, var39 or {})
			end
			if not fFlagLuaAppTileBadgeAnalyticsFix then
				t_18 = getGameTileLayoutData(var34, p5)
			end
			if var34 and var34.thumbnailAssetId then
				table.insert(t_4, var34.thumbnailAssetId)
			else
				var39 = if var34 and var34.primaryWideImageAssetId then var34.primaryWideImageAssetId else itemLayoutDataParsingUtils.getWideImageAssetId(t_18)
				table.insert(t_4, var39 or (if var34 then var34.primaryWideAssetId else nil) or "0")
			end
			if var34 and var34.thumbnailListId then
				table.insert(t_5, var34.thumbnailListId)
			else
				var39 = if var34 and var34.primaryWideImageListId then var34.primaryWideImageListId else t_18 and (t_18.primaryMediaAsset and t_18.primaryMediaAsset.wideImageListId)
				table.insert(t_5, var39 or (if var34 then var34.primaryWideListId else "0"))
			end
			if var34 and var34.videoThumbnailAssetId then
				table.insert(t_6, var34.videoThumbnailAssetId)
			else
				var39 = if var34 and var34.primaryWideVideoAssetId then var34.primaryWideVideoAssetId else t_18 and (t_18.primaryMediaAsset and t_18.primaryMediaAsset.wideVideoAssetId)
				table.insert(t_6, var39 or "0")
			end
			if not fFlagLuaAppTileBadgeAnalyticsFix then
				var39 = nil
				
				if var34 and var34.tileBadgeIds then
					var39 = var34.tileBadgeIds
				elseif t_18 and t_18.tileBadgesByPosition then
					local t_19 = {}
					
					for i_2, i_1 in getValidTileBadges(t_18.tileBadgesByPosition) do
						v_1 = cryoModule.List.map(i_1, function(p10) --[[ line: 256 ]]
							return p10.analyticsId
						end)
						
						if #v_1 > 0 then
							table.insert(t_19, i_2 .. "=" .. table.concat(v_1, "+"))
						end
					end
					if #t_19 > 0 then
						var39 = table.concat(t_19, "&")
					end
				end
				table.insert(t_12, var39 or "0")
			end
			var39 = nil
			
			if var34 and var34.footer and var34.footer.analytics then
				var39 = var34.footer.analytics
			elseif t_18 and t_18.footer and t_18.footer.analytics then
				var39 = t_18.footer.analytics
			end
			if var39 and var39.textLiteral then
				table.insert(t_13, var39.textLiteral)
			else
				table.insert(t_13, "0")
			end
			if var39 and var39.locKey then
				table.insert(t_14, var39.locKey)
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
	
	if var28 then
		t_18.adFlags = table.concat(t_7, ",")
		t_18.adIds = table.concat(t_8, ",")
	end
	if fFlagLuaAppGameImpressionsAddUnifiedFields then
		t_18.hasSponsoredContent = var28
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
	if p3 and #t_4 > 0 then
		t_18.thumbnailAssetIds = table.concat(t_4, ",")
	end
	if p3 and #t_5 > 0 then
		t_18.thumbnailListIds = table.concat(t_5, ",")
	end
	if p3 and #t_6 > 0 then
		t_18.videoThumbnailAssetIds = table.concat(t_6, ",")
	end
	if fFlagLuaAppTileBadgeAnalyticsFix and #t_12 > 0 or not fFlagLuaAppTileBadgeAnalyticsFix and p3 and #t_12 > 0 then
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
	local var33 = cryoModule.Dictionary.join(t_19, p6 or {})
	
	if next(var33) then
		t_18.analyticsData = var33
	end
	return t_18, tCount
end

local function _(p11) --[[ line: 397 | named "addMobileAdvertisingIdToEventParams" ]]
	-- upvalues: appStorageService (ref)
	local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
	
	if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
		p11.mobileAdvertisingId = mobileAdvertisingIdItem
	end
end

return {
	sendFromTopicContents = function(p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28, p29) --[[ line: 404 ]]
		-- upvalues: loggingProtocolModule (ref), feedItemRowDataHitCounterModule (ref), feedItemRowDataMissingCounterModule (ref), addGameFields (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppAddSubIdToHomeEvents (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if p12 and p13 then
			if p14 and #p14 ~= 0 then
				if p15 and #p15 ~= 0 then
					if p19 then
						loggingProtocolModule.default:logRobloxTelemetryCounter(feedItemRowDataHitCounterModule)
					else
						loggingProtocolModule.default:logRobloxTelemetryCounter(feedItemRowDataMissingCounterModule)
					end
					local _ = nil
					local _ = nil
					local var45, var46 = addGameFields(p14, p15, p22, p23, p19, p17, p29)
					var45 = cryoModule.Dictionary.join(var45, {
						sortPos = p18,
						gameSetTypeId = p17,
						gameSetTargetId = p20,
						pageId = p21,
						componentType = p24,
						locale = localizationService.RobloxLocaleId,
						appliedFilters = p25,
						loadSource = p26,
						sortSubId = if fFlagLuaAppAddSubIdToHomeEvents then p28 else nil
					})
					
					if fFlagLuaAppGameImpressionsMobileAdsId then
						var45 = var45
						local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
						
						if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
							var45.mobileAdvertisingId = mobileAdvertisingIdItem
						end
					end
					gameImpressionsEventModule(p12, p16, var45)
					reportGameImpressionCountsModule(p13, p16, var46)
					
					return
				elseif p27 then
					p27(`Missing topicContentsEntries or topicContentsEntries == 0 {p15}`)
				end
				return
			elseif p27 then
				p27(`Missing impressionsToSend or impressionsToSend == 0 {p14}`)
			end
			return
		elseif p27 then
			p27(`Missing analytics service eventIngest: {p12} appAnalytics: {p13}`)
		end
	end,
	sendFromSearch = function(p30, p31, p32, p33, p34, p35, p36, p37, p38, p39) --[[ line: 482 ]]
		-- upvalues: addGameFields (ref), fFlagLuaAppFixSearchImpressions (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if not p30 or not p31 then return end
		if not p32 or #p32 == 0 then return end
		if not p33 or #p33 == 0 then return end
		local var48, var49 = addGameFields(p32, p33, p36, p38, p37, nil, nil, if fFlagLuaAppFixSearchImpressions then p35 else nil, if fFlagLuaAppFixSearchImpressions then p34 else nil)
		
		if fFlagLuaAppAddComponentTypeToSearchImpressions then
			var48 = cryoModule.Dictionary.join(var48, p35, {
				locale = localizationService.RobloxLocaleId,
				componentType = p39
			})
		else
			var48.locale = localizationService.RobloxLocaleId
			var48 = cryoModule.Dictionary.join(var48, p35)
		end
		if fFlagLuaAppGameImpressionsMobileAdsId then
			local var50 = var48
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var50.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p30, p34, var48)
		reportGameImpressionCountsModule(p31, p34, var49)
	end,
	sendFromGameDetails = function(p40, p41, p42, p43, p44) --[[ line: 535 ]]
		-- upvalues: addGameFields (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		local var52, var53 = addGameFields(p42, p43)
		var52.locale = localizationService.RobloxLocaleId
		var52.refId = p44
		
		if fFlagLuaAppGameImpressionsMobileAdsId then
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var52.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p40, "recommended", var52)
		reportGameImpressionCountsModule(p41, "recommended", var53)
	end,
	sendFromSeeAll = function(p45, p46, p47, p48, p49, p50, p51, p52, p53, p54) --[[ line: 555 ]]
		-- upvalues: addGameFields (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if not p45 or not p46 then return end
		if not p47 or #p47 == 0 then return end
		if not p48 or #p48 == 0 then return end
		local var55, var56 = addGameFields(p47, p48, nil, p54)
		local var57 = cryoModule.Dictionary.join(var55, {
			seeAllFlag = 1,
			gameSetTypeId = p50,
			gameSetTargetId = p51,
			pageId = p52,
			locale = localizationService.RobloxLocaleId,
			appliedFilters = p53
		})
		
		if fFlagLuaAppGameImpressionsMobileAdsId then
			var57 = var57
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var57.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p45, p49, var57)
		reportGameImpressionCountsModule(p46, p49, var56, 1)
	end,
	sendFromInGameExitModal = if fFlagEnableInGameExitModalNextUpUi then if fFlagEnableInGameExitModalNextUpUi then function(p55, p56, p57, p58, p59) --[[ line: 603 ]]
		-- upvalues: addGameFields (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if not p55 or not p56 then return end
		if not p58 or #p58 == 0 then return end
		if not p59 or #p59 == 0 then return end
		local var59, var60 = addGameFields(p58, p59)
		local var61 = cryoModule.Dictionary.join(var59, {
			gameSetTypeId = p57,
			locale = localizationService.RobloxLocaleId
		})
		
		if fFlagLuaAppGameImpressionsMobileAdsId then
			var61 = var61
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var61.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p55, "InGameExitPage", var61)
		reportGameImpressionCountsModule(p56, "InGameExitPage", var60)
	end else nil else nil,
	sendFromTraversalHistoryPage = if fFlagTraversalHistoryDiscoveryTelemetry then function(p60, p61, p62, p63, p64, p65) --[[ line: 639 ]]
		-- upvalues: addGameFields (ref), cryoModule (ref), localizationService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if p60 and p61 then
			local var63, var64 = addGameFields(p62, p63, p64, false, p65)
			gameImpressionsEventModule(p60, "InExpHistoryPage", cryoModule.Dictionary.join(var63, { locale = localizationService.RobloxLocaleId }))
			reportGameImpressionCountsModule(p61, "InExpHistoryPage", var64)
			
			return
		end
	end else nil
}