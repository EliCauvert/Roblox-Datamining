local avatarExperienceCommon = script:FindFirstAncestor("AvatarExperienceCommon")
local parent = avatarExperienceCommon.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local verifiedBadgesModule = require(parent.VerifiedBadges)
local avatarExperienceUIKitModule = require(parent.AvatarExperienceUIKit)
local itemCardPriceLine = avatarExperienceUIKitModule.ItemCardComponents.ItemCardPriceLine
local itemCardTitle = avatarExperienceUIKitModule.ItemCardComponents.ItemCardTitle
local cryoModule = require(parent.Cryo)
local _ = require(avatarExperienceCommon.Types.TimedOptionType)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local fFlagAXEnableTimedOptionsForCatalogRowCard = avatarExperienceFlagsModule.FFlagAXEnableTimedOptionsForCatalogRowCard
local fFlagAXDurablesForMIS = avatarExperienceFlagsModule.FFlagAXDurablesForMIS
local fFlagAXMISSmallUIChanges = avatarExperienceFlagsModule.FFlagAXMISSmallUIChanges
local fFlagAXMISWithOffers = avatarExperienceFlagsModule.FFlagAXMISWithOffers
local fFlagAXDurables2Option = avatarExperienceFlagsModule.FFlagAXDurables2Option
local icon = foundationModule.Icon
local iconSize = foundationModule.Enums.IconSize

