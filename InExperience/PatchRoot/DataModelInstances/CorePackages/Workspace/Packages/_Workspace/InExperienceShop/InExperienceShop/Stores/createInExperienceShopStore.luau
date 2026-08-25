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
local fFlagShopUseMockDataModule = require(inExperienceShop.Flags.FFlagShopUseMockData)
local fFlagShopUseMockUserOwnsGamePassModule = require(inExperienceShop.Flags.FFlagShopUseMockUserOwnsGamePass)
local fFlagShopUseMockMultiGetProductInfoModule = require(inExperienceShop.Flags.FFlagShopUseMockMultiGetProductInfo)
local fFlagEnableShopProductInfoRefreshModule = require(inExperienceShop.Flags.FFlagEnableShopProductInfoRefresh)
local fFlagEnablePartialDisplayInExperienceShopModule = require(inExperienceShop.Flags.FFlagEnablePartialDisplayInExperienceShop)
local _ = require(inExperienceShop.Flags.FFlagPromoteRobuxInTopPicks)
local fFlagEnableRobuxInExperienceShop = sharedFlagsModule.FFlagEnableRobuxInExperienceShop
local fIntShopOwnershipFetchMaxAttemptsModule = require(inExperienceShop.Flags.FIntShopOwnershipFetchMaxAttempts)
local mockFetchAllShopDataModule = require(inExperienceShop.Mocks.MockFetchAllShopData)
local mockMultiGetProductInfoModule = require(inExperienceShop.Mocks.MockMultiGetProductInfo)
local mockUserOwnsGamePassModule = require(inExperienceShop.Mocks.MockUserOwnsGamePass)
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
	-- upvalues: createSignal (ref), constantsModule (ref), sortRobuxPackagesByAmountDescendingModule (ref), promoteBonusRobuxPackageToTopPicksModule (ref), fFlagEnableRobuxInExperienceShop (ref), bonusPromotionEligibilityModule (ref), fFlagShopUseMockUserOwnsGamePassModule (ref), mockUserOwnsGamePassModule (ref), userOwnsGamePassModule (ref), fFlagEnableExperienceShopGlobalIconModule (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (ref), inExperienceShop (ref), fFlagShopUseMockDataModule (ref), fFlagShopUseMockMultiGetProductInfoModule (ref), mockMultiGetProductInfoModule (ref), streamMultiGetProductInfoModule (ref), logCounterModule (ref), productInfoFailedItemsCounterModule (ref), errorsModule (ref), fFlagEnablePartialDisplayInExperienceShopModule (ref), fetchShopWidgetsOnlyModule (ref), mockFetchAllShopDataModule (ref), fetchAllShopDataModule (ref), fFlagEnableShopProductInfoRefreshModule (ref), multiGetProductInfoModule (ref), promiseModule (ref), playersService (ref), marketplaceService (ref), fIntShopOwnershipFetchMaxAttemptsModule (ref)
	local var28, var29 = createSignal({})
	local var30, var31 = createSignal({})
	local var32, var33 = createSignal(false)
	local var34, var35 = createSignal(nil)
	local var36, var37 = createSignal(nil)
	local var38, var39 = createSignal(false)
	local var40, var41 = createSignal(false)
	local var42, var43 = createSignal({})
	local var44, var45 = createSignal({})
	local var46, var47 = createSignal(constantsModule.MIN_COLUMNS)
	local t = {}
	local var49 = false
	local var50 = false
	local var51 = false
	local var52 = false
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	local function _(p1, p2)
		-- upvalues: t_3 (ref), var45 (ref)
		t_3[p1] = p2
		var45(table.clone(t_3))
	end
	
	local function sortRobuxPackagesInSections(p3)
		-- upvalues: sortRobuxPackagesByAmountDescendingModule (copy)
		local v_1
		local var75 = false
		
		for i, v in p3 do
			v_1 = v.robuxPackages
			
			if v_1 ~= nil and #v_1 > 1 then
				var75 = true
				break
			end
		end
		if not var75 then
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
		-- upvalues: promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (write), t_3 (ref), var31 (ref), sortRobuxPackagesInSections (ref)
		var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
	end
	
	local function writeOwnership(p4, p5)
		-- upvalues: var42 (ref), var43 (ref), fFlagEnableRobuxInExperienceShop (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (write), bonusPromotionEligibilityModule (copy), t_3 (ref), var45 (ref), var31 (ref), sortRobuxPackagesInSections (ref)
		local cloned = table.clone(var42(false))
		cloned[p4] = p5
		var43(cloned)
		
		if not p5 or not fFlagEnableRobuxInExperienceShop then return end
		local var78 = promoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(t_2)
		local var79 = if var78 ~= nil then nil else promoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(var78)
		
		if var79 == nil or var79 ~= p4 then
			return
		end
		t_3[p4] = bonusPromotionEligibilityModule.Ineligible
		var45(table.clone(t_3))
		var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
	end
	
	local function fetchGamePassOwnership(p6)
		-- upvalues: t (ref), var42 (ref), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassModule (copy), writeOwnership (ref)
		if t[p6] then return end
		if var42(false)[p6] ~= nil then return end
		local var80 = tonumber(p6)
		
		if var80 == nil then
			return
		end
		t[p6] = true;
		(if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule)(var80):andThen(function(p8)
			-- upvalues: var42 (copy), p6 (ref), writeOwnership (copy)
			if var42(false)[p6] == nil then
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
	
	local function fetchBonusGamePassOwnershipForPromotionId(p9)
		-- upvalues: t_4 (ref), bonusPromotionEligibilityModule (copy), t_3 (ref), var45 (ref), promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (write), var31 (ref), sortRobuxPackagesInSections (ref), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassModule (copy), var42 (ref), writeOwnership (ref)
		if t_4[p9] then return end
		t_3[p9] = bonusPromotionEligibilityModule.Unknown
		var45(table.clone(t_3))
		var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
		local var81 = tonumber(p9)
		
		if var81 == nil then
			t_3[p9] = bonusPromotionEligibilityModule.Ineligible
			var45(table.clone(t_3))
			var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
			
			return
		end
		t_4[p9] = true;
		(if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule)(var81):andThen(function(p11)
			-- upvalues: p9 (ref), bonusPromotionEligibilityModule (copy), t_3 (copy), var45 (copy), var42 (copy), writeOwnership (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (copy), var31 (copy), sortRobuxPackagesInSections (copy)
			t_3[p9] = if p11 then bonusPromotionEligibilityModule.Ineligible else bonusPromotionEligibilityModule.Eligible
			var45(table.clone(t_3))
			
			if var42(false)[p9] == nil then
				writeOwnership(p9, p11)
			end
			var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
		end):catch(function(p10)
			-- upvalues: p9 (ref), bonusPromotionEligibilityModule (copy), t_3 (copy), var45 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (copy), var31 (copy), sortRobuxPackagesInSections (copy)
			warn("[Shop] fetchBonusGamePassOwnershipForPromotion failed", p9, tostring(p10))
			t_3[p9] = bonusPromotionEligibilityModule.Ineligible
			var45(table.clone(t_3))
			var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
		end):finally(function()
			-- upvalues: t_4 (copy), p9 (ref)
			t_4[p9] = nil
		end)
	end
	
	local function fetchBonusGamePassOwnershipForPromotion(p12)
		-- upvalues: fFlagEnableRobuxInExperienceShop (copy), promoteBonusRobuxPackageToTopPicksModule (copy), fetchBonusGamePassOwnershipForPromotionId (ref)
		if not fFlagEnableRobuxInExperienceShop then return end
		local var82 = promoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(p12)
		local var83 = if var82 ~= nil then nil else promoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(var82)
		
		for i, v in if var83 ~= nil then {} else { var83 } do
			fetchBonusGamePassOwnershipForPromotionId(v)
		end
	end
	
	local _ = function(p13)
		-- upvalues: t_2 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var31 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref)
		t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p13)
		var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
		fetchBonusGamePassOwnershipForPromotion(t_2)
	end
	
	local _ = function(p14)
		-- upvalues: fFlagEnableExperienceShopGlobalIconModule (copy), var37 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var39 (ref), var41 (ref)
		if fFlagEnableExperienceShopGlobalIconModule then
			local var85
			local metadata = p14.metadata
			var37(metadata)
			local var84 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
			
			if fFlagInExperienceShopExpectStringMetadataValuesModule then
				var85 = var84 == "true"
				var85 = nil
			else
				var85 = var84 == true
			end
			var39(var85)
			var41(metadata ~= nil and metadata.newOffers == true)
		end
	end
	
	local function buildProductInfoRequestsForHydration(p15, p16)
		-- upvalues: inExperienceShop (copy), fFlagEnableRobuxInExperienceShop (copy)
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local var88 = refreshShopItemsModule.buildRequestsFromSections(p15)
		
		if fFlagEnableRobuxInExperienceShop then
			hydrateRobuxBonusItemsModule.appendBonusItemRequests(var88, p15)
		end
		refreshShopItemsModule.appendFailedItemRequests(var88, p16)
		
		return var88
	end
	
	local function applyStreamingProductInfoResult(a, b, p17)
		-- upvalues: inExperienceShop (copy), fFlagEnableRobuxInExperienceShop (copy)
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local makeRequestKey = require(inExperienceShop.Api.shopItemMapping).makeRequestKey
		local var91 = makeRequestKey(b.request.id, b.request.infoType)
		local t = {}
		local t_1 = {}
		
		for i, v in p17 do
			if makeRequestKey(v.id, v.infoType) == var91 then
				table.insert(t, v)
			else
				table.insert(t_1, v)
			end
		end
		local var94 = refreshShopItemsModule.mergeProductInfoIntoSections(a, { b })
		local var95, var96 = refreshShopItemsModule.insertRecoveredItemsIntoSections(if fFlagEnableRobuxInExperienceShop then hydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(var94, { b }) else var94, { b }, t)
		
		for i_1, v_1 in var96 do
			table.insert(t_1, v_1)
		end
		return var95, t_1
	end
	
	local function routeStreamMultiGetProductInfo(p18, p19)
		-- upvalues: fFlagShopUseMockDataModule (copy), fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), streamMultiGetProductInfoModule (copy)
		return if fFlagShopUseMockDataModule and fFlagShopUseMockMultiGetProductInfoModule then mockMultiGetProductInfoModule.streamMultiGetProductInfo(p18, { onResult = p19 }, 0) else streamMultiGetProductInfoModule(p18, { onResult = p19 })
	end
	
	local function streamProductInfoIntoSections(p20, p21, p22, p23)
		-- upvalues: var52 (write), t_2 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var31 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), routeStreamMultiGetProductInfo (ref), applyStreamingProductInfoResult (ref), t_1 (write), logCounterModule (copy), productInfoFailedItemsCounterModule (copy)
		if #p21 == 0 then
			if p23 then
				p23(p22)
			end
			return
		else
			var52 = true
			local var97 = p20
			local var98 = p22
			local var99 = nil
			local var100 = false
			
			local function flushPendingSections()
				-- upvalues: var100 (write), var99 (write), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var31 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy)
				var100 = false
				
				if var99 ~= nil then
					t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var99)
					var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
					fetchBonusGamePassOwnershipForPromotion(t_2)
					var99 = nil
				end
			end
			
			local function _(p24)
				-- upvalues: var99 (write), var100 (write), flushPendingSections (ref)
				var99 = p24
				
				if var100 then
					return
				end
				var100 = true
				task.delay(0.05, flushPendingSections)
			end
			
			routeStreamMultiGetProductInfo(p21, function(p26)
				-- upvalues: var97 (write), var98 (write), applyStreamingProductInfoResult (copy), var99 (write), var100 (write), flushPendingSections (ref)
				local var102, var103 = applyStreamingProductInfoResult(var97, p26, var98)
				var97 = var102
				var98 = var103
				var99 = var97
				
				if var100 then
					return
				end
				var100 = true
				task.delay(0.05, flushPendingSections)
			end):andThen(function(_)
				-- upvalues: var100 (write), var99 (write), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var31 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var97 (write), t_1 (copy), var98 (write), logCounterModule (copy), productInfoFailedItemsCounterModule (copy), var52 (copy), p23 (ref)
				var100 = false
				
				if var99 ~= nil then
					t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var99)
					var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
					fetchBonusGamePassOwnershipForPromotion(t_2)
					var99 = nil
				end
				t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var97)
				var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
				fetchBonusGamePassOwnershipForPromotion(t_2)
				t_1 = var98
				
				if #var98 > 0 then
					logCounterModule(productInfoFailedItemsCounterModule, #var98)
				end
				var52 = false
				
				if p23 then
					p23(var98)
				end
			end):catch(function(p25)
				-- upvalues: var100 (write), var99 (write), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var31 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var52 (copy), p23 (ref), var98 (write)
				warn("[Shop] streamProductInfoIntoSections failed", tostring(p25))
				var100 = false
				
				if var99 ~= nil then
					t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var99)
					var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
					fetchBonusGamePassOwnershipForPromotion(t_2)
					var99 = nil
				end
				var52 = false
				
				if p23 then
					p23(var98)
				end
			end)
		end
	end
	
	local function runShopFetch(p27, p28, p29)
		-- upvalues: var50 (write), var49 (write), var33 (ref), var35 (ref), fFlagShopUseMockDataModule (copy), errorsModule (copy), var29 (ref), t_2 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var31 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), fFlagEnableExperienceShopGlobalIconModule (copy), var37 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var39 (ref), var41 (ref), t_1 (write)
		if var50 or var49 then
			return
		end
		var49 = true
		var33(true)
		var35(nil);
		(if fFlagShopUseMockDataModule then p28() else p27()):andThen(function(p31)
			-- upvalues: errorsModule (copy), p29 (ref), var29 (copy), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var31 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), fFlagEnableExperienceShopGlobalIconModule (copy), var37 (copy), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var39 (copy), var41 (copy), t_1 (copy), var33 (copy), var49 (copy), var50 (copy)
			if not (type(p31) == "table" and (type(p31.categories) == "table" and type(p31.sections) == "table")) then
				return errorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p29), p31)
			end
			var29(p31.categories)
			t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p31.sections)
			var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
			fetchBonusGamePassOwnershipForPromotion(t_2)
			
			if fFlagEnableExperienceShopGlobalIconModule then
				local var105
				local metadata = p31.metadata
				var37(metadata)
				local var104 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
				
				if fFlagInExperienceShopExpectStringMetadataValuesModule then
					var105 = var104 == "true"
					var105 = nil
				else
					var105 = var104 == true
				end
				var39(var105)
				var41(metadata ~= nil and metadata.newOffers == true)
			end
			t_1 = p31.failedItems or {}
			var33(false)
			var49 = false
			var50 = true
		end):catch(function(p30)
			-- upvalues: var35 (copy), var29 (copy), var31 (copy), t_1 (copy), var33 (copy), var49 (copy)
			var35(p30)
			var29({})
			var31({})
			t_1 = {}
			var33(false)
			var49 = false
		end)
	end
	
	local function runPartialDisplayShopFetch(p32, p33, p34)
		-- upvalues: var50 (write), var49 (write), var33 (ref), var35 (ref), fFlagShopUseMockDataModule (copy), errorsModule (copy), var29 (ref), t_2 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var31 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), fFlagEnableExperienceShopGlobalIconModule (copy), var37 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var39 (ref), var41 (ref), t_1 (write), buildProductInfoRequestsForHydration (ref), streamProductInfoIntoSections (ref)
		if var50 or var49 then
			return
		end
		var49 = true
		var33(true)
		var35(nil);
		(if fFlagShopUseMockDataModule then p33() else p32()):andThen(function(p36)
			-- upvalues: errorsModule (copy), p34 (ref), var29 (copy), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var31 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), fFlagEnableExperienceShopGlobalIconModule (copy), var37 (copy), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var39 (copy), var41 (copy), t_1 (copy), var33 (copy), var49 (copy), var50 (copy), buildProductInfoRequestsForHydration (copy), streamProductInfoIntoSections (copy)
			if not (type(p36) == "table" and (type(p36.categories) == "table" and type(p36.sections) == "table")) then
				return errorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p34), p36)
			end
			var29(p36.categories)
			t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p36.sections)
			var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
			fetchBonusGamePassOwnershipForPromotion(t_2)
			
			if fFlagEnableExperienceShopGlobalIconModule then
				local var107
				local metadata = p36.metadata
				var37(metadata)
				local var106 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
				
				if fFlagInExperienceShopExpectStringMetadataValuesModule then
					var107 = var106 == "true"
					var107 = nil
				else
					var107 = var106 == true
				end
				var39(var107)
				var41(metadata ~= nil and metadata.newOffers == true)
			end
			t_1 = p36.failedItems or {}
			var33(false)
			var49 = false
			var50 = true
			local var108 = t_2
			streamProductInfoIntoSections(var108, buildProductInfoRequestsForHydration(var108, t_1), t_1, nil)
		end):catch(function(p35)
			-- upvalues: var35 (copy), var29 (copy), var31 (copy), t_1 (copy), var33 (copy), var49 (copy)
			var35(p35)
			var29({})
			var31({})
			t_1 = {}
			var33(false)
			var49 = false
		end)
	end
	
	local function fetchAllShopData()
		-- upvalues: fFlagEnablePartialDisplayInExperienceShopModule (copy), runPartialDisplayShopFetch (ref), fetchShopWidgetsOnlyModule (copy), mockFetchAllShopDataModule (copy), runShopFetch (ref), fetchAllShopDataModule (copy)
		local var109 = fFlagEnablePartialDisplayInExperienceShopModule
		
		if if typeof(var109) == "function" then var109() else var109 then
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
		-- upvalues: fFlagEnableShopProductInfoRefreshModule (copy), var50 (write), var51 (write), var52 (write), inExperienceShop (copy), t_2 (write), var30 (ref), fFlagEnableRobuxInExperienceShop (copy), t_1 (write), fFlagEnablePartialDisplayInExperienceShopModule (copy), streamProductInfoIntoSections (ref), fFlagShopUseMockDataModule (copy), fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), multiGetProductInfoModule (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var31 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref)
		if not fFlagEnableShopProductInfoRefreshModule then return end
		if not var50 or var51 or var52 then return end
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local var112 = if #t_2 > 0 then t_2 else var30(false)
		local var113 = refreshShopItemsModule.buildRequestsFromSections(var112)
		
		if fFlagEnableRobuxInExperienceShop then
			hydrateRobuxBonusItemsModule.appendBonusItemRequests(var113, var112)
		end
		refreshShopItemsModule.appendFailedItemRequests(var113, t_1)
		
		if #var113 == 0 then return end
		var51 = true
		local var114 = fFlagEnablePartialDisplayInExperienceShopModule
		
		if if typeof(var114) == "function" then var114() else var114 then
			streamProductInfoIntoSections(var112, var113, t_1, function()
				-- upvalues: var51 (copy)
				var51 = false
			end)
			
			return
		end
		local _ = nil;
		(if fFlagShopUseMockDataModule and fFlagShopUseMockMultiGetProductInfoModule then mockMultiGetProductInfoModule.multiGetProductInfo(var113, 0) else multiGetProductInfoModule(var113)):andThen(function(p38)
			-- upvalues: refreshShopItemsModule (ref), var112 (ref), fFlagEnableRobuxInExperienceShop (copy), hydrateRobuxBonusItemsModule (ref), t_1 (ref), t_1 (copy), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var31 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var51 (copy)
			local var115 = refreshShopItemsModule.mergeProductInfoIntoSections(var112, p38)
			local var116, var117 = refreshShopItemsModule.insertRecoveredItemsIntoSections(if fFlagEnableRobuxInExperienceShop then hydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(var115, p38) else var115, p38, t_1)
			t_1 = var117
			t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var116)
			var31(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
			fetchBonusGamePassOwnershipForPromotion(t_2)
			var51 = false
		end):catch(function(p37)
			-- upvalues: var51 (copy)
			warn("[Shop] refreshShopItemInfo failed", tostring(p37))
			var51 = false
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
	
	local function pollOwnershipUntilTrue(p39, p40, p41, p42)
		-- upvalues: promiseModule (copy), pollOwnershipUntilTrue (ref), constantsModule (copy)
		return p39(p40):andThen(function(p44)
			-- upvalues: p41 (ref), promiseModule (copy), p42 (ref), pollOwnershipUntilTrue (copy), p39 (ref), p40 (ref), constantsModule (copy)
			return if p44 then true elseif p41 <= 1 then false else promiseModule.delay(p42):andThen(function()
				-- upvalues: pollOwnershipUntilTrue (copy), p39 (copy), p40 (copy), p41 (copy), p42 (copy), constantsModule (copy)
				return pollOwnershipUntilTrue(p39, p40, p41 - 1, p42 * constantsModule.POLL_BACKOFF_MULTIPLIER)
			end)
		end):catch(function(p43)
			-- upvalues: p41 (ref), p40 (ref), promiseModule (copy), p42 (ref), pollOwnershipUntilTrue (copy), p39 (ref), constantsModule (copy)
			if p41 <= 1 then
				warn("[Shop] pollOwnershipUntilTrue exhausted with engine error", p40, tostring(p43))
				
				return nil
			end
			return promiseModule.delay(p42):andThen(function()
				-- upvalues: pollOwnershipUntilTrue (copy), p39 (copy), p40 (copy), p41 (copy), p42 (copy), constantsModule (copy)
				return pollOwnershipUntilTrue(p39, p40, p41 - 1, p42 * constantsModule.POLL_BACKOFF_MULTIPLIER)
			end)
		end)
	end
	
	local function pollGamePassOwnershipAfterPurchase(p45, p46, p47, p48)
		-- upvalues: t_5 (ref), pollOwnershipUntilTrue (ref), constantsModule (copy), writeOwnership (ref), playersService (copy), marketplaceService (copy), promiseModule (copy)
		if t_5[p45] then return end
		local var118 = tonumber(p45)
		
		if var118 == nil then
			return
		end
		t_5[p45] = true
		promiseModule.delay(constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function()
			-- upvalues: pollOwnershipUntilTrue (copy), p47 (ref), var118 (ref), p46 (ref), constantsModule (copy), writeOwnership (copy), p45 (ref), p48 (ref), playersService (copy), marketplaceService (copy), t_5 (copy)
			pollOwnershipUntilTrue(p47, var118, p46, constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function(p49)
				-- upvalues: writeOwnership (copy), p45 (copy), p48 (copy), playersService (copy), marketplaceService (copy), var118 (copy)
				if p49 ~= true then return end
				writeOwnership(p45, p49)
				
				if p48 then
					local localPlayer = playersService.LocalPlayer
					
					if localPlayer ~= nil then
						marketplaceService:SignalPromptGamePassPurchaseFinished(localPlayer, var118, true)
					end
				end
			end):finally(function()
				-- upvalues: t_5 (copy), p45 (copy)
				t_5[p45] = nil
			end)
		end)
	end
	
	marketplaceService.PromptGamePassPurchaseFinished:Connect(function(p50, p51, p52)
		-- upvalues: playersService (copy), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassModule (copy), fIntShopOwnershipFetchMaxAttemptsModule (copy), t_5 (ref), pollOwnershipUntilTrue (ref), constantsModule (copy), writeOwnership (ref), marketplaceService (copy), promiseModule (copy)
		if not p52 then return end
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer == nil or p50.UserId ~= localPlayer.UserId then return end
		local var119 = if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule
		local var120 = tostring(p51)
		
		if t_5[var120] then return end
		local var121 = tonumber(var120)
		
		if var121 == nil then
			return
		end
		t_5[var120] = true
		local var122 = nil
		promiseModule.delay(constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function()
			-- upvalues: pollOwnershipUntilTrue (copy), var119 (ref), var121 (ref), fIntShopOwnershipFetchMaxAttemptsModule (ref), constantsModule (copy), writeOwnership (copy), var120 (ref), var122 (ref), playersService (copy), marketplaceService (copy), t_5 (copy)
			pollOwnershipUntilTrue(var119, var121, fIntShopOwnershipFetchMaxAttemptsModule, constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function(p53)
				-- upvalues: writeOwnership (copy), var120 (copy), var122 (copy), playersService (copy), marketplaceService (copy), var121 (copy)
				if p53 ~= true then return end
				writeOwnership(var120, p53)
				
				if var122 then
					local localPlayer = playersService.LocalPlayer
					
					if localPlayer ~= nil then
						marketplaceService:SignalPromptGamePassPurchaseFinished(localPlayer, var121, true)
					end
				end
			end):finally(function()
				-- upvalues: t_5 (copy), var120 (copy)
				t_5[var120] = nil
			end)
		end)
	end)
	
	return {
		getCategories = var28,
		getSections = var30,
		getLoading = var32,
		getError = var34,
		getOwnership = var42,
		getBonusPromotionEligibility = var44,
		getItemsPerRow = var46,
		getMetadata = var36,
		getGlobalIconBackendEnabled = var38,
		getGlobalIconHasNewOffers = var40,
		onShopOpened = onShopOpened,
		fetchAllShopData = fetchAllShopData,
		prefetchWidgetsOnly = prefetchWidgetsOnly,
		refreshShopItemInfo = refreshShopItemInfo,
		fetchGamePassOwnership = fetchGamePassOwnership,
		pollGamePassOwnership = pollGamePassOwnershipAfterPurchase,
		setItemsPerRow = function(value)
			-- upvalues: var47 (ref)
			var47(value)
		end
	}
end