local AvatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local Parent = AvatarExperienceCommon.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local VerifiedBadgesModule = require(Parent.VerifiedBadges)
local AvatarExperienceUIKitModule = require(Parent.AvatarExperienceUIKit)
local ItemCardPriceLine = AvatarExperienceUIKitModule.ItemCardComponents.ItemCardPriceLine
local ItemCardTitle = AvatarExperienceUIKitModule.ItemCardComponents.ItemCardTitle
local CryoModule = require(Parent.Cryo)
local _ = require(AvatarExperienceCommon.Types.TimedOptionType)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local FFlagAXEnableTimedOptionsForCatalogRowCard = AvatarExperienceFlagsModule.FFlagAXEnableTimedOptionsForCatalogRowCard
local FFlagAXDurablesForMIS = AvatarExperienceFlagsModule.FFlagAXDurablesForMIS
local FFlagAXMISSmallUIChanges = AvatarExperienceFlagsModule.FFlagAXMISSmallUIChanges
local FFlagAXMISWithOffers = AvatarExperienceFlagsModule.FFlagAXMISWithOffers
local FFlagAXDurables2Option = AvatarExperienceFlagsModule.FFlagAXDurables2Option
local FFlagAXGifting = AvatarExperienceFlagsModule.FFlagAXGifting
local FFlagAXMISOffersChip = AvatarExperienceFlagsModule.FFlagAXMISOffersChip
local Icon = FoundationModule.Icon
local IconSize = FoundationModule.Enums.IconSize

