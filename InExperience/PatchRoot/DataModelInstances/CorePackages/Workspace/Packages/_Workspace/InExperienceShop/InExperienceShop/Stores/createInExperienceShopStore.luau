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

local function _(p1)
	return type(p1) == "table" and (type(p1.categories) == "table" and type(p1.sections) == "table")
end

local _ = function()
	-- upvalues: fFlagEnablePartialDisplayInExperienceShopModule (ref)
	return if typeof(fFlagEnablePartialDisplayInExperienceShopModule) == "function" then fFlagEnablePartialDisplayInExperienceShopModule() else fFlagEnablePartialDisplayInExperienceShopModule
end

return function()
	-- upvalues: createSignal (ref), constantsModule (ref), sortRobuxPackagesByAmountDescendingModule (ref), promoteBonusRobuxPackageToTopPicksModule (ref), fFlagEnableRobuxInExperienceShop (ref), bonusPromotionEligibilityModule (ref), fFlagShopUseMockUserOwnsGamePassModule (ref), mockUserOwnsGamePassModule (ref), userOwnsGamePassModule (ref), fFlagEnableExperienceShopGlobalIconModule (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (ref), inExperienceShop (ref), fFlagShopUseMockDataModule (ref), fFlagShopUseMockMultiGetProductInfoModule (ref), mockMultiGetProductInfoModule (ref), streamMultiGetProductInfoModule (ref), logCounterModule (ref), productInfoFailedItemsCounterModule (ref), errorsModule (ref), fFlagEnablePartialDisplayInExperienceShopModule (ref), fetchShopWidgetsOnlyModule (ref), mockFetchAllShopDataModule (ref), fetchAllShopDataModule (ref), fFlagEnableShopProductInfoRefreshModule (ref), multiGetProductInfoModule (ref), promiseModule (ref), playersService (ref), marketplaceService (ref), fIntShopOwnershipFetchMaxAttemptsModule (ref)
	local var1, var2 = createSignal({})
	local var3, var4 = createSignal({})
	local var5, var6 = createSignal(false)
	local var7, var8 = createSignal(nil)
	local var9, var10 = createSignal(nil)
	local var11, var12 = createSignal(false)
	local var13, var14 = createSignal(false)
	local var15, var16 = createSignal({})
	local var17, var18 = createSignal({})
	local var19, var20 = createSignal(constantsModule.MIN_COLUMNS)
	local t = {}
	local var21 = false
	local var22 = false
	local var23 = false
	local var24 = false
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	local function _(p1, p2)
		-- upvalues: t_3 (ref), var18 (ref)
		t_3[p1] = p2
		var18(table.clone(t_3))
	end
	
	local function sortRobuxPackagesInSections(p1)
		-- upvalues: sortRobuxPackagesByAmountDescendingModule (copy)
		local v_1
		local var25 = false
		
		for i, v in p1 do
			v_1 = v.robuxPackages
			
			if v_1 ~= nil and #v_1 > 1 then
				var25 = true
				break
			end
		end
		if not var25 then
			return p1
		end
		local cloned = table.clone(p1)
		
		for i_1, v_1 in ipairs(p1) do
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
		-- upvalues: promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (write), t_3 (ref), var4 (ref), sortRobuxPackagesInSections (ref)
		var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
	end
	
	local function writeOwnership(p2, p3)
		-- upvalues: var15 (ref), var16 (ref), fFlagEnableRobuxInExperienceShop (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (write), bonusPromotionEligibilityModule (copy), t_3 (ref), var18 (ref), var4 (ref), sortRobuxPackagesInSections (ref)
		local cloned = table.clone(var15(false))
		cloned[p2] = p3
		var16(cloned)
		
		if not p3 or not fFlagEnableRobuxInExperienceShop then return end
		local var26 = promoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(t_2)
		local var27 = if var26 ~= nil then nil else promoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(var26)
		
		if var27 == nil or var27 ~= p2 then
			return
		end
		t_3[p2] = bonusPromotionEligibilityModule.Ineligible
		var18(table.clone(t_3))
		var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
	end
	
	local function fetchGamePassOwnership(p2)
		-- upvalues: t (ref), var15 (ref), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassModule (copy), writeOwnership (ref)
		if t[p2] then return end
		if var15(false)[p2] ~= nil then return end
		local var26 = tonumber(p2)
		
		if var26 == nil then
			return
		end
		t[p2] = true;
		(if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule)(var26):andThen(function(p3)
			-- upvalues: var15 (copy), p2 (ref), writeOwnership (copy)
			if var15(false)[p2] == nil then
				writeOwnership(p2, p3)
				
				return
			end
		end):catch(function(p3)
			-- upvalues: p2 (ref)
			warn("[Shop] fetchGamePassOwnership failed", p2, tostring(p3))
		end):finally(function()
			-- upvalues: t (copy), p2 (ref)
			t[p2] = nil
		end)
	end
	
	local function fetchBonusGamePassOwnershipForPromotionId(p2)
		-- upvalues: t_4 (ref), bonusPromotionEligibilityModule (copy), t_3 (ref), var18 (ref), promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (write), var4 (ref), sortRobuxPackagesInSections (ref), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassModule (copy), var15 (ref), writeOwnership (ref)
		if t_4[p2] then return end
		t_3[p2] = bonusPromotionEligibilityModule.Unknown
		var18(table.clone(t_3))
		var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
		local var26 = tonumber(p2)
		
		if var26 == nil then
			t_3[p2] = bonusPromotionEligibilityModule.Ineligible
			var18(table.clone(t_3))
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
			
			return
		end
		t_4[p2] = true;
		(if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule)(var26):andThen(function(p3)
			-- upvalues: p2 (ref), bonusPromotionEligibilityModule (copy), t_3 (copy), var18 (copy), var15 (copy), writeOwnership (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (copy), var4 (copy), sortRobuxPackagesInSections (copy)
			t_3[p2] = if p3 then bonusPromotionEligibilityModule.Ineligible else bonusPromotionEligibilityModule.Eligible
			var18(table.clone(t_3))
			
			if var15(false)[p2] == nil then
				writeOwnership(p2, p3)
			end
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
		end):catch(function(p3)
			-- upvalues: p2 (ref), bonusPromotionEligibilityModule (copy), t_3 (copy), var18 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_2 (copy), var4 (copy), sortRobuxPackagesInSections (copy)
			warn("[Shop] fetchBonusGamePassOwnershipForPromotion failed", p2, tostring(p3))
			t_3[p2] = bonusPromotionEligibilityModule.Ineligible
			var18(table.clone(t_3))
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
		end):finally(function()
			-- upvalues: t_4 (copy), p2 (ref)
			t_4[p2] = nil
		end)
	end
	
	local function fetchBonusGamePassOwnershipForPromotion(p2)
		-- upvalues: fFlagEnableRobuxInExperienceShop (copy), promoteBonusRobuxPackageToTopPicksModule (copy), fetchBonusGamePassOwnershipForPromotionId (ref)
		if not fFlagEnableRobuxInExperienceShop then return end
		local var26 = promoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(p2)
		local var27 = if var26 ~= nil then nil else promoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(var26)
		
		for i, v in if var27 ~= nil then {} else { var27 } do
			fetchBonusGamePassOwnershipForPromotionId(v)
		end
	end
	
	local _ = function(p3)
		-- upvalues: t_2 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref)
		t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p3)
		var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
		fetchBonusGamePassOwnershipForPromotion(t_2)
	end
	
	local _ = function(p3)
		-- upvalues: fFlagEnableExperienceShopGlobalIconModule (copy), var10 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (ref), var14 (ref)
		if fFlagEnableExperienceShopGlobalIconModule then
			local var28
			local metadata = p3.metadata
			var10(metadata)
			local var29 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
			
			if fFlagInExperienceShopExpectStringMetadataValuesModule then
				var28 = var29 == "true"
				var28 = nil
			else
				var28 = var29 == true
			end
			var12(var28)
			var14(metadata ~= nil and metadata.newOffers == true)
		end
	end
	
	local function buildProductInfoRequestsForHydration(p3, p4)
		-- upvalues: inExperienceShop (copy), fFlagEnableRobuxInExperienceShop (copy)
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local var28 = refreshShopItemsModule.buildRequestsFromSections(p3)
		
		if fFlagEnableRobuxInExperienceShop then
			hydrateRobuxBonusItemsModule.appendBonusItemRequests(var28, p3)
		end
		refreshShopItemsModule.appendFailedItemRequests(var28, p4)
		
		return var28
	end
	
	local function applyStreamingProductInfoResult(a, b, p3)
		-- upvalues: inExperienceShop (copy), fFlagEnableRobuxInExperienceShop (copy)
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local makeRequestKey = require(inExperienceShop.Api.shopItemMapping).makeRequestKey
		local var28 = makeRequestKey(b.request.id, b.request.infoType)
		local t = {}
		local t_1 = {}
		
		for i, v in p3 do
			if makeRequestKey(v.id, v.infoType) == var28 then
				table.insert(t, v)
			else
				table.insert(t_1, v)
			end
		end
		local var29 = refreshShopItemsModule.mergeProductInfoIntoSections(a, { b })
		local var30, var31 = refreshShopItemsModule.insertRecoveredItemsIntoSections(if fFlagEnableRobuxInExperienceShop then hydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(var29, { b }) else var29, { b }, t)
		
		for i_1, v_1 in var31 do
			table.insert(t_1, v_1)
		end
		return var30, t_1
	end
	
	local function routeStreamMultiGetProductInfo(p4, p5)
		-- upvalues: fFlagShopUseMockDataModule (copy), fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), streamMultiGetProductInfoModule (copy)
		return if fFlagShopUseMockDataModule and fFlagShopUseMockMultiGetProductInfoModule then mockMultiGetProductInfoModule.streamMultiGetProductInfo(p4, { onResult = p5 }, 0) else streamMultiGetProductInfoModule(p4, { onResult = p5 })
	end
	
	local function streamProductInfoIntoSections(p4, p5, p6, p7)
		-- upvalues: var24 (write), t_2 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), routeStreamMultiGetProductInfo (ref), applyStreamingProductInfoResult (ref), t_1 (write), logCounterModule (copy), productInfoFailedItemsCounterModule (copy)
		if #p5 == 0 then
			if p7 then
				p7(p6)
			end
			return
		else
			var24 = true
			local var32 = p4
			local var33 = p6
			local var34 = nil
			local var35 = false
			
			local function flushPendingSections()
				-- upvalues: var35 (write), var34 (write), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy)
				var35 = false
				
				if var34 ~= nil then
					t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var34)
					var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
					fetchBonusGamePassOwnershipForPromotion(t_2)
					var34 = nil
				end
			end
			
			local function _(p8)
				-- upvalues: var34 (write), var35 (write), flushPendingSections (ref)
				var34 = p8
				
				if var35 then
					return
				end
				var35 = true
				task.delay(0.05, flushPendingSections)
			end
			
			routeStreamMultiGetProductInfo(p5, function(p8)
				-- upvalues: var32 (write), var33 (write), applyStreamingProductInfoResult (copy), var34 (write), var35 (write), flushPendingSections (ref)
				local var36, var37 = applyStreamingProductInfoResult(var32, p8, var33)
				var32 = var36
				var33 = var37
				var34 = var32
				
				if var35 then
					return
				end
				var35 = true
				task.delay(0.05, flushPendingSections)
			end):andThen(function(_)
				-- upvalues: var35 (write), var34 (write), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var32 (write), t_1 (copy), var33 (write), logCounterModule (copy), productInfoFailedItemsCounterModule (copy), var24 (copy), p7 (ref)
				var35 = false
				
				if var34 ~= nil then
					t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var34)
					var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
					fetchBonusGamePassOwnershipForPromotion(t_2)
					var34 = nil
				end
				t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var32)
				var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
				fetchBonusGamePassOwnershipForPromotion(t_2)
				t_1 = var33
				
				if #var33 > 0 then
					logCounterModule(productInfoFailedItemsCounterModule, #var33)
				end
				var24 = false
				
				if p7 then
					p7(var33)
				end
			end):catch(function(p8)
				-- upvalues: var35 (write), var34 (write), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var24 (copy), p7 (ref), var33 (write)
				warn("[Shop] streamProductInfoIntoSections failed", tostring(p8))
				var35 = false
				
				if var34 ~= nil then
					t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var34)
					var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
					fetchBonusGamePassOwnershipForPromotion(t_2)
					var34 = nil
				end
				var24 = false
				
				if p7 then
					p7(var33)
				end
			end)
		end
	end
	
	local function runShopFetch(p4, p5, p6)
		-- upvalues: var22 (write), var21 (write), var6 (ref), var8 (ref), fFlagShopUseMockDataModule (copy), errorsModule (copy), var2 (ref), t_2 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), fFlagEnableExperienceShopGlobalIconModule (copy), var10 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (ref), var14 (ref), t_1 (write)
		if var22 or var21 then
			return
		end
		var21 = true
		var6(true)
		var8(nil);
		(if fFlagShopUseMockDataModule then p5() else p4()):andThen(function(p7)
			-- upvalues: errorsModule (copy), p6 (ref), var2 (copy), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), fFlagEnableExperienceShopGlobalIconModule (copy), var10 (copy), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (copy), var14 (copy), t_1 (copy), var6 (copy), var21 (copy), var22 (copy)
			if not (type(p7) == "table" and (type(p7.categories) == "table" and type(p7.sections) == "table")) then
				return errorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p6), p7)
			end
			var2(p7.categories)
			t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p7.sections)
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
			fetchBonusGamePassOwnershipForPromotion(t_2)
			
			if fFlagEnableExperienceShopGlobalIconModule then
				local var32
				local metadata = p7.metadata
				var10(metadata)
				local var33 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
				
				if fFlagInExperienceShopExpectStringMetadataValuesModule then
					var32 = var33 == "true"
					var32 = nil
				else
					var32 = var33 == true
				end
				var12(var32)
				var14(metadata ~= nil and metadata.newOffers == true)
			end
			t_1 = p7.failedItems or {}
			var6(false)
			var21 = false
			var22 = true
		end):catch(function(p7)
			-- upvalues: var8 (copy), var2 (copy), var4 (copy), t_1 (copy), var6 (copy), var21 (copy)
			var8(p7)
			var2({})
			var4({})
			t_1 = {}
			var6(false)
			var21 = false
		end)
	end
	
	local function runPartialDisplayShopFetch(p4, p5, p6)
		-- upvalues: var22 (write), var21 (write), var6 (ref), var8 (ref), fFlagShopUseMockDataModule (copy), errorsModule (copy), var2 (ref), t_2 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), fFlagEnableExperienceShopGlobalIconModule (copy), var10 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (ref), var14 (ref), t_1 (write), buildProductInfoRequestsForHydration (ref), streamProductInfoIntoSections (ref)
		if var22 or var21 then
			return
		end
		var21 = true
		var6(true)
		var8(nil);
		(if fFlagShopUseMockDataModule then p5() else p4()):andThen(function(p7)
			-- upvalues: errorsModule (copy), p6 (ref), var2 (copy), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), fFlagEnableExperienceShopGlobalIconModule (copy), var10 (copy), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (copy), var14 (copy), t_1 (copy), var6 (copy), var21 (copy), var22 (copy), buildProductInfoRequestsForHydration (copy), streamProductInfoIntoSections (copy)
			if not (type(p7) == "table" and (type(p7.categories) == "table" and type(p7.sections) == "table")) then
				return errorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p6), p7)
			end
			var2(p7.categories)
			t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p7.sections)
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
			fetchBonusGamePassOwnershipForPromotion(t_2)
			
			if fFlagEnableExperienceShopGlobalIconModule then
				local var32
				local metadata = p7.metadata
				var10(metadata)
				local var33 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
				
				if fFlagInExperienceShopExpectStringMetadataValuesModule then
					var32 = var33 == "true"
					var32 = nil
				else
					var32 = var33 == true
				end
				var12(var32)
				var14(metadata ~= nil and metadata.newOffers == true)
			end
			t_1 = p7.failedItems or {}
			var6(false)
			var21 = false
			var22 = true
			local var34 = t_2
			streamProductInfoIntoSections(var34, buildProductInfoRequestsForHydration(var34, t_1), t_1, nil)
		end):catch(function(p7)
			-- upvalues: var8 (copy), var2 (copy), var4 (copy), t_1 (copy), var6 (copy), var21 (copy)
			var8(p7)
			var2({})
			var4({})
			t_1 = {}
			var6(false)
			var21 = false
		end)
	end
	
	local function fetchAllShopData()
		-- upvalues: fFlagEnablePartialDisplayInExperienceShopModule (copy), runPartialDisplayShopFetch (ref), fetchShopWidgetsOnlyModule (copy), mockFetchAllShopDataModule (copy), runShopFetch (ref), fetchAllShopDataModule (copy)
		local var32 = fFlagEnablePartialDisplayInExperienceShopModule
		
		if if typeof(var32) == "function" then var32() else var32 then
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
		-- upvalues: fFlagEnableShopProductInfoRefreshModule (copy), var22 (write), var23 (write), var24 (write), inExperienceShop (copy), t_2 (write), var3 (ref), fFlagEnableRobuxInExperienceShop (copy), t_1 (write), fFlagEnablePartialDisplayInExperienceShopModule (copy), streamProductInfoIntoSections (ref), fFlagShopUseMockDataModule (copy), fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), multiGetProductInfoModule (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref)
		if not fFlagEnableShopProductInfoRefreshModule then return end
		if not var22 or var23 or var24 then return end
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local var32 = if #t_2 > 0 then t_2 else var3(false)
		local var33 = refreshShopItemsModule.buildRequestsFromSections(var32)
		
		if fFlagEnableRobuxInExperienceShop then
			hydrateRobuxBonusItemsModule.appendBonusItemRequests(var33, var32)
		end
		refreshShopItemsModule.appendFailedItemRequests(var33, t_1)
		
		if #var33 == 0 then return end
		var23 = true
		local var34 = fFlagEnablePartialDisplayInExperienceShopModule
		
		if if typeof(var34) == "function" then var34() else var34 then
			streamProductInfoIntoSections(var32, var33, t_1, function()
				-- upvalues: var23 (copy)
				var23 = false
			end)
			
			return
		end
		local _ = nil;
		(if fFlagShopUseMockDataModule and fFlagShopUseMockMultiGetProductInfoModule then mockMultiGetProductInfoModule.multiGetProductInfo(var33, 0) else multiGetProductInfoModule(var33)):andThen(function(p4)
			-- upvalues: refreshShopItemsModule (ref), var32 (ref), fFlagEnableRobuxInExperienceShop (copy), hydrateRobuxBonusItemsModule (ref), t_1 (ref), t_1 (copy), t_2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var23 (copy)
			local var35 = refreshShopItemsModule.mergeProductInfoIntoSections(var32, p4)
			local var36, var37 = refreshShopItemsModule.insertRecoveredItemsIntoSections(if fFlagEnableRobuxInExperienceShop then hydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(var35, p4) else var35, p4, t_1)
			t_1 = var37
			t_2 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var36)
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_2, t_3)))
			fetchBonusGamePassOwnershipForPromotion(t_2)
			var23 = false
		end):catch(function(p4)
			-- upvalues: var23 (copy)
			warn("[Shop] refreshShopItemInfo failed", tostring(p4))
			var23 = false
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
	
	local function pollOwnershipUntilTrue(p4, p5, p6, p7)
		-- upvalues: promiseModule (copy), pollOwnershipUntilTrue (ref), constantsModule (copy)
		return p4(p5):andThen(function(p8)
			-- upvalues: p6 (ref), promiseModule (copy), p7 (ref), pollOwnershipUntilTrue (copy), p4 (ref), p5 (ref), constantsModule (copy)
			return if p8 then true elseif p6 <= 1 then false else promiseModule.delay(p7):andThen(function()
				-- upvalues: pollOwnershipUntilTrue (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), constantsModule (copy)
				return pollOwnershipUntilTrue(p4, p5, p6 - 1, p7 * constantsModule.POLL_BACKOFF_MULTIPLIER)
			end)
		end):catch(function(p8)
			-- upvalues: p6 (ref), p5 (ref), promiseModule (copy), p7 (ref), pollOwnershipUntilTrue (copy), p4 (ref), constantsModule (copy)
			if p6 <= 1 then
				warn("[Shop] pollOwnershipUntilTrue exhausted with engine error", p5, tostring(p8))
				
				return nil
			end
			return promiseModule.delay(p7):andThen(function()
				-- upvalues: pollOwnershipUntilTrue (copy), p4 (copy), p5 (copy), p6 (copy), p7 (copy), constantsModule (copy)
				return pollOwnershipUntilTrue(p4, p5, p6 - 1, p7 * constantsModule.POLL_BACKOFF_MULTIPLIER)
			end)
		end)
	end
	
	local function pollGamePassOwnershipAfterPurchase(p4, p5, p6, p7)
		-- upvalues: t_5 (ref), pollOwnershipUntilTrue (ref), constantsModule (copy), writeOwnership (ref), playersService (copy), marketplaceService (copy), promiseModule (copy)
		if t_5[p4] then return end
		local var32 = tonumber(p4)
		
		if var32 == nil then
			return
		end
		t_5[p4] = true
		promiseModule.delay(constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function()
			-- upvalues: pollOwnershipUntilTrue (copy), p6 (ref), var32 (ref), p5 (ref), constantsModule (copy), writeOwnership (copy), p4 (ref), p7 (ref), playersService (copy), marketplaceService (copy), t_5 (copy)
			pollOwnershipUntilTrue(p6, var32, p5, constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function(p8)
				-- upvalues: writeOwnership (copy), p4 (copy), p7 (copy), playersService (copy), marketplaceService (copy), var32 (copy)
				if p8 ~= true then return end
				writeOwnership(p4, p8)
				
				if p7 then
					local localPlayer = playersService.LocalPlayer
					
					if localPlayer ~= nil then
						marketplaceService:SignalPromptGamePassPurchaseFinished(localPlayer, var32, true)
					end
				end
			end):finally(function()
				-- upvalues: t_5 (copy), p4 (copy)
				t_5[p4] = nil
			end)
		end)
	end
	
	marketplaceService.PromptGamePassPurchaseFinished:Connect(function(p4, p5, p6)
		-- upvalues: playersService (copy), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassModule (copy), fIntShopOwnershipFetchMaxAttemptsModule (copy), t_5 (ref), pollOwnershipUntilTrue (ref), constantsModule (copy), writeOwnership (ref), marketplaceService (copy), promiseModule (copy)
		if not p6 then return end
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer == nil or p4.UserId ~= localPlayer.UserId then return end
		local var32 = if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule
		local var33 = tostring(p5)
		
		if t_5[var33] then return end
		local var34 = tonumber(var33)
		
		if var34 == nil then
			return
		end
		t_5[var33] = true
		local var35 = nil
		promiseModule.delay(constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function()
			-- upvalues: pollOwnershipUntilTrue (copy), var32 (ref), var34 (ref), fIntShopOwnershipFetchMaxAttemptsModule (ref), constantsModule (copy), writeOwnership (copy), var33 (ref), var35 (ref), playersService (copy), marketplaceService (copy), t_5 (copy)
			pollOwnershipUntilTrue(var32, var34, fIntShopOwnershipFetchMaxAttemptsModule, constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function(p7)
				-- upvalues: writeOwnership (copy), var33 (copy), var35 (copy), playersService (copy), marketplaceService (copy), var34 (copy)
				if p7 ~= true then return end
				writeOwnership(var33, p7)
				
				if var35 then
					local localPlayer = playersService.LocalPlayer
					
					if localPlayer ~= nil then
						marketplaceService:SignalPromptGamePassPurchaseFinished(localPlayer, var34, true)
					end
				end
			end):finally(function()
				-- upvalues: t_5 (copy), var33 (copy)
				t_5[var33] = nil
			end)
		end)
	end)
	
	return {
		getCategories = var1,
		getSections = var3,
		getLoading = var5,
		getError = var7,
		getOwnership = var15,
		getBonusPromotionEligibility = var17,
		getItemsPerRow = var19,
		getMetadata = var9,
		getGlobalIconBackendEnabled = var11,
		getGlobalIconHasNewOffers = var13,
		onShopOpened = onShopOpened,
		fetchAllShopData = fetchAllShopData,
		prefetchWidgetsOnly = prefetchWidgetsOnly,
		refreshShopItemInfo = refreshShopItemInfo,
		fetchGamePassOwnership = fetchGamePassOwnership,
		pollGamePassOwnership = pollGamePassOwnershipAfterPurchase,
		setItemsPerRow = function(value)
			-- upvalues: var20 (ref)
			var20(value)
		end
	}
end