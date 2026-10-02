local marketplaceService = game:GetService("MarketplaceService")
local playersService = game:GetService("Players")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local pioneerInfo = require(parent.PioneerUtils).PioneerInfo
local createSignal = require(parent.Signals).createSignal
local inExperienceOffersModule = require(parent.InExperienceOffers)
local fFlagEnableUserOffers = sharedFlagsModule.FFlagEnableUserOffers
local fFlagEnableOffersPrefetch = sharedFlagsModule.FFlagEnableOffersPrefetch
local fFlagOfferNineDotActivityIndicator = sharedFlagsModule.FFlagOfferNineDotActivityIndicator
local fFlagOfferNotifyOnGlobalIcon = sharedFlagsModule.FFlagOfferNotifyOnGlobalIcon
local fFlagHideOfferNotificationsWhenShopEmpty = sharedFlagsModule.FFlagHideOfferNotificationsWhenShopEmpty
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)
local hasOfferEligibleCategoryModule = require(inExperienceShop.Utils.hasOfferEligibleCategory)
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
local fFlagShopRobuxPurchaseCompletionModalModule = require(inExperienceShop.Flags.FFlagShopRobuxPurchaseCompletionModal)
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
	-- upvalues: createSignal (ref), constantsModule (ref), shopDebugLoggerModule (ref), fFlagRefetchRobuxWidgetAfterPurchaseModule (ref), fFlagShopRobuxPurchaseCompletionModalModule (ref), pioneerInfo (ref), sortRobuxPackagesByAmountDescendingModule (ref), promoteBonusRobuxPackageToTopPicksModule (ref), fFlagEnableRobuxInExperienceShop (ref), bonusPromotionEligibilityModule (ref), fFlagShopUseMockUserOwnsGamePassModule (ref), mockUserOwnsGamePassModule (ref), userOwnsGamePassModule (ref), fFlagLuaAppEnableGamePassFreeTrialsModule (ref), fFlagShopUseMockGamePassTrialAvailabilitiesModule (ref), mockGamePassTrialAvailabilitiesModule (ref), fetchGamePassTrialAvailabilitiesModule (ref), fFlagEnableExperienceShopGlobalIconModule (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (ref), fFlagHideOfferNotificationsWhenShopEmpty (ref), inExperienceOffersModule (ref), hasOfferEligibleCategoryModule (ref), inExperienceShop (ref), fFlagShopUseMockDataModule (ref), fFlagShopUseMockMultiGetProductInfoModule (ref), mockMultiGetProductInfoModule (ref), streamMultiGetProductInfoModule (ref), logCounterModule (ref), productInfoFailedItemsCounterModule (ref), errorsModule (ref), fFlagEnableUserOffers (ref), fFlagEnableOffersPrefetch (ref), list (ref), fFlagEnablePartialDisplayInExperienceShopModule (ref), fetchShopWidgetsOnlyModule (ref), mockFetchAllShopDataModule (ref), fetchAllShopDataModule (ref), fFlagEnableShopProductInfoRefreshModule (ref), multiGetProductInfoModule (ref), fFlagOfferNineDotActivityIndicator (ref), fFlagOfferNotifyOnGlobalIcon (ref), promiseModule (ref), fetchRobuxWidgetsAfterPurchaseModule (ref), mergeRobuxShopDataModule (ref), playersService (ref), marketplaceService (ref), fIntShopOwnershipFetchMaxAttemptsModule (ref), fFlagShopListenNativePurchaseFinishedModule (ref), userOwnsGamePassHttpModule (ref), fFlagSkipPaymentSessionForPlainRobuxModule (ref), fFlagLuaAppEnableNativePurchaseFinishedV2Signals (ref)
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
	local var23, var24 = createSignal(nil)
	local t = {}
	local var25 = false
	local var26 = nil
	local var27 = nil
	local var28 = nil
	local t_1 = {}
	local var29 = false
	
	local function bonusGamePassIdForNativePurchase(p1, p2, p3)
		-- upvalues: shopDebugLoggerModule (copy), fFlagRefetchRobuxWidgetAfterPurchaseModule (copy), var26 (write), var27 (write), fFlagShopRobuxPurchaseCompletionModalModule (copy), var28 (write), pioneerInfo (copy), var24 (ref)
		if p2 == "" then
			shopDebugLoggerModule.log("bonusGamePassIdForNativePurchase: skip, empty store SKU")
			
			return
		end
		var26 = if fFlagRefetchRobuxWidgetAfterPurchaseModule then if p1 == nil or p1 == "" then nil else p1 else p1
		var27 = p2
		
		if fFlagShopRobuxPurchaseCompletionModalModule then
			var28 = if pioneerInfo.isDaveyBazooka() and p3 ~= nil and p3 > 0 then p3 else nil
			var24(nil)
		end
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: var26 (copy), p2 (ref)
			return "bonusGamePassIdForNativePurchase: recorded bonusGamePassId=" .. tostring(var26) .. " storeSku=" .. p2
		end)
	end
	
	local var30 = false
	local var31 = false
	local var32 = false
	local var33 = false
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	local t_5 = {}
	local var34, var35 = createSignal(false)
	
	local function _(p1, p2)
		-- upvalues: t_4 (ref), var20 (ref)
		t_4[p1] = p2
		var20(table.clone(t_4))
	end
	
	local function sortRobuxPackagesInSections(p1)
		-- upvalues: sortRobuxPackagesByAmountDescendingModule (copy)
		local v_1
		local var36 = false
		
		for i, v in p1 do
			v_1 = v.robuxPackages
			
			if v_1 ~= nil and #v_1 > 1 then
				var36 = true
				break
			end
		end
		if not var36 then
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
					categoryType = v_1.categoryType,
					stableCategoryId = v_1.stableCategoryId,
					categoryGroup = v_1.categoryGroup,
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
		local var37 = promoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(t_3)
		local var38 = if var37 ~= nil then nil else promoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(var37)
		
		if var38 == nil or var38 ~= p2 then
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
		local var37 = tonumber(p2)
		
		if var37 == nil then
			return
		end
		t[p2] = true;
		(if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule)(var37):andThen(function(p3)
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
		-- upvalues: fFlagLuaAppEnableGamePassFreeTrialsModule (copy), var25 (write), fFlagShopUseMockGamePassTrialAvailabilitiesModule (copy), mockGamePassTrialAvailabilitiesModule (copy), fetchGamePassTrialAvailabilitiesModule (copy), var18 (ref)
		if not fFlagLuaAppEnableGamePassFreeTrialsModule then return end
		if var25 then
			return
		end
		var25 = true;
		(if fFlagShopUseMockGamePassTrialAvailabilitiesModule then mockGamePassTrialAvailabilitiesModule.fetchGamePassTrialAvailabilities else fetchGamePassTrialAvailabilitiesModule.fetchGamePassTrialAvailabilities)(game.GameId):andThen(function(p2)
			-- upvalues: var18 (copy)
			var18(p2)
		end):catch(function(p2)
			warn("[Shop] hydrateGamePassTrialAvailabilities failed", tostring(p2))
		end):finally(function()
			-- upvalues: var25 (copy)
			var25 = false
		end)
	end
	
	local function fetchBonusGamePassOwnershipForPromotionId(p2)
		-- upvalues: fFlagRefetchRobuxWidgetAfterPurchaseModule (copy), t_1 (ref), shopDebugLoggerModule (copy), t_5 (ref), bonusPromotionEligibilityModule (copy), t_4 (ref), var20 (ref), promoteBonusRobuxPackageToTopPicksModule (copy), t_3 (write), var4 (ref), sortRobuxPackagesInSections (ref), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassModule (copy), var15 (ref), writeOwnership (ref)
		if fFlagRefetchRobuxWidgetAfterPurchaseModule and t_1[p2] then
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p2 (ref)
				return "fetchBonusGamePassOwnershipForPromotion: skip, poll in flight itemId=" .. p14
			end)
			
			return
		elseif t_5[p2] then return end
		t_4[p2] = bonusPromotionEligibilityModule.Unknown
		var20(table.clone(t_4))
		var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
		local var37 = tonumber(p2)
		
		if var37 == nil then
			t_4[p2] = bonusPromotionEligibilityModule.Ineligible
			var20(table.clone(t_4))
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
			
			return
		end
		t_5[p2] = true;
		(if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassModule)(var37):andThen(function(p3)
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
		local var37 = promoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(p2)
		local var38 = if var37 ~= nil then nil else promoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(var37)
		
		for i, v in if var38 ~= nil then {} else { var38 } do
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
			local var39
			local metadata = p3.metadata
			var10(metadata)
			local var40 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
			
			if fFlagInExperienceShopExpectStringMetadataValuesModule then
				var39 = var40 == "true"
				var39 = nil
			else
				var39 = var40 == true
			end
			var12(var39)
			var14(metadata ~= nil and metadata.newOffers == true)
		end
	end
	
	local _ = function(p3)
		-- upvalues: fFlagHideOfferNotificationsWhenShopEmpty (copy), inExperienceOffersModule (copy), hasOfferEligibleCategoryModule (copy)
		if fFlagHideOfferNotificationsWhenShopEmpty then
			inExperienceOffersModule.getOffersStore(false).setShopHasItems(hasOfferEligibleCategoryModule(p3.categories))
		end
	end
	
	local function buildProductInfoRequestsForHydration(p3, p4)
		-- upvalues: inExperienceShop (copy), fFlagEnableRobuxInExperienceShop (copy)
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local var39 = refreshShopItemsModule.buildRequestsFromSections(p3)
		
		if fFlagEnableRobuxInExperienceShop then
			hydrateRobuxBonusItemsModule.appendBonusItemRequests(var39, p3)
		end
		refreshShopItemsModule.appendFailedItemRequests(var39, p4)
		
		return var39
	end
	
	local function applyStreamingProductInfoResult(a, b, p3)
		-- upvalues: inExperienceShop (copy), fFlagEnableRobuxInExperienceShop (copy)
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local makeRequestKey = require(inExperienceShop.Api.shopItemMapping).makeRequestKey
		local var39 = makeRequestKey(b.request.id, b.request.infoType)
		local t = {}
		local t_1 = {}
		
		for i, v in p3 do
			if makeRequestKey(v.id, v.infoType) == var39 then
				table.insert(t, v)
			else
				table.insert(t_1, v)
			end
		end
		local var40 = refreshShopItemsModule.mergeProductInfoIntoSections(a, { b })
		local var41, var42 = refreshShopItemsModule.insertRecoveredItemsIntoSections(if fFlagEnableRobuxInExperienceShop then hydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(var40, { b }) else var40, { b }, t)
		
		for i_1, v_1 in var42 do
			table.insert(t_1, v_1)
		end
		return var41, t_1
	end
	
	local function routeStreamMultiGetProductInfo(p4, p5)
		-- upvalues: fFlagShopUseMockDataModule (copy), fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), streamMultiGetProductInfoModule (copy)
		return if fFlagShopUseMockDataModule and fFlagShopUseMockMultiGetProductInfoModule then mockMultiGetProductInfoModule.streamMultiGetProductInfo(p4, { onResult = p5 }, 0) else streamMultiGetProductInfoModule(p4, { onResult = p5 })
	end
	
	local function streamProductInfoIntoSections(p4, p5, p6, p7)
		-- upvalues: var33 (write), t_3 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), routeStreamMultiGetProductInfo (ref), applyStreamingProductInfoResult (ref), t_2 (write), logCounterModule (copy), productInfoFailedItemsCounterModule (copy)
		if #p5 == 0 then
			if p7 then
				p7(p6)
			end
			return
		else
			var33 = true
			local var43 = p4
			local var44 = p6
			local var45 = nil
			local var46 = false
			
			local function flushPendingSections()
				-- upvalues: var46 (write), var45 (write), t_3 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy)
				var46 = false
				
				if var45 ~= nil then
					t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var45)
					var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
					fetchBonusGamePassOwnershipForPromotion(t_3)
					var45 = nil
				end
			end
			
			local function _(p8)
				-- upvalues: var45 (write), var46 (write), flushPendingSections (ref)
				var45 = p8
				
				if var46 then
					return
				end
				var46 = true
				task.delay(0.05, flushPendingSections)
			end
			
			routeStreamMultiGetProductInfo(p5, function(p8)
				-- upvalues: var43 (write), var44 (write), applyStreamingProductInfoResult (copy), var45 (write), var46 (write), flushPendingSections (ref)
				local var47, var48 = applyStreamingProductInfoResult(var43, p8, var44)
				var43 = var47
				var44 = var48
				var45 = var43
				
				if var46 then
					return
				end
				var46 = true
				task.delay(0.05, flushPendingSections)
			end):andThen(function(_)
				-- upvalues: var46 (write), var45 (write), t_3 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var43 (write), t_2 (copy), var44 (write), logCounterModule (copy), productInfoFailedItemsCounterModule (copy), var33 (copy), p7 (ref)
				var46 = false
				
				if var45 ~= nil then
					t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var45)
					var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
					fetchBonusGamePassOwnershipForPromotion(t_3)
					var45 = nil
				end
				t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var43)
				var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
				fetchBonusGamePassOwnershipForPromotion(t_3)
				t_2 = var44
				
				if #var44 > 0 then
					logCounterModule(productInfoFailedItemsCounterModule, #var44)
				end
				var33 = false
				
				if p7 then
					p7(var44)
				end
			end):catch(function(p8)
				-- upvalues: var46 (write), var45 (write), t_3 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var33 (copy), p7 (ref), var44 (write)
				warn("[Shop] streamProductInfoIntoSections failed", tostring(p8))
				var46 = false
				
				if var45 ~= nil then
					t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var45)
					var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
					fetchBonusGamePassOwnershipForPromotion(t_3)
					var45 = nil
				end
				var33 = false
				
				if p7 then
					p7(var44)
				end
			end)
		end
	end
	
	local function runShopFetch(p4, p5, p6)
		-- upvalues: var31 (write), var30 (write), var6 (ref), var8 (ref), hydrateGamePassTrialAvailabilities (ref), fFlagShopUseMockDataModule (copy), errorsModule (copy), var2 (ref), t_3 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), fFlagEnableExperienceShopGlobalIconModule (copy), var10 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (ref), var14 (ref), fFlagHideOfferNotificationsWhenShopEmpty (copy), inExperienceOffersModule (copy), hasOfferEligibleCategoryModule (copy), t_2 (write), fFlagEnableUserOffers (copy), fFlagEnableOffersPrefetch (copy), list (copy)
		if var31 or var30 then
			return
		end
		var30 = true
		var6(true)
		var8(nil)
		hydrateGamePassTrialAvailabilities();
		(if fFlagShopUseMockDataModule then p5() else p4()):andThen(function(p7)
			-- upvalues: errorsModule (copy), p6 (ref), var2 (copy), t_3 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), fFlagEnableExperienceShopGlobalIconModule (copy), var10 (copy), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (copy), var14 (copy), fFlagHideOfferNotificationsWhenShopEmpty (copy), inExperienceOffersModule (copy), hasOfferEligibleCategoryModule (copy), t_2 (copy), var6 (copy), var30 (copy), var31 (copy), fFlagEnableUserOffers (copy), fFlagEnableOffersPrefetch (copy), list (copy)
			if not (type(p7) == "table" and (type(p7.categories) == "table" and type(p7.sections) == "table")) then
				return errorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p6), p7)
			end
			var2(p7.categories)
			t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p7.sections)
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
			fetchBonusGamePassOwnershipForPromotion(t_3)
			
			if fFlagEnableExperienceShopGlobalIconModule then
				local var43
				local metadata = p7.metadata
				var10(metadata)
				local var44 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
				
				if fFlagInExperienceShopExpectStringMetadataValuesModule then
					var43 = var44 == "true"
					var43 = nil
				else
					var43 = var44 == true
				end
				var12(var43)
				var14(metadata ~= nil and metadata.newOffers == true)
			end
			if fFlagHideOfferNotificationsWhenShopEmpty then
				inExperienceOffersModule.getOffersStore(false).setShopHasItems(hasOfferEligibleCategoryModule(p7.categories))
			end
			t_2 = p7.failedItems or {}
			var6(false)
			var30 = false
			var31 = true
			
			if fFlagEnableUserOffers and not fFlagEnableOffersPrefetch then
				inExperienceOffersModule.getOffersStore(false).fetchOffers(list)
			end
		end):catch(function(p7)
			-- upvalues: var8 (copy), var2 (copy), var4 (copy), t_2 (copy), var6 (copy), var30 (copy)
			var8(p7)
			var2({})
			var4({})
			t_2 = {}
			var6(false)
			var30 = false
		end)
	end
	
	local function runPartialDisplayShopFetch(p4, p5, p6)
		-- upvalues: var31 (write), var30 (write), var6 (ref), var8 (ref), hydrateGamePassTrialAvailabilities (ref), fFlagShopUseMockDataModule (copy), errorsModule (copy), var2 (ref), t_3 (write), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref), fFlagEnableExperienceShopGlobalIconModule (copy), var10 (ref), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (ref), var14 (ref), fFlagHideOfferNotificationsWhenShopEmpty (copy), inExperienceOffersModule (copy), hasOfferEligibleCategoryModule (copy), t_2 (write), fFlagEnableUserOffers (copy), fFlagEnableOffersPrefetch (copy), list (copy), buildProductInfoRequestsForHydration (ref), streamProductInfoIntoSections (ref)
		if var31 or var30 then
			return
		end
		var30 = true
		var6(true)
		var8(nil)
		hydrateGamePassTrialAvailabilities();
		(if fFlagShopUseMockDataModule then p5() else p4()):andThen(function(p7)
			-- upvalues: errorsModule (copy), p6 (ref), var2 (copy), t_3 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), fFlagEnableExperienceShopGlobalIconModule (copy), var10 (copy), fFlagInExperienceShopExpectStringMetadataValuesModule (copy), var12 (copy), var14 (copy), fFlagHideOfferNotificationsWhenShopEmpty (copy), inExperienceOffersModule (copy), hasOfferEligibleCategoryModule (copy), t_2 (copy), var6 (copy), var30 (copy), var31 (copy), fFlagEnableUserOffers (copy), fFlagEnableOffersPrefetch (copy), list (copy), buildProductInfoRequestsForHydration (copy), streamProductInfoIntoSections (copy)
			if not (type(p7) == "table" and (type(p7.categories) == "table" and type(p7.sections) == "table")) then
				return errorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p6), p7)
			end
			var2(p7.categories)
			t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p7.sections)
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
			fetchBonusGamePassOwnershipForPromotion(t_3)
			
			if fFlagEnableExperienceShopGlobalIconModule then
				local var43
				local metadata = p7.metadata
				var10(metadata)
				local var44 = if metadata ~= nil then nil else metadata.inExperienceGlobalIconEnabled
				
				if fFlagInExperienceShopExpectStringMetadataValuesModule then
					var43 = var44 == "true"
					var43 = nil
				else
					var43 = var44 == true
				end
				var12(var43)
				var14(metadata ~= nil and metadata.newOffers == true)
			end
			if fFlagHideOfferNotificationsWhenShopEmpty then
				inExperienceOffersModule.getOffersStore(false).setShopHasItems(hasOfferEligibleCategoryModule(p7.categories))
			end
			t_2 = p7.failedItems or {}
			var6(false)
			var30 = false
			var31 = true
			
			if fFlagEnableUserOffers and not fFlagEnableOffersPrefetch then
				inExperienceOffersModule.getOffersStore(false).fetchOffers(list)
			end
			local var45 = t_3
			streamProductInfoIntoSections(var45, buildProductInfoRequestsForHydration(var45, t_2), t_2, nil)
		end):catch(function(p7)
			-- upvalues: var8 (copy), var2 (copy), var4 (copy), t_2 (copy), var6 (copy), var30 (copy)
			var8(p7)
			var2({})
			var4({})
			t_2 = {}
			var6(false)
			var30 = false
		end)
	end
	
	local function fetchAllShopData()
		-- upvalues: fFlagEnablePartialDisplayInExperienceShopModule (copy), runPartialDisplayShopFetch (ref), fetchShopWidgetsOnlyModule (copy), mockFetchAllShopDataModule (copy), runShopFetch (ref), fetchAllShopDataModule (copy)
		local var43 = fFlagEnablePartialDisplayInExperienceShopModule
		
		if if typeof(var43) == "function" then var43() else var43 then
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
		-- upvalues: fFlagEnableShopProductInfoRefreshModule (copy), var31 (write), var32 (write), var33 (write), inExperienceShop (copy), t_3 (write), var3 (ref), fFlagEnableRobuxInExperienceShop (copy), t_2 (write), fFlagEnablePartialDisplayInExperienceShopModule (copy), streamProductInfoIntoSections (ref), fFlagShopUseMockDataModule (copy), fFlagShopUseMockMultiGetProductInfoModule (copy), mockMultiGetProductInfoModule (copy), multiGetProductInfoModule (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref)
		if not fFlagEnableShopProductInfoRefreshModule then return end
		if not var31 or var32 or var33 then return end
		local refreshShopItemsModule = require(inExperienceShop.Api.refreshShopItems)
		local hydrateRobuxBonusItemsModule = require(inExperienceShop.Api.hydrateRobuxBonusItems)
		local var43 = if #t_3 > 0 then t_3 else var3(false)
		local var44 = refreshShopItemsModule.buildRequestsFromSections(var43)
		
		if fFlagEnableRobuxInExperienceShop then
			hydrateRobuxBonusItemsModule.appendBonusItemRequests(var44, var43)
		end
		refreshShopItemsModule.appendFailedItemRequests(var44, t_2)
		
		if #var44 == 0 then return end
		var32 = true
		local var45 = fFlagEnablePartialDisplayInExperienceShopModule
		
		if if typeof(var45) == "function" then var45() else var45 then
			streamProductInfoIntoSections(var43, var44, t_2, function()
				-- upvalues: var32 (copy)
				var32 = false
			end)
			
			return
		end
		local _ = nil;
		(if fFlagShopUseMockDataModule and fFlagShopUseMockMultiGetProductInfoModule then mockMultiGetProductInfoModule.multiGetProductInfo(var44, 0) else multiGetProductInfoModule(var44)):andThen(function(p4)
			-- upvalues: refreshShopItemsModule (ref), var43 (ref), fFlagEnableRobuxInExperienceShop (copy), hydrateRobuxBonusItemsModule (ref), t_2 (ref), t_2 (copy), t_3 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), var32 (copy)
			local var46 = refreshShopItemsModule.mergeProductInfoIntoSections(var43, p4)
			local var47, var48 = refreshShopItemsModule.insertRecoveredItemsIntoSections(if fFlagEnableRobuxInExperienceShop then hydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(var46, p4) else var46, p4, t_2)
			t_2 = var48
			t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var47)
			var4(sortRobuxPackagesInSections(promoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(t_3, t_4)))
			fetchBonusGamePassOwnershipForPromotion(t_3)
			var32 = false
		end):catch(function(p4)
			-- upvalues: var32 (copy)
			warn("[Shop] refreshShopItemInfo failed", tostring(p4))
			var32 = false
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
		-- upvalues: fFlagRefetchRobuxWidgetAfterPurchaseModule (copy), promiseModule (copy), var31 (write), var29 (write), shopDebugLoggerModule (copy), fFlagShopUseMockDataModule (copy), mockFetchAllShopDataModule (copy), fetchRobuxWidgetsAfterPurchaseModule (copy), mergeRobuxShopDataModule (copy), var1 (ref), t_3 (write), var2 (ref), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (ref), var4 (ref), sortRobuxPackagesInSections (ref), fetchBonusGamePassOwnershipForPromotion (ref)
		if not fFlagRefetchRobuxWidgetAfterPurchaseModule then
			return promiseModule.resolve()
		elseif not var31 then
			return promiseModule.resolve()
		elseif var29 then
			return promiseModule.resolve()
		end
		var29 = true
		shopDebugLoggerModule.log("refreshRobuxWidgetsAfterPurchase: start")
		
		return (if fFlagShopUseMockDataModule then mockFetchAllShopDataModule.fetchRobuxWidgetsAfterPurchase(0) else fetchRobuxWidgetsAfterPurchaseModule.fetchRobuxWidgetsAfterPurchase()):andThen(function(p4)
			-- upvalues: shopDebugLoggerModule (copy), mergeRobuxShopDataModule (copy), var1 (copy), t_3 (copy), var2 (copy), promoteBonusRobuxPackageToTopPicksModule (copy), t_4 (copy), var4 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy)
			if type(p4) == "table" and (type(p4.categories) == "table" and type(p4.sections) == "table") then
				local var43, var44 = mergeRobuxShopDataModule(var1(false), t_3, p4)
				var2(var43)
				t_3 = promoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(var44)
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
			-- upvalues: var29 (copy)
			var29 = false
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
				return "pollGamePassOwnership: already in flight itemId=" .. p53
			end)
			
			return
		end
		local var43 = tonumber(p4)
		
		if var43 == nil then
			shopDebugLoggerModule.logLazy(function()
				-- upvalues: p4 (ref)
				return "pollGamePassOwnership: skip invalid itemId=" .. p53
			end)
			
			return
		end
		t_1[p4] = true
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: p4 (ref), p5 (ref), p7 (ref)
			return "pollGamePassOwnership: start itemId=" .. p53 .. " maxAttempts=" .. tostring(p5) .. " signalOnSuccess=" .. tostring(p7 == true)
		end)
		promiseModule.delay(constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function()
			-- upvalues: pollOwnershipUntilTrue (copy), p6 (ref), var43 (ref), p5 (ref), constantsModule (copy), shopDebugLoggerModule (copy), p4 (ref), writeOwnership (copy), p7 (ref), playersService (copy), marketplaceService (copy), t_1 (copy)
			pollOwnershipUntilTrue(p6, var43, p5, constantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function(p8)
				-- upvalues: shopDebugLoggerModule (copy), p4 (copy), writeOwnership (copy), p7 (copy), playersService (copy), marketplaceService (copy), var43 (copy)
				shopDebugLoggerModule.logLazy(function()
					-- upvalues: p4 (copy), p8 (ref)
					return "pollGamePassOwnership: result itemId=" .. p53 .. " owned=" .. tostring(p8)
				end)
				
				if p8 ~= true then return end
				writeOwnership(p4, p8)
				
				if p7 then
					local localPlayer = playersService.LocalPlayer
					
					if localPlayer ~= nil then
						shopDebugLoggerModule.logLazy(function()
							-- upvalues: p4 (copy)
							return "pollGamePassOwnership: SignalPromptGamePassPurchaseFinished itemId=" .. p53
						end)
						marketplaceService:SignalPromptGamePassPurchaseFinished(localPlayer, var43, true)
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
			-- upvalues: playersService (copy), shopDebugLoggerModule (copy), var26 (write), var27 (write), var28 (write), fFlagRefetchRobuxWidgetAfterPurchaseModule (copy), fFlagShopRobuxPurchaseCompletionModalModule (copy), var24 (ref), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassHttpModule (copy), pollGamePassOwnershipAfterPurchase (ref), fIntShopOwnershipFetchMaxAttemptsModule (copy), fFlagSkipPaymentSessionForPlainRobuxModule (copy), refreshRobuxWidgetsAfterPurchase (ref)
			if p6 ~= nil then
				local localPlayer = playersService.LocalPlayer
				
				if localPlayer == nil or p6.UserId ~= localPlayer.UserId then
					shopDebugLoggerModule.log("NativePurchaseFinished: ignored, not local player")
					
					return
				elseif var27 == nil or not fFlagRefetchRobuxWidgetAfterPurchaseModule and var26 == nil and (not fFlagShopRobuxPurchaseCompletionModalModule or var28 == nil) then
					shopDebugLoggerModule.log("NativePurchaseFinished: skip, no pending shop Robux purchase")
					
					return
				elseif tostring(p5) ~= var27 then
					shopDebugLoggerModule.logLazy(function()
						-- upvalues: p5 (ref), var27 (ref)
						return "NativePurchaseFinished: skip, sku mismatch productId=" .. tostring(p5) .. " pendingStoreSku=" .. var70
					end)
					
					return
				end
				var26 = nil
				var27 = nil
				var28 = nil
				
				if not p4 then
					shopDebugLoggerModule.logLazy(function()
						-- upvalues: var26 (ref)
						return "NativePurchaseFinished: skip, not purchased bonusGamePassId=" .. tostring(var26)
					end)
					
					return
				elseif fFlagShopRobuxPurchaseCompletionModalModule and var28 ~= nil then
					var24(var28)
				end
				if var26 ~= nil then
					shopDebugLoggerModule.logLazy(function()
						-- upvalues: var26 (ref)
						return "NativePurchaseFinished: polling bonusGamePassId=" .. var69
					end)
					pollGamePassOwnershipAfterPurchase(var26, fIntShopOwnershipFetchMaxAttemptsModule, if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassHttpModule, true)
				end
				if fFlagRefetchRobuxWidgetAfterPurchaseModule and (var26 ~= nil or not fFlagSkipPaymentSessionForPlainRobuxModule) then
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
		
		local var43 = marketplaceService
		local nativePurchaseWithLocalPlayerEngineFeature = game:GetEngineFeature("NativePurchaseWithLocalPlayer")
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: fFlagLuaAppEnableNativePurchaseFinishedV2Signals (copy), nativePurchaseWithLocalPlayerEngineFeature (ref)
			return "NativePurchaseFinished: connecting v2=" .. tostring(fFlagLuaAppEnableNativePurchaseFinishedV2Signals) .. " localPlayerFeature=" .. tostring(nativePurchaseWithLocalPlayerEngineFeature)
		end)
		local nativePurchaseFinished = var43.NativePurchaseFinished
		
		if typeof(nativePurchaseFinished) == "RBXScriptSignal" or type(nativePurchaseFinished) == "table" and nativePurchaseFinished.Connect ~= nil then
			nativePurchaseFinished:Connect(onNativePurchaseFinished)
		end
		if fFlagLuaAppEnableNativePurchaseFinishedV2Signals then
			nativePurchaseFinished = var43.NativePurchaseFinishedV2
			
			if typeof(nativePurchaseFinished) == "RBXScriptSignal" or type(nativePurchaseFinished) == "table" and nativePurchaseFinished.Connect ~= nil then
				nativePurchaseFinished:Connect(onNativePurchaseFinished)
			end
		end
		if nativePurchaseWithLocalPlayerEngineFeature then
			nativePurchaseFinished = var43.NativePurchaseFinishedWithLocalPlayer
			
			if typeof(nativePurchaseFinished) == "RBXScriptSignal" or type(nativePurchaseFinished) == "table" and nativePurchaseFinished.Connect ~= nil then
				nativePurchaseFinished:Connect(onNativePurchaseFinishedWithLocalPlayer)
			end
			if fFlagLuaAppEnableNativePurchaseFinishedV2Signals then
				nativePurchaseFinished = var43.NativePurchaseFinishedWithLocalPlayerV2
				
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
		getShouldOpenToRobuxTab = var34,
		getPurchasedRobuxAmount = var23,
		dismissRobuxPurchaseSuccess = function()
			-- upvalues: var24 (ref)
			var24(nil)
		end,
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
		setShouldOpenToRobuxTab = var35
	}
end