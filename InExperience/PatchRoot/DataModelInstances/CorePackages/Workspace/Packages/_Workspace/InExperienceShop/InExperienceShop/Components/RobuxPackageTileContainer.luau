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

return reactModule.memo(function(p0) --[[ line: 40 | named "RobuxPackageTileContainer" ]]
	-- upvalues: reactModule (ref), signalsReactModule (ref), getInExperienceShopStoreModule (ref), promoteBonusRobuxPackageToTopPicksModule (ref), getRobuxPackageBonusPresentationModule (ref), fFlagEnableInExperienceShopUnifiedLoggingModule (ref), parent (ref), sessionService (ref), fFlagShopUseMockUserOwnsGamePassModule (ref), mockUserOwnsGamePassModule (ref), userOwnsGamePassHttpModule (ref), fIntShopOwnershipFetchMaxAttemptsModule (ref), purchasePromptModule (ref), getBlockRobuxTileClickInShopModule (ref), view (ref), robuxPackageTileModule (ref)
	local pkg = p0.pkg
	local var16 = reactModule.useRef(nil)
	local var17 = signalsReactModule.useSignalState(getInExperienceShopStoreModule)
	local bonusGamePassId = promoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(pkg)
	local var19 = getRobuxPackageBonusPresentationModule(pkg, signalsReactModule.useSignalState(function(p1) --[[ line: 46 ]]
		-- upvalues: var17 (ref), bonusGamePassId (ref)
		return if bonusGamePassId == nil then nil else var17.getOwnership(p1)[bonusGamePassId]
	end), signalsReactModule.useSignalState(function(p2) --[[ line: 56 ]]
		-- upvalues: var17 (ref), bonusGamePassId (ref)
		return if bonusGamePassId == nil then nil else var17.getBonusPromotionEligibility(p2)[bonusGamePassId]
	end))
	local mobileProductId = pkg.mobileProductId
	local productId = pkg.productId
	local paymentSessionId = p0.paymentSessionId
	reactModule.useEffect(function() --[[ line: 75 ]]
		-- upvalues: fFlagEnableInExperienceShopUnifiedLoggingModule (copy), parent (copy), pkg (ref), productId (ref), p0 (ref), var16 (ref), sessionService (copy)
		if fFlagEnableInExperienceShopUnifiedLoggingModule then
			task.defer(function() --[[ line: 80 ]]
				-- upvalues: parent (copy), pkg (copy), productId (copy), p0 (copy), var16 (copy), sessionService (copy)
				local avatarExperienceAnalyticsModule = require(parent.AvatarExperienceAnalytics)
				local marketplaceUnifiedItemType = avatarExperienceAnalyticsModule.UnifiedEventLogEnums.MarketplaceUnifiedItemType
				avatarExperienceAnalyticsModule.addUnifiedEventLogging(var16, {
					universeId = game.GameId,
					itemId = if productId ~= nil then pkg.id else productId,
					itemType = if pkg.bonusItem ~= nil then marketplaceUnifiedItemType.ROBUX_WITH_BONUS else marketplaceUnifiedItemType.ROBUX,
					categoryId = p0.categoryId,
					gridPositionRow = p0.gridPositionRow,
					gridPositionColumn = p0.gridPositionColumn
				}, { sessionTagName = sessionService:GetSessionTag("level2a") })
			end)
			
			return
		end
	end, {
		pkg.id, productId, pkg.bonusItem, p0.categoryId, p0.gridPositionRow,
		p0.gridPositionColumn
	})
	local var20 = reactModule.useCallback(function() --[[ line: 114 ]]
		-- upvalues: bonusGamePassId (ref), fFlagShopUseMockUserOwnsGamePassModule (copy), mockUserOwnsGamePassModule (copy), userOwnsGamePassHttpModule (copy), var17 (ref), fIntShopOwnershipFetchMaxAttemptsModule (copy)
		if bonusGamePassId == nil then
			return
		end
		var17.pollGamePassOwnership(bonusGamePassId, fIntShopOwnershipFetchMaxAttemptsModule, if fFlagShopUseMockUserOwnsGamePassModule then mockUserOwnsGamePassModule else userOwnsGamePassHttpModule, true)
	end, { bonusGamePassId, var17 })
	local var21 = reactModule.useCallback(function() --[[ line: 124 ]]
		-- upvalues: purchasePromptModule (copy), mobileProductId (ref), productId (ref), paymentSessionId (ref), var20 (ref)
		local launchRobuxPackagePurchase = purchasePromptModule.launchRobuxPackagePurchase
		
		if launchRobuxPackagePurchase == nil then
			return
		end
		launchRobuxPackagePurchase({
			mobileProductId = mobileProductId or "",
			productId = productId,
			paymentSessionId = paymentSessionId,
			onWebViewClosed = var20
		})
	end, { mobileProductId, productId, paymentSessionId, var20 })
	local hasBonusItem = var19.hasBonusItem
	local bonusItemDetails = pkg.bonusItemDetails
	local onBonusItemActivated = p0.onBonusItemActivated
	
	return reactModule.createElement(view, {
		tag = "fill size-full-0",
		LayoutOrder = p0.LayoutOrder,
		ref = if fFlagEnableInExperienceShopUnifiedLoggingModule then var16 else nil
	}, {
		Tile = reactModule.createElement(robuxPackageTileModule, {
			robuxAmount = pkg.robuxAmount,
			currencyAmountStr = pkg.currencyAmountStr,
			robuxImage = pkg.robuxImage,
			hasBonusItem = var19.hasBonusItem,
			bonusItemThumbnail = var19.bonusItemThumbnail,
			onTileActivated = reactModule.useCallback(function() --[[ line: 140 ]]
				-- upvalues: getBlockRobuxTileClickInShopModule (copy), hasBonusItem (ref), bonusItemDetails (ref), onBonusItemActivated (ref)
				if getBlockRobuxTileClickInShopModule() then return end
				if not hasBonusItem or bonusItemDetails == nil or onBonusItemActivated == nil then return end
				local itemType = bonusItemDetails.itemType
				
				if itemType == nil then
					return
				end
				onBonusItemActivated(bonusItemDetails.id, itemType)
			end, { hasBonusItem, bonusItemDetails, onBonusItemActivated }),
			onBuyActivated = var21,
			isPrimaryRobuxPackage = pkg.isPrimaryRobuxPackage == true,
			mediaHeightScale = p0.mediaHeightScale
		})
	})
end)