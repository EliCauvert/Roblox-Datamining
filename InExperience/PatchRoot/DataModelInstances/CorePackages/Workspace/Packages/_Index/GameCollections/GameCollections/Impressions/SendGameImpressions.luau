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

local function addGameFields(p0, p1, p2, p3, p4, p5, p6, p7, p8) --[[ line: 57 ]]
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
			local var38 = getGameTileLayoutData(var34, p5)
			local var39 = getTileBadgeByPositionConfigFromEntry(var34) or var38.tileBadgesByPosition
			local joined = nil
			
			if var34.tileBadgeIds then
				joined = var34.tileBadgeIds
			elseif var39 then
				local t_18 = {}
				
				for i_1, v_1 in getValidTileBadges(var39) do
					local var42 = cryoModule.List.map(v_1, function(p9) --[[ line: 174 ]]
						return p9.analyticsId
					end)
					
					if #var42 > 0 then
						table.insert(t_18, i_1 .. "=" .. table.concat(var42, "+"))
					end
				end
				if #t_18 > 0 then
					joined = table.concat(t_18, "&")
				end
			end
			local i_2
			table.insert(t_12, joined or "0")
			
			if not p3 then
				i_2 = var34.analyticsData
				
				if i_2 then
					for i_1 in i_2 do
						t_17[i_1] = true
					end
				end
				table.insert(t_16, i_2 or {})
			end
			if var34 and var34.thumbnailAssetId then
				table.insert(t_4, var34.thumbnailAssetId)
			else
				i_2 = if var34 and var34.primaryWideImageAssetId then var34.primaryWideImageAssetId else itemLayoutDataParsingUtils.getWideImageAssetId(var38)
				table.insert(t_4, i_2 or (if var34 then var34.primaryWideAssetId else nil) or "0")
			end
			if var34 and var34.thumbnailListId then
				table.insert(t_5, var34.thumbnailListId)
			else
				i_2 = if var34 and var34.primaryWideImageListId then var34.primaryWideImageListId else var38 and (var38.primaryMediaAsset and var38.primaryMediaAsset.wideImageListId)
				table.insert(t_5, i_2 or (if var34 then var34.primaryWideListId else "0"))
			end
			if var34 and var34.videoThumbnailAssetId then
				table.insert(t_6, var34.videoThumbnailAssetId)
			else
				i_2 = if var34 and var34.primaryWideVideoAssetId then var34.primaryWideVideoAssetId else var38 and (var38.primaryMediaAsset and var38.primaryMediaAsset.wideVideoAssetId)
				table.insert(t_6, i_2 or "0")
			end
			i_2 = nil
			
			if var34 and var34.footer and var34.footer.analytics then
				i_2 = var34.footer.analytics
			elseif var38 and var38.footer and var38.footer.analytics then
				i_2 = var38.footer.analytics
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
	local var33 = cryoModule.Dictionary.join(t_19, p6 or {})
	
	if next(var33) then
		t_18.analyticsData = var33
	end
	return t_18, tCount
end

local function _(p10) --[[ line: 348 | named "addMobileAdvertisingIdToEventParams" ]]
	-- upvalues: appStorageService (ref)
	local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
	
	if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
		p10.mobileAdvertisingId = mobileAdvertisingIdItem
	end
end

