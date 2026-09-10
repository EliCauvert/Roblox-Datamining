local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local sessionService = game:GetService("SessionService")
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local signalsReactModule = require(parent.SignalsReact)
local purchasePromptModule = require(parent.PurchasePrompt)
local view = foundationModule.View
local fIntShopOwnershipFetchMaxAttemptsModule = require(inExperienceShop.Flags.FIntShopOwnershipFetchMaxAttempts)
local fFlagEnableInExperienceShopUnifiedLoggingModule = require(inExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local fFlagShopUseMockUserOwnsGamePassModule = require(inExperienceShop.Flags.FFlagShopUseMockUserOwnsGamePass)
local fFlagSkipPaymentSessionForPlainRobuxModule = require(inExperienceShop.Flags.FFlagSkipPaymentSessionForPlainRobux)
local fFlagEnableBonusJwtInShop = require(parent.SharedFlags).FFlagEnableBonusJwtInShop
local fFlagShopListenNativePurchaseFinishedModule = require(inExperienceShop.Flags.FFlagShopListenNativePurchaseFinished)
local getBlockRobuxTileClickInShopModule = require(inExperienceShop.Flags.GetBlockRobuxTileClickInShop)
local userOwnsGamePassHttpModule = require(inExperienceShop.Api.userOwnsGamePassHttp)
local mockUserOwnsGamePassModule = require(inExperienceShop.Mocks.MockUserOwnsGamePass)
local robuxPackageTileModule = require(inExperienceShop.Components.RobuxPackageTile)
local shopDebugLoggerModule = require(inExperienceShop.Internal.ShopDebugLogger)
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local getRobuxPackageBonusPresentationModule = require(inExperienceShop.Utils.getRobuxPackageBonusPresentation)
local promoteBonusRobuxPackageToTopPicksModule = require(inExperienceShop.Api.promoteBonusRobuxPackageToTopPicks)
local redeemBonusTokenModule = require(inExperienceShop.Api.redeemBonusToken)
local _ = require(inExperienceShop.Types)

local function _(p1)
	return typeof(p1) == "table" and typeof(p1.andThen) == "function"
end

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), signalsReactModule (ref), getInExperienceShopStoreModule (ref), promoteBonusRobuxPackageToTopPicksModule (ref), fFlagEnableBonusJwtInShop (ref), getRobuxPackageBonusPresentationModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), parent (ref), sessionService (ref), shopDebugLoggerModule (ref), fFlagShopUseMockUserOwnsGamePassModule (ref), mockUserOwnsGamePassModule (ref), userOwnsGamePassHttpModule (ref), fIntShopOwnershipFetchMaxAttemptsModule (ref), fFlagShopListenNativePurchaseFinishedModule (ref), purchasePromptModule (ref), fFlagSkipPaymentSessionForPlainRobuxModule (ref), redeemBonusTokenModule (ref), getBlockRobuxTileClickInShopModule (ref), view (ref), robuxPackageTileModule (ref)
	local pkg = p1.pkg
	local var1 = reactModule.useRef(nil)
	local var2 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local bonusGamePassId = promoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(pkg)
	local var3 = nil
	local var4 = nil
	local var5 = nil
	local var6 = nil
	local var7 = nil
	
	if fFlagEnableBonusJwtInShop then
		local var8, var9 = reactModule.useState(false)
		var3 = var8
		var4 = var9
		var5 = reactModule.useRef(false)
		var6 = reactModule.useRef(true)
		var7 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: var6 (write), var7 (write)
			var6.current = true
			
			return function()
				-- upvalues: var6 (copy), var7 (copy)
				var6.current = false
				local current = var7.current
				var7.current = nil
				
				if current ~= nil and typeof(current.cancel) == "function" then
					current:cancel()
				end
			end
		end, {})
	end
	local var10 = getRobuxPackageBonusPresentationModule(pkg, signalsReactModule.useSignalState(function(p2)
		-- upvalues: var2 (ref), bonusGamePassId (ref)
		return if bonusGamePassId == nil then nil else var2.getOwnership(p2)[bonusGamePassId]
	end), signalsReactModule.useSignalState(function(p2)
		-- upvalues: var2 (ref), bonusGamePassId (ref)
		return if bonusGamePassId == nil then nil else var2.getBonusPromotionEligibility(p2)[bonusGamePassId]
	end))
	local mobileProductId = pkg.mobileProductId
	local productId = pkg.productId
	local paymentSessionId = p1.paymentSessionId
	local var11 = if fFlagEnableBonusJwtInShop then p1.bonusJwt else nil
	local hasBonusItem = var10.hasBonusItem
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), parent (copy), pkg (ref), productId (ref), p1 (ref), var1 (ref), sessionService (copy)
		if fFlagEnableInExperienceShopUnifiedLoggingModule then
			task.defer(function()
				-- upvalues: parent (copy), pkg (copy), productId (copy), p1 (copy), var1 (copy), sessionService (copy)
				local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
				local marketplaceUnifiedItemType = avatarExperienceAnalyticsModule.UnifiedEventLogEnums.MarketplaceUnifiedItemType
				avatarExperienceAnalyticsModule.addUnifiedEventLogging(var1, {
					universeId = game.GameId,
					itemId = if productId ~= nil then pkg.id else productId,
					itemType = if pkg.bonusItem ~= nil then marketplaceUnifiedItemType.ROBUX_WITH_BONUS else marketplaceUnifiedItemType.ROBUX,
					categoryId = p1.categoryId,
					gridPositionRow = p1.gridPositionRow,
					gridPositionColumn = p1.gridPositionColumn
				}, { sessionTagName = sessionService:GetSessionTag("level2a") })
			end)
			
			return
		end
	end, {
		pkg.id, productId, pkg.bonusItem, p1.categoryId, p1.gridPositionRow,
		p1.gridPositionColumn
	})
	local var12 = reactModule.useCallback(function()
		-- upvalues: bonusGamePassId (ref), shopDebugLoggerModule (copy), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassHttpModule (copy), var2 (ref), fIntShopOwnershipFetchMaxAttemptsModule (copy)
		if bonusGamePassId == nil then
			shopDebugLoggerModule.log("refreshBonusOwnership: skip, no bonus game pass")
			
			return
		end
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: bonusGamePassId (copy)
			return "refreshBonusOwnership: polling bonusGamePassId=" .. bonusGamePassId
		end)
		var2.pollGamePassOwnership(bonusGamePassId, fIntShopOwnershipFetchMaxAttemptsModule, if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassHttpModule, true)
	end, { bonusGamePassId, var2 })
	local var13 = if fFlagShopListenNativePurchaseFinishedModule then reactModule.useCallback(function()
		-- upvalues: bonusGamePassId (ref), shopDebugLoggerModule (copy), mobileProductId (ref), var2 (ref)
		if bonusGamePassId == nil then
			shopDebugLoggerModule.log("onNativePurchaseLaunched: skip, no bonus game pass")
			
			return
		elseif mobileProductId == nil or mobileProductId == "" then
			shopDebugLoggerModule.log("onNativePurchaseLaunched: skip, no store SKU")
			
			return
		end
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: bonusGamePassId (copy), mobileProductId (copy)
			return "onNativePurchaseLaunched: recording bonusGamePassId=" .. bonusGamePassId .. " storeSku=" .. mobileProductId
		end)
		var2.bonusGamePassIdForNativePurchase(bonusGamePassId, mobileProductId)
	end, { bonusGamePassId, mobileProductId, var2 }) else nil
	local var14 = reactModule.useCallback(function()
		-- upvalues: purchasePromptModule (copy), shopDebugLoggerModule (copy), fFlagEnableBonusJwtInShop (copy), var5 (write), paymentSessionId (ref), fFlagSkipPaymentSessionForPlainRobuxModule (copy), hasBonusItem (ref), mobileProductId (ref), productId (ref), bonusGamePassId (ref), var12 (ref), fFlagShopListenNativePurchaseFinishedModule (copy), var13 (write), var11 (ref), redeemBonusTokenModule (copy), var7 (write), var4 (write), var6 (write)
		local launchRobuxPackagePurchase = purchasePromptModule.launchRobuxPackagePurchase
		
		if launchRobuxPackagePurchase == nil then
			shopDebugLoggerModule.log("onBuyActivated: skip, launchRobuxPackagePurchase missing")
			
			return
		elseif fFlagEnableBonusJwtInShop and var5.current then return end
		local var15 = if fFlagSkipPaymentSessionForPlainRobuxModule and not hasBonusItem then "" else paymentSessionId
		shopDebugLoggerModule.logLazy(function()
			-- upvalues: mobileProductId (copy), productId (copy), bonusGamePassId (copy)
			return "onBuyActivated: launch mobileProductId=" .. tostring(mobileProductId) .. " productId=" .. tostring(productId) .. " bonusGamePassId=" .. tostring(bonusGamePassId)
		end)
		local t = {
			mobileProductId = mobileProductId or "",
			productId = productId,
			paymentSessionId = var15,
			onWebViewClosed = var12
		}
		
		if fFlagShopListenNativePurchaseFinishedModule then
			t.onNativePurchaseLaunched = var13
		end
		if not fFlagEnableBonusJwtInShop then
			launchRobuxPackagePurchase(t)
			
			return
		end
		t.bonusJwt = if fFlagSkipPaymentSessionForPlainRobuxModule and not hasBonusItem then "" else var11
		t.redeemBonusToken = redeemBonusTokenModule
		local var16 = launchRobuxPackagePurchase(t)
		
		if typeof(var16) == "table" and typeof(var16.andThen) == "function" then
			var5.current = true
			var7.current = var16
			var4(true)
			var16:catch(function(p2)
				-- upvalues: shopDebugLoggerModule (copy)
				shopDebugLoggerModule.logLazy(function()
					-- upvalues: p2 (ref)
					return "RobuxPackageTile: purchase launch failed err=" .. (if typeof(p2) == "table" then tostring(p2.message) else tostring(p2))
				end)
			end):finally(function()
				-- upvalues: var5 (copy), var7 (copy), var6 (copy), var4 (copy)
				var5.current = false
				var7.current = nil
				
				if var6.current then
					var4(false)
				end
			end)
			
			return
		end
	end, {
		mobileProductId, productId, paymentSessionId, var11, var12, var13,
		hasBonusItem, bonusGamePassId
	})
	local bonusItemDetails = pkg.bonusItemDetails
	local onBonusItemActivated = p1.onBonusItemActivated
	
	return reactModule.createElement(view, {
		tag = "fill size-full-0",
		LayoutOrder = p1.LayoutOrder,
		ref = if fFlagEnableInExperienceShopUnifiedLoggingModule then var1 else nil
	}, {
		Tile = reactModule.createElement(robuxPackageTileModule, {
			robuxAmount = pkg.robuxAmount,
			currencyAmountStr = pkg.currencyAmountStr,
			robuxImage = pkg.robuxImage,
			hasBonusItem = var10.hasBonusItem,
			bonusItemThumbnail = var10.bonusItemThumbnail,
			onTileActivated = reactModule.useCallback(function()
				-- upvalues: getBlockRobuxTileClickInShopModule (copy), hasBonusItem (ref), bonusItemDetails (ref), onBonusItemActivated (ref)
				if getBlockRobuxTileClickInShopModule() then return end
				if not hasBonusItem or bonusItemDetails == nil or onBonusItemActivated == nil then return end
				local itemType = bonusItemDetails.itemType
				
				if itemType == nil then
					return
				end
				onBonusItemActivated(bonusItemDetails.id, itemType)
			end, { hasBonusItem, bonusItemDetails, onBonusItemActivated }),
			onBuyActivated = var14,
			isBuyLoading = if fFlagEnableBonusJwtInShop then var3 else nil,
			isPrimaryRobuxPackage = pkg.isPrimaryRobuxPackage == true,
			mediaHeightScale = p1.mediaHeightScale
		})
	})
end)