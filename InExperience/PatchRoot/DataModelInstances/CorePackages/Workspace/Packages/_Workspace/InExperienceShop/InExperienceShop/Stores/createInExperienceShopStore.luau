local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local createSignal = require(parent.Signals).createSignal
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)
local errorsModule = require(inExperienceShop.Api.Errors)
local fetchAllShopDataModule = require(inExperienceShop.Api.fetchAllShopData)
local fetchShopWidgetsOnlyModule = require(inExperienceShop.Api.fetchShopWidgetsOnly)
local multiGetProductInfoModule = require(inExperienceShop.Api.multiGetProductInfo)
local streamMultiGetProductInfoModule = require(inExperienceShop.Api.streamMultiGetProductInfo)
local logCounterModule = require(inExperienceShop.Internal.logCounter)
local productInfoFailedItemsCounterModule = require(inExperienceShop.Events.ProductInfoFailedItemsCounter)
local userOwnsGamePassModule = require(inExperienceShop.Api.userOwnsGamePass)
local fetchGamePassTrialAvailabilitiesModule = require(inExperienceShop.Api.fetchGamePassTrialAvailabilities)
local fFlagShopUseMockDataModule = require(inExperienceShop.Flags.FFlagShopUseMockData)
local fFlagShopUseMockUserOwnsGamePassModule = require(inExperienceShop.Flags.FFlagShopUseMockUserOwnsGamePass)
local fFlagShopUseMockGamePassTrialAvailabilitiesModule = require(inExperienceShop.Flags.FFlagShopUseMockGamePassTrialAvailabilities)
local fFlagLuaAppEnableGamePassFreeTrialsModule = require(inExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local fFlagShopUseMockMultiGetProductInfoModule = require(inExperienceShop.Flags.FFlagShopUseMockMultiGetProductInfo)
local fFlagEnableShopProductInfoRefreshModule = require(inExperienceShop.Flags.FFlagEnableShopProductInfoRefresh)
local fFlagEnablePartialDisplayInExperienceShopModule = require(inExperienceShop.Flags.FFlagEnablePartialDisplayInExperienceShop)
local _ = require(inExperienceShop.Flags.FFlagPromoteRobuxInTopPicks)
local fFlagEnableRobuxInExperienceShop = sharedFlagsModule.FFlagEnableRobuxInExperienceShop
local fIntShopOwnershipFetchMaxAttemptsModule = require(inExperienceShop.Flags.FIntShopOwnershipFetchMaxAttempts)
local mockFetchAllShopDataModule = require(inExperienceShop.Mocks.MockFetchAllShopData)
local mockMultiGetProductInfoModule = require(inExperienceShop.Mocks.MockMultiGetProductInfo)
local mockUserOwnsGamePassModule = require(inExperienceShop.Mocks.MockUserOwnsGamePass)
local mockGamePassTrialAvailabilitiesModule = require(inExperienceShop.Mocks.MockGamePassTrialAvailabilities)
local promoteBonusRobuxPackageToTopPicksModule = require(inExperienceShop.Api.promoteBonusRobuxPackageToTopPicks)
local bonusPromotionEligibilityModule = require(inExperienceShop.Api.BonusPromotionEligibility)
local sortRobuxPackagesByAmountDescendingModule = require(inExperienceShop.Utils.sortRobuxPackagesByAmountDescending)
local fFlagEnableExperienceShopGlobalIconModule = require(inExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local fFlagInExperienceShopExpectStringMetadataValuesModule = require(inExperienceShop.Flags.FFlagInExperienceShopExpectStringMetadataValues)

local function _(p0)
	return type(p0) == "table" and (type(p0.categories) == "table" and type(p0.sections) == "table")
end

local _ = function()
	-- upvalues: fFlagEnablePartialDisplayInExperienceShopModule (ref)
	return if typeof(fFlagEnablePartialDisplayInExperienceShopModule) == "function" then fFlagEnablePartialDisplayInExperienceShopModule() else fFlagEnablePartialDisplayInExperienceShopModule
end

return function()
	-- upvalues: createSignal (ref), constantsModule (ref), sortRobuxPackagesByAmountDescendingModule (ref), promoteBonusRobuxPackageToTopPicksModule (ref), fFlagEnableRobuxInExperienceShop (ref), bonusPromotionEligibilityModule (ref), fFlagShopUseMockUserOwnsGamePassModule (ref), mockUserOwnsGamePassModule (ref), userOwnsGamePassModule (ref), fFlagLuaAppEnableGamePassFreeTrialsModule (ref), fFlagShopUseMockGamePassTrialAvailabilitiesModule (ref), mockGamePassTrialAvailabilitiesModule (ref), fetchGamePassTrialAvailabilitiesModule (ref), fFlagEnableExperienceShopGlobalIconModule (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (ref), inExperienceShop (ref), fFlagShopUseMockDataModule (ref), fFlagShopUseMockMultiGetProductInfoModule (ref), mockMultiGetProductInfoModule (ref), streamMultiGetProductInfoModule (ref), logCounterModule (ref), productInfoFailedItemsCounterModule (ref), errorsModule (ref), fFlagEnablePartialDisplayInExperienceShopModule (ref), fetchShopWidgetsOnlyModule (ref), mockFetchAllShopDataModule (ref), fetchAllShopDataModule (ref), fFlagEnableShopProductInfoRefreshModule (ref), multiGetProductInfoModule (ref), promiseModule (ref), playersService (ref), marketplaceService (ref), fIntShopOwnershipFetchMaxAttemptsModule (ref)
	local var32, var33 = createSignal({})
	local var34, var35 = createSignal({})
	local var36, var37 = createSignal(false)
	local var38, var39 = createSignal(nil)
	local var40, var41 = createSignal(nil)
	local var42, var43 = createSignal(false)
	local var44, var45 = createSignal(false)
	local var46, var47 = createSignal({})
	local var48, var49 = createSignal({ available = {}, active = {} })
	local var50, var51 = createSignal({})
	local var52, var53 = createSignal(constantsModule.MIN_COLUMNS)
	local t = {}
	local var55 = false
	local var56 = false
	local var57 = false
	local var58 = false
	local var59 = false
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	local function _(p1, p2)
		-- upvalues: t_3 (ref), var51 (ref)
		t_3[p1] = p2
		var51(table.clone(t_3))
	end
	
	local function sortRobuxPackagesInSections(p3)
		-- upvalues: sortRobuxPackagesByAmountDescendingModule (copy)
		local v_1
		local var83 = false
		
		for i, v in p3 do
			v_1 = v.robuxPackages
			
			if v_1 ~= nil and #v_1 > 1 then
				var83 = true
				break
			end
		end
		if not var83 then
			return p3
		end
		local cloned = table.clone(p3)
		
		for i_1, v_1 in ipairs(p3) do
			local robuxPackages = v_1.robuxPackages
			
			if robuxPackages ~= nil and #robuxPackages > 1 then
				cloned[i_1] = {
					id = v_1.id,
					name = v_1.name,
					items = v_1.items,
					paymentSessionId = v_1.paymentSessionId,
					robuxPackages = sortRobuxPackagesByAmountDescendingModule(robuxPackages),
					featuredRobuxPackage = v_1.featuredRobuxPackage
				}
			end
		end
		return cloned
	end
	
	local _ = function()
		-- upvalues: promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (write), t_3 (ref), var35 (ref), sortRobuxPackagesInSections (ref)
		var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
	end
	
	local function writeOwnership(p4, p5)
		-- upvalues: var46 (ref), var47 (ref), fFlagEnableRobuxInExperienceShop (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (write), bonusPromotionEligibilityModule (copy), t_3 (ref), var51 (ref), var35 (ref), sortRobuxPackagesInSections (ref)
		local cloned = table.clone(var46(false))
		cloned[p4] = p5
		var47(cloned)
		
		if not p5 or not fFlagEnableRobuxInExperienceShop then return end
		local var86 = promoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(t_2)
		local var87 = if var86 ~= nil then nil else promoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(var86)
		
		if var87 == nil or var87 ~= p4 then
			return
		end
		t_3[p4] = bonusPromotionEligibilityModule.Ineligible
		var51(table.clone(t_3))
		var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
	end
	
	local function fetchGamePassOwnership(p6)
		-- upvalues: t (ref), var46 (ref), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassModule (copy), writeOwnership (ref)
		if t[p6] then return end
		if var46(false)[p6] ~= nil then return end
		local var88 = tonumber(p6)
		
		if var88 == nil then
			return
		end
		t[p6] = true;
		(if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule)(var88):andThen(function(p8)
			-- upvalues: var46 (copy), p6 (ref), writeOwnership (copy)
			if var46(false)[p6] == nil then
				writeOwnership(p6, p8)
				
				return
			end
		end):catch(function(p7)
			-- upvalues: p6 (ref)
			warn("[Shop] fetchGamePassOwnership failed", p6, tostring(p7))
		end):finally(function()
			-- upvalues: t (copy), p6 (ref)
			t[p6] = nil
		end)
	end
	
	local function hydrateGamePassTrialAvailabilities()
		-- upvalues: fFlagLuaAppEnableGamePassFreeTrialsModule (copy), var55 (write), fFlagShopUseMockGamePassTrialAvailabilitiesModule (copy), mockGamePassTrialAvailabilitiesModule (copy), fetchGamePassTrialAvailabilitiesModule (copy), var49 (ref)
		if not fFlagLuaAppEnableGamePassFreeTrialsModule then return end
		if var55 then
			return
		end
		var55 = true;
		(if fFlagShopUseMockGamePassTrialAvailabilitiesModule then mockGamePassTrialAvailabilitiesModule.fetchGamePassTrialAvailabilities else fetchGamePassTrialAvailabilitiesModule.fetchGamePassTrialAvailabilities)(game.GameId):andThen(function(p10)
			-- upvalues: var49 (copy)
			var49(p10)
		end):catch(function(p9)
			warn("[Shop] hydrateGamePassTrialAvailabilities failed", tostring(p9))
		end):finally(function()
			-- upvalues: var55 (copy)
			var55 = false
		end)
	end
	
	local function fetchBonusGamePassOwnershipForPromotionId(p11)
		-- upvalues: t_4 (ref), bonusPromotionEligibilityModule (copy), t_3 (ref), var51 (ref), promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (write), var35 (ref), sortRobuxPackagesInSections (ref), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassModule (copy), var46 (ref), writeOwnership (ref)
		if t_4[p11] then return end
		t_3[p11] = bonusPromotionEligibilityModule.Unknown
		var51(table.clone(t_3))
		var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
		local var89 = tonumber(p11)
		
		if var89 == nil then
			t_3[p11] = bonusPromotionEligibilityModule.Ineligible
			var51(table.clone(t_3))
			var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
			
			return
		end
		t_4[p11] = true;
		(if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule)(var89):andThen(function(p13)
			-- upvalues: p11 (ref), bonusPromotionEligibilityModule (copy), t_3 (copy), var51 (copy), var46 (copy), writeOwnership (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (copy), var35 (copy), sortRobuxPackagesInSections (copy)
			t_3[p11] = if p13 then bonusPromotionEligibilityModule.Ineligible else bonusPromotionEligibilityModule.Eligible
			var51(table.clone(t_3))
			
			if var46(false)[p11] == nil then
				writeOwnership(p11, p13)
			end
			var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
		end):catch(function(p12)
			-- upvalues: p11 (ref), bonusPromotionEligibilityModule (copy), t_3 (copy), var51 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (copy), var35 (copy), sortRobuxPackagesInSections (copy)
			warn("[Shop] fetchBonusGamePassOwnershipForPromotion failed", p11, tostring(p12))
			t_3[p11] = bonusPromotionEligibilityModule.Ineligible
			var51(table.clone(t_3))
			var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
		end):finally(function()
			-- upvalues: t_4 (copy), p11 (ref)
			t_4[p11] = nil
		end)
	end
	
	local function fetchBonusGamePassOwnershipForPromotion(p14)
		-- upvalues: fFlagEnableRobuxInExperienceShop (copy), promoteBonusRobuxPackageToTopPicksModule (copy), fetchBonusGamePassOwnershipForPromotionId (ref)
		if not fFlagEnableRobuxInExperienceShop then return end
		local var90 = promoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(p14)
		local var91 = if var90 ~= nil then nil else promoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(var90)
		
		for i, v in if var91 ~= nil then {} else { var91 } do
			fetchBonusGamePassOwnershipForPromotionId(v)
		end
	end
	
	local _ = function(p15)
		-- upvalues: t_2 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var35 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref)
		t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p15)
		var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
		fetchBonusGamePassOwnershipForPromotion(t_2)
	end
	
	local _ = function(p16)
		-- upvalues: fFlagEnableExperienceShopGlobalIconModule (copy), var41 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var43 (ref), var45 (ref)
		if fFlagEnableExperienceShopGlobalIconModule then
			local var93
			local metadata = p16.metadata
			var41(metadata)
			local var92 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
			
			if fFlagInExperienceShopExpectStringMetadataValuesModule then
				var93 = var92 == "true"
				var93 = nil
			else
				var93 = var92 == true
			end
			var43(var93)
			var45(metadata ~= nil and metadata.newOffers == true)
		end
	end
	
	local function buildProductInfoRequestsForHydration(p17, p18)
		-- upvalues: inExperienceShop (copy), fFlagEnableRobuxInExperienceShop (copy)
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local var96 = refreshShopItemsModule.buildRequestsFromSections(p17)
		
		if fFlagEnableRobuxInExperienceShop then
			hydrateRobuxBonusItemsModule.appendBonusItemRequests(var96, p17)
		end
		refreshShopItemsModule.appendFailedItemRequests(var96, p18)
		
		return var96
	end
	
	local function applyStreamingProductInfoResult(a, b, p19)
		-- upvalues: inExperienceShop (copy), fFlagEnableRobuxInExperienceShop (copy)
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local makeRequestKey = require(inExperienceShop.Api.shopItemMapping).makeRequestKey
		local var99 = makeRequestKey(b.request.id, b.request.infoType)
		local t = {}
		local t_1 = {}
		
		for i, v in p19 do
			if makeRequestKey(v.id, v.infoType) == var99 then
				table.insert(t, v)
			else
				table.insert(t_1, v)
			end
		end
		local var102 = refreshShopItemsModule.mergeProductInfoIntoSections(a, { b })
		local var103, var104 = refreshShopItemsModule.insertRecoveredItemsIntoSections(if fFlagEnableRobuxInExperienceShop then hydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(var102, { b }) else var102, { b }, t)
		
		for i_1, v_1 in var104 do
			table.insert(t_1, v_1)
		end
		return var103, t_1
	end
	
	local function routeStreamMultiGetProductInfo(p20, p21)
		-- upvalues: fFlagShopUseMockDataModule (copy), fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), streamMultiGetProductInfoModule (copy)
		return if fFlagShopUseMockDataModule and fFlagShopUseMockMultiGetProductInfoModule then mockMultiGetProductInfoModule.streamMultiGetProductInfo(p20, { onResult = p21 }, 0) else streamMultiGetProductInfoModule(p20, { onResult = p21 })
	end
	
	local function streamProductInfoIntoSections(p22, p23, p24, p25)
		-- upvalues: var59 (write), t_2 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var35 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), routeStreamMultiGetProductInfo (ref), applyStreamingProductInfoResult (ref), t_1 (write), logCounterModule (copy), productInfoFailedItemsCounterModule (copy)
		if #p23 == 0 then
			if p25 then
				p25(p24)
			end
			return
		else
			var59 = true
			local var105 = p22
			local var106 = p24
			local var107 = nil
			local var108 = false
			
			local function flushPendingSections()
				-- upvalues: var108 (write), var107 (write), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var35 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy)
				var108 = false
				
				if var107 ~= nil then
					t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var107)
					var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
					fetchBonusGamePassOwnershipForPromotion(t_2)
					var107 = nil
				end
			end
			
			local function _(p26)
				-- upvalues: var107 (write), var108 (write), flushPendingSections (ref)
				var107 = p26
				
				if var108 then
					return
				end
				var108 = true
				task.delay(0.05, flushPendingSections)
			end
			
			routeStreamMultiGetProductInfo(p23, function(p28)
				-- upvalues: var105 (write), var106 (write), applyStreamingProductInfoResult (copy), var107 (write), var108 (write), flushPendingSections (ref)
				local var110, var111 = applyStreamingProductInfoResult(var105, p28, var106)
				var105 = var110
				var106 = var111
				var107 = var105
				
				if var108 then
					return
				end
				var108 = true
				task.delay(0.05, flushPendingSections)
			end):andThen(function(_)
				-- upvalues: var108 (write), var107 (write), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var35 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var105 (write), t_1 (copy), var106 (write), logCounterModule (copy), productInfoFailedItemsCounterModule (copy), var59 (copy), p25 (ref)
				var108 = false
				
				if var107 ~= nil then
					t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var107)
					var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
					fetchBonusGamePassOwnershipForPromotion(t_2)
					var107 = nil
				end
				t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var105)
				var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
				fetchBonusGamePassOwnershipForPromotion(t_2)
				t_1 = var106
				
				if #var106 > 0 then
					logCounterModule(productInfoFailedItemsCounterModule, #var106)
				end
				var59 = false
				
				if p25 then
					p25(var106)
				end
			end):catch(function(p27)
				-- upvalues: var108 (write), var107 (write), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var35 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var59 (copy), p25 (ref), var106 (write)
				warn("[Shop] streamProductInfoIntoSections failed", tostring(p27))
				var108 = false
				
				if var107 ~= nil then
					t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var107)
					var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
					fetchBonusGamePassOwnershipForPromotion(t_2)
					var107 = nil
				end
				var59 = false
				
				if p25 then
					p25(var106)
				end
			end)
		end
	end
	
	local function runShopFetch(p29, p30, p31)
		-- upvalues: var57 (write), var56 (write), var37 (ref), var39 (ref), hydrateGamePassTrialAvailabilities (ref), fFlagShopUseMockDataModule (copy), errorsModule (copy), var33 (ref), t_2 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var35 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), fFlagEnableExperienceShopGlobalIconModule (copy), var41 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var43 (ref), var45 (ref), t_1 (write)
		if var57 or var56 then
			return
		end
		var56 = true
		var37(true)
		var39(nil)
		hydrateGamePassTrialAvailabilities();
		(if fFlagShopUseMockDataModule then p30() else p29()):andThen(function(p33)
			-- upvalues: errorsModule (copy), p31 (ref), var33 (copy), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var35 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), fFlagEnableExperienceShopGlobalIconModule (copy), var41 (copy), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var43 (copy), var45 (copy), t_1 (copy), var37 (copy), var56 (copy), var57 (copy)
			if not (type(p33) == "table" and (type(p33.categories) == "table" and type(p33.sections) == "table")) then
				return errorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p31), p33)
			end
			var33(p33.categories)
			t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p33.sections)
			var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
			fetchBonusGamePassOwnershipForPromotion(t_2)
			
			if fFlagEnableExperienceShopGlobalIconModule then
				local var113
				local metadata = p33.metadata
				var41(metadata)
				local var112 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
				
				if fFlagInExperienceShopExpectStringMetadataValuesModule then
					var113 = var112 == "true"
					var113 = nil
				else
					var113 = var112 == true
				end
				var43(var113)
				var45(metadata ~= nil and metadata.newOffers == true)
			end
			t_1 = p33.failedItems or {}
			var37(false)
			var56 = false
			var57 = true
		end):catch(function(p32)
			-- upvalues: var39 (copy), var33 (copy), var35 (copy), t_1 (copy), var37 (copy), var56 (copy)
			var39(p32)
			var33({})
			var35({})
			t_1 = {}
			var37(false)
			var56 = false
		end)
	end
	
	local function runPartialDisplayShopFetch(p34, p35, p36)
		-- upvalues: var57 (write), var56 (write), var37 (ref), var39 (ref), hydrateGamePassTrialAvailabilities (ref), fFlagShopUseMockDataModule (copy), errorsModule (copy), var33 (ref), t_2 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var35 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), fFlagEnableExperienceShopGlobalIconModule (copy), var41 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var43 (ref), var45 (ref), t_1 (write), buildProductInfoRequestsForHydration (ref), streamProductInfoIntoSections (ref)
		if var57 or var56 then
			return
		end
		var56 = true
		var37(true)
		var39(nil)
		hydrateGamePassTrialAvailabilities();
		(if fFlagShopUseMockDataModule then p35() else p34()):andThen(function(p38)
			-- upvalues: errorsModule (copy), p36 (ref), var33 (copy), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var35 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), fFlagEnableExperienceShopGlobalIconModule (copy), var41 (copy), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var43 (copy), var45 (copy), t_1 (copy), var37 (copy), var56 (copy), var57 (copy), buildProductInfoRequestsForHydration (copy), streamProductInfoIntoSections (copy)
			if not (type(p38) == "table" and (type(p38.categories) == "table" and type(p38.sections) == "table")) then
				return errorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p36), p38)
			end
			var33(p38.categories)
			t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p38.sections)
			var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
			fetchBonusGamePassOwnershipForPromotion(t_2)
			
			if fFlagEnableExperienceShopGlobalIconModule then
				local var115
				local metadata = p38.metadata
				var41(metadata)
				local var114 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
				
				if fFlagInExperienceShopExpectStringMetadataValuesModule then
					var115 = var114 == "true"
					var115 = nil
				else
					var115 = var114 == true
				end
				var43(var115)
				var45(metadata ~= nil and metadata.newOffers == true)
			end
			t_1 = p38.failedItems or {}
			var37(false)
			var56 = false
			var57 = true
			local var116 = t_2
			streamProductInfoIntoSections(var116, buildProductInfoRequestsForHydration(var116, t_1), t_1, nil)
		end):catch(function(p37)
			-- upvalues: var39 (copy), var33 (copy), var35 (copy), t_1 (copy), var37 (copy), var56 (copy)
			var39(p37)
			var33({})
			var35({})
			t_1 = {}
			var37(false)
			var56 = false
		end)
	end
	
	local function fetchAllShopData()
		-- upvalues: fFlagEnablePartialDisplayInExperienceShopModule (copy), runPartialDisplayShopFetch (ref), fetchShopWidgetsOnlyModule (copy), mockFetchAllShopDataModule (copy), runShopFetch (ref), fetchAllShopDataModule (copy)
		local var117 = fFlagEnablePartialDisplayInExperienceShopModule
		
		if if typeof(var117) == "function" then var117() else var117 then
			runPartialDisplayShopFetch(fetchShopWidgetsOnlyModule, mockFetchAllShopDataModule.fetchShopWidgetsOnly, "fetchAllShopData")
			
			return
		end
		runShopFetch(fetchAllShopDataModule, mockFetchAllShopDataModule.fetchAllShopData, "fetchAllShopData")
	end
	
	local function prefetchWidgetsOnly()
		-- upvalues: runShopFetch (ref), fetchShopWidgetsOnlyModule (copy), mockFetchAllShopDataModule (copy)
		runShopFetch(fetchShopWidgetsOnlyModule, mockFetchAllShopDataModule.fetchShopWidgetsOnly, "prefetchWidgetsOnly")
	end
	
	local function refreshShopItemInfo()
		-- upvalues: fFlagEnableShopProductInfoRefreshModule (copy), var57 (write), var58 (write), var59 (write), inExperienceShop (copy), t_2 (write), var34 (ref), fFlagEnableRobuxInExperienceShop (copy), t_1 (write), fFlagEnablePartialDisplayInExperienceShopModule (copy), streamProductInfoIntoSections (ref), fFlagShopUseMockDataModule (copy), fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), multiGetProductInfoModule (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var35 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref)
		if not fFlagEnableShopProductInfoRefreshModule then return end
		if not var57 or var58 or var59 then return end
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local var120 = if #t_2 > 0 then t_2 else var34(false)
		local var121 = refreshShopItemsModule.buildRequestsFromSections(var120)
		
		if fFlagEnableRobuxInExperienceShop then
			hydrateRobuxBonusItemsModule.appendBonusItemRequests(var121, var120)
		end
		refreshShopItemsModule.appendFailedItemRequests(var121, t_1)
		
		if #var121 == 0 then return end
		var58 = true
		local var122 = fFlagEnablePartialDisplayInExperienceShopModule
		
		if if typeof(var122) == "function" then var122() else var122 then
			streamProductInfoIntoSections(var120, var121, t_1, function()
				-- upvalues: var58 (copy)
				var58 = false
			end)
			
			return
		end
		local _ = nil;
		(if fFlagShopUseMockDataModule and fFlagShopUseMockMultiGetProductInfoModule then mockMultiGetProductInfoModule.multiGetProductInfo(var121, 0) else multiGetProductInfoModule(var121)):andThen(function(p40)
			-- upvalues: refreshShopItemsModule (ref), var120 (ref), fFlagEnableRobuxInExperienceShop (copy), hydrateRobuxBonusItemsModule (ref), t_1 (ref), t_1 (copy), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var35 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var58 (copy)
			local var123 = refreshShopItemsModule.mergeProductInfoIntoSections(var120, p40)
			local var124, var125 = refreshShopItemsModule.insertRecoveredItemsIntoSections(if fFlagEnableRobuxInExperienceShop then hydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(var123, p40) else var123, p40, t_1)
			t_1 = var125
			t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var124)
			var35(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
			fetchBonusGamePassOwnershipForPromotion(t_2)
			var58 = false
		end):catch(function(p39)
			-- upvalues: var58 (copy)
			warn("[Shop] refreshShopItemInfo failed", tostring(p39))
			var58 = false
		end)
	end
	
	local function onShopOpened()
		-- upvalues: fFlagEnablePartialDisplayInExperienceShopModule (copy), runPartialDisplayShopFetch (ref), fetchShopWidgetsOnlyModule (copy), mockFetchAllShopDataModule (copy), runShopFetch (ref), fetchAllShopDataModule (copy), refreshShopItemInfo (ref)
		if if typeof(fFlagEnablePartialDisplayInExperienceShopModule) == "function" then fFlagEnablePartialDisplayInExperienceShopModule() else fFlagEnablePartialDisplayInExperienceShopModule then
			runPartialDisplayShopFetch(fetchShopWidgetsOnlyModule, mockFetchAllShopDataModule.fetchShopWidgetsOnly, "fetchAllShopData")
		else
			runShopFetch(fetchAllShopDataModule, mockFetchAllShopDataModule.fetchAllShopData, "fetchAllShopData")
		end
		refreshShopItemInfo()
	end
	
	local t_5 = {}
	
	local function pollOwnershipUntilTrue(p41, p42, p43, p44)
		-- upvalues: promiseModule (copy), pollOwnershipUntilTrue (ref), constantsModule (copy)
		return p41(p42):andThen(function(p46)
			-- upvalues: p43 (ref), promiseModule (copy), p44 (ref), pollOwnershipUntilTrue (copy), p41 (ref), p42 (ref), constantsModule (copy)
			return if p46 then true elseif p43 <= 1 then false else promiseModule.delay(p44):andThen(function()
				-- upvalues: pollOwnershipUntilTrue (copy), p41 (copy), p42 (copy), p43 (copy), p44 (copy), constantsModule (copy)
				return pollOwnershipUntilTrue(p41, p42, p43 - 1, p44 * constantsModule.POLL_BACKOFF_MULTIPLIER)
			end)
		end):catch(function(p45)
			-- upvalues: p43 (ref), p42 (ref), promiseModule (copy), p44 (ref), pollOwnershipUntilTrue (copy), p41 (ref), constantsModule (copy)
			if p43 <= 1 then
				warn("[Shop] pollOwnershipUntilTrue exhausted with engine error", p42, tostring(p45))
				
				return nil
			end
			return promiseModule.delay(p44):andThen(function()
				-- upvalues: pollOwnershipUntilTrue (copy), p41 (copy), p42 (copy), p43 (copy), p44 (copy), constantsModule (copy)
				return pollOwnershipUntilTrue(p41, p42, p43 - 1, p44 * constantsModule.POLL_BACKOFF_MULTIPLIER)
			end)
		end)
	end
	
	local function pollGamePassOwnershipAfterPurchase(p47, p48, p49, p50)
		-- upvalues: t_5 (ref), pollOwnershipUntilTrue (ref), constantsModule (copy), writeOwnership (ref), playersService (copy), marketplaceService (copy), promiseModule (copy)
		if t_5[p47] then return end
		local var126 = tonumber(p47)
		
		if var126 == nil then
			return
		end
		t_5[p47] = true
		promiseModule.delay(constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function()
			-- upvalues: pollOwnershipUntilTrue (copy), p49 (ref), var126 (ref), p48 (ref), constantsModule (copy), writeOwnership (copy), p47 (ref), p50 (ref), playersService (copy), marketplaceService (copy), t_5 (copy)
			pollOwnershipUntilTrue(p49, var126, p48, constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function(p51)
				-- upvalues: writeOwnership (copy), p47 (copy), p50 (copy), playersService (copy), marketplaceService (copy), var126 (copy)
				if p51 ~= true then return end
				writeOwnership(p47, p51)
				
				if p50 then
					local localPlayer = playersService.LocalPlayer
					
					if localPlayer ~= nil then
						marketplaceService:SignalPromptGamePassPurchaseFinished(localPlayer, var126, true)
					end
				end
			end):finally(function()
				-- upvalues: t_5 (copy), p47 (copy)
				t_5[p47] = nil
			end)
		end)
	end
	
	marketplaceService.PromptGamePassPurchaseFinished:Connect(function(p52, p53, p54)
		-- upvalues: playersService (copy), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassModule (copy), fIntShopOwnershipFetchMaxAttemptsModule (copy), t_5 (ref), pollOwnershipUntilTrue (ref), constantsModule (copy), writeOwnership (ref), marketplaceService (copy), promiseModule (copy)
		if not p54 then return end
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer == nil or p52.UserId ~= localPlayer.UserId then return end
		local var127 = if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule
		local var128 = tostring(p53)
		
		if t_5[var128] then return end
		local var129 = tonumber(var128)
		
		if var129 == nil then
			return
		end
		t_5[var128] = true
		local var130 = nil
		promiseModule.delay(constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function()
			-- upvalues: pollOwnershipUntilTrue (copy), var127 (ref), var129 (ref), fIntShopOwnershipFetchMaxAttemptsModule (ref), constantsModule (copy), writeOwnership (copy), var128 (ref), var130 (ref), playersService (copy), marketplaceService (copy), t_5 (copy)
			pollOwnershipUntilTrue(var127, var129, fIntShopOwnershipFetchMaxAttemptsModule, constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function(p55)
				-- upvalues: writeOwnership (copy), var128 (copy), var130 (copy), playersService (copy), marketplaceService (copy), var129 (copy)
				if p55 ~= true then return end
				writeOwnership(var128, p55)
				
				if var130 then
					local localPlayer = playersService.LocalPlayer
					
					if localPlayer ~= nil then
						marketplaceService:SignalPromptGamePassPurchaseFinished(localPlayer, var129, true)
					end
				end
			end):finally(function()
				-- upvalues: t_5 (copy), var128 (copy)
				t_5[var128] = nil
			end)
		end)
	end)
	
	return {
		getCategories = var32,
		getSections = var34,
		getLoading = var36,
		getError = var38,
		getOwnership = var46,
		getTrialAvailabilities = var48,
		getBonusPromotionEligibility = var50,
		getItemsPerRow = var52,
		getMetadata = var40,
		getGlobalIconBackendEnabled = var42,
		getGlobalIconHasNewOffers = var44,
		onShopOpened = onShopOpened,
		fetchAllShopData = fetchAllShopData,
		prefetchWidgetsOnly = prefetchWidgetsOnly,
		refreshShopItemInfo = refreshShopItemInfo,
		fetchGamePassOwnership = fetchGamePassOwnership,
		pollGamePassOwnership = pollGamePassOwnershipAfterPurchase,
		setItemsPerRow = function(value)
			-- upvalues: var53 (ref)
			var53(value)
		end
	}
end