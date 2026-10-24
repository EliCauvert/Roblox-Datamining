local MarketplaceService = game:GetService("MarketplaceService")
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local PromiseModule = require(Parent.Promise)
local SharedFlagsModule = require(Parent.SharedFlags)
local PioneerInfo = require(Parent.PioneerUtils).PioneerInfo
local CreateSignalFunction = require(Parent.Signals).createSignal
local InExperienceOffersModule = require(Parent.InExperienceOffers)
local FFlagEnableOffersPrefetch = SharedFlagsModule.FFlagEnableOffersPrefetch
local FFlagOfferNineDotActivityIndicator = SharedFlagsModule.FFlagOfferNineDotActivityIndicator
local FFlagOfferNotifyOnGlobalIcon = SharedFlagsModule.FFlagOfferNotifyOnGlobalIcon
local FFlagHideOfferNotificationsWhenShopEmpty = SharedFlagsModule.FFlagHideOfferNotificationsWhenShopEmpty
local ConstantsModule = require(InExperienceShop.Constants)
local _ = require(InExperienceShop.Types)
local HasOfferEligibleCategoryModule = require(InExperienceShop.Utils.hasOfferEligibleCategory)
local ErrorsModule = require(InExperienceShop.Api.Errors)
local FetchAllShopDataModule = require(InExperienceShop.Api.fetchAllShopData)
local FetchShopWidgetsOnlyModule = require(InExperienceShop.Api.fetchShopWidgetsOnly)
local FetchRobuxWidgetsAfterPurchaseModule = require(InExperienceShop.Api.fetchRobuxWidgetsAfterPurchase)
local MergeRobuxShopDataModule = require(InExperienceShop.Api.mergeRobuxShopData)
local MultiGetProductInfoModule = require(InExperienceShop.Api.multiGetProductInfo)
local StreamMultiGetProductInfoModule = require(InExperienceShop.Api.streamMultiGetProductInfo)
local LogCounterModule = require(InExperienceShop.Internal.logCounter)
local ShopDebugLoggerModule = require(InExperienceShop.Internal.ShopDebugLogger)
local ProductInfoFailedItemsCounterModule = require(InExperienceShop.Events.ProductInfoFailedItemsCounter)
local UserOwnsGamePassModule = require(InExperienceShop.Api.userOwnsGamePass)
local UserOwnsGamePassHttpModule = require(InExperienceShop.Api.userOwnsGamePassHttp)
local FetchGamePassTrialAvailabilitiesModule = require(InExperienceShop.Api.fetchGamePassTrialAvailabilities)
local RedeemGamePassTrialModule = require(InExperienceShop.Api.redeemGamePassTrial)
local GetPassOwnershipModule = require(InExperienceShop.Api.getPassOwnership)
local FFlagShopUseMockDataModule = require(InExperienceShop.Flags.FFlagShopUseMockData)
local FFlagShopUseMockUserOwnsGamePassModule = require(InExperienceShop.Flags.FFlagShopUseMockUserOwnsGamePass)
local FFlagShopUseMockGamePassTrialAvailabilitiesModule = require(InExperienceShop.Flags.FFlagShopUseMockGamePassTrialAvailabilities)
local FFlagShopUseMockGamePassTrialRedemptionModule = require(InExperienceShop.Flags.FFlagShopUseMockGamePassTrialRedemption)
local FFlagMockGetGamePassOwnershipModule = require(InExperienceShop.Flags.FFlagMockGetGamePassOwnership)
local FFlagUseGetGamePassOwnershipApi = SharedFlagsModule.FFlagUseGetGamePassOwnershipApi
local FFlagLuaAppEnableGamePassFreeTrialsModule = require(InExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local FFlagShopUseMockMultiGetProductInfoModule = require(InExperienceShop.Flags.FFlagShopUseMockMultiGetProductInfo)
local FFlagEnableShopProductInfoRefreshModule = require(InExperienceShop.Flags.FFlagEnableShopProductInfoRefresh)
local FFlagEnableShopExposureLoggingModule = require(InExperienceShop.Flags.FFlagEnableShopExposureLogging)
local FStringExperienceShopIXPLayersCommaSeparatedModule = require(InExperienceShop.Flags.FStringExperienceShopIXPLayersCommaSeparated)
local FFlagRefetchRobuxWidgetAfterPurchaseModule = require(InExperienceShop.Flags.FFlagRefetchRobuxWidgetAfterPurchase)
local FFlagSkipPaymentSessionForPlainRobuxModule = require(InExperienceShop.Flags.FFlagSkipPaymentSessionForPlainRobux)
local FFlagEnablePartialDisplayInExperienceShopModule = require(InExperienceShop.Flags.FFlagEnablePartialDisplayInExperienceShop)
local _ = require(InExperienceShop.Flags.FFlagPromoteRobuxInTopPicks)
local FFlagEnableRobuxInExperienceShop = SharedFlagsModule.FFlagEnableRobuxInExperienceShop
local FFlagLuaAppEnableNativePurchaseFinishedV2Signals = SharedFlagsModule.FFlagLuaAppEnableNativePurchaseFinishedV2Signals
local FFlagShopListenNativePurchaseFinishedModule = require(InExperienceShop.Flags.FFlagShopListenNativePurchaseFinished)
local FFlagShopRobuxPurchaseCompletionModalModule = require(InExperienceShop.Flags.FFlagShopRobuxPurchaseCompletionModal)
local FIntShopOwnershipFetchMaxAttemptsModule = require(InExperienceShop.Flags.FIntShopOwnershipFetchMaxAttempts)
local MockFetchAllShopDataModule = require(InExperienceShop.Mocks.MockFetchAllShopData)
local MockMultiGetProductInfoModule = require(InExperienceShop.Mocks.MockMultiGetProductInfo)
local MockUserOwnsGamePassModule = require(InExperienceShop.Mocks.MockUserOwnsGamePass)
local MockGamePassTrialAvailabilitiesModule = require(InExperienceShop.Mocks.MockGamePassTrialAvailabilities)
local MockGetPassOwnershipModule = require(InExperienceShop.Mocks.MockGetPassOwnership)
local PromoteBonusRobuxPackageToTopPicksModule = require(InExperienceShop.Api.promoteBonusRobuxPackageToTopPicks)
local BonusPromotionEligibilityModule = require(InExperienceShop.Api.BonusPromotionEligibility)
local SortRobuxPackagesByAmountDescendingModule = require(InExperienceShop.Utils.sortRobuxPackagesByAmountDescending)
local FindTopPicksSectionIndexModule = require(InExperienceShop.Utils.findTopPicksSectionIndex)
local MoveItemToPositionInShopModule = require(InExperienceShop.Utils.moveItemToPositionInShop)
local FFlagEnableExperienceShopGlobalIconModule = require(InExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local FFlagInExperienceShopExpectStringMetadataValuesModule = require(InExperienceShop.Flags.FFlagInExperienceShopExpectStringMetadataValues)
local list = { InExperienceOffersModule.FeatureKeys.RobloxShop }

local function _(p1): boolean
	return type(p1) == "table" and type(p1.categories) == "table" and type(p1.sections) == "table"
end

local _ = function()
	-- upvalues: FFlagEnablePartialDisplayInExperienceShopModule (copy)
	return if typeof(FFlagEnablePartialDisplayInExperienceShopModule) == "function" then FFlagEnablePartialDisplayInExperienceShopModule() else FFlagEnablePartialDisplayInExperienceShopModule
end

return function()
	-- upvalues: CreateSignalFunction (copy), ConstantsModule (copy), ShopDebugLoggerModule (copy), FFlagRefetchRobuxWidgetAfterPurchaseModule (copy), FFlagShopRobuxPurchaseCompletionModalModule (copy), PioneerInfo (copy), SortRobuxPackagesByAmountDescendingModule (copy), PromoteBonusRobuxPackageToTopPicksModule (copy), FindTopPicksSectionIndexModule (copy), MoveItemToPositionInShopModule (copy), FFlagEnableRobuxInExperienceShop (copy), BonusPromotionEligibilityModule (copy), FFlagUseGetGamePassOwnershipApi (copy), Players (copy), PromiseModule (copy), FFlagMockGetGamePassOwnershipModule (copy), MockGetPassOwnershipModule (copy), GetPassOwnershipModule (copy), FFlagShopUseMockUserOwnsGamePassModule (copy), MockUserOwnsGamePassModule (copy), UserOwnsGamePassModule (copy), FFlagLuaAppEnableGamePassFreeTrialsModule (copy), FFlagShopUseMockGamePassTrialAvailabilitiesModule (copy), MockGamePassTrialAvailabilitiesModule (copy), FetchGamePassTrialAvailabilitiesModule (copy), MarketplaceService (copy), FFlagShopUseMockGamePassTrialRedemptionModule (copy), RedeemGamePassTrialModule (copy), FFlagEnableExperienceShopGlobalIconModule (copy), FFlagInExperienceShopExpectStringMetadataValuesModule (copy), FFlagHideOfferNotificationsWhenShopEmpty (copy), InExperienceOffersModule (copy), HasOfferEligibleCategoryModule (copy), InExperienceShop (copy), FFlagShopUseMockDataModule (copy), FFlagShopUseMockMultiGetProductInfoModule (copy), MockMultiGetProductInfoModule (copy), StreamMultiGetProductInfoModule (copy), LogCounterModule (copy), ProductInfoFailedItemsCounterModule (copy), ErrorsModule (copy), FFlagEnableOffersPrefetch (copy), list (copy), FFlagEnablePartialDisplayInExperienceShopModule (copy), FetchShopWidgetsOnlyModule (copy), MockFetchAllShopDataModule (copy), FetchAllShopDataModule (copy), FFlagEnableShopProductInfoRefreshModule (copy), MultiGetProductInfoModule (copy), FFlagOfferNineDotActivityIndicator (copy), FFlagOfferNotifyOnGlobalIcon (copy), FFlagEnableShopExposureLoggingModule (copy), RunService (copy), Parent (copy), FStringExperienceShopIXPLayersCommaSeparatedModule (copy), FetchRobuxWidgetsAfterPurchaseModule (copy), MergeRobuxShopDataModule (copy), FIntShopOwnershipFetchMaxAttemptsModule (copy), FFlagShopListenNativePurchaseFinishedModule (copy), UserOwnsGamePassHttpModule (copy), FFlagSkipPaymentSessionForPlainRobuxModule (copy), FFlagLuaAppEnableNativePurchaseFinishedV2Signals (copy)
	local Signal, Signal2 = CreateSignalFunction({})
	local Signal1, Signal2_1 = CreateSignalFunction({})
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Signal4, Signal2_3 = CreateSignalFunction(nil)
	local Signal5, Signal2_4 = CreateSignalFunction(nil)
	local Signal6, Signal2_5 = CreateSignalFunction(false)
	local Signal7, Signal2_6 = CreateSignalFunction(false)
	local Signal8, Signal2_7 = CreateSignalFunction({})
	local Signal9, Signal2_8 = CreateSignalFunction({ available = {}, active = {} })
	local Signal10, Signal2_9 = CreateSignalFunction({})
	local Signal11, Signal2_10 = CreateSignalFunction(ConstantsModule.MIN_COLUMNS)
	local Signal12, Signal2_11 = CreateSignalFunction(nil)
	local t = {}
	local Flag = false
	local Flag1 = false
	local Flag2 = false
	local v1 = nil
	local v2 = nil
	local v3 = nil
	local t1 = {}
	local Flag3 = false
	
	local function bonusGamePassIdForNativePurchase(p1, p2, p3: number)
		-- upvalues: ShopDebugLoggerModule (upval), FFlagRefetchRobuxWidgetAfterPurchaseModule (upval), v1 (ref), v2 (ref), FFlagShopRobuxPurchaseCompletionModalModule (upval), v3 (ref), PioneerInfo (upval), Signal2_11 (copy)
		if p2 == "" then
			ShopDebugLoggerModule.log("bonusGamePassIdForNativePurchase: skip, empty store SKU")
			
			return
		end
		v1 = if FFlagRefetchRobuxWidgetAfterPurchaseModule and (p1 == nil or p1 == "") then nil else p1
		v2 = p2
		
		if FFlagShopRobuxPurchaseCompletionModalModule then
			v3 = if PioneerInfo.isDaveyBazooka() and p3 ~= nil and p3 > 0 then p3 else nil
			Signal2_11(nil)
		end
		ShopDebugLoggerModule.logLazy(function(): string
			-- upvalues: v1 (upval), p2 (copy)
			return "bonusGamePassIdForNativePurchase: recorded bonusGamePassId=" .. tostring(v1) .. " storeSku=" .. p2
		end)
	end
	
	local Flag4 = false
	local Flag5 = false
	local Flag6 = false
	local Flag7 = false
	local Flag8 = false
	local FailedItems = {}
	local WithoutFeaturedPromotionResult = {}
	local Tbl = {}
	local t2 = {}
	local Signal13, Signal2_12 = CreateSignalFunction(false)
	local Signal14, Signal2_13 = CreateSignalFunction(false)
	
	local function _(Key, p1)
		-- upvalues: Tbl (copy), Signal2_9 (copy)
		Tbl[Key] = p1
		Signal2_9(table.clone(Tbl))
	end
	
	local function sortRobuxPackagesInSections(Tbl)
		-- upvalues: SortRobuxPackagesByAmountDescendingModule (upval)
		local Flag = false
		
		for _, value in Tbl do
			local RobuxPackages = value.robuxPackages
			
			if RobuxPackages ~= nil and #RobuxPackages > 1 then
				Flag = true
				break
			end
		end
		if not Flag then
			return Tbl
		end
		local Copy = table.clone(Tbl)
		
		for i, value1 in ipairs(Tbl) do
			local RobuxPackages = value1.robuxPackages
			
			if RobuxPackages ~= nil and #RobuxPackages > 1 then
				Copy[i] = {
					id = value1.id,
					name = value1.name,
					items = value1.items,
					categoryType = value1.categoryType,
					stableCategoryId = value1.stableCategoryId,
					categoryGroup = value1.categoryGroup,
					paymentSessionId = value1.paymentSessionId,
					bonusJwt = value1.bonusJwt,
					robuxPackages = SortRobuxPackagesByAmountDescendingModule(RobuxPackages),
					featuredRobuxPackage = value1.featuredRobuxPackage
				}
			end
		end
		return Copy
	end
	
	local _ = function()
		-- upvalues: PromoteBonusRobuxPackageToTopPicksModule (upval), WithoutFeaturedPromotionResult (ref), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy)
		Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
	end
	
	local _ = function(p1)
		-- upvalues: FindTopPicksSectionIndexModule (upval), WithoutFeaturedPromotionResult (ref), MoveItemToPositionInShopModule (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy)
		local TopPicksSectionIndexModule = FindTopPicksSectionIndexModule(WithoutFeaturedPromotionResult)
		
		if TopPicksSectionIndexModule ~= nil then
			WithoutFeaturedPromotionResult = MoveItemToPositionInShopModule(WithoutFeaturedPromotionResult, TopPicksSectionIndexModule, p1, "GamePass", 1)
		end
		Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
	end
	
	local function writeOwnership(Key, p1)
		-- upvalues: Signal8 (copy), Signal2_7 (copy), FFlagEnableRobuxInExperienceShop (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), WithoutFeaturedPromotionResult (ref), BonusPromotionEligibilityModule (upval), Tbl (copy), Signal2_9 (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy)
		local Copy = table.clone(Signal8(false))
		Copy[Key] = p1
		Signal2_7(Copy)
		
		if not p1 or not FFlagEnableRobuxInExperienceShop then return end
		local FirstBonusRobuxPackage = PromoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(WithoutFeaturedPromotionResult)
		local BonusGamePassId = if FirstBonusRobuxPackage == nil then nil else PromoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(FirstBonusRobuxPackage)
		
		if BonusGamePassId ~= nil and BonusGamePassId == Key then
			Tbl[Key] = BonusPromotionEligibilityModule.Ineligible
			Signal2_9(table.clone(Tbl))
			Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
			
			return
		end
	end
	
	local function fetchOwnedGamePass(Number)
		-- upvalues: FFlagUseGetGamePassOwnershipApi (upval), Players (upval), PromiseModule (upval), FFlagMockGetGamePassOwnershipModule (upval), MockGetPassOwnershipModule (upval), GetPassOwnershipModule (upval), FFlagShopUseMockUserOwnsGamePassModule (upval), MockUserOwnsGamePassModule (upval), UserOwnsGamePassModule (upval)
		if FFlagUseGetGamePassOwnershipApi then
			local LocalPlayer = Players.LocalPlayer
			
			return if LocalPlayer == nil then PromiseModule.reject("fetchOwnedGamePass: no LocalPlayer") elseif FFlagMockGetGamePassOwnershipModule then MockGetPassOwnershipModule.getPassOwnership(LocalPlayer, Number) else GetPassOwnershipModule.getPassOwnership(LocalPlayer, Number):andThen(function(Result): boolean
				return Result ~= nil and Result.Owned == true
			end)
		else
			return (if FFlagShopUseMockUserOwnsGamePassModule then MockUserOwnsGamePassModule else UserOwnsGamePassModule)(Number)
		end
	end
	
	local function fetchGamePassOwnership(Key)
		-- upvalues: t (copy), Signal8 (copy), fetchOwnedGamePass (copy), writeOwnership (copy)
		if t[Key] then return end
		if Signal8(false)[Key] ~= nil then return end
		local Number: number? = tonumber(Key)
		
		if Number ~= nil then
			t[Key] = true
			fetchOwnedGamePass(Number):andThen(function(Result)
				-- upvalues: Signal8 (upval), Key (copy), writeOwnership (upval)
				if Signal8(false)[Key] == nil then
					writeOwnership(Key, Result)
					
					return
				end
			end):catch(function(Err)
				-- upvalues: Key (copy)
				warn("[Shop] fetchGamePassOwnership failed", Key, (tostring(Err)))
			end):finally(function()
				-- upvalues: t (upval), Key (copy)
				t[Key] = nil
			end)
			
			return
		end
	end
	
	local Callback = nil
	
	local _ = function()
		-- upvalues: Flag2 (ref), Flag5 (ref), Flag1 (ref), Flag (ref), Callback (ref)
		if Flag2 and Flag5 and not Flag1 and not Flag then
			Callback()
		end
	end
	
	Callback = function()
		-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (upval), Flag1 (ref), Flag (ref), Flag2 (ref), FFlagShopUseMockGamePassTrialAvailabilitiesModule (upval), MockGamePassTrialAvailabilitiesModule (upval), FetchGamePassTrialAvailabilitiesModule (upval), Signal2_8 (copy), Flag5 (ref), Callback (ref)
		if not FFlagLuaAppEnableGamePassFreeTrialsModule then return end
		if not Flag1 and not Flag then
			Flag2 = false
			Flag = true;
			(if FFlagShopUseMockGamePassTrialAvailabilitiesModule then MockGamePassTrialAvailabilitiesModule.fetchGamePassTrialAvailabilities else FetchGamePassTrialAvailabilitiesModule.fetchGamePassTrialAvailabilities)(game.GameId):andThen(function(Result)
				-- upvalues: Signal2_8 (upval), Flag1 (upval)
				Signal2_8(Result)
				Flag1 = true
			end):catch(function(Err)
				warn("[Shop] hydrateGamePassTrialAvailabilities failed", if typeof(Err) == "table" and Err.errorMessage ~= nil then Err.errorMessage else Err)
			end):finally(function()
				-- upvalues: Flag (upval), Flag2 (upval), Flag5 (upval), Flag1 (upval), Callback (upval)
				Flag = false
				
				if Flag2 and Flag5 and not Flag1 and not Flag then
					Callback()
				end
			end)
			
			return
		end
	end
	
	local Signal15, Signal2_14 = CreateSignalFunction({})
	
	local _ = function(Key, p1)
		-- upvalues: Signal15 (copy), Signal2_14 (copy)
		local Copy = table.clone(Signal15(false))
		
		if p1 then
			Copy[Key] = true
		else
			Copy[Key] = nil
		end
		Signal2_14(Copy)
	end
	
	local _ = function(p1)
		-- upvalues: Players (upval), MarketplaceService (upval)
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer == nil then return end
		local Success, Result = pcall(function()
			-- upvalues: MarketplaceService (copy), LocalPlayer (copy), p1 (copy)
			MarketplaceService:SignalGamePassFreeTrialRedeemed(LocalPlayer, p1)
		end)
		
		if not Success then
			warn("[Shop] SignalGamePassFreeTrialRedeemed failed", p1, Result)
		end
	end
	
	local function markGamePassTrialActive(Key)
		-- upvalues: Signal9 (copy), Signal2_8 (copy)
		local SignalResult = Signal9(false)
		local Copy = table.clone(SignalResult.available)
		local Copy1 = table.clone(SignalResult.active)
		Copy[Key] = nil
		Copy1[Key] = true
		Signal2_8({ available = Copy, active = Copy1 })
	end
	
	local function redeemGamePassTrial(Key)
		-- upvalues: Signal15 (copy), FFlagShopUseMockGamePassTrialRedemptionModule (upval), markGamePassTrialActive (copy), FindTopPicksSectionIndexModule (upval), WithoutFeaturedPromotionResult (ref), MoveItemToPositionInShopModule (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy), Players (upval), MarketplaceService (upval), Signal2_14 (copy), RedeemGamePassTrialModule (upval), FetchGamePassTrialAvailabilitiesModule (upval), Signal2_8 (copy), Flag1 (ref)
		if Signal15(false)[Key] then return end
		if FFlagShopUseMockGamePassTrialRedemptionModule then
			markGamePassTrialActive(Key)
			local TopPicksSectionIndexModule = FindTopPicksSectionIndexModule(WithoutFeaturedPromotionResult)
			
			if TopPicksSectionIndexModule ~= nil then
				WithoutFeaturedPromotionResult = MoveItemToPositionInShopModule(WithoutFeaturedPromotionResult, TopPicksSectionIndexModule, Key, "GamePass", 1)
			end
			Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
			local Number1: number? = tonumber(Key)
			
			if Number1 ~= nil then
				local LocalPlayer = Players.LocalPlayer
				
				if LocalPlayer == nil then return end
				local Success, Result = pcall(function()
					-- upvalues: MarketplaceService (copy), LocalPlayer (copy), Number1 (copy)
					MarketplaceService:SignalGamePassFreeTrialRedeemed(LocalPlayer, Number1)
				end)
				
				if not Success then
					warn("[Shop] SignalGamePassFreeTrialRedeemed failed", Number1, Result)
				end
			end
			return
		else
			local Number: number? = tonumber(Key)
			
			if Number == nil then
				warn("[Shop] redeemGamePassTrial skipped, gamePassId is not numeric", Key)
				
				return
			else
				local Copy = table.clone(Signal15(false))
				Copy[Key] = true
				Signal2_14(Copy)
				local Flag = false
				RedeemGamePassTrialModule.redeemGamePassTrial(Number):andThen(function()
					-- upvalues: Flag (ref), Key (copy), FindTopPicksSectionIndexModule (upval), WithoutFeaturedPromotionResult (upval), MoveItemToPositionInShopModule (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), Number (copy), Players (upval), MarketplaceService (upval), FetchGamePassTrialAvailabilitiesModule (upval)
					Flag = true
					local TopPicksSectionIndexModule = FindTopPicksSectionIndexModule(WithoutFeaturedPromotionResult)
					
					if TopPicksSectionIndexModule ~= nil then
						WithoutFeaturedPromotionResult = MoveItemToPositionInShopModule(WithoutFeaturedPromotionResult, TopPicksSectionIndexModule, Key, "GamePass", 1)
					end
					Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
					local LocalPlayer = Players.LocalPlayer
					
					if LocalPlayer ~= nil then
						local Success, Result = pcall(function()
							-- upvalues: MarketplaceService (copy), LocalPlayer (copy), Number (copy)
							MarketplaceService:SignalGamePassFreeTrialRedeemed(LocalPlayer, Number)
						end)
						
						if not Success then
							warn("[Shop] SignalGamePassFreeTrialRedeemed failed", Number, Result)
						end
					end
					return FetchGamePassTrialAvailabilitiesModule.fetchGamePassTrialAvailabilities(game.GameId)
				end):andThen(function(Result)
					-- upvalues: Signal2_8 (upval), Flag1 (upval), Key (copy), markGamePassTrialActive (upval)
					Signal2_8(Result)
					Flag1 = true
					
					if Result.available[Key] then
						markGamePassTrialActive(Key)
					end
				end):catch(function(Err)
					-- upvalues: Key (copy), Flag (ref), markGamePassTrialActive (upval)
					warn("[Shop] redeemGamePassTrial failed", Key, (tostring(Err)))
					
					if Flag then
						markGamePassTrialActive(Key)
					end
				end):finally(function()
					-- upvalues: Key (copy), Signal15 (upval), Signal2_14 (upval)
					local Copy = table.clone(Signal15(false))
					Copy[Key] = nil
					Signal2_14(Copy)
				end)
			end
		end
	end
	
	local function fetchBonusGamePassOwnershipForPromotionId(Key)
		-- upvalues: FFlagRefetchRobuxWidgetAfterPurchaseModule (upval), t1 (copy), ShopDebugLoggerModule (upval), t2 (copy), BonusPromotionEligibilityModule (upval), Tbl (copy), Signal2_9 (copy), PromoteBonusRobuxPackageToTopPicksModule (upval), WithoutFeaturedPromotionResult (ref), Signal2_1 (copy), sortRobuxPackagesInSections (copy), fetchOwnedGamePass (copy), Signal8 (copy), writeOwnership (copy)
		if FFlagRefetchRobuxWidgetAfterPurchaseModule and t1[Key] then
			ShopDebugLoggerModule.logLazy(function(): string
				-- upvalues: Key (copy)
				return "fetchBonusGamePassOwnershipForPromotion: skip, poll in flight itemId=" .. Key
			end)
			
			return
		end
		if t2[Key] then return end
		Tbl[Key] = BonusPromotionEligibilityModule.Unknown
		Signal2_9(table.clone(Tbl))
		Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
		local Number: number? = tonumber(Key)
		
		if Number == nil then
			Tbl[Key] = BonusPromotionEligibilityModule.Ineligible
			Signal2_9(table.clone(Tbl))
			Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
			
			return
		else
			t2[Key] = true
			fetchOwnedGamePass(Number):andThen(function(Result)
				-- upvalues: Key (copy), BonusPromotionEligibilityModule (upval), Tbl (upval), Signal2_9 (upval), Signal8 (upval), writeOwnership (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), WithoutFeaturedPromotionResult (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval)
				Tbl[Key] = if Result then BonusPromotionEligibilityModule.Ineligible else BonusPromotionEligibilityModule.Eligible
				Signal2_9(table.clone(Tbl))
				
				if Signal8(false)[Key] == nil then
					writeOwnership(Key, Result)
				end
				Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
			end):catch(function(Err)
				-- upvalues: Key (copy), BonusPromotionEligibilityModule (upval), Tbl (upval), Signal2_9 (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), WithoutFeaturedPromotionResult (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval)
				warn("[Shop] fetchBonusGamePassOwnershipForPromotion failed", Key, (tostring(Err)))
				Tbl[Key] = BonusPromotionEligibilityModule.Ineligible
				Signal2_9(table.clone(Tbl))
				Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
			end):finally(function()
				-- upvalues: t2 (upval), Key (copy)
				t2[Key] = nil
			end)
		end
	end
	
	local function fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
		-- upvalues: FFlagEnableRobuxInExperienceShop (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), fetchBonusGamePassOwnershipForPromotionId (copy)
		if not FFlagEnableRobuxInExperienceShop then return end
		local FirstBonusRobuxPackage = PromoteBonusRobuxPackageToTopPicksModule.findFirstBonusRobuxPackage(WithoutFeaturedPromotionResult)
		local BonusGamePassId = if FirstBonusRobuxPackage == nil then nil else PromoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(FirstBonusRobuxPackage)
		local T = if BonusGamePassId == nil then {} else { BonusGamePassId }
		for _, value in T do
			fetchBonusGamePassOwnershipForPromotionId(value)
		end
	end
	
	local _ = function(p1)
		-- upvalues: WithoutFeaturedPromotionResult (ref), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy)
		WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(p1)
		Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
		fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
	end
	
	local _ = function(p1)
		-- upvalues: FFlagEnableExperienceShopGlobalIconModule (upval), Signal2_4 (copy), FFlagInExperienceShopExpectStringMetadataValuesModule (upval), Signal2_5 (copy), Signal2_6 (copy)
		if FFlagEnableExperienceShopGlobalIconModule then
			local Metadata = p1.metadata
			Signal2_4(Metadata)
			local InExperienceGlobalIconEnabled = if Metadata == nil then nil else Metadata.inExperienceGlobalIconEnabled
			Signal2_5(if FFlagInExperienceShopExpectStringMetadataValuesModule then InExperienceGlobalIconEnabled == "true" else InExperienceGlobalIconEnabled == true)
			Signal2_6(Metadata ~= nil and Metadata.newOffers == true)
		end
	end
	
	local _ = function(p1)
		-- upvalues: FFlagHideOfferNotificationsWhenShopEmpty (upval), InExperienceOffersModule (upval), HasOfferEligibleCategoryModule (upval)
		if FFlagHideOfferNotificationsWhenShopEmpty then
			InExperienceOffersModule.getOffersStore(false).setShopHasItems(HasOfferEligibleCategoryModule(p1.categories))
		end
	end
	
	local function buildProductInfoRequestsForHydration(WithoutFeaturedPromotionResult, FailedItems)
		-- upvalues: InExperienceShop (upval), FFlagEnableRobuxInExperienceShop (upval)
		local RefreshShopItemsModule = require(InExperienceShop.Api.refreshShopItems)
		local HydrateRobuxBonusItemsModule = require(InExperienceShop.Api.hydrateRobuxBonusItems)
		local RequestsFromSections = RefreshShopItemsModule.buildRequestsFromSections(WithoutFeaturedPromotionResult)
		
		if FFlagEnableRobuxInExperienceShop then
			HydrateRobuxBonusItemsModule.appendBonusItemRequests(RequestsFromSections, WithoutFeaturedPromotionResult)
		end
		RefreshShopItemsModule.appendFailedItemRequests(RequestsFromSections, FailedItems)
		
		return RequestsFromSections
	end
	
	local function applyStreamingProductInfoResult(p1, p2, List)
		-- upvalues: InExperienceShop (upval), FFlagEnableRobuxInExperienceShop (upval)
		local RefreshShopItemsModule = require(InExperienceShop.Api.refreshShopItems)
		local HydrateRobuxBonusItemsModule = require(InExperienceShop.Api.hydrateRobuxBonusItems)
		local MakeRequestKeyFunction = require(InExperienceShop.Api.shopItemMapping).makeRequestKey
		local RequestKey = MakeRequestKeyFunction(p2.request.id, p2.request.infoType)
		local List1 = {}
		local List2 = {}
		
		for _, value in List do
			if MakeRequestKeyFunction(value.id, value.infoType) == RequestKey then
				table.insert(List1, value)
			else
				table.insert(List2, value)
			end
		end
		local MergeProductInfoIntoSectionsResult = RefreshShopItemsModule.mergeProductInfoIntoSections(p1, { p2 })
		local InsertRecoveredItemsIntoSectionsResult, InsertRecoveredItemsIntoSectionsResult2 = RefreshShopItemsModule.insertRecoveredItemsIntoSections(if FFlagEnableRobuxInExperienceShop then HydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(MergeProductInfoIntoSectionsResult, { p2 }) else MergeProductInfoIntoSectionsResult, { p2 }, List1)
		
		for _, value1 in InsertRecoveredItemsIntoSectionsResult2 do
			table.insert(List2, value1)
		end
		return InsertRecoveredItemsIntoSectionsResult, List2
	end
	
	local function routeStreamMultiGetProductInfo(p3, OnResult)
		-- upvalues: FFlagShopUseMockDataModule (upval), FFlagShopUseMockMultiGetProductInfoModule (upval), MockMultiGetProductInfoModule (upval), StreamMultiGetProductInfoModule (upval)
		return if FFlagShopUseMockDataModule and FFlagShopUseMockMultiGetProductInfoModule then MockMultiGetProductInfoModule.streamMultiGetProductInfo(p3, { onResult = OnResult }, 0) else StreamMultiGetProductInfoModule(p3, { onResult = OnResult })
	end
	
	local function streamProductInfoIntoSections(WithoutFeaturedPromotionResult1, RequestsFromSections, FailedItems1, Callback: (any) -> ())
		-- upvalues: Flag8 (ref), WithoutFeaturedPromotionResult (ref), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), routeStreamMultiGetProductInfo (copy), applyStreamingProductInfoResult (copy), FailedItems (ref), LogCounterModule (upval), ProductInfoFailedItemsCounterModule (upval)
		if #RequestsFromSections ~= 0 then
			Flag8 = true
			local WithoutFeaturedPromotionResult2 = WithoutFeaturedPromotionResult1
			local FailedItems2 = FailedItems1
			local v4 = nil
			local Flag = false
			
			local function flushPendingSections()
				-- upvalues: Flag (ref), v4 (ref), WithoutFeaturedPromotionResult (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), fetchBonusGamePassOwnershipForPromotion (upval)
				Flag = false
				
				if v4 ~= nil then
					WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(v4)
					Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
					fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
					v4 = nil
				end
			end
			
			local function _(p3)
				-- upvalues: v4 (ref), Flag (ref), flushPendingSections (copy)
				v4 = p3
				
				if not Flag then
					Flag = true
					task.delay(0.05, flushPendingSections)
					
					return
				end
			end
			
			routeStreamMultiGetProductInfo(RequestsFromSections, function(p3)
				-- upvalues: WithoutFeaturedPromotionResult2 (ref), FailedItems2 (ref), applyStreamingProductInfoResult (upval), v4 (ref), Flag (ref), flushPendingSections (copy)
				WithoutFeaturedPromotionResult2, FailedItems2 = applyStreamingProductInfoResult(WithoutFeaturedPromotionResult2, p3, FailedItems2)
				v4 = WithoutFeaturedPromotionResult2
				
				if not Flag then
					Flag = true
					task.delay(0.05, flushPendingSections)
					
					return
				end
			end):andThen(function(_)
				-- upvalues: Flag (ref), v4 (ref), WithoutFeaturedPromotionResult (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), fetchBonusGamePassOwnershipForPromotion (upval), WithoutFeaturedPromotionResult2 (ref), FailedItems (upval), FailedItems2 (ref), LogCounterModule (upval), ProductInfoFailedItemsCounterModule (upval), Flag8 (upval), Callback (copy)
				Flag = false
				
				if v4 ~= nil then
					WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(v4)
					Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
					fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
					v4 = nil
				end
				WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(WithoutFeaturedPromotionResult2)
				Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
				fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
				FailedItems = FailedItems2
				
				if #FailedItems2 > 0 then
					LogCounterModule(ProductInfoFailedItemsCounterModule, #FailedItems2)
				end
				Flag8 = false
				
				if Callback then
					Callback(FailedItems2)
				end
			end):catch(function(Err)
				-- upvalues: Flag (ref), v4 (ref), WithoutFeaturedPromotionResult (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), fetchBonusGamePassOwnershipForPromotion (upval), Flag8 (upval), Callback (copy), FailedItems2 (ref)
				warn("[Shop] streamProductInfoIntoSections failed", (tostring(Err)))
				Flag = false
				
				if v4 ~= nil then
					WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(v4)
					Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
					fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
					v4 = nil
				end
				Flag8 = false
				
				if Callback then
					Callback(FailedItems2)
				end
			end)
			
			return
		elseif Callback then
			Callback(FailedItems1)
		end
	end
	
	local function runShopFetch(Callback2, Callback1, p3)
		-- upvalues: Flag5 (ref), Flag4 (ref), Signal2_2 (copy), Signal2_3 (copy), Flag6 (ref), Callback (ref), FFlagShopUseMockDataModule (upval), ErrorsModule (upval), Signal2 (copy), WithoutFeaturedPromotionResult (ref), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), FFlagEnableExperienceShopGlobalIconModule (upval), Signal2_4 (copy), FFlagInExperienceShopExpectStringMetadataValuesModule (upval), Signal2_5 (copy), Signal2_6 (copy), FFlagHideOfferNotificationsWhenShopEmpty (upval), InExperienceOffersModule (upval), HasOfferEligibleCategoryModule (upval), FailedItems (ref), Flag2 (ref), Flag1 (ref), Flag (ref), FFlagEnableOffersPrefetch (upval), list (upval)
		if Flag5 or Flag4 then return end
		Flag4 = true
		Signal2_2(true)
		Signal2_3(nil)
		local NoFlag6 = not Flag6
		Flag6 = true
		
		if NoFlag6 then
			Callback()
		end;
		(if FFlagShopUseMockDataModule then Callback1() else Callback2()):andThen(function(Result)
			-- upvalues: ErrorsModule (upval), p3 (copy), Signal2 (upval), WithoutFeaturedPromotionResult (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), fetchBonusGamePassOwnershipForPromotion (upval), FFlagEnableExperienceShopGlobalIconModule (upval), Signal2_4 (upval), FFlagInExperienceShopExpectStringMetadataValuesModule (upval), Signal2_5 (upval), Signal2_6 (upval), FFlagHideOfferNotificationsWhenShopEmpty (upval), InExperienceOffersModule (upval), HasOfferEligibleCategoryModule (upval), FailedItems (upval), Signal2_2 (upval), Flag4 (upval), Flag5 (upval), NoFlag6 (copy), Callback (upval), Flag2 (upval), Flag1 (upval), Flag (upval), FFlagEnableOffersPrefetch (upval), list (upval)
			if type(Result) ~= "table" or (type(Result.categories) ~= "table" or type(Result.sections) ~= "table") then
				return ErrorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p3), Result)
			end
			Signal2(Result.categories)
			WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(Result.sections)
			Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
			fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
			
			if FFlagEnableExperienceShopGlobalIconModule then
				local Metadata = Result.metadata
				Signal2_4(Metadata)
				local InExperienceGlobalIconEnabled = if Metadata == nil then nil else Metadata.inExperienceGlobalIconEnabled
				Signal2_5(if FFlagInExperienceShopExpectStringMetadataValuesModule then InExperienceGlobalIconEnabled == "true" else InExperienceGlobalIconEnabled == true)
				Signal2_6(Metadata ~= nil and Metadata.newOffers == true)
			end
			if FFlagHideOfferNotificationsWhenShopEmpty then
				InExperienceOffersModule.getOffersStore(false).setShopHasItems(HasOfferEligibleCategoryModule(Result.categories))
			end
			FailedItems = Result.failedItems or {}
			Signal2_2(false)
			Flag4 = false
			Flag5 = true
			
			if NoFlag6 then
				if Flag2 and Flag5 and not Flag1 and not Flag then
					Callback()
				end
			else
				Callback()
			end
			if not FFlagEnableOffersPrefetch then
				InExperienceOffersModule.getOffersStore(false).fetchOffers(list)
			end
		end):catch(function(Err)
			-- upvalues: Signal2_3 (upval), Signal2 (upval), Signal2_1 (upval), FailedItems (upval), Signal2_2 (upval), Flag4 (upval)
			Signal2_3(Err)
			Signal2({})
			Signal2_1({})
			FailedItems = {}
			Signal2_2(false)
			Flag4 = false
		end)
	end
	
	local function runPartialDisplayShopFetch(Callback2, Callback1, p3)
		-- upvalues: Flag5 (ref), Flag4 (ref), Signal2_2 (copy), Signal2_3 (copy), Flag6 (ref), Callback (ref), FFlagShopUseMockDataModule (upval), ErrorsModule (upval), Signal2 (copy), WithoutFeaturedPromotionResult (ref), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy), FFlagEnableExperienceShopGlobalIconModule (upval), Signal2_4 (copy), FFlagInExperienceShopExpectStringMetadataValuesModule (upval), Signal2_5 (copy), Signal2_6 (copy), FFlagHideOfferNotificationsWhenShopEmpty (upval), InExperienceOffersModule (upval), HasOfferEligibleCategoryModule (upval), FailedItems (ref), Flag2 (ref), Flag1 (ref), Flag (ref), FFlagEnableOffersPrefetch (upval), list (upval), buildProductInfoRequestsForHydration (copy), streamProductInfoIntoSections (copy)
		if Flag5 or Flag4 then return end
		Flag4 = true
		Signal2_2(true)
		Signal2_3(nil)
		local NoFlag6 = not Flag6
		Flag6 = true
		
		if NoFlag6 then
			Callback()
		end;
		(if FFlagShopUseMockDataModule then Callback1() else Callback2()):andThen(function(Result)
			-- upvalues: ErrorsModule (upval), p3 (copy), Signal2 (upval), WithoutFeaturedPromotionResult (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), fetchBonusGamePassOwnershipForPromotion (upval), FFlagEnableExperienceShopGlobalIconModule (upval), Signal2_4 (upval), FFlagInExperienceShopExpectStringMetadataValuesModule (upval), Signal2_5 (upval), Signal2_6 (upval), FFlagHideOfferNotificationsWhenShopEmpty (upval), InExperienceOffersModule (upval), HasOfferEligibleCategoryModule (upval), FailedItems (upval), Signal2_2 (upval), Flag4 (upval), Flag5 (upval), NoFlag6 (copy), Callback (upval), Flag2 (upval), Flag1 (upval), Flag (upval), FFlagEnableOffersPrefetch (upval), list (upval), buildProductInfoRequestsForHydration (upval), streamProductInfoIntoSections (upval)
			if type(Result) ~= "table" or (type(Result.categories) ~= "table" or type(Result.sections) ~= "table") then
				return ErrorsModule.rejectSchema(string.format("createInExperienceShopStore: %s payload missing categories/sections", p3), Result)
			end
			Signal2(Result.categories)
			WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(Result.sections)
			Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
			fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
			
			if FFlagEnableExperienceShopGlobalIconModule then
				local Metadata = Result.metadata
				Signal2_4(Metadata)
				local InExperienceGlobalIconEnabled = if Metadata == nil then nil else Metadata.inExperienceGlobalIconEnabled
				Signal2_5(if FFlagInExperienceShopExpectStringMetadataValuesModule then InExperienceGlobalIconEnabled == "true" else InExperienceGlobalIconEnabled == true)
				Signal2_6(Metadata ~= nil and Metadata.newOffers == true)
			end
			if FFlagHideOfferNotificationsWhenShopEmpty then
				InExperienceOffersModule.getOffersStore(false).setShopHasItems(HasOfferEligibleCategoryModule(Result.categories))
			end
			FailedItems = Result.failedItems or {}
			Signal2_2(false)
			Flag4 = false
			Flag5 = true
			
			if NoFlag6 then
				if Flag2 and Flag5 and not Flag1 and not Flag then
					Callback()
				end
			else
				Callback()
			end
			if not FFlagEnableOffersPrefetch then
				InExperienceOffersModule.getOffersStore(false).fetchOffers(list)
			end
			local WithoutFeaturedPromotionResult1 = WithoutFeaturedPromotionResult
			streamProductInfoIntoSections(WithoutFeaturedPromotionResult1, buildProductInfoRequestsForHydration(WithoutFeaturedPromotionResult1, FailedItems), FailedItems, nil)
		end):catch(function(Err)
			-- upvalues: Signal2_3 (upval), Signal2 (upval), Signal2_1 (upval), FailedItems (upval), Signal2_2 (upval), Flag4 (upval)
			Signal2_3(Err)
			Signal2({})
			Signal2_1({})
			FailedItems = {}
			Signal2_2(false)
			Flag4 = false
		end)
	end
	
	local function fetchAllShopData()
		-- upvalues: FFlagEnablePartialDisplayInExperienceShopModule (upval), runPartialDisplayShopFetch (copy), FetchShopWidgetsOnlyModule (upval), MockFetchAllShopDataModule (upval), runShopFetch (copy), FetchAllShopDataModule (upval)
		if if typeof(FFlagEnablePartialDisplayInExperienceShopModule) == "function" then FFlagEnablePartialDisplayInExperienceShopModule() else FFlagEnablePartialDisplayInExperienceShopModule then
			runPartialDisplayShopFetch(FetchShopWidgetsOnlyModule, MockFetchAllShopDataModule.fetchShopWidgetsOnly, "fetchAllShopData")
			
			return
		else
			runShopFetch(FetchAllShopDataModule, MockFetchAllShopDataModule.fetchAllShopData, "fetchAllShopData")
		end
	end
	
	local function prefetchWidgetsOnly()
		-- upvalues: runShopFetch (copy), FetchShopWidgetsOnlyModule (upval), MockFetchAllShopDataModule (upval)
		runShopFetch(FetchShopWidgetsOnlyModule, MockFetchAllShopDataModule.fetchShopWidgetsOnly, "prefetchWidgetsOnly")
	end
	
	local function refreshShopItemInfo()
		-- upvalues: FFlagEnableShopProductInfoRefreshModule (upval), Flag5 (ref), Flag7 (ref), Flag8 (ref), InExperienceShop (upval), WithoutFeaturedPromotionResult (ref), Signal1 (copy), FFlagEnableRobuxInExperienceShop (upval), FailedItems (ref), FFlagEnablePartialDisplayInExperienceShopModule (upval), streamProductInfoIntoSections (copy), FFlagShopUseMockDataModule (upval), FFlagShopUseMockMultiGetProductInfoModule (upval), MockMultiGetProductInfoModule (upval), MultiGetProductInfoModule (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy)
		if not FFlagEnableShopProductInfoRefreshModule then return end
		if not Flag5 or Flag7 or Flag8 then return end
		local RefreshShopItemsModule = require(InExperienceShop.Api.refreshShopItems)
		local HydrateRobuxBonusItemsModule = require(InExperienceShop.Api.hydrateRobuxBonusItems)
		local WithoutFeaturedPromotionResult1 = if #WithoutFeaturedPromotionResult > 0 then WithoutFeaturedPromotionResult else Signal1(false)
		local RequestsFromSections = RefreshShopItemsModule.buildRequestsFromSections(WithoutFeaturedPromotionResult1)
		
		if FFlagEnableRobuxInExperienceShop then
			HydrateRobuxBonusItemsModule.appendBonusItemRequests(RequestsFromSections, WithoutFeaturedPromotionResult1)
		end
		local FailedItems1 = FailedItems
		RefreshShopItemsModule.appendFailedItemRequests(RequestsFromSections, FailedItems1)
		
		if #RequestsFromSections == 0 then return end
		Flag7 = true
		
		if if typeof(FFlagEnablePartialDisplayInExperienceShopModule) == "function" then FFlagEnablePartialDisplayInExperienceShopModule() else FFlagEnablePartialDisplayInExperienceShopModule then
			streamProductInfoIntoSections(WithoutFeaturedPromotionResult1, RequestsFromSections, FailedItems1, function()
				-- upvalues: Flag7 (upval)
				Flag7 = false
			end)
			
			return
		else
			(if FFlagShopUseMockDataModule and FFlagShopUseMockMultiGetProductInfoModule then MockMultiGetProductInfoModule.multiGetProductInfo(RequestsFromSections, 0) else MultiGetProductInfoModule(RequestsFromSections)):andThen(function(Result)
				-- upvalues: RefreshShopItemsModule (copy), WithoutFeaturedPromotionResult1 (copy), FFlagEnableRobuxInExperienceShop (upval), HydrateRobuxBonusItemsModule (copy), FailedItems1 (copy), FailedItems (upval), WithoutFeaturedPromotionResult (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), fetchBonusGamePassOwnershipForPromotion (upval), Flag7 (upval)
				local MergeProductInfoIntoSectionsResult = RefreshShopItemsModule.mergeProductInfoIntoSections(WithoutFeaturedPromotionResult1, Result)
				local InsertRecoveredItemsIntoSectionsResult, InsertRecoveredItemsIntoSectionsResult2 = RefreshShopItemsModule.insertRecoveredItemsIntoSections(if FFlagEnableRobuxInExperienceShop then HydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections(MergeProductInfoIntoSectionsResult, Result) else MergeProductInfoIntoSectionsResult, Result, FailedItems1)
				FailedItems = InsertRecoveredItemsIntoSectionsResult2
				WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(InsertRecoveredItemsIntoSectionsResult)
				Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
				fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
				Flag7 = false
			end):catch(function(Err)
				-- upvalues: Flag7 (upval)
				warn("[Shop] refreshShopItemInfo failed", (tostring(Err)))
				Flag7 = false
			end)
		end
	end
	
	local function onShopOpened()
		-- upvalues: FFlagOfferNineDotActivityIndicator (upval), FFlagOfferNotifyOnGlobalIcon (upval), InExperienceOffersModule (upval), FFlagEnableShopExposureLoggingModule (upval), RunService (upval), Parent (upval), FStringExperienceShopIXPLayersCommaSeparatedModule (upval), FFlagLuaAppEnableGamePassFreeTrialsModule (upval), Flag1 (ref), Flag5 (ref), Flag (ref), Callback (ref), Flag2 (ref), FFlagEnablePartialDisplayInExperienceShopModule (upval), runPartialDisplayShopFetch (copy), FetchShopWidgetsOnlyModule (upval), MockFetchAllShopDataModule (upval), runShopFetch (copy), FetchAllShopDataModule (upval), refreshShopItemInfo (copy)
		if FFlagOfferNineDotActivityIndicator or FFlagOfferNotifyOnGlobalIcon then
			InExperienceOffersModule.getOffersStore(false).markInExperienceShopOpened()
		end
		if FFlagEnableShopExposureLoggingModule and not RunService:IsStudio() then
			local IXPServiceWrapper = require(Parent.IxpServiceWrapper).IXPServiceWrapper
			
			for _, value in string.split(FStringExperienceShopIXPLayersCommaSeparatedModule, ",") do
				local Match: string? = string.match(value, "^%s*(.-)%s*$")
				
				if Match ~= nil and Match ~= "" then
					IXPServiceWrapper:LogUserLayerExposure(Match)
				end
			end
		end
		if FFlagLuaAppEnableGamePassFreeTrialsModule and not Flag1 then
			if Flag5 and not Flag then
				Callback()
			else
				Flag2 = true
			end
		end
		if if typeof(FFlagEnablePartialDisplayInExperienceShopModule) == "function" then FFlagEnablePartialDisplayInExperienceShopModule() else FFlagEnablePartialDisplayInExperienceShopModule then
			runPartialDisplayShopFetch(FetchShopWidgetsOnlyModule, MockFetchAllShopDataModule.fetchShopWidgetsOnly, "fetchAllShopData")
		else
			runShopFetch(FetchAllShopDataModule, MockFetchAllShopDataModule.fetchAllShopData, "fetchAllShopData")
		end
		refreshShopItemInfo()
	end
	
	local function refreshRobuxWidgetsAfterPurchase()
		-- upvalues: FFlagRefetchRobuxWidgetAfterPurchaseModule (upval), PromiseModule (upval), Flag5 (ref), Flag3 (ref), ShopDebugLoggerModule (upval), FFlagShopUseMockDataModule (upval), MockFetchAllShopDataModule (upval), FetchRobuxWidgetsAfterPurchaseModule (upval), MergeRobuxShopDataModule (upval), Signal (copy), WithoutFeaturedPromotionResult (ref), Signal2 (copy), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (copy), Signal2_1 (copy), sortRobuxPackagesInSections (copy), fetchBonusGamePassOwnershipForPromotion (copy)
		if not FFlagRefetchRobuxWidgetAfterPurchaseModule then
			return PromiseModule.resolve()
		elseif not Flag5 then
			return PromiseModule.resolve()
		elseif Flag3 then
			return PromiseModule.resolve()
		else
			Flag3 = true
			ShopDebugLoggerModule.log("refreshRobuxWidgetsAfterPurchase: start")
			
			return (if FFlagShopUseMockDataModule then MockFetchAllShopDataModule.fetchRobuxWidgetsAfterPurchase(0) else FetchRobuxWidgetsAfterPurchaseModule.fetchRobuxWidgetsAfterPurchase()):andThen(function(Result)
				-- upvalues: ShopDebugLoggerModule (upval), MergeRobuxShopDataModule (upval), Signal (upval), WithoutFeaturedPromotionResult (upval), Signal2 (upval), PromoteBonusRobuxPackageToTopPicksModule (upval), Tbl (upval), Signal2_1 (upval), sortRobuxPackagesInSections (upval), fetchBonusGamePassOwnershipForPromotion (upval)
				if type(Result) == "table" and (type(Result.categories) == "table" and type(Result.sections) == "table") then
					local MergeRobuxShopDataModuleResult, MergeRobuxShopDataModuleResult2 = MergeRobuxShopDataModule(Signal(false), WithoutFeaturedPromotionResult, Result)
					Signal2(MergeRobuxShopDataModuleResult)
					WithoutFeaturedPromotionResult = PromoteBonusRobuxPackageToTopPicksModule.withoutFeaturedPromotion(MergeRobuxShopDataModuleResult2)
					Signal2_1((sortRobuxPackagesInSections((PromoteBonusRobuxPackageToTopPicksModule.promoteBonusRobuxPackageToTopPicks(WithoutFeaturedPromotionResult, Tbl)))))
					fetchBonusGamePassOwnershipForPromotion(WithoutFeaturedPromotionResult)
					
					return
				else
					ShopDebugLoggerModule.log("refreshRobuxWidgetsAfterPurchase: skip, invalid payload")
				end
			end):catch(function(Err)
				-- upvalues: ShopDebugLoggerModule (upval)
				ShopDebugLoggerModule.logLazy(function(): string
					-- upvalues: Err (copy)
					return "refreshRobuxWidgetsAfterPurchase: failed err=" .. tostring(Err)
				end)
			end):finally(function()
				-- upvalues: Flag3 (upval)
				Flag3 = false
			end)
		end
	end
	
	local function pollOwnershipUntilTrue(Callback, Number, p3, ScaledPOLLBACKOFFMULTIPLIER)
		-- upvalues: PromiseModule (upval), pollOwnershipUntilTrue (copy), ConstantsModule (upval)
		return Callback(Number):andThen(function(Result)
			-- upvalues: p3 (copy), PromiseModule (upval), ScaledPOLLBACKOFFMULTIPLIER (copy), pollOwnershipUntilTrue (upval), Callback (copy), Number (copy), ConstantsModule (upval)
			return if Result then true else p3 > 1 and PromiseModule.delay(ScaledPOLLBACKOFFMULTIPLIER):andThen(function()
				-- upvalues: pollOwnershipUntilTrue (upval), Callback (upval), Number (upval), p3 (upval), ScaledPOLLBACKOFFMULTIPLIER (upval), ConstantsModule (upval)
				return pollOwnershipUntilTrue(Callback, Number, p3 - 1, ScaledPOLLBACKOFFMULTIPLIER * ConstantsModule.POLL_BACKOFF_MULTIPLIER)
			end)
		end):catch(function(Err)
			-- upvalues: p3 (copy), Number (copy), PromiseModule (upval), ScaledPOLLBACKOFFMULTIPLIER (copy), pollOwnershipUntilTrue (upval), Callback (copy), ConstantsModule (upval)
			if p3 <= 1 then
				warn("[Shop] pollOwnershipUntilTrue exhausted with engine error", Number, (tostring(Err)))
				
				return nil
			else
				return PromiseModule.delay(ScaledPOLLBACKOFFMULTIPLIER):andThen(function()
					-- upvalues: pollOwnershipUntilTrue (upval), Callback (upval), Number (upval), p3 (upval), ScaledPOLLBACKOFFMULTIPLIER (upval), ConstantsModule (upval)
					return pollOwnershipUntilTrue(Callback, Number, p3 - 1, ScaledPOLLBACKOFFMULTIPLIER * ConstantsModule.POLL_BACKOFF_MULTIPLIER)
				end)
			end
		end)
	end
	
	local function pollGamePassOwnershipAfterPurchase(Key, FIntShopOwnershipFetchMaxAttemptsModule, FetchOwnedGamePass, Enabled)
		-- upvalues: t1 (copy), ShopDebugLoggerModule (upval), pollOwnershipUntilTrue (copy), ConstantsModule (upval), writeOwnership (copy), Players (upval), MarketplaceService (upval), PromiseModule (upval)
		if t1[Key] then
			ShopDebugLoggerModule.logLazy(function(): string
				-- upvalues: Key (copy)
				return "pollGamePassOwnership: already in flight itemId=" .. Key
			end)
			
			return
		end
		local Number: number? = tonumber(Key)
		
		if Number == nil then
			ShopDebugLoggerModule.logLazy(function(): string
				-- upvalues: Key (copy)
				return "pollGamePassOwnership: skip invalid itemId=" .. Key
			end)
			
			return
		else
			t1[Key] = true
			ShopDebugLoggerModule.logLazy(function(): string
				-- upvalues: Key (copy), FIntShopOwnershipFetchMaxAttemptsModule (copy), Enabled (copy)
				return "pollGamePassOwnership: start itemId=" .. Key .. " maxAttempts=" .. tostring(FIntShopOwnershipFetchMaxAttemptsModule) .. " signalOnSuccess=" .. tostring(Enabled == true)
			end)
			PromiseModule.delay(ConstantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function()
				-- upvalues: pollOwnershipUntilTrue (upval), FetchOwnedGamePass (copy), Number (copy), FIntShopOwnershipFetchMaxAttemptsModule (copy), ConstantsModule (upval), ShopDebugLoggerModule (upval), Key (copy), writeOwnership (upval), Enabled (copy), Players (upval), MarketplaceService (upval), t1 (upval)
				pollOwnershipUntilTrue(FetchOwnedGamePass, Number, FIntShopOwnershipFetchMaxAttemptsModule, ConstantsModule.POLL_INITIAL_DELAY_SECONDS):andThen(function(Enabled1)
					-- upvalues: ShopDebugLoggerModule (upval), Key (upval), writeOwnership (upval), Enabled (upval), Players (upval), MarketplaceService (upval), Number (upval)
					ShopDebugLoggerModule.logLazy(function(): string
						-- upvalues: Key (upval), Enabled1 (copy)
						return "pollGamePassOwnership: result itemId=" .. Key .. " owned=" .. tostring(Enabled1)
					end)
					
					if Enabled1 ~= true then return end
					writeOwnership(Key, Enabled1)
					
					if Enabled then
						local LocalPlayer = Players.LocalPlayer
						
						if LocalPlayer ~= nil then
							ShopDebugLoggerModule.logLazy(function(): string
								-- upvalues: Key (upval)
								return "pollGamePassOwnership: SignalPromptGamePassPurchaseFinished itemId=" .. Key
							end)
							MarketplaceService:SignalPromptGamePassPurchaseFinished(LocalPlayer, Number, true)
						end
					end
				end):finally(function()
					-- upvalues: t1 (upval), Key (upval)
					t1[Key] = nil
				end)
			end)
		end
	end
	
	MarketplaceService.PromptGamePassPurchaseFinished:Connect(function(Player, GamePassId, WasPurchased)
		-- upvalues: Players (upval), pollGamePassOwnershipAfterPurchase (copy), FIntShopOwnershipFetchMaxAttemptsModule (upval), fetchOwnedGamePass (copy)
		if not WasPurchased then return end
		local LocalPlayer = Players.LocalPlayer
		
		if LocalPlayer ~= nil and Player.UserId == LocalPlayer.UserId then
			pollGamePassOwnershipAfterPurchase(tostring(GamePassId), FIntShopOwnershipFetchMaxAttemptsModule, fetchOwnedGamePass)
			
			return
		end
	end)
	
	if FFlagShopListenNativePurchaseFinishedModule and FFlagEnableRobuxInExperienceShop then
		local function pollBonusOwnershipAfterNativeRobuxPurchase(p3, p4, Player)
			-- upvalues: Players (upval), ShopDebugLoggerModule (upval), v1 (ref), v2 (ref), v3 (ref), FFlagRefetchRobuxWidgetAfterPurchaseModule (upval), FFlagShopRobuxPurchaseCompletionModalModule (upval), Signal2_11 (copy), FFlagShopUseMockUserOwnsGamePassModule (upval), MockUserOwnsGamePassModule (upval), UserOwnsGamePassHttpModule (upval), pollGamePassOwnershipAfterPurchase (copy), FIntShopOwnershipFetchMaxAttemptsModule (upval), FFlagSkipPaymentSessionForPlainRobuxModule (upval), refreshRobuxWidgetsAfterPurchase (copy)
			if Player ~= nil then
				local LocalPlayer = Players.LocalPlayer
				
				if LocalPlayer == nil or Player.UserId ~= LocalPlayer.UserId then
					ShopDebugLoggerModule.log("NativePurchaseFinished: ignored, not local player")
					
					return
				end
			end
			local Key = v1
			local v4 = v2
			local v5 = v3
			
			if v4 == nil or not FFlagRefetchRobuxWidgetAfterPurchaseModule and Key == nil and (not FFlagShopRobuxPurchaseCompletionModalModule or v5 == nil) then
				ShopDebugLoggerModule.log("NativePurchaseFinished: skip, no pending shop Robux purchase")
				
				return
			end
			if tostring(p4) ~= v4 then
				ShopDebugLoggerModule.logLazy(function(): string
					-- upvalues: p4 (copy), v4 (copy)
					return "NativePurchaseFinished: skip, sku mismatch productId=" .. tostring(p4) .. " pendingStoreSku=" .. v4
				end)
				
				return
			end
			v1 = nil
			v2 = nil
			v3 = nil
			
			if not p3 then
				ShopDebugLoggerModule.logLazy(function(): string
					-- upvalues: Key (copy)
					return "NativePurchaseFinished: skip, not purchased bonusGamePassId=" .. tostring(Key)
				end)
				
				return
			end
			if FFlagShopRobuxPurchaseCompletionModalModule and v5 ~= nil then
				Signal2_11(v5)
			end
			if Key ~= nil then
				ShopDebugLoggerModule.logLazy(function(): string
					-- upvalues: Key (copy)
					return "NativePurchaseFinished: polling bonusGamePassId=" .. Key
				end)
				pollGamePassOwnershipAfterPurchase(Key, FIntShopOwnershipFetchMaxAttemptsModule, if FFlagShopUseMockUserOwnsGamePassModule then MockUserOwnsGamePassModule else UserOwnsGamePassHttpModule, true)
			end
			if FFlagRefetchRobuxWidgetAfterPurchaseModule and (Key ~= nil or not FFlagSkipPaymentSessionForPlainRobuxModule) then
				refreshRobuxWidgetsAfterPurchase()
			end
		end
		
		local function onNativePurchaseFinished(Player, p3, p4, p5)
			-- upvalues: ShopDebugLoggerModule (upval), pollBonusOwnershipAfterNativeRobuxPurchase (copy)
			ShopDebugLoggerModule.logLazy(function(): string
				-- upvalues: p3 (copy), p4 (copy), p5 (copy)
				return "NativePurchaseFinished: productId=" .. tostring(p3) .. " wasPurchased=" .. tostring(p4) .. " checkoutSessionId=" .. tostring(p5)
			end)
			pollBonusOwnershipAfterNativeRobuxPurchase(p4, p3, Player)
		end
		
		local function onNativePurchaseFinishedWithLocalPlayer(p3, p4, p5)
			-- upvalues: ShopDebugLoggerModule (upval), pollBonusOwnershipAfterNativeRobuxPurchase (copy)
			ShopDebugLoggerModule.logLazy(function(): string
				-- upvalues: p3 (copy), p4 (copy), p5 (copy)
				return "NativePurchaseFinishedWithLocalPlayer: productId=" .. tostring(p3) .. " wasPurchased=" .. tostring(p4) .. " checkoutSessionId=" .. tostring(p5)
			end)
			pollBonusOwnershipAfterNativeRobuxPurchase(p4, p3, nil)
		end
		
		local _ = function(Signal, Callback)
			if typeof(Signal) == "RBXScriptSignal" or type(Signal) == "table" and Signal.Connect ~= nil then
				Signal:Connect(Callback)
			end
		end
		
		local NativePurchaseWithLocalPlayerEngineFeature = game:GetEngineFeature("NativePurchaseWithLocalPlayer")
		ShopDebugLoggerModule.logLazy(function(): string
			-- upvalues: FFlagLuaAppEnableNativePurchaseFinishedV2Signals (upval), NativePurchaseWithLocalPlayerEngineFeature (copy)
			return "NativePurchaseFinished: connecting v2=" .. tostring(FFlagLuaAppEnableNativePurchaseFinishedV2Signals) .. " localPlayerFeature=" .. tostring(NativePurchaseWithLocalPlayerEngineFeature)
		end)
		local NativePurchaseFinished = MarketplaceService.NativePurchaseFinished
		
		if typeof(NativePurchaseFinished) == "RBXScriptSignal" or type(NativePurchaseFinished) == "table" and NativePurchaseFinished.Connect ~= nil then
			NativePurchaseFinished:Connect(onNativePurchaseFinished)
		end
		if FFlagLuaAppEnableNativePurchaseFinishedV2Signals then
			local NativePurchaseFinishedV2 = MarketplaceService.NativePurchaseFinishedV2
			
			if typeof(NativePurchaseFinishedV2) == "RBXScriptSignal" or type(NativePurchaseFinishedV2) == "table" and NativePurchaseFinishedV2.Connect ~= nil then
				NativePurchaseFinishedV2:Connect(onNativePurchaseFinished)
			end
		end
		if NativePurchaseWithLocalPlayerEngineFeature then
			local NativePurchaseFinishedWithLocalPlayer = MarketplaceService.NativePurchaseFinishedWithLocalPlayer
			
			if typeof(NativePurchaseFinishedWithLocalPlayer) == "RBXScriptSignal" or type(NativePurchaseFinishedWithLocalPlayer) == "table" and NativePurchaseFinishedWithLocalPlayer.Connect ~= nil then
				NativePurchaseFinishedWithLocalPlayer:Connect(onNativePurchaseFinishedWithLocalPlayer)
			end
			if FFlagLuaAppEnableNativePurchaseFinishedV2Signals then
				local NativePurchaseFinishedWithLocalPlayerV2 = MarketplaceService.NativePurchaseFinishedWithLocalPlayerV2
				
				if typeof(NativePurchaseFinishedWithLocalPlayerV2) == "RBXScriptSignal" or type(NativePurchaseFinishedWithLocalPlayerV2) == "table" and NativePurchaseFinishedWithLocalPlayerV2.Connect ~= nil then
					NativePurchaseFinishedWithLocalPlayerV2:Connect(onNativePurchaseFinishedWithLocalPlayer)
				end
			end
		end
	end
	return {
		getCategories = Signal,
		getSections = Signal1,
		getLoading = Signal3,
		getError = Signal4,
		getOwnership = Signal8,
		getTrialAvailabilities = Signal9,
		getTrialRedemptionInFlight = Signal15,
		getBonusPromotionEligibility = Signal10,
		getItemsPerRow = Signal11,
		getMetadata = Signal5,
		getGlobalIconBackendEnabled = Signal6,
		getGlobalIconHasNewOffers = Signal7,
		getShouldOpenToRobuxTab = Signal13,
		getOpenedFromBuyRobux = Signal14,
		getPurchasedRobuxAmount = Signal12,
		dismissRobuxPurchaseSuccess = function()
			-- upvalues: Signal2_11 (copy)
			Signal2_11(nil)
		end,
		onShopOpened = onShopOpened,
		fetchAllShopData = fetchAllShopData,
		prefetchWidgetsOnly = prefetchWidgetsOnly,
		refreshShopItemInfo = refreshShopItemInfo,
		refreshRobuxWidgetsAfterPurchase = refreshRobuxWidgetsAfterPurchase,
		fetchGamePassOwnership = fetchGamePassOwnership,
		redeemGamePassTrial = redeemGamePassTrial,
		pollGamePassOwnership = pollGamePassOwnershipAfterPurchase,
		bonusGamePassIdForNativePurchase = bonusGamePassIdForNativePurchase,
		setItemsPerRow = function(p3)
			-- upvalues: Signal2_10 (copy)
			Signal2_10(p3)
		end,
		setShouldOpenToRobuxTab = Signal2_12,
		setOpenedFromBuyRobux = Signal2_13
	}
end