local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local createSignal = require(parent.Signals).createSignal
local inExperienceOffersModule = require(parent.InExperienceOffers)
local fFlagEnableUserOffers = sharedFlagsModule.FFlagEnableUserOffers
local fFlagOfferNineDotActivityIndicator = sharedFlagsModule.FFlagOfferNineDotActivityIndicator
local fFlagOfferNotifyOnGlobalIcon = sharedFlagsModule.FFlagOfferNotifyOnGlobalIcon
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)
local errorsModule = require(inExperienceShop.Api.Errors)
local fetchAllShopDataModule = require(inExperienceShop.Api.fetchAllShopData)
local fetchShopWidgetsOnlyModule = require(inExperienceShop.Api.fetchShopWidgetsOnly)
local fetchRobuxWidgetsAfterPurchaseModule = require(inExperienceShop.Api.fetchRobuxWidgetsAfterPurchase)
local mergeRobuxShopDataModule = require(inExperienceShop.Api.mergeRobuxShopData)
local multiGetProductInfoModule = require(inExperienceShop.Api.multiGetProductInfo)
local streamMultiGetProductInfoModule = require(inExperienceShop.Api.streamMultiGetProductInfo)
local logCounterModule = require(inExperienceShop.Internal.logCounter)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)
local productInfoFailedItemsCounterModule = require(inExperienceShop.Events.ProductInfoFailedItemsCounter)
local userOwnsGamePassModule = require(inExperienceShop.Api.userOwnsGamePass)
local userOwnsGamePassHttpModule = require(inExperienceShop.Api.userOwnsGamePassHttp)
local fetchGamePassTrialAvailabilitiesModule = require(inExperienceShop.Api.fetchGamePassTrialAvailabilities)
local fFlagShopUseMockDataModule = require(inExperienceShop.Flags.FFlagShopUseMockData)
local fFlagShopUseMockUserOwnsGamePassModule = require(inExperienceShop.Flags.FFlagShopUseMockUserOwnsGamePass)
local fFlagShopUseMockGamePassTrialAvailabilitiesModule = require(inExperienceShop.Flags.FFlagShopUseMockGamePassTrialAvailabilities)
local fFlagLuaAppEnableGamePassFreeTrialsModule = require(inExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local fFlagShopUseMockMultiGetProductInfoModule = require(inExperienceShop.Flags.FFlagShopUseMockMultiGetProductInfo)
local fFlagEnableShopProductInfoRefreshModule = require(inExperienceShop.Flags.FFlagEnableShopProductInfoRefresh)
local fFlagRefetchRobuxWidgetAfterPurchaseModule = require(inExperienceShop.Flags.FFlagRefetchRobuxWidgetAfterPurchase)
local fFlagSkipPaymentSessionForPlainRobuxModule = require(inExperienceShop.Flags.FFlagSkipPaymentSessionForPlainRobux)
local fFlagEnablePartialDisplayInExperienceShopModule = require(inExperienceShop.Flags.FFlagEnablePartialDisplayInExperienceShop)
local _ = require(inExperienceShop.Flags.FFlagPromoteRobuxInTopPicks)
local fFlagEnableRobuxInExperienceShop = sharedFlagsModule.FFlagEnableRobuxInExperienceShop
local fFlagLuaAppEnableNativePurchaseFinishedV2Signals = sharedFlagsModule.FFlagLuaAppEnableNativePurchaseFinishedV2Signals
local fFlagShopListenNativePurchaseFinishedModule = require(inExperienceShop.Flags.FFlagShopListenNativePurchaseFinished)
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
local list = { inExperienceOffersModule.FeatureKeys.RobloxShop }

local function _(p1)
	return type(p1) == "table" and (type(p1.categories) == "table" and type(p1.sections) == "table")
end

local _ = function()
	-- upvalues: fFlagEnablePartialDisplayInExperienceShopModule (ref)
	return if typeof(fFlagEnablePartialDisplayInExperienceShopModule) == "function" then fFlagEnablePartialDisplayInExperienceShopModule() else fFlagEnablePartialDisplayInExperienceShopModule
end

return function()
	-- upvalues: createSignal (ref), constantsModule (ref), shopDebugLoggerModule (ref), fFlagRefetchRobuxWidgetAfterPurchaseModule (ref), sortRobuxPackagesByAmountDescendingModule (ref), promoteBonusRobuxPackageToTopPicksModule (ref), fFlagEnableRobuxInExperienceShop (ref), bonusPromotionEligibilityModule (ref), fFlagShopUseMockUserOwnsGamePassModule (ref), mockUserOwnsGamePassModule (ref), userOwnsGamePassModule (ref), fFlagLuaAppEnableGamePassFreeTrialsModule (ref), fFlagShopUseMockGamePassTrialAvailabilitiesModule (ref), mockGamePassTrialAvailabilitiesModule (ref), fetchGamePassTrialAvailabilitiesModule (ref), fFlagEnableExperienceShopGlobalIconModule (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (ref), inExperienceShop (ref), fFlagShopUseMockDataModule (ref), fFlagShopUseMockMultiGetProductInfoModule (ref), mockMultiGetProductInfoModule (ref), streamMultiGetProductInfoModule (ref), logCounterModule (ref), productInfoFailedItemsCounterModule (ref), errorsModule (ref), fFlagEnableUserOffers (ref), inExperienceOffersModule (ref), list (ref), fFlagEnablePartialDisplayInExperienceShopModule (ref), fetchShopWidgetsOnlyModule (ref), mockFetchAllShopDataModule (ref), fetchAllShopDataModule (ref), fFlagEnableShopProductInfoRefreshModule (ref), multiGetProductInfoModule (ref), fFlagOfferNineDotActivityIndicator (ref), fFlagOfferNotifyOnGlobalIcon (ref), promiseModule (ref), fetchRobuxWidgetsAfterPurchaseModule (ref), mergeRobuxShopDataModule (ref), playersService (ref), marketplaceService (ref), fIntShopOwnershipFetchMaxAttemptsModule (ref), fFlagShopListenNativePurchaseFinishedModule (ref), userOwnsGamePassHttpModule (ref), fFlagSkipPaymentSessionForPlainRobuxModule (ref), fFlagLuaAppEnableNativePurchaseFinishedV2Signals (ref)
	local var1, var2 = createSignal({})
	local var3, var4 = createSignal({})
	local var5, var6 = createSignal(false)
	local var7, var8 = createSignal(nil)
	local var9, var10 = createSignal(nil)
	local var11, var12 = createSignal(false)
	local var13, var14 = createSignal(false)
	local var15, var16 = createSignal({})
	local var17, var18 = createSignal({ available = {}, active = {} })
	local var19, var20 = createSignal({})
	local var21, var22 = createSignal(constantsModule.MIN_COLUMNS)
	local t = {}
	local var23 = false
	local var24 = nil
	local var25 = nil
	local t_1 = {}
	local var26 = false
	
	local function bonusGamePassIdForNativePurchase(p1, p2)
		-- upvalues: shopDebugLoggerModule (copy), fFlagRefetchRobuxWidgetAfterPurchaseModule (copy), var24 (write), var25 (write)
		if p2 == "" then
			shopDebugLoggerModule.log("bonusGamePassIdForNativePurchase: skip, empty store SKU")
			
			return
		end
		var24 = if fFlagRefetchRobuxWidgetAfterPurchaseModule then if p1 == nil or p1 == "" then nil else p1 else p1
		var25 = p2
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: var24 (copy), p2 (ref)
			return "bonusGamePassIdForNativePurchase: recorded bonusGamePassId=" .. tostring(var24) .. " storeSku=" .. p2
		end)
	end
	
	local var27 = false
	local var28 = false
	local var29 = false
	local var30 = false
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local var31, var32 = createSignal(false)
	
	local function _(p1, p2)
		-- upvalues: t_4 (ref), var20 (ref)
		t_4[p1] = p2
		var20(table.clone(t_4))
	end
	
	local function sortRobuxPackagesInSections(p1)
		-- upvalues: sortRobuxPackagesByAmountDescendingModule (copy)
		local v_1
		local var33 = false
		
		for i, v in p1 do
			v_1 = v.robuxPackages
			
			if v_1 ~= nil and #v_1 > 1 then
				var33 = true
				break
			end
		end
		if not var33 then
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
					bonusJwt = v_1.bonusJwt,
					robuxPackages = sortRobuxPackagesByAmountDescendingModule(robuxPackages),
					featuredRobuxPackage = v_1.featuredRobuxPackage
				}
			end
		end
		return cloned
	end
	
	local _ = function()
		-- upvalues: promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (write), t_4 (ref), var4 (ref), sortRobuxPackagesInSections (ref)
		var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
	end
	
	local function writeOwnership(p2, p3)
		-- upvalues: var15 (ref), var16 (ref), fFlagEnableRobuxInExperienceShop (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (write), bonusPromotionEligibilityModule (copy), t_4 (ref), var20 (ref), var4 (ref), sortRobuxPackagesInSections (ref)
		local cloned = table.clone(var15(false))
		cloned[p2] = p3
		var16(cloned)
		
		if not p3 or not fFlagEnableRobuxInExperienceShop then return end
		local var34 = promoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(t_3)
		local var35 = if var34 ~= nil then nil else promoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(var34)
		
		if var35 == nil or var35 ~= p2 then
			return
		end
		t_4[p2] = bonusPromotionEligibilityModule.Ineligible
		var20(table.clone(t_4))
		var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
	end
	
	local function fetchGamePassOwnership(p2)
		-- upvalues: t (ref), var15 (ref), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassModule (copy), writeOwnership (ref)
		if t[p2] then return end
		if var15(false)[p2] ~= nil then return end
		local var34 = tonumber(p2)
		
		if var34 == nil then
			return
		end
		t[p2] = true;
		(if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule)(var34):andThen(function(p3)
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
	
	local function hydrateGamePassTrialAvailabilities()
		-- upvalues: fFlagLuaAppEnableGamePassFreeTrialsModule (copy), var23 (write), fFlagShopUseMockGamePassTrialAvailabilitiesModule (copy), mockGamePassTrialAvailabilitiesModule (copy), fetchGamePassTrialAvailabilitiesModule (copy), var18 (ref)
		if not fFlagLuaAppEnableGamePassFreeTrialsModule then return end
		if var23 then
			return
		end
		var23 = true;
		(if fFlagShopUseMockGamePassTrialAvailabilitiesModule then mockGamePassTrialAvailabilitiesModule.fetchGamePassTrialAvailabilities else fetchGamePassTrialAvailabilitiesModule.fetchGamePassTrialAvailabilities)(game.GameId):andThen(function(p2)
			-- upvalues: var18 (copy)
			var18(p2)
		end):catch(function(p2)
			warn("[Shop] hydrateGamePassTrialAvailabilities failed", tostring(p2))
		end):finally(function()
			-- upvalues: var23 (copy)
			var23 = false
		end)
	end
	
	local function fetchBonusGamePassOwnershipForPromotionId(p2)
		-- upvalues: fFlagRefetchRobuxWidgetAfterPurchaseModule (copy), t_1 (ref), shopDebugLoggerModule (copy), t_5 (ref), bonusPromotionEligibilityModule (copy), t_4 (ref), var20 (ref), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (write), var4 (ref), sortRobuxPackagesInSections (ref), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassModule (copy), var15 (ref), writeOwnership (ref)
		if fFlagRefetchRobuxWidgetAfterPurchaseModule and t_1[p2] then
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p2 (ref)
				return "fetchBonusGamePassOwnershipForPromotion: skip, poll in flight itemId=" .. p13
			end)
			
			return
		elseif t_5[p2] then return end
		t_4[p2] = bonusPromotionEligibilityModule.Unknown
		var20(table.clone(t_4))
		var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
		local var34 = tonumber(p2)
		
		if var34 == nil then
			t_4[p2] = bonusPromotionEligibilityModule.Ineligible
			var20(table.clone(t_4))
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
			
			return
		end
		t_5[p2] = true;
		(if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule)(var34):andThen(function(p3)
			-- upvalues: p2 (ref), bonusPromotionEligibilityModule (copy), t_4 (copy), var20 (copy), var15 (copy), writeOwnership (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var4 (copy), sortRobuxPackagesInSections (copy)
			t_4[p2] = if p3 then bonusPromotionEligibilityModule.Ineligible else bonusPromotionEligibilityModule.Eligible
			var20(table.clone(t_4))
			
			if var15(false)[p2] == nil then
				writeOwnership(p2, p3)
			end
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
		end):catch(function(p3)
			-- upvalues: p2 (ref), bonusPromotionEligibilityModule (copy), t_4 (copy), var20 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (copy), var4 (copy), sortRobuxPackagesInSections (copy)
			warn("[Shop] fetchBonusGamePassOwnershipForPromotion failed", p2, tostring(p3))
			t_4[p2] = bonusPromotionEligibilityModule.Ineligible
			var20(table.clone(t_4))
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
		end):finally(function()
			-- upvalues: t_5 (copy), p2 (ref)
			t_5[p2] = nil
		end)
	end
	
	local function fetchBonusGamePassOwnershipForPromotion(p2)
		-- upvalues: fFlagEnableRobuxInExperienceShop (copy), promoteBonusRobuxPackageToTopPicksModule (copy), fetchBonusGamePassOwnershipForPromotionId (ref)
		if not fFlagEnableRobuxInExperienceShop then return end
		local var34 = promoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(p2)
		local var35 = if var34 ~= nil then nil else promoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(var34)
		
		for i, v in if var35 ~= nil then {} else { var35 } do
			fetchBonusGamePassOwnershipForPromotionId(v)
		end
	end
	
	local _ = function(p3)
		-- upvalues: t_3 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref)
		t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p3)
		var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
		fetchBonusGamePassOwnershipForPromotion(t_3)
	end
	
	local _ = function(p3)
		-- upvalues: fFlagEnableExperienceShopGlobalIconModule (copy), var10 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (ref), var14 (ref)
		if fFlagEnableExperienceShopGlobalIconModule then
			local var36
			local metadata = p3.metadata
			var10(metadata)
			local var37 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
			
			if fFlagInExperienceShopExpectStringMetadataValuesModule then
				var36 = var37 == "true"
				var36 = nil
			else
				var36 = var37 == true
			end
			var12(var36)
			var14(metadata ~= nil and metadata.newOffers == true)
		end
	end
	
	local function buildProductInfoRequestsForHydration(p3, p4)
		-- upvalues: inExperienceShop (copy), fFlagEnableRobuxInExperienceShop (copy)
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local var36 = refreshShopItemsModule.buildRequestsFromSections(p3)
		
		if fFlagEnableRobuxInExperienceShop then
			hydrateRobuxBonusItemsModule.appendBonusItemRequests(var36, p3)
		end
		refreshShopItemsModule.appendFailedItemRequests(var36, p4)
		
		return var36
	end
	
	local function applyStreamingProductInfoResult(a, b, p3)
		-- upvalues: inExperienceShop (copy), fFlagEnableRobuxInExperienceShop (copy)
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local makeRequestKey = require(inExperienceShop.Api.shopItemMapping).makeRequestKey
		local var36 = makeRequestKey(b.request.id, b.request.infoType)
		local t = {}
		local t_1 = {}
		
		for i, v in p3 do
			if makeRequestKey(v.id, v.infoType) == var36 then
				table.insert(t, v)
			else
				table.insert(t_1, v)
			end
		end
		local var37 = refreshShopItemsModule.mergeProductInfoIntoSections(a, { b })
		local var38, var39 = refreshShopItemsModule.insertRecoveredItemsIntoSections(if fFlagEnableRobuxInExperienceShop then hydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(var37, { b }) else var37, { b }, t)
		
		for i_1, v_1 in var39 do
			table.insert(t_1, v_1)
		end
		return var38, t_1
	end
	
	local function routeStreamMultiGetProductInfo(p4, p5)
		-- upvalues: fFlagShopUseMockDataModule (copy), fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), streamMultiGetProductInfoModule (copy)
		return if fFlagShopUseMockDataModule and fFlagShopUseMockMultiGetProductInfoModule then mockMultiGetProductInfoModule.streamMultiGetProductInfo(p4, { onResult = p5 }, 0) else streamMultiGetProductInfoModule(p4, { onResult = p5 })
	end
	
	local function streamProductInfoIntoSections(p4, p5, p6, p7)
		-- upvalues: var30 (write), t_3 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), routeStreamMultiGetProductInfo (ref), applyStreamingProductInfoResult (ref), t_2 (write), logCounterModule (copy), productInfoFailedItemsCounterModule (copy)
		if #p5 == 0 then
			if p7 then
				p7(p6)
			end
			return
		else
			var30 = true
			local var40 = p4
			local var41 = p6
			local var42 = nil
			local var43 = false
			
			local function flushPendingSections()
				-- upvalues: var43 (write), var42 (write), t_3 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy)
				var43 = false
				
				if var42 ~= nil then
					t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var42)
					var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
					fetchBonusGamePassOwnershipForPromotion(t_3)
					var42 = nil
				end
			end
			
			local function _(p8)
				-- upvalues: var42 (write), var43 (write), flushPendingSections (ref)
				var42 = p8
				
				if var43 then
					return
				end
				var43 = true
				task.delay(0.05, flushPendingSections)
			end
			
			routeStreamMultiGetProductInfo(p5, function(p8)
				-- upvalues: var40 (write), var41 (write), applyStreamingProductInfoResult (copy), var42 (write), var43 (write), flushPendingSections (ref)
				local var44, var45 = applyStreamingProductInfoResult(var40, p8, var41)
				var40 = var44
				var41 = var45
				var42 = var40
				
				if var43 then
					return
				end
				var43 = true
				task.delay(0.05, flushPendingSections)
			end):andThen(function(_)
				-- upvalues: var43 (write), var42 (write), t_3 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var40 (write), t_2 (copy), var41 (write), logCounterModule (copy), productInfoFailedItemsCounterModule (copy), var30 (copy), p7 (ref)
				var43 = false
				
				if var42 ~= nil then
					t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var42)
					var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
					fetchBonusGamePassOwnershipForPromotion(t_3)
					var42 = nil
				end
				t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var40)
				var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
				fetchBonusGamePassOwnershipForPromotion(t_3)
				t_2 = var41
				
				if #var41 > 0 then
					logCounterModule(productInfoFailedItemsCounterModule, #var41)
				end
				var30 = false
				
				if p7 then
					p7(var41)
				end
			end):catch(function(p8)
				-- upvalues: var43 (write), var42 (write), t_3 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var30 (copy), p7 (ref), var41 (write)
				warn("[Shop] streamProductInfoIntoSections failed", tostring(p8))
				var43 = false
				
				if var42 ~= nil then
					t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var42)
					var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
					fetchBonusGamePassOwnershipForPromotion(t_3)
					var42 = nil
				end
				var30 = false
				
				if p7 then
					p7(var41)
				end
			end)
		end
	end
	
	local function runShopFetch(p4, p5, p6)
		-- upvalues: var28 (write), var27 (write), var6 (ref), var8 (ref), hydrateGamePassTrialAvailabilities (ref), fFlagShopUseMockDataModule (copy), errorsModule (copy), var2 (ref), t_3 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), fFlagEnableExperienceShopGlobalIconModule (copy), var10 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (ref), var14 (ref), t_2 (write), fFlagEnableUserOffers (copy), inExperienceOffersModule (copy), list (copy)
		if var28 or var27 then
			return
		end
		var27 = true
		var6(true)
		var8(nil)
		hydrateGamePassTrialAvailabilities();
		(if fFlagShopUseMockDataModule then p5() else p4()):andThen(function(p7)
			-- upvalues: errorsModule (copy), p6 (ref), var2 (copy), t_3 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), fFlagEnableExperienceShopGlobalIconModule (copy), var10 (copy), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (copy), var14 (copy), t_2 (copy), var6 (copy), var27 (copy), var28 (copy), fFlagEnableUserOffers (copy), inExperienceOffersModule (copy), list (copy)
			if not (type(p7) == "table" and (type(p7.categories) == "table" and type(p7.sections) == "table")) then
				return errorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p6), p7)
			end
			var2(p7.categories)
			t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p7.sections)
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
			fetchBonusGamePassOwnershipForPromotion(t_3)
			
			if fFlagEnableExperienceShopGlobalIconModule then
				local var40
				local metadata = p7.metadata
				var10(metadata)
				local var41 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
				
				if fFlagInExperienceShopExpectStringMetadataValuesModule then
					var40 = var41 == "true"
					var40 = nil
				else
					var40 = var41 == true
				end
				var12(var40)
				var14(metadata ~= nil and metadata.newOffers == true)
			end
			t_2 = p7.failedItems or {}
			var6(false)
			var27 = false
			var28 = true
			
			if fFlagEnableUserOffers then
				inExperienceOffersModule.getOffersStore(false).fetchOffers(list)
			end
		end):catch(function(p7)
			-- upvalues: var8 (copy), var2 (copy), var4 (copy), t_2 (copy), var6 (copy), var27 (copy)
			var8(p7)
			var2({})
			var4({})
			t_2 = {}
			var6(false)
			var27 = false
		end)
	end
	
	local function runPartialDisplayShopFetch(p4, p5, p6)
		-- upvalues: var28 (write), var27 (write), var6 (ref), var8 (ref), hydrateGamePassTrialAvailabilities (ref), fFlagShopUseMockDataModule (copy), errorsModule (copy), var2 (ref), t_3 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), fFlagEnableExperienceShopGlobalIconModule (copy), var10 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (ref), var14 (ref), t_2 (write), fFlagEnableUserOffers (copy), inExperienceOffersModule (copy), list (copy), buildProductInfoRequestsForHydration (ref), streamProductInfoIntoSections (ref)
		if var28 or var27 then
			return
		end
		var27 = true
		var6(true)
		var8(nil)
		hydrateGamePassTrialAvailabilities();
		(if fFlagShopUseMockDataModule then p5() else p4()):andThen(function(p7)
			-- upvalues: errorsModule (copy), p6 (ref), var2 (copy), t_3 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), fFlagEnableExperienceShopGlobalIconModule (copy), var10 (copy), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (copy), var14 (copy), t_2 (copy), var6 (copy), var27 (copy), var28 (copy), fFlagEnableUserOffers (copy), inExperienceOffersModule (copy), list (copy), buildProductInfoRequestsForHydration (copy), streamProductInfoIntoSections (copy)
			if not (type(p7) == "table" and (type(p7.categories) == "table" and type(p7.sections) == "table")) then
				return errorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p6), p7)
			end
			var2(p7.categories)
			t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p7.sections)
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
			fetchBonusGamePassOwnershipForPromotion(t_3)
			
			if fFlagEnableExperienceShopGlobalIconModule then
				local var40
				local metadata = p7.metadata
				var10(metadata)
				local var41 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
				
				if fFlagInExperienceShopExpectStringMetadataValuesModule then
					var40 = var41 == "true"
					var40 = nil
				else
					var40 = var41 == true
				end
				var12(var40)
				var14(metadata ~= nil and metadata.newOffers == true)
			end
			t_2 = p7.failedItems or {}
			var6(false)
			var27 = false
			var28 = true
			
			if fFlagEnableUserOffers then
				inExperienceOffersModule.getOffersStore(false).fetchOffers(list)
			end
			local var42 = t_3
			streamProductInfoIntoSections(var42, buildProductInfoRequestsForHydration(var42, t_2), t_2, nil)
		end):catch(function(p7)
			-- upvalues: var8 (copy), var2 (copy), var4 (copy), t_2 (copy), var6 (copy), var27 (copy)
			var8(p7)
			var2({})
			var4({})
			t_2 = {}
			var6(false)
			var27 = false
		end)
	end
	
	local function fetchAllShopData()
		-- upvalues: fFlagEnablePartialDisplayInExperienceShopModule (copy), runPartialDisplayShopFetch (ref), fetchShopWidgetsOnlyModule (copy), mockFetchAllShopDataModule (copy), runShopFetch (ref), fetchAllShopDataModule (copy)
		local var40 = fFlagEnablePartialDisplayInExperienceShopModule
		
		if if typeof(var40) == "function" then var40() else var40 then
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
		-- upvalues: fFlagEnableShopProductInfoRefreshModule (copy), var28 (write), var29 (write), var30 (write), inExperienceShop (copy), t_3 (write), var3 (ref), fFlagEnableRobuxInExperienceShop (copy), t_2 (write), fFlagEnablePartialDisplayInExperienceShopModule (copy), streamProductInfoIntoSections (ref), fFlagShopUseMockDataModule (copy), fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), multiGetProductInfoModule (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref)
		if not fFlagEnableShopProductInfoRefreshModule then return end
		if not var28 or var29 or var30 then return end
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local var40 = if #t_3 > 0 then t_3 else var3(false)
		local var41 = refreshShopItemsModule.buildRequestsFromSections(var40)
		
		if fFlagEnableRobuxInExperienceShop then
			hydrateRobuxBonusItemsModule.appendBonusItemRequests(var41, var40)
		end
		refreshShopItemsModule.appendFailedItemRequests(var41, t_2)
		
		if #var41 == 0 then return end
		var29 = true
		local var42 = fFlagEnablePartialDisplayInExperienceShopModule
		
		if if typeof(var42) == "function" then var42() else var42 then
			streamProductInfoIntoSections(var40, var41, t_2, function()
				-- upvalues: var29 (copy)
				var29 = false
			end)
			
			return
		end
		local _ = nil;
		(if fFlagShopUseMockDataModule and fFlagShopUseMockMultiGetProductInfoModule then mockMultiGetProductInfoModule.multiGetProductInfo(var41, 0) else multiGetProductInfoModule(var41)):andThen(function(p4)
			-- upvalues: refreshShopItemsModule (ref), var40 (ref), fFlagEnableRobuxInExperienceShop (copy), hydrateRobuxBonusItemsModule (ref), t_2 (ref), t_2 (copy), t_3 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var29 (copy)
			local var43 = refreshShopItemsModule.mergeProductInfoIntoSections(var40, p4)
			local var44, var45 = refreshShopItemsModule.insertRecoveredItemsIntoSections(if fFlagEnableRobuxInExperienceShop then hydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(var43, p4) else var43, p4, t_2)
			t_2 = var45
			t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var44)
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
			fetchBonusGamePassOwnershipForPromotion(t_3)
			var29 = false
		end):catch(function(p4)
			-- upvalues: var29 (copy)
			warn("[Shop] refreshShopItemInfo failed", tostring(p4))
			var29 = false
		end)
	end
	
	local function onShopOpened()
		-- upvalues: fFlagEnableUserOffers (copy), fFlagOfferNineDotActivityIndicator (copy), fFlagOfferNotifyOnGlobalIcon (copy), inExperienceOffersModule (copy), fFlagEnablePartialDisplayInExperienceShopModule (copy), runPartialDisplayShopFetch (ref), fetchShopWidgetsOnlyModule (copy), mockFetchAllShopDataModule (copy), runShopFetch (ref), fetchAllShopDataModule (copy), refreshShopItemInfo (ref)
		if fFlagEnableUserOffers and (fFlagOfferNineDotActivityIndicator or fFlagOfferNotifyOnGlobalIcon) then
			inExperienceOffersModule.getOffersStore(false).markInExperienceShopOpened()
		end
		if if typeof(fFlagEnablePartialDisplayInExperienceShopModule) == "function" then fFlagEnablePartialDisplayInExperienceShopModule() else fFlagEnablePartialDisplayInExperienceShopModule then
			runPartialDisplayShopFetch(fetchShopWidgetsOnlyModule, mockFetchAllShopDataModule.fetchShopWidgetsOnly, "fetchAllShopData")
		else
			runShopFetch(fetchAllShopDataModule, mockFetchAllShopDataModule.fetchAllShopData, "fetchAllShopData")
		end
		refreshShopItemInfo()
	end
	
	local function refreshRobuxWidgetsAfterPurchase()
		-- upvalues: fFlagRefetchRobuxWidgetAfterPurchaseModule (copy), promiseModule (copy), var28 (write), var26 (write), shopDebugLoggerModule (copy), fFlagShopUseMockDataModule (copy), mockFetchAllShopDataModule (copy), fetchRobuxWidgetsAfterPurchaseModule (copy), mergeRobuxShopDataModule (copy), var1 (ref), t_3 (write), var2 (ref), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref)
		if not fFlagRefetchRobuxWidgetAfterPurchaseModule then
			return promiseModule.resolve()
		elseif not var28 then
			return promiseModule.resolve()
		elseif var26 then
			return promiseModule.resolve()
		end
		var26 = true
		shopDebugLoggerModule.log("refreshRobuxWidgetsAfterPurchase: start")
		
		return (if fFlagShopUseMockDataModule then mockFetchAllShopDataModule.fetchRobuxWidgetsAfterPurchase(0) else fetchRobuxWidgetsAfterPurchaseModule.fetchRobuxWidgetsAfterPurchase()):andThen(function(p4)
			-- upvalues: shopDebugLoggerModule (copy), mergeRobuxShopDataModule (copy), var1 (copy), t_3 (copy), var2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy)
			if type(p4) == "table" and (type(p4.categories) == "table" and type(p4.sections) == "table") then
				local var40, var41 = mergeRobuxShopDataModule(var1(false), t_3, p4)
				var2(var40)
				t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var41)
				var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
				fetchBonusGamePassOwnershipForPromotion(t_3)
				
				return
			end
			shopDebugLoggerModule.log("refreshRobuxWidgetsAfterPurchase: skip, invalid payload")
		end):catch(function(p4)
			-- upvalues: shopDebugLoggerModule (copy)
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p4 (ref)
				return "refreshRobuxWidgetsAfterPurchase: failed err=" .. tostring(p4)
			end)
		end):finally(function()
			-- upvalues: var26 (copy)
			var26 = false
		end)
	end
	
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
		-- upvalues: t_1 (ref), shopDebugLoggerModule (copy), pollOwnershipUntilTrue (ref), constantsModule (copy), writeOwnership (ref), playersService (copy), marketplaceService (copy), promiseModule (copy)
		if t_1[p4] then
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p4 (ref)
				return "pollGamePassOwnership: already in flight itemId=" .. p51
			end)
			
			return
		end
		local var40 = tonumber(p4)
		
		if var40 == nil then
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p4 (ref)
				return "pollGamePassOwnership: skip invalid itemId=" .. p51
			end)
			
			return
		end
		t_1[p4] = true
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: p4 (ref), p5 (ref), p7 (ref)
			return "pollGamePassOwnership: start itemId=" .. p51 .. " maxAttempts=" .. tostring(p5) .. " signalOnSuccess=" .. tostring(p7 == true)
		end)
		promiseModule.delay(constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function()
			-- upvalues: pollOwnershipUntilTrue (copy), p6 (ref), var40 (ref), p5 (ref), constantsModule (copy), shopDebugLoggerModule (copy), p4 (ref), writeOwnership (copy), p7 (ref), playersService (copy), marketplaceService (copy), t_1 (copy)
			pollOwnershipUntilTrue(p6, var40, p5, constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function(p8)
				-- upvalues: shopDebugLoggerModule (copy), p4 (copy), writeOwnership (copy), p7 (copy), playersService (copy), marketplaceService (copy), var40 (copy)
				shopDebugLoggerModule.logLazy(function()
					-- upvalues: p4 (copy), p8 (ref)
					return "pollGamePassOwnership: result itemId=" .. p51 .. " owned=" .. tostring(p8)
				end)
				
				if p8 ~= true then return end
				writeOwnership(p4, p8)
				
				if p7 then
					local localPlayer = playersService.LocalPlayer
					
					if localPlayer ~= nil then
						shopDebugLoggerModule.logLazy(function()
							-- upvalues: p4 (copy)
							return "pollGamePassOwnership: SignalPromptGamePassPurchaseFinished itemId=" .. p51
						end)
						marketplaceService:SignalPromptGamePassPurchaseFinished(localPlayer, var40, true)
					end
				end
			end):finally(function()
				-- upvalues: t_1 (copy), p4 (copy)
				t_1[p4] = nil
			end)
		end)
	end
	
	marketplaceService.PromptGamePassPurchaseFinished:Connect(function(p4, p5, p6)
		-- upvalues: playersService (copy), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassModule (copy), pollGamePassOwnershipAfterPurchase (ref), fIntShopOwnershipFetchMaxAttemptsModule (copy)
		if not p6 then return end
		local localPlayer = playersService.LocalPlayer
		
		if localPlayer == nil or p4.UserId ~= localPlayer.UserId then
			return
		end
		pollGamePassOwnershipAfterPurchase(tostring(p5), fIntShopOwnershipFetchMaxAttemptsModule, if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule)
	end)
	
	if fFlagShopListenNativePurchaseFinishedModule and fFlagEnableRobuxInExperienceShop then
		local function pollBonusOwnershipAfterNativeRobuxPurchase(p4, p5, p6)
			-- upvalues: playersService (copy), shopDebugLoggerModule (copy), var24 (write), var25 (write), fFlagRefetchRobuxWidgetAfterPurchaseModule (copy), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassHttpModule (copy), pollGamePassOwnershipAfterPurchase (ref), fIntShopOwnershipFetchMaxAttemptsModule (copy), fFlagSkipPaymentSessionForPlainRobuxModule (copy), refreshRobuxWidgetsAfterPurchase (ref)
			if p6 ~= nil then
				local localPlayer = playersService.LocalPlayer
				
				if localPlayer == nil or p6.UserId ~= localPlayer.UserId then
					shopDebugLoggerModule.log("NativePurchaseFinished: ignored, not local player")
					
					return
				elseif var25 == nil or not fFlagRefetchRobuxWidgetAfterPurchaseModule and var24 == nil then
					shopDebugLoggerModule.log("NativePurchaseFinished: skip, no pending shop Robux purchase")
					
					return
				elseif tostring(p5) ~= var25 then
					shopDebugLoggerModule.logLazy(function()
						-- upvalues: p5 (ref), var25 (ref)
						return "NativePurchaseFinished: skip, sku mismatch productId=" .. tostring(p5) .. " pendingStoreSku=" .. var66
					end)
					
					return
				end
				var24 = nil
				var25 = nil
				
				if not p4 then
					shopDebugLoggerModule.logLazy(function()
						-- upvalues: var24 (ref)
						return "NativePurchaseFinished: skip, not purchased bonusGamePassId=" .. tostring(var24)
					end)
					
					return
				elseif var24 ~= nil then
					shopDebugLoggerModule.logLazy(function()
						-- upvalues: var24 (ref)
						return "NativePurchaseFinished: polling bonusGamePassId=" .. var65
					end)
					pollGamePassOwnershipAfterPurchase(var24, fIntShopOwnershipFetchMaxAttemptsModule, if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassHttpModule, true)
				end
				if fFlagRefetchRobuxWidgetAfterPurchaseModule and (var24 ~= nil or not fFlagSkipPaymentSessionForPlainRobuxModule) then
					refreshRobuxWidgetsAfterPurchase()
				end
			end
		end
		
		local function onNativePurchaseFinished(p4, p5, p6, p7)
			-- upvalues: shopDebugLoggerModule (copy), pollBonusOwnershipAfterNativeRobuxPurchase (ref)
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p5 (ref), p6 (ref), p7 (ref)
				return "NativePurchaseFinished: productId=" .. tostring(p5) .. " wasPurchased=" .. tostring(p6) .. " checkoutSessionId=" .. tostring(p7)
			end)
			pollBonusOwnershipAfterNativeRobuxPurchase(p6, p5, p4)
		end
		
		local function onNativePurchaseFinishedWithLocalPlayer(p4, p5, p6)
			-- upvalues: shopDebugLoggerModule (copy), pollBonusOwnershipAfterNativeRobuxPurchase (ref)
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p4 (ref), p5 (ref), p6 (ref)
				return "NativePurchaseFinishedWithLocalPlayer: productId=" .. tostring(p4) .. " wasPurchased=" .. tostring(p5) .. " checkoutSessionId=" .. tostring(p6)
			end)
			pollBonusOwnershipAfterNativeRobuxPurchase(p5, p4, nil)
		end
		
		local _ = function(p4, p5)
			if typeof(p4) == "RBXScriptSignal" or type(p4) == "table" and p4.Connect ~= nil then
				p4:Connect(p5)
			end
		end
		
		local var40 = marketplaceService
		local nativePurchaseWithLocalPlayerEngineFeature = game:GetEngineFeature("NativePurchaseWithLocalPlayer")
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: fFlagLuaAppEnableNativePurchaseFinishedV2Signals (copy), nativePurchaseWithLocalPlayerEngineFeature (ref)
			return "NativePurchaseFinished: connecting v2=" .. tostring(fFlagLuaAppEnableNativePurchaseFinishedV2Signals) .. " localPlayerFeature=" .. tostring(nativePurchaseWithLocalPlayerEngineFeature)
		end)
		local nativePurchaseFinished = var40.NativePurchaseFinished
		
		if typeof(nativePurchaseFinished) == "RBXScriptSignal" or type(nativePurchaseFinished) == "table" and nativePurchaseFinished.Connect ~= nil then
			nativePurchaseFinished:Connect(onNativePurchaseFinished)
		end
		if fFlagLuaAppEnableNativePurchaseFinishedV2Signals then
			nativePurchaseFinished = var40.NativePurchaseFinishedV2
			
			if typeof(nativePurchaseFinished) == "RBXScriptSignal" or type(nativePurchaseFinished) == "table" and nativePurchaseFinished.Connect ~= nil then
				nativePurchaseFinished:Connect(onNativePurchaseFinished)
			end
		end
		if nativePurchaseWithLocalPlayerEngineFeature then
			nativePurchaseFinished = var40.NativePurchaseFinishedWithLocalPlayer
			
			if typeof(nativePurchaseFinished) == "RBXScriptSignal" or type(nativePurchaseFinished) == "table" and nativePurchaseFinished.Connect ~= nil then
				nativePurchaseFinished:Connect(onNativePurchaseFinishedWithLocalPlayer)
			end
			if fFlagLuaAppEnableNativePurchaseFinishedV2Signals then
				nativePurchaseFinished = var40.NativePurchaseFinishedWithLocalPlayerV2
				
				if typeof(nativePurchaseFinished) == "RBXScriptSignal" or type(nativePurchaseFinished) == "table" and nativePurchaseFinished.Connect ~= nil then
					nativePurchaseFinished:Connect(onNativePurchaseFinishedWithLocalPlayer)
				end
			end
		end
	end
	return {
		getCategories = var1,
		getSections = var3,
		getLoading = var5,
		getError = var7,
		getOwnership = var15,
		getTrialAvailabilities = var17,
		getBonusPromotionEligibility = var19,
		getItemsPerRow = var21,
		getMetadata = var9,
		getGlobalIconBackendEnabled = var11,
		getGlobalIconHasNewOffers = var13,
		getShouldOpenToRobuxTab = var31,
		onShopOpened = onShopOpened,
		fetchAllShopData = fetchAllShopData,
		prefetchWidgetsOnly = prefetchWidgetsOnly,
		refreshShopItemInfo = refreshShopItemInfo,
		refreshRobuxWidgetsAfterPurchase = refreshRobuxWidgetsAfterPurchase,
		fetchGamePassOwnership = fetchGamePassOwnership,
		pollGamePassOwnership = pollGamePassOwnershipAfterPurchase,
		bonusGamePassIdForNativePurchase = bonusGamePassIdForNativePurchase,
		setItemsPerRow = function(value)
			-- upvalues: var22 (ref)
			var22(value)
		end,
		setShouldOpenToRobuxTab = var32
	}
end