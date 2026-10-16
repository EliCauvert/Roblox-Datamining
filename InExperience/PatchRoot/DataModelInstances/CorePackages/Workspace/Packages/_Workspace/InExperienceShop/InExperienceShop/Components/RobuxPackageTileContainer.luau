local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local SessionService = game:GetService("SessionService")
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local PurchasePromptModule = require(Parent.PurchasePrompt)
local PromiseModule = require(Parent.Promise)
local View = require(Parent.Foundation).View
local FIntShopOwnershipFetchMaxAttemptsModule = require(InExperienceShop.Flags.FIntShopOwnershipFetchMaxAttempts)
local FFlagEnableInExperienceShopUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local FFlagEnableCategoryLoggingInShopModule = require(InExperienceShop.Flags.FFlagEnableCategoryLoggingInShop)
local FFlagShopUseMockUserOwnsGamePassModule = require(InExperienceShop.Flags.FFlagShopUseMockUserOwnsGamePass)
local FFlagSkipPaymentSessionForPlainRobuxModule = require(InExperienceShop.Flags.FFlagSkipPaymentSessionForPlainRobux)
local FFlagHideBonusInShopWhenNotClaimableModule = require(InExperienceShop.Flags.FFlagHideBonusInShopWhenNotClaimable)
local FFlagEnableBonusJwtInShop = require(Parent.SharedFlags).FFlagEnableBonusJwtInShop
local FFlagShopListenNativePurchaseFinishedModule = require(InExperienceShop.Flags.FFlagShopListenNativePurchaseFinished)
local FFlagShopRobuxPurchaseCompletionModalModule = require(InExperienceShop.Flags.FFlagShopRobuxPurchaseCompletionModal)
local FFlagRefetchRobuxWidgetAfterPurchaseModule = require(InExperienceShop.Flags.FFlagRefetchRobuxWidgetAfterPurchase)
local FFlagEnableShopRobuxBuyTelemetryModule = require(InExperienceShop.Flags.FFlagEnableShopRobuxBuyTelemetry)
local GetBlockRobuxTileClickInShopModule = require(InExperienceShop.Flags.GetBlockRobuxTileClickInShop)
local UserOwnsGamePassHttpModule = require(InExperienceShop.Api.userOwnsGamePassHttp)
local MockUserOwnsGamePassModule = require(InExperienceShop.Mocks.MockUserOwnsGamePass)
local RobuxPackageTileModule = require(InExperienceShop.Components.RobuxPackageTile)
local ShopDebugLoggerModule = require(InExperienceShop.Internal.ShopDebugLogger)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local GetRobuxPackageBonusPresentationModule = require(InExperienceShop.Utils.getRobuxPackageBonusPresentation)
local PromoteBonusRobuxPackageToTopPicksModule = require(InExperienceShop.Api.promoteBonusRobuxPackageToTopPicks)
local RedeemBonusTokenModule = require(InExperienceShop.Api.redeemBonusToken)
local _ = require(InExperienceShop.Types)

local function _(p1): boolean --[[ Line: 57 | Named "isPromise" ]]
	return typeof(p1) == "table" and typeof(p1.andThen) == "function"
end

