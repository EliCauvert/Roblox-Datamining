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
local getBlockRobuxTileClickInShopModule = require(inExperienceShop.Flags.GetBlockRobuxTileClickInShop)
local userOwnsGamePassHttpModule = require(inExperienceShop.Api.userOwnsGamePassHttp)
local mockUserOwnsGamePassModule = require(inExperienceShop.Mocks.MockUserOwnsGamePass)
local robuxPackageTileModule = require(inExperienceShop.Components.RobuxPackageTile)
local getInExperienceShopStoreModule = require(inExperienceShop.Stores.getInExperienceShopStore)
local getRobuxPackageBonusPresentationModule = require(inExperienceShop.Utils.getRobuxPackageBonusPresentation)
local promoteBonusRobuxPackageToTopPicksModule = require(inExperienceShop.Api.promoteBonusRobuxPackageToTopPicks)
local _ = require(inExperienceShop.Types)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), signalsReactModule (ref), getInExperienceShopStoreModule (ref), promoteBonusRobuxPackageToTopPicksModule (ref), getRobuxPackageBonusPresentationModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), parent (ref), sessionService (ref), fFlagShopUseMockUserOwnsGamePassModule (ref), mockUserOwnsGamePassModule (ref), userOwnsGamePassHttpModule (ref), fIntShopOwnershipFetchMaxAttemptsModule (ref), purchasePromptModule (ref), getBlockRobuxTileClickInShopModule (ref), view (ref), robuxPackageTileModule (ref)
	local pkg = p1.pkg
	local var1 = reactModule.useRef(nil)
	local var2 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local bonusGamePassId = promoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(pkg)
	local var3 = getRobuxPackageBonusPresentationModule(pkg, signalsReactModule.useSignalState(function(p2)
		-- upvalues: var2 (ref), bonusGamePassId (ref)
		return if bonusGamePassId == nil then nil else var2.getOwnership(p2)[bonusGamePassId]
	end), signalsReactModule.useSignalState(function(p2)
		-- upvalues: var2 (ref), bonusGamePassId (ref)
		return if bonusGamePassId == nil then nil else var2.getBonusPromotionEligibility(p2)[bonusGamePassId]
	end))
	local mobileProductId = pkg.mobileProductId
	local productId = pkg.productId
	local paymentSessionId = p1.paymentSessionId
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
	local var4 = reactModule.useCallback(function()
		-- upvalues: bonusGamePassId (ref), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassHttpModule (copy), var2 (ref), fIntShopOwnershipFetchMaxAttemptsModule (copy)
		if bonusGamePassId == nil then
			return
		end
		var2.pollGamePassOwnership(bonusGamePassId, fIntShopOwnershipFetchMaxAttemptsModule, if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassHttpModule, true)
	end, { bonusGamePassId, var2 })
	local var5 = reactModule.useCallback(function()
		-- upvalues: purchasePromptModule (copy), mobileProductId (ref), productId (ref), paymentSessionId (ref), var4 (ref)
		local launchRobuxPackagePurchase = purchasePromptModule.launchRobuxPackagePurchase
		
		if launchRobuxPackagePurchase == nil then
			return
		end
		launchRobuxPackagePurchase({
			mobileProductId = mobileProductId or "",
			productId = productId,
			paymentSessionId = paymentSessionId,
			onWebViewClosed = var4
		})
	end, { mobileProductId, productId, paymentSessionId, var4 })
	local hasBonusItem = var3.hasBonusItem
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
			hasBonusItem = var3.hasBonusItem,
			bonusItemThumbnail = var3.bonusItemThumbnail,
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
			onBuyActivated = var5,
			isPrimaryRobuxPackage = pkg.isPrimaryRobuxPackage == true,
			mediaHeightScale = p1.mediaHeightScale
		})
	})
end)