return function(p0) --[[ line: 76 | named "CatalogRowItemCardFooter" ]]
	-- upvalues: useTokens (ref), fFlagAXDurablesForMIS (ref), fFlagAXEnableTimedOptionsForCatalogRowCard (ref), reactModule (ref), cryoModule (ref), fFlagAXMISWithOffers (ref), iconSize (ref), foundationModule (ref), itemCardPriceLine (ref), fFlagAXMISSmallUIChanges (ref), fFlagAXDurables2Option (ref), itemCardTitle (ref), text (ref), icon (ref), verifiedBadgesModule (ref)
	local var7 = useTokens()
	local selectedTimedOptionPrice = nil
	local setSelectedTimedOptionPrice = nil
	
	if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then
		selectedTimedOptionPrice = p0.selectedTimedOptionPrice
		setSelectedTimedOptionPrice = p0.setSelectedTimedOptionPrice
	end
	local createElement_1
	local useMemo = reactModule.useMemo
	useMemo = useMemo(function() --[[ line: 87 ]]
		-- upvalues: p0 (ref), cryoModule (copy), fFlagAXDurablesForMIS (copy), fFlagAXEnableTimedOptionsForCatalogRowCard (copy), selectedTimedOptionPrice (write), fFlagAXMISWithOffers (copy), var7 (ref), iconSize (copy), reactModule (copy), foundationModule (copy), itemCardPriceLine (copy), fFlagAXMISSmallUIChanges (copy)
		local t = {}
		
		if p0.priceLineContent and #p0.priceLineContent > 0 then
			local var23
			for i, v in p0.priceLineContent do
				local var22 = cryoModule.Dictionary.omit(v, { "strikethrough" })
				
				if (fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard) and (selectedTimedOptionPrice and v.type == "price") then
					if v.isOriginalPrice and p0.timedOptions then
						var23 = selectedTimedOptionPrice
						
						for i_1, v_1 in p0.timedOptions do
							if v_1.price == selectedTimedOptionPrice and v_1.discountInformation then
								var23 = v_1.discountInformation.originalPrice
								break
							end
						end
						var22 = cryoModule.Dictionary.join(var22, { price = var23 })
						
						if var23 ~= selectedTimedOptionPrice or fFlagAXMISWithOffers and (not fFlagAXMISWithOffers or v.shouldShowOriginalPrice) then
							if fFlagAXMISWithOffers and v.priceInRobuxDiscountedByOffers then
								var22 = cryoModule.Dictionary.join(var22, { price = v.priceInRobuxDiscountedByOffers })
							end
							if (fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard) and v.strikethrough then
								var22 = cryoModule.Dictionary.join(var22, {
									colorStyle = var7.Color.Content.Muted,
									iconSize = iconSize.XSmall,
									fontStyle = var7.Typography.BodySmall
								})
							end
							t[`PriceLine{i}`] = reactModule.createElement(foundationModule.View, { tag = "auto-xy", LayoutOrder = i }, {
								ItemCardPriceLine = reactModule.createElement(itemCardPriceLine, { content = var22 }),
								Strikethrough = if v.strikethrough then reactModule.createElement(foundationModule.View, {
									tag = "bg-system-neutral anchor-center-center position-center-center size-full-50",
									Size = if fFlagAXMISSmallUIChanges then UDim2.new(1, 0, 0, 1) else nil
								}) else nil
							})
						end
					else
						var22 = cryoModule.Dictionary.join(var22, { price = selectedTimedOptionPrice })
					end
				end
			end
		end
		return t
	end, {
		p0.priceLineContent,
		if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then selectedTimedOptionPrice else nil,
		if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p0.timedOptions else nil,
		if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then var7 else nil
	})
	local var8 = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then if p0.priceLineContent then true else p0.timedOptions else nil
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		tag = "fill self-stretch",
		Size = p0.Size,
		AutomaticSize = p0.AutomaticSize,
		LayoutOrder = p0.LayoutOrder
	}
	local t_1 = {}
	
	if fFlagAXDurables2Option and p0.onRemove then
		local var19
		createElement_1 = reactModule.createElement
		local view_1 = foundationModule.View
		local t_2 = { tag = "row size-full-0 auto-y" }
		local t_3 = {}
		local createElement_2 = reactModule.createElement
		local view_2 = foundationModule.View
		local t_4 = {
			tag = "col align-x-left fill gap-xsmall size-full-0 auto-y",
			LayoutOrder = 1
		}
		local t_5 = {
			ItemCardFooterTitle = reactModule.createElement(itemCardTitle, { LayoutOrder = 1, title = p0.title or "" })
		}
		
		if p0.itemSubType or p0.creatorName then
			var19 = reactModule.createElement
			var19 = var19(foundationModule.View, {
				tag = "row align-x-left gap-xxsmall size-full-0 auto-y",
				LayoutOrder = 2
			}, {
				ItemSubType = if p0.itemSubType then reactModule.createElement(text, {
					LayoutOrder = 1,
					textStyle = var7.Color.Content.Default,
					fontStyle = var7.Typography.BodyMedium,
					Text = p0.itemSubType,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				}) else nil,
				Spacer = if p0.itemSubType and not fFlagAXMISSmallUIChanges then reactModule.createElement(icon, {
					name = "icons/controls/keys/period",
					LayoutOrder = 2,
					size = iconSize.Small
				}) else nil,
				Divider = if p0.creatorName and fFlagAXMISSmallUIChanges then reactModule.createElement(icon, {
					name = "icons/controls/keys/period",
					LayoutOrder = 2,
					size = iconSize.Small
				}) else nil,
				CreatorName = if p0.creatorName then reactModule.createElement(text, {
					tag = "fill self-stretch",
					LayoutOrder = 3,
					textStyle = var7.Color.Content.Default,
					fontStyle = var7.Typography.BodyMedium,
					Text = if p0.creatorHasVerifiedBadge then `{p0.creatorName}{verifiedBadgesModule.emoji.verified}` else p0.creatorName,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				}) else nil
			})
		else
			var19 = nil
		end
		t_5.ItemCardFooterInfo = var19
		t_5.BundleParts = if p0.bundlePartsText and not p0.timedOptions then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy padding-xsmall radius-small bg-surface-100",
			LayoutOrder = 3
		}, {
			Text = reactModule.createElement(text, {
				textStyle = var7.Color.Content.Default,
				fontStyle = var7.Typography.BodySmall,
				Text = p0.bundlePartsText,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextTruncate = Enum.TextTruncate.SplitWord
			})
		}) else nil
		t_3.Left = createElement_2(view_2, t_4, t_5)
		t_3.Right = if p0.onRemove then reactModule.createElement(foundationModule.View, { tag = "auto-xy", LayoutOrder = 2 }, reactModule.createElement(foundationModule.IconButton, {
			icon = "x",
			isCircular = true,
			testId = "catalogRowItemCardRemoveButton",
			variant = foundationModule.Enums.ButtonVariant.Standard,
			onActivated = p0.onRemove
		})) else nil
		createElement_1 = createElement_1(view_1, t_2, t_3)
	else
		local var14
		createElement_1 = reactModule.createElement
		local var11 = "Frame"
		local t_2 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}
		local t_3 = {
			TopLayout = reactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, var7.Gap.XSmall)
			}),
			ItemCardFooterTitle = reactModule.createElement(itemCardTitle, { LayoutOrder = 1, title = p0.title or "" })
		}
		
		if p0.itemSubType or p0.creatorName then
			var14 = reactModule.createElement
			var14 = var14("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.fromScale(1, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				ItemCardFooterInfoLayout = reactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, var7.Gap.XXSmall)
				}),
				ItemSubType = if p0.itemSubType then reactModule.createElement(text, {
					LayoutOrder = 1,
					textStyle = var7.Color.Content.Default,
					fontStyle = var7.Typography.BodyMedium,
					Text = p0.itemSubType,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				}) else nil,
				Spacer = if p0.itemSubType and not fFlagAXMISSmallUIChanges then reactModule.createElement(icon, {
					name = "icons/controls/keys/period",
					LayoutOrder = 2,
					size = iconSize.Small
				}) else nil,
				Divider = if p0.creatorName and fFlagAXMISSmallUIChanges then reactModule.createElement(icon, {
					name = "icons/controls/keys/period",
					LayoutOrder = 2,
					size = iconSize.Small
				}) else nil,
				CreatorName = if p0.creatorName then reactModule.createElement(text, {
					tag = "fill self-stretch",
					LayoutOrder = 3,
					textStyle = var7.Color.Content.Default,
					fontStyle = var7.Typography.BodyMedium,
					Text = if p0.creatorHasVerifiedBadge then `{p0.creatorName}{verifiedBadgesModule.emoji.verified}` else p0.creatorName,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				}) else nil
			})
		else
			var14 = nil
		end
		t_3.ItemCardFooterInfo = var14
		t_3.BundleParts = if p0.bundlePartsText then reactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundColor3 = var7.Color.Surface.Surface_100.Color3,
			BackgroundTransparency = var7.Color.Surface.Surface_100.Transparency,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var7.Radius.Small) }),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var7.Padding.XSmall),
				PaddingLeft = UDim.new(0, var7.Padding.XSmall),
				PaddingRight = UDim.new(0, var7.Padding.XSmall),
				PaddingBottom = UDim.new(0, var7.Padding.XSmall)
			}),
			Text = reactModule.createElement(text, {
				textStyle = var7.Color.Content.Default,
				fontStyle = var7.Typography.BodySmall,
				Text = p0.bundlePartsText,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextTruncate = Enum.TextTruncate.SplitWord
			})
		}) else nil
		createElement_1 = createElement_1(var11, t_2, t_3)
	end
	local var20
	t_1.TopSection = createElement_1
	t_1.BottomPrice = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard or (not p0.priceLineContent or #p0.priceLineContent <= 0) then nil else reactModule.createElement(foundationModule.View, {
		tag = "auto-xy row gap-xsmall position-bottom-left anchor-bottom-left"
	}, useMemo)
	
	if (fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard) and var8 then
		var20 = reactModule.createElement
		var20 = var20(foundationModule.View, {
			tag = if fFlagAXDurables2Option and p0.hideTimedOptionSelections then "auto-x row gap-xsmall align-y-center position-bottom-left anchor-bottom-left" else "auto-xy row gap-xsmall align-y-center position-bottom-left anchor-bottom-left",
			Size = if fFlagAXDurables2Option and p0.hideTimedOptionSelections then UDim2.fromOffset(0, var7.Size.Size_1200) else nil
		}, cryoModule.Dictionary.join(if fFlagAXDurables2Option and p0.hideTimedOptionSelections and p0.timedOptions and ((not p0.isOwned or p0.expirationTime) and p0.itemStatusInCheckout == nil) then {} else useMemo, {
			WearTimeOptions = if fFlagAXDurables2Option and p0.hideTimedOptionSelections or not p0.timedOptions or p0.isOwned and not p0.expirationTime then nil else reactModule.createElement(foundationModule.View, { tag = "auto-xy padding-left-small", LayoutOrder = 100 }, {
				WearTimeSelectedOptionInList = if p0.wearTimeSelectedOptionInList then reactModule.createElement(p0.wearTimeSelectedOptionInList, {
					options = p0.timedOptions,
					selectedTimedOptionIndexInReducer = if fFlagAXDurablesForMIS then p0.selectedTimedOptionIndexInReducer else nil,
					onOptionActivated = function(p1) --[[ line: 415 ]]
						-- upvalues: p0 (ref), setSelectedTimedOptionPrice (write)
						local var24 = p0.timedOptions[p1]
						
						if var24 then
							if setSelectedTimedOptionPrice then
								setSelectedTimedOptionPrice(var24.price)
							end
							if p0.onTimedOptionPriceChanged then
								p0.onTimedOptionPriceChanged(var24.price, if var24.days == 0 then nil else var24.days)
							end
						end
					end
				}) else nil
			}),
			Badge = if fFlagAXDurables2Option and p0.offerApplied then reactModule.createElement(foundationModule.Popover.Root, { isOpen = p0.showOfferPillTooltip or false }, {
				Anchor = reactModule.createElement(foundationModule.Popover.Anchor, { LayoutOrder = 101 }, {
					Badge = reactModule.createElement(foundationModule.Badge, {
						icon = {
							name = foundationModule.Enums.IconName.TagSparkle,
							position = foundationModule.Enums.IconPosition.Left
						},
						text = p0.offersLocalized and p0.offersLocalized.OfferApplied,
						variant = foundationModule.Enums.BadgeVariant.Neutral,
						shape = foundationModule.Enums.BadgeShape.Pill,
						size = foundationModule.Enums.BadgeSize.XSmall
					})
				}),
				Content = reactModule.createElement(foundationModule.Popover.Content, {
					align = foundationModule.Enums.PopoverAlign.Center,
					side = foundationModule.Enums.PopoverSide.Top,
					radius = foundationModule.Enums.Radius.Medium,
					backgroundStyle = var7.Color.System.Contrast
				}, {
					TooltipContent = reactModule.createElement(foundationModule.View, {
						tag = "col gap-xsmall auto-xy padding-x-medium padding-y-small"
					}, {
						TooltipText = reactModule.createElement(text, {
							tag = "auto-xy text-title-medium text-truncate-end content-inverse-emphasis",
							Text = p0.offersLocalized and p0.offersLocalized.OfferAppliedTooltip
						})
					})
				})
			}) else nil
		}))
	else
		var20 = nil
	end
	t_1.BottomContent = var20
	
	return createElement(view, t, t_1)
end