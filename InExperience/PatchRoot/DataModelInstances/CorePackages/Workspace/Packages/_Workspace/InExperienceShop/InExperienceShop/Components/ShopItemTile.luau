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
local ToUnifiedCategoryIdModule = require(InExperienceShop.Analytics.toUnifiedCategoryId)
local SHOPITEMMEDIAHEIGHTSCALE = require(InExperienceShop.Components.computeShopRowTileWidths).SHOP_ITEM_MEDIA_HEIGHT_SCALE
local FFlagEnableInExperienceShopUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableInExperienceShopUnifiedLogging)
local FFlagEnableCategoryLoggingInShopModule = require(InExperienceShop.Flags.FFlagEnableCategoryLoggingInShop)
local FFlagCategoryLoggingInShopPurchaseModule = require(InExperienceShop.Flags.FFlagCategoryLoggingInShopPurchase)
local FFlagFixThumbnailBackgroundInExperienceShopModule = require(InExperienceShop.Flags.FFlagFixThumbnailBackgroundInExperienceShop)
local FFlagEnableDiscountOnInShopTileModule = require(InExperienceShop.Flags.FFlagEnableDiscountOnInShopTile)
local FFlagLuaAppEnableGamePassFreeTrialsModule = require(InExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local FFlagUseOverMediaOnAllFreeTrialBadgesModule = require(InExperienceShop.Flags.FFlagUseOverMediaOnAllFreeTrialBadges)
local FFlagEnableFreeTrialTopBarChipModule = require(InExperienceShop.Flags.FFlagEnableFreeTrialTopBarChip)
local FFlagEnableGamePassTrialUnifiedLoggingModule = require(InExperienceShop.Flags.FFlagEnableGamePassTrialUnifiedLogging)
local GetIconRichTextFunction = FoundationModule.Utility.getIconRichText
local FormatPriceModule = if FFlagEnableDiscountOnInShopTileModule then require(InExperienceShop.Utils.formatPrice) else nil
local _ = require(InExperienceShop.Types)
local ConstantsModule = require(InExperienceShop.Constants)
local config = {
	freeTrial = "Feature.InExperienceShop.Label.FreeTrial",
	trial = "Feature.InExperienceShop.Label.Trial",
	active = "Feature.InExperienceShop.Label.Active",
	keepIt = "Feature.InExperienceShop.Label.KeepIt"
}

local function TrialBadge(p1)
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseTokensFunction (copy), FFlagUseOverMediaOnAllFreeTrialBadgesModule (copy), Enums (copy), ReactModule (copy), Badge (copy)
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseTokensResult = UseTokensFunction()
	
	return ReactModule.createElement(Badge, {
		testId = "ShopItemTile-TrialBadge",
		text = if p1.freeTrialStatus == "active" then UseLocalizationResult.active elseif p1.freeTrialStatus == "redeemed" then UseLocalizationResult.keepIt else UseLocalizationResult.trial,
		variant = if FFlagUseOverMediaOnAllFreeTrialBadgesModule or p1.freeTrialStatus ~= "active" then Enums.BadgeVariant.OverMedia else Enums.BadgeVariant.Emphasis,
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

return ReactModule.memo(function(Frame: Frame)
	-- upvalues: SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), ReactModule (copy), FFlagLuaAppEnableGamePassFreeTrialsModule (copy), FFlagEnableGamePassTrialUnifiedLoggingModule (copy), FFlagEnableInExperienceShopUnifiedLoggingModule (copy), Parent (copy), InExperienceShop (copy), ToUnifiedCategoryIdModule (copy), FFlagEnableCategoryLoggingInShopModule (copy), SessionService (copy), FFlagCategoryLoggingInShopPurchaseModule (copy), UseGamePassTrialRedemptionModule (copy), FFlagEnableFreeTrialTopBarChipModule (copy), FFlagEnableDiscountOnInShopTileModule (copy), FormatPriceModule (copy), View (copy), SHOPITEMMEDIAHEIGHTSCALE (copy), Image (copy), FFlagFixThumbnailBackgroundInExperienceShopModule (copy), TrialBadge (copy), Text (copy), FreeTrialLabel (copy), Icon (copy), ConstantsModule (copy), IconSize (copy), GetIconRichTextFunction (copy), Enums (copy), ShopItemFooterModule (copy)
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
	local UseSignalStateResult4 = if FFlagLuaAppEnableGamePassFreeTrialsModule then SignalsReactModule.useSignalState(function(p1): boolean
		-- upvalues: UseSignalStateResult (copy), Frame (copy)
		local Redeemed = UseSignalStateResult.getTrialAvailabilities(p1).redeemed
		
		return Frame.itemType == "GamePass" and Redeemed ~= nil and Redeemed[Frame.itemId] ~= nil
	end) else false
	local Available = if NoUseSignalStateResult1 then "available" elseif UseSignalStateResult3 and not UseSignalStateResult1 then "active" elseif UseSignalStateResult4 then "redeemed" else nil
	local Available1 = if FFlagEnableGamePassTrialUnifiedLoggingModule and Frame.itemType == "GamePass" then if Available == "available" then "available" elseif Available == "active" then "Active" elseif Available == "redeemed" then "Redeemed" else "unavailable" else nil
	local UseSignalStateResult5 = if FFlagEnableGamePassTrialUnifiedLoggingModule then SignalsReactModule.useSignalState(function(p1)
		-- upvalues: UseSignalStateResult (copy), Frame (copy)
		local TrialAvailabilityPhase = UseSignalStateResult.getTrialAvailabilityPhase(p1)
		
		return if Frame.itemType == "GamePass" then TrialAvailabilityPhase else "settled"
	end) else "settled"
	local Config = if Available1 == nil then nil else {
		shopPageType = Frame.shopPageType,
		universeId = if Frame.universeId == nil then nil else tonumber(Frame.universeId),
		trialStatus = Available1
	}
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableInExperienceShopUnifiedLoggingModule (upval), FFlagEnableGamePassTrialUnifiedLoggingModule (upval), Frame (copy), UseSignalStateResult5 (copy), Parent (upval), InExperienceShop (upval), ToUnifiedCategoryIdModule (upval), FFlagEnableCategoryLoggingInShopModule (upval), Available1 (copy), UseRefResult (copy), SessionService (upval)
		if not FFlagEnableInExperienceShopUnifiedLoggingModule then return end
		if not FFlagEnableGamePassTrialUnifiedLoggingModule or Frame.itemType ~= "GamePass" or UseSignalStateResult5 == "settled" then
			task.defer(function()
				-- upvalues: Parent (upval), InExperienceShop (upval), Frame (upval), ToUnifiedCategoryIdModule (upval), FFlagEnableCategoryLoggingInShopModule (upval), FFlagEnableGamePassTrialUnifiedLoggingModule (upval), Available1 (upval), UseRefResult (upval), SessionService (upval)
				local AvatarExperienceAnalyticsModule = require(Parent.AvatarExperienceAnalytics)
				local AddUnifiedEventLoggingFunction: (any, any, any) -> () = AvatarExperienceAnalyticsModule.addUnifiedEventLogging
				local ItemType = require(InExperienceShop.Utils.mapShopItemTypeToUnifiedItemType)(Frame.itemType)
				
				if ItemType == nil then return end
				local FFlagAXUnifiedEventStrictPayloads = AvatarExperienceAnalyticsModule.Flags.FFlagAXUnifiedEventStrictPayloads
				local config = {
					universeId = if Frame.universeId == nil then game.GameId else tonumber(Frame.universeId),
					itemId = Frame.itemId,
					itemType = ItemType,
					categoryId = if FFlagAXUnifiedEventStrictPayloads then ToUnifiedCategoryIdModule(Frame.categoryId) else Frame.categoryId,
					gridPositionRow = Frame.gridPositionRow,
					gridPositionColumn = Frame.gridPositionColumn,
					categoryType = if FFlagEnableCategoryLoggingInShopModule then Frame.categoryType else nil,
					stableCategoryId = if FFlagEnableCategoryLoggingInShopModule then Frame.stableCategoryId else nil,
					categoryGroup = if FFlagEnableCategoryLoggingInShopModule then Frame.categoryGroup else nil,
					categoryName = if FFlagEnableCategoryLoggingInShopModule then Frame.categoryName else nil
				}
				
				if FFlagEnableGamePassTrialUnifiedLoggingModule and Frame.itemType == "GamePass" then
					config.trialStatus = Available1
					local TryButtonTrialBadgeFreeTrialText = if Available1 == "available" then "try_button,trial_badge,free_trial_text" elseif Available1 == "Redeemed" then if Frame.price == nil then "trialed_badge" else "trialed_badge,price" elseif Available1 == "Active" then if Frame.price == nil then "active_badge" else "active_badge,price" else nil
					
					if TryButtonTrialBadgeFreeTrialText == nil then
						if UseRefResult.current ~= nil then
							UseRefResult.current:SetAttribute(AvatarExperienceAnalyticsModule.UnifiedEventLogConstants.ATTRIBUTE_PREFIX .. "elementMetadata", nil)
						end
					else
						config.elementMetadata = game:GetService("HttpService"):JSONEncode({ elementsShown = TryButtonTrialBadgeFreeTrialText })
					end
				end
				AddUnifiedEventLoggingFunction(UseRefResult, config, { sessionTagName = SessionService:GetSessionTag("level2a") })
			end)
			
			return
		end
	end, {
		Frame.itemId, Frame.itemType, Frame.universeId, Frame.categoryId,
		Frame.gridPositionRow, Frame.gridPositionColumn,
		if FFlagEnableCategoryLoggingInShopModule then Frame.categoryType else nil,
		if FFlagEnableCategoryLoggingInShopModule then Frame.stableCategoryId else nil,
		if FFlagEnableCategoryLoggingInShopModule then Frame.categoryGroup else nil,
		if FFlagEnableCategoryLoggingInShopModule then Frame.categoryName else nil,
		if FFlagEnableGamePassTrialUnifiedLoggingModule then UseSignalStateResult5 else nil,
		if FFlagEnableGamePassTrialUnifiedLoggingModule then Available1 else nil,
		if FFlagEnableGamePassTrialUnifiedLoggingModule then Frame.price else nil
	})
	local OnItemActivatedFunction = Frame.onItemActivated
	local ItemType = Frame.itemType
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: OnItemActivatedFunction (copy), Frame (copy), ItemType (copy)
		if OnItemActivatedFunction then
			OnItemActivatedFunction(Frame.itemId, ItemType)
		end
	end, { Frame.itemId, ItemType, OnItemActivatedFunction })
	local CategoryLocation = nil
	
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
			CategoryLocation = config
		end
	end
	local UseGamePassTrialRedemptionModuleResult = UseGamePassTrialRedemptionModule(Frame.itemId, {
		shopPageType = Frame.shopPageType,
		categoryLocation = CategoryLocation,
		universeId = if Config == nil then nil else Config.universeId,
		trialStatus = if Config == nil then nil else Config.trialStatus
	}, if FFlagEnableFreeTrialTopBarChipModule then Frame.thumbnail else nil)
	local IsUserBasePriceInRobuxAbove: boolean = FFlagEnableDiscountOnInShopTileModule and (Frame.userBasePriceInRobux ~= nil and (Frame.price ~= nil and Frame.userBasePriceInRobux > Frame.price))
	local FormatPriceModuleResult = if IsUserBasePriceInRobuxAbove and FormatPriceModule then FormatPriceModule(Frame.userBasePriceInRobux) else nil
	local FormatPriceModuleResult1 = if IsUserBasePriceInRobuxAbove and FormatPriceModule then FormatPriceModule(Frame.price) else nil
	
	return if FFlagEnableGamePassTrialUnifiedLoggingModule and Frame.itemType == "GamePass" and UseSignalStateResult5 ~= "settled" then ReactModule.createElement(View, {
		tag = "col fill size-full-0 auto-y radius-medium clip bg-shift-200",
		testId = "ShopItemTile-TrialLoading",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Media = ReactModule.createElement(View, {
			tag = "radius-medium bg-shift-200",
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, SHOPITEMMEDIAHEIGHTSCALE),
			SizeConstraint = Enum.SizeConstraint.RelativeXX
		}),
		TileContent = ReactModule.createElement(View, {
			tag = "col gap-medium size-full-0 auto-y padding-medium",
			LayoutOrder = 2
		}, {
			Title = ReactModule.createElement(View, {
				tag = "radius-small bg-shift-200",
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 16)
			}),
			Price = ReactModule.createElement(View, {
				tag = "radius-small bg-shift-200",
				LayoutOrder = 2,
				Size = UDim2.new(0.4, 0, 0, 12)
			}),
			Button = ReactModule.createElement(View, {
				tag = "radius-small bg-shift-200",
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, 28)
			})
		})
	}) else ReactModule.createElement(View, {
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
			TrialBadge = if Available == nil then nil else ReactModule.createElement(TrialBadge, { freeTrialStatus = Available })
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
				purchaseCategoryLocation = CategoryLocation
			})
		})
	})
end)