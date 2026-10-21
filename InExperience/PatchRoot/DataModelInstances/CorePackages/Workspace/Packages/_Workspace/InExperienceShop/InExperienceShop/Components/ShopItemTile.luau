local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local SessionService = game:GetService("SessionService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local SignalsReactModule = require(Parent.SignalsReact)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Image = FoundationModule.Image
local Icon = FoundationModule.Icon
local Enums = FoundationModule.Enums
local Badge = FoundationModule.Badge
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconSize = Enums.IconSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local ShopItemFooterModule = require(InExperienceShop.Components.ShopItemFooter)
local UseGamePassTrialRedemptionModule = require(InExperienceShop.Hooks.useGamePassTrialRedemption)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local SHOPITEMMEDIAHEIGHTSCALE = require(InExperienceShop.Components.computeShopRowTileWidths).SHOP_ITEM_MEDIA_HEIGHT_SCALE
local FFlagEnableInExperienceShopUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local FFlagEnableCategoryLoggingInShopModule = require(InExperienceShop.Flags.FFlagEnableCategoryLoggingInShop)
local FFlagCategoryLoggingInShopPurchaseModule = require(InExperienceShop.Flags.FFlagCategoryLoggingInShopPurchase)
local FFlagFixThumbnailBackgroundInExperienceShopModule = require(InExperienceShop.Flags.FFlagFixThumbnailBackgroundInExperienceShop)
local FFlagEnableDiscountOnInShopTileModule = require(InExperienceShop.Flags.FFlagEnableDiscountOnInShopTile)
local FFlagLuaAppEnableGamePassFreeTrialsModule = require(InExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local FormatPriceModule = if FFlagEnableDiscountOnInShopTileModule then require(InExperienceShop.Utils.formatPrice) else nil
local _ = require(InExperienceShop.Types)
local ConstantsModule = require(InExperienceShop.Constants)
local config = {
	freeTrial = "Feature.InExperienceShop.Label.FreeTrial",
	trial = "Feature.InExperienceShop.Label.Trial",
	active = "Feature.InExperienceShop.Label.Active"
}

local function TrialBadge(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseTokensFunction (copy), ReactModule (copy), Badge (copy), Enums (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Badge, {
		text = if p1.isActive then UseLocalizationResult.active else UseLocalizationResult.trial,
		variant = if p1.isActive then Enums.BadgeVariant.Emphasis else Enums.BadgeVariant.OverMedia,
		size = Enums.BadgeSize.Small,
		Position = UDim2.fromOffset(UseTokensResult.Gap.Small, UseTokensResult.Gap.Small)
	})
end

local function FreeTrialLabel(Frame)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseTokensFunction (copy), ReactModule (copy), Text (copy)
	return ReactModule.createElement(Text, {
		tag = "auto-xy",
		fontStyle = UseTokensFunction().Typography.BodyMedium,
		Text = UseLocalizationFunction(config).freeTrial,
		LayoutOrder = Frame.LayoutOrder
	})
end

return ReactModule.memo(function(Frame)
	-- upvalues: SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), ReactModule (copy), FFlagLuaAppEnableGamePassFreeTrialsModule (copy), UseGamePassTrialRedemptionModule (copy), FFlagEnableInExperienceShopUnifiedLoggingModule (copy), Parent (copy), InExperienceShop (copy), FFlagEnableCategoryLoggingInShopModule (copy), SessionService (copy), FFlagCategoryLoggingInShopPurchaseModule (copy), FFlagEnableDiscountOnInShopTileModule (copy), FormatPriceModule (copy), View (copy), Image (copy), FFlagFixThumbnailBackgroundInExperienceShopModule (copy), SHOPITEMMEDIAHEIGHTSCALE (copy), TrialBadge (copy), Text (copy), FreeTrialLabel (copy), Icon (copy), ConstantsModule (copy), IconSize (copy), GetIconRichTextFunction (copy), Enums (copy), ShopItemFooterModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	local UseRefResult = ReactModule.useRef(nil)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(function(p1)
		-- upvalues: UseSignalStateResult (copy), Frame (copy)
		return UseSignalStateResult.getOwnership(p1)[Frame.itemId]
	end)
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseSignalStateResult (copy)
		if Frame.itemType == "GamePass" then
			UseSignalStateResult.fetchGamePassOwnership(Frame.itemId)
		end
	end, {
		Frame.itemId,
		Frame.itemType,
		UseSignalStateResult.fetchGamePassOwnership
	})
	local UseSignalStateResult2 = SignalsReactModule.useSignalState(function(p1): boolean
		-- upvalues: UseSignalStateResult (copy), FFlagLuaAppEnableGamePassFreeTrialsModule (upval), Frame (copy)
		local Available = UseSignalStateResult.getTrialAvailabilities(p1).available
		
		return if FFlagLuaAppEnableGamePassFreeTrialsModule and Frame.itemType == "GamePass" then Available[Frame.itemId] == true else false
	end)
	local NoUseSignalStateResult1: boolean = FFlagLuaAppEnableGamePassFreeTrialsModule and (UseSignalStateResult2 and not UseSignalStateResult1)
	local UseSignalStateResult3 = if FFlagLuaAppEnableGamePassFreeTrialsModule then SignalsReactModule.useSignalState(function(p1): boolean
		-- upvalues: UseSignalStateResult (copy), Frame (copy)
		local Active = UseSignalStateResult.getTrialAvailabilities(p1).active
		
		return Frame.itemType == "GamePass" and Active[Frame.itemId] == true
	end) else false
	local NoUseSignalStateResult1_1: boolean = NoUseSignalStateResult1 or UseSignalStateResult3 and not UseSignalStateResult1
	local UseGamePassTrialRedemptionModuleResult = UseGamePassTrialRedemptionModule(Frame.itemId)
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableInExperienceShopUnifiedLoggingModule (upval), Parent (upval), InExperienceShop (upval), Frame (copy), FFlagEnableCategoryLoggingInShopModule (upval), UseRefResult (copy), SessionService (upval)
		if FFlagEnableInExperienceShopUnifiedLoggingModule then
			task.defer(function()
				-- upvalues: Parent (upval), InExperienceShop (upval), Frame (upval), FFlagEnableCategoryLoggingInShopModule (upval), UseRefResult (upval), SessionService (upval)
				local AddUnifiedEventLoggingFunction: (any, any, any) -> () = require(Parent.AvatarExperienceAnalytics).addUnifiedEventLogging
				local ItemType = require(InExperienceShop.Utils.mapShopItemTypeToUnifiedItemType)(Frame.itemType)
				
				if ItemType ~= nil then
					AddUnifiedEventLoggingFunction(UseRefResult, {
						universeId = if Frame.universeId == nil then game.GameId else tonumber(Frame.universeId),
						itemId = Frame.itemId,
						itemType = ItemType,
						categoryId = Frame.categoryId,
						gridPositionRow = Frame.gridPositionRow,
						gridPositionColumn = Frame.gridPositionColumn,
						categoryType = if FFlagEnableCategoryLoggingInShopModule then Frame.categoryType else nil,
						stableCategoryId = if FFlagEnableCategoryLoggingInShopModule then Frame.stableCategoryId else nil,
						categoryGroup = if FFlagEnableCategoryLoggingInShopModule then Frame.categoryGroup else nil,
						categoryName = if FFlagEnableCategoryLoggingInShopModule then Frame.categoryName else nil
					}, { sessionTagName = SessionService:GetSessionTag("level2a") })
					
					return
				end
			end)
			
			return
		end
	end, {
		Frame.itemId, Frame.itemType, Frame.universeId, Frame.categoryId,
		Frame.gridPositionRow, Frame.gridPositionColumn,
		if FFlagEnableCategoryLoggingInShopModule then Frame.categoryType else nil,
		if FFlagEnableCategoryLoggingInShopModule then Frame.stableCategoryId else nil,
		if FFlagEnableCategoryLoggingInShopModule then Frame.categoryGroup else nil,
		if FFlagEnableCategoryLoggingInShopModule then Frame.categoryName else nil
	})
	local OnItemActivatedFunction = Frame.onItemActivated
	local ItemType = Frame.itemType
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: OnItemActivatedFunction (copy), Frame (copy), ItemType (copy)
		if OnItemActivatedFunction then
			OnItemActivatedFunction(Frame.itemId, ItemType)
		end
	end, { Frame.itemId, ItemType, OnItemActivatedFunction })
	local PurchaseCategoryLocation = nil
	
	if FFlagCategoryLoggingInShopPurchaseModule then
		local config = {
			categoryGroup = Frame.categoryGroup,
			categoryPosition = Frame.categoryId,
			gridPositionRow = Frame.gridPositionRow,
			gridPositionColumn = Frame.gridPositionColumn,
			categoryName = Frame.categoryName,
			stableCategoryId = Frame.stableCategoryId
		}
		
		if config.categoryGroup ~= nil or config.categoryPosition ~= nil or config.gridPositionRow ~= nil or config.gridPositionColumn ~= nil or config.categoryName ~= nil or config.stableCategoryId ~= nil then
			PurchaseCategoryLocation = config
		end
	end
	local IsUserBasePriceInRobuxAbove: boolean = FFlagEnableDiscountOnInShopTileModule and (Frame.userBasePriceInRobux ~= nil and (Frame.price ~= nil and Frame.userBasePriceInRobux > Frame.price))
	local FormatPriceModuleResult = if IsUserBasePriceInRobuxAbove and FormatPriceModule then FormatPriceModule(Frame.userBasePriceInRobux) else nil
	local FormatPriceModuleResult1 = if IsUserBasePriceInRobuxAbove and FormatPriceModule then FormatPriceModule(Frame.price) else nil
	
	return ReactModule.createElement(View, {
		tag = "col fill size-full-0 auto-y radius-medium clip bg-shift-200",
		LayoutOrder = Frame.LayoutOrder,
		onActivated = if OnItemActivatedFunction then UseResult else nil,
		ref = if FFlagEnableInExperienceShopUnifiedLoggingModule then UseRefResult else nil
	}, {
		Media = ReactModule.createElement(Image, {
			LayoutOrder = 1,
			tag = {
				["radius-medium bg-shift-200"] = FFlagFixThumbnailBackgroundInExperienceShopModule,
				["radius-medium"] = not FFlagFixThumbnailBackgroundInExperienceShopModule
			},
			Size = UDim2.fromScale(1, SHOPITEMMEDIAHEIGHTSCALE),
			SizeConstraint = Enum.SizeConstraint.RelativeXX,
			Image = Frame.thumbnail,
			ScaleType = Enum.ScaleType.Fit
		}, {
			TrialBadge = if NoUseSignalStateResult1_1 then ReactModule.createElement(TrialBadge, { isActive = UseSignalStateResult3 }) else nil
		}),
		TileContent = ReactModule.createElement(View, {
			tag = "col gap-medium size-full-0 auto-y padding-medium",
			LayoutOrder = 2
		}, {
			ContentHeader = ReactModule.createElement(View, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, {
				Title = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-title-medium text-align-x-left text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = Frame.name
				}),
				FreeTrialLabel = if NoUseSignalStateResult1 then ReactModule.createElement(FreeTrialLabel, { LayoutOrder = 2 }) else nil,
				Metadata = if Frame.price and not NoUseSignalStateResult1 then if FFlagEnableDiscountOnInShopTileModule then ReactModule.createElement(View, {
					tag = "row align-y-center gap-xsmall auto-xy",
					LayoutOrder = 2
				}, {
					SalePrice = ReactModule.createElement(View, {
						tag = "row align-y-center gap-xsmall auto-xy",
						LayoutOrder = 1
					}, {
						SaleRobuxIcon = ReactModule.createElement(Icon, {
							LayoutOrder = 1,
							name = ConstantsModule.ROBUX_ICON,
							size = IconSize.Small
						}),
						SalePriceLabel = ReactModule.createElement(Text, {
							tag = "auto-xy text-body-medium text-truncate-end content-emphasis",
							LayoutOrder = 2,
							Text = FormatPriceModuleResult1 or tostring(Frame.price)
						})
					}),
					OriginalPrice = if IsUserBasePriceInRobuxAbove and FormatPriceModuleResult then ReactModule.createElement(Text, {
						tag = "auto-xy text-body-small text-truncate-end content-default",
						RichText = true,
						LayoutOrder = 2,
						Text = "<s>" .. GetIconRichTextFunction(Enums.IconName.Robux) .. " " .. FormatPriceModuleResult .. "</s>"
					}) else nil
				}) else ReactModule.createElement(View, {
					tag = "row align-y-center gap-xsmall auto-xy",
					LayoutOrder = 2
				}, {
					RobuxIcon = ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						name = ConstantsModule.ROBUX_ICON,
						size = IconSize.Small
					}),
					PriceLabel = ReactModule.createElement(Text, {
						tag = "auto-xy text-body-medium text-truncate-end content-default",
						LayoutOrder = 2,
						Text = tostring(Frame.price)
					})
				}) else nil
			}),
			Footer = ReactModule.createElement(ShopItemFooterModule, {
				LayoutOrder = 2,
				itemId = Frame.itemId,
				itemType = Frame.itemType,
				isOwned = UseSignalStateResult1,
				showTry = UseSignalStateResult2,
				isActionLoading = UseGamePassTrialRedemptionModuleResult.isActionLoading,
				isActionDisabled = UseGamePassTrialRedemptionModuleResult.isActionDisabled,
				onTryActivated = UseGamePassTrialRedemptionModuleResult.onTryActivated,
				price = Frame.price,
				shopPageType = Frame.shopPageType,
				purchaseCategoryLocation = PurchaseCategoryLocation
			})
		})
	})
end)