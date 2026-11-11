local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local SessionService = game:GetService("SessionService")
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local PurchasePromptModule = require(Parent.PurchasePrompt)
local View = require(Parent.Foundation).View
local FIntShopOwnershipFetchMaxAttemptsModule = require(InExperienceShop.Flags.FIntShopOwnershipFetchMaxAttempts)
local FFlagEnableInExperienceShopUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local FFlagShopUseMockUserOwnsGamePassModule = require(InExperienceShop.Flags.FFlagShopUseMockUserOwnsGamePass)
local GetBlockRobuxTileClickInShopModule = require(InExperienceShop.Flags.GetBlockRobuxTileClickInShop)
local UserOwnsGamePassHttpModule = require(InExperienceShop.Api.userOwnsGamePassHttp)
local MockUserOwnsGamePassModule = require(InExperienceShop.Mocks.MockUserOwnsGamePass)
local RobuxPackageTileModule = require(InExperienceShop.Components.RobuxPackageTile)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local GetRobuxPackageBonusPresentationModule = require(InExperienceShop.Utils.getRobuxPackageBonusPresentation)
local PromoteBonusRobuxPackageToTopPicksModule = require(InExperienceShop.Api.promoteBonusRobuxPackageToTopPicks)
local _ = require(InExperienceShop.Types)

return ReactModule.memo(function(Frame)
	-- upvalues: ReactModule (copy), SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), PromoteBonusRobuxPackageToTopPicksModule (copy), GetRobuxPackageBonusPresentationModule (copy), FFlagEnableInExperienceShopUnifiedLoggingModule (copy), Parent (copy), SessionService (copy), FFlagShopUseMockUserOwnsGamePassModule (copy), MockUserOwnsGamePassModule (copy), UserOwnsGamePassHttpModule (copy), FIntShopOwnershipFetchMaxAttemptsModule (copy), PurchasePromptModule (copy), GetBlockRobuxTileClickInShopModule (copy), View (copy), RobuxPackageTileModule (copy)
	local Pkg = Frame.pkg
	local UseRefResult = ReactModule.useRef(nil)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	local BonusGamePassId = PromoteBonusRobuxPackageToTopPicksModule.getBonusGamePassId(Pkg)
	local RobuxPackageBonusPresentationModule = GetRobuxPackageBonusPresentationModule(Pkg, SignalsReactModule.useSignalState(function(p1)
		-- upvalues: UseSignalStateResult (copy), BonusGamePassId (copy)
		local Ownership = UseSignalStateResult.getOwnership(p1)
		
		return if BonusGamePassId == nil then nil else Ownership[BonusGamePassId]
	end), (SignalsReactModule.useSignalState(function(p1)
		-- upvalues: UseSignalStateResult (copy), BonusGamePassId (copy)
		local BonusPromotionEligibility = UseSignalStateResult.getBonusPromotionEligibility(p1)
		
		return if BonusGamePassId == nil then nil else BonusPromotionEligibility[BonusGamePassId]
	end)))
	local MobileProductId = Pkg.mobileProductId
	local ProductId = Pkg.productId
	local PaymentSessionId = Frame.paymentSessionId
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableInExperienceShopUnifiedLoggingModule (upval), Parent (upval), Pkg (copy), ProductId (copy), Frame (copy), UseRefResult (copy), SessionService (upval)
		if FFlagEnableInExperienceShopUnifiedLoggingModule then
			task.defer(function()
				-- upvalues: Parent (upval), Pkg (upval), ProductId (upval), Frame (upval), UseRefResult (upval), SessionService (upval)
				local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
				local MarketplaceUnifiedItemType = AvatarExperienceAnalyticsModule.UnifiedEventLogEnums.MarketplaceUnifiedItemType
				local HasBonusItem = Pkg.bonusItem ~= nil
				AvatarExperienceAnalyticsModule.addUnifiedEventLogging(UseRefResult, {
					universeId = game.GameId,
					itemId = if ProductId == nil then Pkg.id else ProductId,
					itemType = if HasBonusItem then MarketplaceUnifiedItemType.ROBUX_WITH_BONUS else MarketplaceUnifiedItemType.ROBUX,
					categoryId = Frame.categoryId,
					gridPositionRow = Frame.gridPositionRow,
					gridPositionColumn = Frame.gridPositionColumn
				}, { sessionTagName = SessionService:GetSessionTag("level2a") })
			end)
			
			return
		end
	end, {
		Pkg.id, ProductId, Pkg.bonusItem, Frame.categoryId, Frame.gridPositionRow,
		Frame.gridPositionColumn
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: BonusGamePassId (copy), FFlagShopUseMockUserOwnsGamePassModule (upval), MockUserOwnsGamePassModule (upval), UserOwnsGamePassHttpModule (upval), UseSignalStateResult (copy), FIntShopOwnershipFetchMaxAttemptsModule (upval)
		if BonusGamePassId ~= nil then
			UseSignalStateResult.pollGamePassOwnership(BonusGamePassId, FIntShopOwnershipFetchMaxAttemptsModule, if FFlagShopUseMockUserOwnsGamePassModule then MockUserOwnsGamePassModule else UserOwnsGamePassHttpModule, true)
			
			return
		end
	end, { BonusGamePassId, UseSignalStateResult })
	local HasBonusItem = RobuxPackageBonusPresentationModule.hasBonusItem
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
			hasBonusItem = RobuxPackageBonusPresentationModule.hasBonusItem,
			bonusItemThumbnail = RobuxPackageBonusPresentationModule.bonusItemThumbnail,
			onTileActivated = ReactModule.useCallback(function()
				-- upvalues: GetBlockRobuxTileClickInShopModule (upval), HasBonusItem (copy), BonusItemDetails (copy), OnBonusItemActivatedFunction (copy)
				if GetBlockRobuxTileClickInShopModule() then return end
				if not HasBonusItem or BonusItemDetails == nil or OnBonusItemActivatedFunction == nil then return end
				local ItemType = BonusItemDetails.itemType
				
				if ItemType ~= nil then
					OnBonusItemActivatedFunction(BonusItemDetails.id, ItemType)
					
					return
				end
			end, {
				HasBonusItem,
				BonusItemDetails,
				OnBonusItemActivatedFunction
			}),
			onBuyActivated = ReactModule.useCallback(function()
				-- upvalues: PurchasePromptModule (upval), MobileProductId (copy), ProductId (copy), PaymentSessionId (copy), UseResult (copy)
				local LaunchRobuxPackagePurchaseFunction: (any) -> () = PurchasePromptModule.launchRobuxPackagePurchase
				
				if LaunchRobuxPackagePurchaseFunction ~= nil then
					LaunchRobuxPackagePurchaseFunction({
						mobileProductId = MobileProductId or "",
						productId = ProductId,
						paymentSessionId = PaymentSessionId,
						onWebViewClosed = UseResult
					})
					
					return
				end
			end, { MobileProductId, ProductId, PaymentSessionId, UseResult }),
			isPrimaryRobuxPackage = Pkg.isPrimaryRobuxPackage == true,
			mediaHeightScale = Frame.mediaHeightScale
		})
	})
end)