return {
	sendFromTopicContents = function(p11, p12, p13, p14, p15, p16, p17, p18, p19, p20, p21, p22, p23, p24, p25, p26, p27, p28) --[[ line: 355 ]]
		-- upvalues: loggingProtocolModule (ref), feedItemRowDataHitCounterModule (ref), feedItemRowDataMissingCounterModule (ref), addGameFields (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if p11 and p12 then
			if p13 and #p13 ~= 0 then
				if p14 and #p14 ~= 0 then
					if p18 then
						loggingProtocolModule.default:logRobloxTelemetryCounter(feedItemRowDataHitCounterModule)
					else
						loggingProtocolModule.default:logRobloxTelemetryCounter(feedItemRowDataMissingCounterModule)
					end
					local _ = nil
					local _ = nil
					local var44, var45 = addGameFields(p13, p14, p21, p22, p18, p16, p28)
					var44 = cryoModule.Dictionary.join(var44, {
						sortPos = p17,
						gameSetTypeId = p16,
						gameSetTargetId = p19,
						pageId = p20,
						componentType = p23,
						locale = localizationService.RobloxLocaleId,
						appliedFilters = p24,
						loadSource = p25,
						sortSubId = p27
					})
					
					if fFlagLuaAppGameImpressionsMobileAdsId then
						var44 = var44
						local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
						
						if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
							var44.mobileAdvertisingId = mobileAdvertisingIdItem
						end
					end
					gameImpressionsEventModule(p11, p15, var44)
					reportGameImpressionCountsModule(p12, p15, var45)
					
					return
				elseif p26 then
					p26(`Missing topicContentsEntries or topicContentsEntries == 0 {p14}`)
				end
				return
			elseif p26 then
				p26(`Missing impressionsToSend or impressionsToSend == 0 {p13}`)
			end
			return
		elseif p26 then
			p26(`Missing analytics service eventIngest: {p11} appAnalytics: {p12}`)
		end
	end,
	sendFromSearch = function(p29, p30, p31, p32, p33, p34, p35, p36, p37, p38) --[[ line: 433 ]]
		-- upvalues: addGameFields (ref), fFlagLuaAppFixSearchImpressions (ref), fFlagLuaAppAddComponentTypeToSearchImpressions (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if not p29 or not p30 then return end
		if not p31 or #p31 == 0 then return end
		if not p32 or #p32 == 0 then return end
		local var47, var48 = addGameFields(p31, p32, p35, p37, p36, nil, nil, if fFlagLuaAppFixSearchImpressions then p34 else nil, if fFlagLuaAppFixSearchImpressions then p33 else nil)
		
		if fFlagLuaAppAddComponentTypeToSearchImpressions then
			var47 = cryoModule.Dictionary.join(var47, p34, {
				locale = localizationService.RobloxLocaleId,
				componentType = p38
			})
		else
			var47.locale = localizationService.RobloxLocaleId
			var47 = cryoModule.Dictionary.join(var47, p34)
		end
		if fFlagLuaAppGameImpressionsMobileAdsId then
			local var49 = var47
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var49.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p29, p33, var47)
		reportGameImpressionCountsModule(p30, p33, var48)
	end,
	sendFromGameDetails = function(p39, p40, p41, p42, p43) --[[ line: 486 ]]
		-- upvalues: addGameFields (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		local var51, var52 = addGameFields(p41, p42)
		var51.locale = localizationService.RobloxLocaleId
		var51.refId = p43
		
		if fFlagLuaAppGameImpressionsMobileAdsId then
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var51.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p39, "recommended", var51)
		reportGameImpressionCountsModule(p40, "recommended", var52)
	end,
	sendFromSeeAll = function(p44, p45, p46, p47, p48, p49, p50, p51, p52, p53) --[[ line: 506 ]]
		-- upvalues: addGameFields (ref), cryoModule (ref), localizationService (ref), fFlagLuaAppGameImpressionsMobileAdsId (ref), appStorageService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if not p44 or not p45 then return end
		if not p46 or #p46 == 0 then return end
		if not p47 or #p47 == 0 then return end
		local var54, var55 = addGameFields(p46, p47, nil, p53)
		local var56 = cryoModule.Dictionary.join(var54, {
			seeAllFlag = 1,
			gameSetTypeId = p49,
			gameSetTargetId = p50,
			pageId = p51,
			locale = localizationService.RobloxLocaleId,
			appliedFilters = p52
		})
		
		if fFlagLuaAppGameImpressionsMobileAdsId then
			var56 = var56
			local mobileAdvertisingIdItem = appStorageService:GetItem("MobileAdvertisingId")
			
			if mobileAdvertisingIdItem and mobileAdvertisingIdItem ~= "" then
				var56.mobileAdvertisingId = mobileAdvertisingIdItem
			end
		end
		gameImpressionsEventModule(p44, p48, var56)
		reportGameImpressionCountsModule(p45, p48, var55, 1)
	end,
	sendFromTraversalHistoryPage = if fFlagTraversalHistoryDiscoveryTelemetry then function(p54, p55, p56, p57, p58, p59) --[[ line: 554 ]]
		-- upvalues: addGameFields (ref), cryoModule (ref), localizationService (ref), gameImpressionsEventModule (ref), reportGameImpressionCountsModule (ref)
		if p54 and p55 then
			local var58, var59 = addGameFields(p56, p57, p58, false, p59)
			gameImpressionsEventModule(p54, "InExpHistoryPage", cryoModule.Dictionary.join(var58, { locale = localizationService.RobloxLocaleId }))
			reportGameImpressionCountsModule(p55, "InExpHistoryPage", var59)
			
			return
		end
	end else nil
}