return ReactModule.memo(function(Frame) --[[ Line: 61 | Named "RobuxPackageTileContainer" ]]
	-- upvalues: ReactModule (copy), SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), PromoteBonusRobuxPackageToTopPicksModule (copy), FFlagEnableBonusJwtInShop (copy), GetRobuxPackageBonusPresentationModule (copy), FFlagHideBonusInShopWhenNotClaimableModule (copy), FFlagEnableInExperienceShopUnifiedLoggingModule (copy), Parent (copy), FFlagEnableCategoryLoggingInShopModule (copy), SessionService (copy), ShopDebugLoggerModule (copy), FFlagShopUseMockUserOwnsGamePassModule (copy), MockUserOwnsGamePassModule (copy), UserOwnsGamePassHttpModule (copy), FIntShopOwnershipFetchMaxAttemptsModule (copy), FFlagRefetchRobuxWidgetAfterPurchaseModule (copy), FFlagSkipPaymentSessionForPlainRobuxModule (copy), FFlagShopListenNativePurchaseFinishedModule (copy), FFlagShopRobuxPurchaseCompletionModalModule (copy), PurchasePromptModule (copy), FFlagEnableShopRobuxBuyTelemetryModule (copy), InExperienceShop (copy), RedeemBonusTokenModule (copy), PromiseModule (copy), GetBlockRobuxTileClickInShopModule (copy), View (copy), RobuxPackageTileModule (copy)
	local Pkg = Frame.pkg
	local UseRefResult = ReactModule.useRef(nil)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	local BonusGamePassId = PromoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(Pkg)
	local v1 = nil
	local Callback = nil
	local UseRefResult1 = nil
	local UseRefResult2 = nil
	local UseRefResult3 = nil
	
	if FFlagEnableBonusJwtInShop then
		v1, Callback = ReactModule.useState(false)
		UseRefResult1 = ReactModule.useRef(false)
		UseRefResult2 = ReactModule.useRef(true)
		UseRefResult3 = ReactModule.useRef(nil)
		ReactModule.useEffect(function() --[[ Line: 82 ]]
			-- upvalues: UseRefResult2 (ref), UseRefResult3 (ref)
			UseRefResult2.current = true
			
			return function() --[[ Line: 84 ]]
				-- upvalues: UseRefResult2 (upval), UseRefResult3 (upval)
				UseRefResult2.current = false
				local Current = UseRefResult3.current
				UseRefResult3.current = nil
				
				if Current ~= nil and typeof(Current.cancel) == "function" then
					Current:cancel()
				end
			end
		end, {})
	end
	local RobuxPackageBonusPresentationModule = GetRobuxPackageBonusPresentationModule(Pkg, SignalsReactModule.useSignalState(function(p1) --[[ Line: 95 ]]
		-- upvalues: UseSignalStateResult (copy), BonusGamePassId (copy)
		local Ownership = UseSignalStateResult.getOwnership(p1)
		
		return if BonusGamePassId == nil then nil else Ownership[BonusGamePassId]
	end), (SignalsReactModule.useSignalState(function(p1) --[[ Line: 105 ]]
		-- upvalues: UseSignalStateResult (copy), BonusGamePassId (copy)
		local BonusPromotionEligibility = UseSignalStateResult.getBonusPromotionEligibility(p1)
		
		return if BonusGamePassId == nil then nil else BonusPromotionEligibility[BonusGamePassId]
	end)))
	local MobileProductId = Pkg.mobileProductId
	local ProductId = Pkg.productId
	local PaymentSessionId = Frame.paymentSessionId
	local BonusJwt = if FFlagEnableBonusJwtInShop then Frame.bonusJwt else nil
	local HasBonusItem = RobuxPackageBonusPresentationModule.hasBonusItem
	local NoFFlagHideBonusInShopWhenNotClaimableModule: boolean = HasBonusItem and (not FFlagHideBonusInShopWhenNotClaimableModule or (if PaymentSessionId == nil then BonusJwt ~= nil and BonusJwt ~= "" else PaymentSessionId ~= "" or BonusJwt ~= nil and BonusJwt ~= ""))
	ReactModule.useEffect(function() --[[ Line: 129 ]]
		-- upvalues: FFlagEnableInExperienceShopUnifiedLoggingModule (upval), Parent (upval), Pkg (copy), ProductId (copy), Frame (copy), FFlagEnableCategoryLoggingInShopModule (upval), UseRefResult (copy), SessionService (upval)
		if FFlagEnableInExperienceShopUnifiedLoggingModule then
			task.defer(function() --[[ Line: 134 ]]
				-- upvalues: Parent (upval), Pkg (upval), ProductId (upval), Frame (upval), FFlagEnableCategoryLoggingInShopModule (upval), UseRefResult (upval), SessionService (upval)
				local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
				local MarketplaceUnifiedItemType = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums.MarketplaceUnifiedItemType
				local HasBonusItem = Pkg.bonusItem ~= nil
				AvatarExperienceAnalyticsModule.addUnifiedEventLogging(UseRefResult, {
					universeId = game.GameId,
					itemId = if ProductId == nil then Pkg.id else ProductId,
					itemType = if HasBonusItem then MarketplaceUnifiedItemType.ROBUX_WITH_BONUS else MarketplaceUnifiedItemType.ROBUX,
					categoryId = Frame.categoryId,
					categoryType = Frame.categoryType,
					gridPositionRow = Frame.gridPositionRow,
					gridPositionColumn = Frame.gridPositionColumn,
					stableCategoryId = if FFlagEnableCategoryLoggingInShopModule then Frame.stableCategoryId else nil,
					categoryGroup = if FFlagEnableCategoryLoggingInShopModule then Frame.categoryGroup else nil,
					categoryName = if FFlagEnableCategoryLoggingInShopModule then Frame.categoryName else nil
				}, { sessionTagName = SessionService:GetSessionTag("level2a") })
			end)
			
			return
		end
	end, {
		Pkg.id, ProductId, Pkg.bonusItem, Frame.categoryId, Frame.categoryType,
		Frame.gridPositionRow, Frame.gridPositionColumn,
		if FFlagEnableCategoryLoggingInShopModule then Frame.stableCategoryId else nil,
		if FFlagEnableCategoryLoggingInShopModule then Frame.categoryGroup else nil,
		if FFlagEnableCategoryLoggingInShopModule then Frame.categoryName else nil
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 179 ]]
		-- upvalues: BonusGamePassId (copy), ShopDebugLoggerModule (upval), FFlagShopUseMockUserOwnsGamePassModule (upval), MockUserOwnsGamePassModule (upval), UserOwnsGamePassHttpModule (upval), UseSignalStateResult (copy), FIntShopOwnershipFetchMaxAttemptsModule (upval), FFlagRefetchRobuxWidgetAfterPurchaseModule (upval), FFlagSkipPaymentSessionForPlainRobuxModule (upval)
		if BonusGamePassId == nil then
			ShopDebugLoggerModule.log("refreshBonusOwnership: skip poll, no bonus game pass")
		else
			ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 181 ]]
				-- upvalues: BonusGamePassId (upval)
				return "refreshBonusOwnership: polling bonusGamePassId=" .. BonusGamePassId
			end)
			UseSignalStateResult.pollGamePassOwnership(BonusGamePassId, FIntShopOwnershipFetchMaxAttemptsModule, if FFlagShopUseMockUserOwnsGamePassModule then MockUserOwnsGamePassModule else UserOwnsGamePassHttpModule, true)
		end
		if FFlagRefetchRobuxWidgetAfterPurchaseModule and (BonusGamePassId ~= nil or not FFlagSkipPaymentSessionForPlainRobuxModule) then
			UseSignalStateResult.refreshRobuxWidgetsAfterPurchase()
		end
	end, { BonusGamePassId, UseSignalStateResult })
	local UseResult1 = if FFlagShopListenNativePurchaseFinishedModule then ReactModule.useCallback(function() --[[ Line: 208 ]]
		-- upvalues: MobileProductId (copy), ShopDebugLoggerModule (upval), FFlagRefetchRobuxWidgetAfterPurchaseModule (upval), FFlagShopRobuxPurchaseCompletionModalModule (upval), BonusGamePassId (copy), UseSignalStateResult (copy), Pkg (copy)
		if MobileProductId == nil or MobileProductId == "" then
			ShopDebugLoggerModule.log("onNativePurchaseLaunched: skip, no store SKU")
			
			return
		end
		if not FFlagRefetchRobuxWidgetAfterPurchaseModule and not FFlagShopRobuxPurchaseCompletionModalModule and BonusGamePassId == nil then
			ShopDebugLoggerModule.log("onNativePurchaseLaunched: skip, no bonus game pass")
			
			return
		end
		ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 221 ]]
			-- upvalues: BonusGamePassId (upval), MobileProductId (upval)
			return "onNativePurchaseLaunched: recording bonusGamePassId=" .. tostring(BonusGamePassId) .. " storeSku=" .. MobileProductId
		end)
		
		if FFlagShopRobuxPurchaseCompletionModalModule then
			UseSignalStateResult.bonusGamePassIdForNativePurchase(BonusGamePassId, MobileProductId, Pkg.robuxAmount)
			
			return
		else
			UseSignalStateResult.bonusGamePassIdForNativePurchase(BonusGamePassId, MobileProductId)
		end
	end, {
		BonusGamePassId,
		MobileProductId,
		Pkg.robuxAmount,
		UseSignalStateResult
	}) else nil
	local BonusItemDetails = Pkg.bonusItemDetails
	local OnBonusItemActivatedFunction = Frame.onBonusItemActivated
	
	return ReactModule.createElement(View, {
		tag = "fill size-full-0",
		LayoutOrder = Frame.LayoutOrder,
		ref = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseRefResult else nil
	}, {
		Tile = ReactModule.createElement(RobuxPackageTileModule, {
			robuxAmount = Pkg.robuxAmount,
			currencyAmountStr = Pkg.currencyAmountStr,
			robuxImage = Pkg.robuxImage,
			hasBonusItem = NoFFlagHideBonusInShopWhenNotClaimableModule,
			bonusItemThumbnail = RobuxPackageBonusPresentationModule.bonusItemThumbnail,
			onTileActivated = ReactModule.useCallback(function() --[[ Line: 353 ]]
				-- upvalues: GetBlockRobuxTileClickInShopModule (upval), NoFFlagHideBonusInShopWhenNotClaimableModule (copy), BonusItemDetails (copy), OnBonusItemActivatedFunction (copy)
				if GetBlockRobuxTileClickInShopModule() then return end
				if not NoFFlagHideBonusInShopWhenNotClaimableModule or BonusItemDetails == nil or OnBonusItemActivatedFunction == nil then return end
				local ItemType = BonusItemDetails.itemType
				
				if ItemType ~= nil then
					OnBonusItemActivatedFunction(BonusItemDetails.id, ItemType)
					
					return
				end
			end, {
				NoFFlagHideBonusInShopWhenNotClaimableModule,
				BonusItemDetails,
				OnBonusItemActivatedFunction
			}),
			onBuyActivated = ReactModule.useCallback(function() --[[ Line: 236 ]]
				-- upvalues: PurchasePromptModule (upval), ShopDebugLoggerModule (upval), FFlagEnableBonusJwtInShop (upval), UseRefResult1 (ref), FFlagEnableShopRobuxBuyTelemetryModule (upval), FFlagEnableInExperienceShopUnifiedLoggingModule (upval), UseRefResult (copy), InExperienceShop (upval), Frame (copy), PaymentSessionId (copy), FFlagSkipPaymentSessionForPlainRobuxModule (upval), HasBonusItem (copy), MobileProductId (copy), ProductId (copy), BonusGamePassId (copy), UseResult (copy), FFlagShopListenNativePurchaseFinishedModule (upval), UseResult1 (ref), BonusJwt (copy), FFlagRefetchRobuxWidgetAfterPurchaseModule (upval), RedeemBonusTokenModule (upval), PromiseModule (upval), UseSignalStateResult (copy), UseRefResult3 (ref), Callback (ref), UseRefResult2 (ref)
				local LaunchRobuxPackagePurchaseFunction = PurchasePromptModule.launchRobuxPackagePurchase
				
				if LaunchRobuxPackagePurchaseFunction == nil then
					ShopDebugLoggerModule.log("onBuyActivated: skip, launchRobuxPackagePurchase missing")
					
					return
				end
				if FFlagEnableBonusJwtInShop and UseRefResult1.current then return end
				if FFlagEnableShopRobuxBuyTelemetryModule and FFlagEnableInExperienceShopUnifiedLoggingModule and UseRefResult.current ~= nil then
					require(InExperienceShop.Analytics.sendRobuxBuyClickUnifiedEvent)(UseRefResult.current, Frame.shopPageType)
				end
				local PaymentSessionId1 = if FFlagSkipPaymentSessionForPlainRobuxModule and not HasBonusItem then "" else PaymentSessionId
				ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 261 ]]
					-- upvalues: MobileProductId (upval), ProductId (upval), BonusGamePassId (upval)
					return "onBuyActivated: launch mobileProductId=" .. tostring(MobileProductId) .. " productId=" .. tostring(ProductId) .. " bonusGamePassId=" .. tostring(BonusGamePassId)
				end)
				local config = {
					mobileProductId = MobileProductId or "",
					productId = ProductId,
					paymentSessionId = PaymentSessionId1,
					onWebViewClosed = UseResult
				}
				
				if FFlagShopListenNativePurchaseFinishedModule then
					config.onNativePurchaseLaunched = UseResult1
				end
				if not FFlagEnableBonusJwtInShop then
					LaunchRobuxPackagePurchaseFunction(config)
					
					return
				end
				config.bonusJwt = if FFlagSkipPaymentSessionForPlainRobuxModule and not HasBonusItem then "" else BonusJwt
				
				if FFlagRefetchRobuxWidgetAfterPurchaseModule then
					function config.redeemBonusToken(p1, p2) --[[ Line: 288 ]]
						-- upvalues: RedeemBonusTokenModule (upval), PromiseModule (upval), ShopDebugLoggerModule (upval), UseSignalStateResult (upval)
						return RedeemBonusTokenModule(p1, p2):catch(function(Err) --[[ Line: 289 ]]
							-- upvalues: PromiseModule (upval), ShopDebugLoggerModule (upval), UseSignalStateResult (upval)
							if typeof(Err) == "table" and Err.kind == "BadRequest" then
								ShopDebugLoggerModule.log("redeemBonusToken: HTTP 400, refreshing Robux widgets")
								local RefreshRobuxWidgetsAfterPurchaseResult = UseSignalStateResult.refreshRobuxWidgetsAfterPurchase()
								local IsFunction: boolean = typeof(RefreshRobuxWidgetsAfterPurchaseResult) == "table" and typeof(RefreshRobuxWidgetsAfterPurchaseResult.andThen) == "function"
								
								return (if IsFunction then RefreshRobuxWidgetsAfterPurchaseResult else PromiseModule.resolve()):andThen(function() --[[ Line: 299 ]]
									-- upvalues: PromiseModule (upval), Err (copy)
									return PromiseModule.reject(Err)
								end)
							else
								return PromiseModule.reject(Err)
							end
						end)
					end
				else
					config.redeemBonusToken = RedeemBonusTokenModule
				end
				local LaunchRobuxPackagePurchaseResult = LaunchRobuxPackagePurchaseFunction(config)
				
				if typeof(LaunchRobuxPackagePurchaseResult) == "table" and typeof(LaunchRobuxPackagePurchaseResult.andThen) == "function" then
					UseRefResult1.current = true
					UseRefResult3.current = LaunchRobuxPackagePurchaseResult
					Callback(true)
					LaunchRobuxPackagePurchaseResult:catch(function(Err) --[[ Line: 329 ]]
						-- upvalues: ShopDebugLoggerModule (upval)
						ShopDebugLoggerModule.logLazy(function(): string --[[ Line: 330 ]]
							-- upvalues: Err (copy)
							return "RobuxPackageTile: purchase launch failed err=" .. (if typeof(Err) == "table" then tostring(Err.message) else tostring(Err))
						end)
					end):finally(function() --[[ Line: 320 | Named "settle" ]]
						-- upvalues: UseRefResult1 (upval), UseRefResult3 (upval), UseRefResult2 (upval), Callback (upval)
						UseRefResult1.current = false
						UseRefResult3.current = nil
						
						if UseRefResult2.current then
							Callback(false)
						end
					end)
					
					return
				end
			end, {
				MobileProductId, ProductId, PaymentSessionId, BonusJwt, UseResult, UseResult1,
				HasBonusItem, BonusGamePassId, UseSignalStateResult, Frame.shopPageType
			}),
			isBuyLoading = if FFlagEnableBonusJwtInShop then v1 else nil,
			isPrimaryRobuxPackage = Pkg.isPrimaryRobuxPackage == true,
			mediaHeightScale = Frame.mediaHeightScale
		})
	})
end)