return function(Frame: Frame) --[[ Line: 79 | Named "CatalogRowItemCardFooter" ]]
	-- upvalues: UseTokensFunction (copy), FFlagAXDurablesForMIS (copy), FFlagAXEnableTimedOptionsForCatalogRowCard (copy), ReactModule (copy), CryoModule (copy), FFlagAXMISWithOffers (copy), IconSize (copy), FoundationModule (copy), ItemCardPriceLine (copy), FFlagAXMISSmallUIChanges (copy), FFlagAXGifting (copy), FFlagAXDurables2Option (copy), ItemCardTitle (copy), Text (copy), Icon (copy), VerifiedBadgesModule (copy), FFlagAXMISOffersChip (copy)
	local UseTokensResult = UseTokensFunction()
	local Price = nil
	local SetSelectedTimedOptionPriceFunction = nil
	
	if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then
		Price = Frame.selectedTimedOptionPrice
		SetSelectedTimedOptionPriceFunction = Frame.setSelectedTimedOptionPrice
	end
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 90 ]]
		-- upvalues: Frame (copy), CryoModule (upval), FFlagAXDurablesForMIS (upval), FFlagAXEnableTimedOptionsForCatalogRowCard (upval), Price (ref), FFlagAXMISWithOffers (upval), UseTokensResult (copy), IconSize (upval), ReactModule (upval), FoundationModule (upval), ItemCardPriceLine (upval), FFlagAXMISSmallUIChanges (upval)
		local Elements = {}
		
		if Frame.priceLineContent and #Frame.priceLineContent > 0 then
			local Price1 = nil
			for LayoutOrder, value in Frame.priceLineContent do
				local OmitResult = CryoModule.Dictionary.omit(value, { "strikethrough" })
				
				if (FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard) and (Price and value.type == "price") then
					if value.isOriginalPrice and Frame.timedOptions then
						Price1 = Price
						
						for _, timedOption in Frame.timedOptions do
							if timedOption.price == Price and timedOption.discountInformation then
								Price1 = timedOption.discountInformation.originalPrice
								break
							end
						end
						OmitResult = CryoModule.Dictionary.join(OmitResult, { price = Price1 })
						
						if Price1 == Price and (not FFlagAXMISWithOffers or FFlagAXMISWithOffers and not value.shouldShowOriginalPrice) then
							continue
						end
					else
						OmitResult = CryoModule.Dictionary.join(OmitResult, { price = Price })
					end
				end
				if FFlagAXMISWithOffers and value.priceInRobuxDiscountedByOffers then
					OmitResult = CryoModule.Dictionary.join(OmitResult, { price = value.priceInRobuxDiscountedByOffers })
				end
				if (FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard) and value.strikethrough then
					OmitResult = CryoModule.Dictionary.join(OmitResult, {
						colorStyle = UseTokensResult.Color.Content.Muted,
						iconSize = IconSize.XSmall,
						fontStyle = UseTokensResult.Typography.BodySmall
					})
				end
				Elements[`PriceLine{LayoutOrder}`] = ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", LayoutOrder = LayoutOrder }, {
					ItemCardPriceLine = ReactModule.createElement(ItemCardPriceLine, { content = OmitResult }),
					Strikethrough = if value.strikethrough then ReactModule.createElement(FoundationModule.View, {
						tag = "bg-system-neutral anchor-center-center position-center-center size-full-50",
						Size = if FFlagAXMISSmallUIChanges then UDim2.new(1, 0, 0, 1) else nil
					}) else nil
				})
			end
		end
		return Elements
	end, {
		Frame.priceLineContent,
		if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then Price else nil,
		if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then Frame.timedOptions else nil,
		if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then UseTokensResult else nil
	})
	local v1 = if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard then Frame.priceLineContent and #Frame.priceLineContent > 0 or Frame.timedOptions else nil
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "fill self-stretch",
		Size = Frame.Size,
		AutomaticSize = Frame.AutomaticSize,
		LayoutOrder = Frame.LayoutOrder
	}, {
		TopSection = if if FFlagAXGifting then Frame.onRemove or Frame.giftButton else FFlagAXDurables2Option and Frame.onRemove then ReactModule.createElement(FoundationModule.View, { tag = "row size-full-0 auto-y" }, {
			Left = ReactModule.createElement(FoundationModule.View, {
				tag = "col align-x-left fill gap-xsmall size-full-0 auto-y",
				LayoutOrder = 1
			}, {
				ItemCardFooterTitle = ReactModule.createElement(ItemCardTitle, { LayoutOrder = 1, title = Frame.title or "" }),
				ItemCardFooterInfo = if Frame.itemSubType or Frame.creatorName then ReactModule.createElement(FoundationModule.View, {
					tag = "row align-x-left gap-xxsmall size-full-0 auto-y",
					LayoutOrder = 2
				}, {
					ItemSubType = if Frame.itemSubType then ReactModule.createElement(Text, {
						LayoutOrder = 1,
						textStyle = UseTokensResult.Color.Content.Default,
						fontStyle = UseTokensResult.Typography.BodyMedium,
						Text = Frame.itemSubType,
						TextXAlignment = Enum.TextXAlignment.Left,
						AutomaticSize = Enum.AutomaticSize.XY,
						TextTruncate = Enum.TextTruncate.SplitWord
					}) else nil,
					Spacer = if Frame.itemSubType and not FFlagAXMISSmallUIChanges then ReactModule.createElement(Icon, {
						name = "icons/controls/keys/period",
						LayoutOrder = 2,
						size = IconSize.Small
					}) else nil,
					Divider = if Frame.creatorName and FFlagAXMISSmallUIChanges then ReactModule.createElement(Icon, {
						name = "icons/controls/keys/period",
						LayoutOrder = 2,
						size = IconSize.Small
					}) else nil,
					CreatorName = if Frame.creatorName then ReactModule.createElement(Text, {
						tag = "fill self-stretch",
						LayoutOrder = 3,
						textStyle = UseTokensResult.Color.Content.Default,
						fontStyle = UseTokensResult.Typography.BodyMedium,
						Text = if Frame.creatorHasVerifiedBadge then `{Frame.creatorName}{VerifiedBadgesModule.emoji.verified}` else Frame.creatorName,
						TextXAlignment = Enum.TextXAlignment.Left,
						AutomaticSize = Enum.AutomaticSize.XY,
						TextTruncate = Enum.TextTruncate.SplitWord
					}) else nil
				}) else nil,
				BundleParts = if Frame.bundlePartsText and not Frame.timedOptions then ReactModule.createElement(FoundationModule.View, {
					tag = "auto-xy padding-xsmall radius-small bg-surface-100",
					LayoutOrder = 3
				}, {
					Text = ReactModule.createElement(Text, {
						textStyle = UseTokensResult.Color.Content.Default,
						fontStyle = UseTokensResult.Typography.BodySmall,
						Text = Frame.bundlePartsText,
						TextXAlignment = Enum.TextXAlignment.Left,
						AutomaticSize = Enum.AutomaticSize.XY,
						TextTruncate = Enum.TextTruncate.SplitWord
					})
				}) else nil
			}),
			Right = if Frame.onRemove or FFlagAXGifting and Frame.giftButton then ReactModule.createElement(FoundationModule.View, {
				LayoutOrder = 2,
				tag = if FFlagAXGifting then {
					["auto-xy"] = true,
					["row gap-small"] = Frame.giftButton ~= nil
				} else "auto-xy"
			}, if FFlagAXGifting then {
				GiftButton = if Frame.giftButton == nil then nil else ReactModule.createElement(FoundationModule.View, {
					tag = "auto-xy",
					LayoutOrder = 1,
					testId = "catalogRowItemCardGiftButton"
				}, Frame.giftButton),
				RemoveButton = if Frame.onRemove then ReactModule.createElement(FoundationModule.IconButton, {
					icon = "x",
					isCircular = true,
					testId = "catalogRowItemCardRemoveButton",
					LayoutOrder = 2,
					variant = FoundationModule.Enums.ButtonVariant.Standard,
					onActivated = Frame.onRemove
				}) else nil
			} elseif Frame.onRemove then ReactModule.createElement(FoundationModule.IconButton, {
				icon = "x",
				isCircular = true,
				testId = "catalogRowItemCardRemoveButton",
				variant = FoundationModule.Enums.ButtonVariant.Standard,
				onActivated = Frame.onRemove
			}) else nil) else nil
		}) else ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			TopLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, UseTokensResult.Gap.XSmall)
			}),
			ItemCardFooterTitle = ReactModule.createElement(ItemCardTitle, { LayoutOrder = 1, title = Frame.title or "" }),
			ItemCardFooterInfo = if Frame.itemSubType or Frame.creatorName then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				ItemCardFooterInfoLayout = ReactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, UseTokensResult.Gap.XXSmall)
				}),
				ItemSubType = if Frame.itemSubType then ReactModule.createElement(Text, {
					LayoutOrder = 1,
					textStyle = UseTokensResult.Color.Content.Default,
					fontStyle = UseTokensResult.Typography.BodyMedium,
					Text = Frame.itemSubType,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				}) else nil,
				Spacer = if Frame.itemSubType and not FFlagAXMISSmallUIChanges then ReactModule.createElement(Icon, {
					name = "icons/controls/keys/period",
					LayoutOrder = 2,
					size = IconSize.Small
				}) else nil,
				Divider = if Frame.creatorName and FFlagAXMISSmallUIChanges then ReactModule.createElement(Icon, {
					name = "icons/controls/keys/period",
					LayoutOrder = 2,
					size = IconSize.Small
				}) else nil,
				CreatorName = if Frame.creatorName then ReactModule.createElement(Text, {
					tag = "fill self-stretch",
					LayoutOrder = 3,
					textStyle = UseTokensResult.Color.Content.Default,
					fontStyle = UseTokensResult.Typography.BodyMedium,
					Text = if Frame.creatorHasVerifiedBadge then `{Frame.creatorName}{VerifiedBadgesModule.emoji.verified}` else Frame.creatorName,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				}) else nil
			}) else nil,
			BundleParts = if Frame.bundlePartsText then ReactModule.createElement("Frame", {
				LayoutOrder = 3,
				BackgroundColor3 = UseTokensResult.Color.Surface.Surface_100.Color3,
				BackgroundTransparency = UseTokensResult.Color.Surface.Surface_100.Transparency,
				AutomaticSize = Enum.AutomaticSize.XY
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, UseTokensResult.Radius.Small) }),
				UIPadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, UseTokensResult.Padding.XSmall),
					PaddingLeft = UDim.new(0, UseTokensResult.Padding.XSmall),
					PaddingRight = UDim.new(0, UseTokensResult.Padding.XSmall),
					PaddingBottom = UDim.new(0, UseTokensResult.Padding.XSmall)
				}),
				Text = ReactModule.createElement(Text, {
					textStyle = UseTokensResult.Color.Content.Default,
					fontStyle = UseTokensResult.Typography.BodySmall,
					Text = Frame.bundlePartsText,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				})
			}) else nil
		}),
		BottomPrice = if FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard or not Frame.priceLineContent or #Frame.priceLineContent <= 0 then nil else ReactModule.createElement(FoundationModule.View, {
			tag = "auto-xy row gap-xsmall position-bottom-left anchor-bottom-left"
		}, UseMemoResult),
		BottomContent = if (FFlagAXDurablesForMIS or FFlagAXEnableTimedOptionsForCatalogRowCard) and v1 then ReactModule.createElement(FoundationModule.View, {
			tag = if FFlagAXDurables2Option and Frame.hideTimedOptionSelections then "auto-x row gap-xsmall align-y-center position-bottom-left anchor-bottom-left" else "auto-xy row gap-xsmall align-y-center position-bottom-left anchor-bottom-left",
			Size = if FFlagAXMISOffersChip then UDim2.fromOffset(0, UseTokensResult.Size.Size_800) else nil
		}, CryoModule.Dictionary.join(if FFlagAXDurables2Option and Frame.hideTimedOptionSelections and Frame.timedOptions and (not Frame.isOwned or Frame.expirationTime) and Frame.itemStatusInCheckout == nil then {} else UseMemoResult, {
			WearTimeOptions = if FFlagAXDurables2Option and Frame.hideTimedOptionSelections then nil elseif Frame.timedOptions and (not Frame.isOwned or Frame.expirationTime) then ReactModule.createElement(FoundationModule.View, { tag = "auto-xy padding-left-small", LayoutOrder = 100 }, {
				WearTimeSelectedOptionInList = if Frame.wearTimeSelectedOptionInList then ReactModule.createElement(Frame.wearTimeSelectedOptionInList, {
					options = Frame.timedOptions,
					selectedTimedOptionIndexInReducer = if FFlagAXDurablesForMIS then Frame.selectedTimedOptionIndexInReducer else nil,
					onOptionActivated = function(p1) --[[ Line: 445 ]]
						-- upvalues: Frame (copy), SetSelectedTimedOptionPriceFunction (ref)
						local TimedOption = Frame.timedOptions[p1]
						
						if TimedOption then
							if SetSelectedTimedOptionPriceFunction then
								SetSelectedTimedOptionPriceFunction(TimedOption.price)
							end
							if Frame.onTimedOptionPriceChanged then
								Frame.onTimedOptionPriceChanged(TimedOption.price, if TimedOption.days == 0 then nil else TimedOption.days)
							end
						end
					end
				}) else nil
			}) else nil,
			Badge = if FFlagAXDurables2Option and Frame.offerApplied then ReactModule.createElement(FoundationModule.Popover.Root, { isOpen = Frame.showOfferPillTooltip or false }, {
				Anchor = ReactModule.createElement(FoundationModule.Popover.Anchor, { LayoutOrder = 101 }, {
					Badge = ReactModule.createElement(FoundationModule.Badge, {
						icon = {
							name = FoundationModule.Enums.IconName.TagSparkle,
							position = FoundationModule.Enums.IconPosition.Left
						},
						text = Frame.offersLocalized and Frame.offersLocalized.OfferApplied,
						variant = FoundationModule.Enums.BadgeVariant.Neutral,
						shape = FoundationModule.Enums.BadgeShape.Pill,
						size = FoundationModule.Enums.BadgeSize.XSmall
					})
				}),
				Content = ReactModule.createElement(FoundationModule.Popover.Content, {
					align = FoundationModule.Enums.PopoverAlign.Center,
					side = FoundationModule.Enums.PopoverSide.Top,
					radius = FoundationModule.Enums.Radius.Medium,
					backgroundStyle = UseTokensResult.Color.System.Contrast
				}, {
					TooltipContent = ReactModule.createElement(FoundationModule.View, {
						tag = "col gap-xsmall auto-xy padding-x-medium padding-y-small"
					}, {
						TooltipText = ReactModule.createElement(Text, {
							tag = "auto-xy text-title-medium text-truncate-end content-inverse-emphasis",
							Text = Frame.offersLocalized and Frame.offersLocalized.OfferAppliedTooltip
						})
					})
				})
			}) else nil,
			OfferAppliedBadge = if FFlagAXMISOffersChip and (not FFlagAXDurables2Option and Frame.offerApplied) and (not Frame.timedOptions or Frame.isOwned and not Frame.expirationTime) then ReactModule.createElement(FoundationModule.Badge, {
				LayoutOrder = 101,
				icon = {
					name = FoundationModule.Enums.IconName.TagSparkle,
					position = FoundationModule.Enums.IconPosition.Left
				},
				text = Frame.offersLocalized and Frame.offersLocalized.OfferApplied,
				variant = FoundationModule.Enums.BadgeVariant.Neutral,
				shape = FoundationModule.Enums.BadgeShape.Pill,
				size = FoundationModule.Enums.BadgeSize.XSmall
			}) else nil
		})) else nil
	})
end