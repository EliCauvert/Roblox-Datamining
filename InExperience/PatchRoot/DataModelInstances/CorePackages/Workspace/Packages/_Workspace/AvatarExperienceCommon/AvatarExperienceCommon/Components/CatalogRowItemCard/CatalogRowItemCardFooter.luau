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

return function(p1)
	-- upvalues: useTokens (ref), fFlagAXDurablesForMIS (ref), fFlagAXEnableTimedOptionsForCatalogRowCard (ref), reactModule (ref), cryoModule (ref), fFlagAXMISWithOffers (ref), iconSize (ref), foundationModule (ref), itemCardPriceLine (ref), fFlagAXMISSmallUIChanges (ref), fFlagAXDurables2Option (ref), itemCardTitle (ref), text (ref), icon (ref), verifiedBadgesModule (ref)
	local var1 = useTokens()
	local selectedTimedOptionPrice = nil
	local setSelectedTimedOptionPrice = nil
	
	if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then
		selectedTimedOptionPrice = p1.selectedTimedOptionPrice
		setSelectedTimedOptionPrice = p1.setSelectedTimedOptionPrice
	end
	local createElement_1
	local useMemo = reactModule.useMemo
	useMemo = useMemo(function()
		-- upvalues: p1 (ref), cryoModule (copy), fFlagAXDurablesForMIS (copy), fFlagAXEnableTimedOptionsForCatalogRowCard (copy), selectedTimedOptionPrice (write), fFlagAXMISWithOffers (copy), var1 (ref), iconSize (copy), reactModule (copy), foundationModule (copy), itemCardPriceLine (copy), fFlagAXMISSmallUIChanges (copy)
		local t = {}
		
		if p1.priceLineContent and #p1.priceLineContent > 0 then
			local var2
			for i, v in p1.priceLineContent do
				local var3 = cryoModule.Dictionary.omit(v, { "strikethrough" })
				
				if (fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard) and (selectedTimedOptionPrice and v.type == "price") then
					if v.isOriginalPrice and p1.timedOptions then
						var2 = selectedTimedOptionPrice
						
						for i_1, v_1 in p1.timedOptions do
							if v_1.price == selectedTimedOptionPrice and v_1.discountInformation then
								var2 = v_1.discountInformation.originalPrice
								break
							end
						end
						var3 = cryoModule.Dictionary.join(var3, { price = var2 })
						
						if var2 ~= selectedTimedOptionPrice or fFlagAXMISWithOffers and (not fFlagAXMISWithOffers or v.shouldShowOriginalPrice) then
							if fFlagAXMISWithOffers and v.priceInRobuxDiscountedByOffers then
								var3 = cryoModule.Dictionary.join(var3, { price = v.priceInRobuxDiscountedByOffers })
							end
							if (fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard) and v.strikethrough then
								var3 = cryoModule.Dictionary.join(var3, {
									colorStyle = var1.Color.Content.Muted,
									iconSize = iconSize.XSmall,
									fontStyle = var1.Typography.BodySmall
								})
							end
							t[`PriceLine{i}`] = reactModule.createElement(foundationModule.View, { tag = "auto-xy", LayoutOrder = i }, {
								ItemCardPriceLine = reactModule.createElement(itemCardPriceLine, { content = var3 }),
								Strikethrough = if v.strikethrough then reactModule.createElement(foundationModule.View, {
									tag = "bg-system-neutral anchor-center-center position-center-center size-full-50",
									Size = if fFlagAXMISSmallUIChanges then UDim2.new(1, 0, 0, 1) else nil
								}) else nil
							})
						end
					else
						var3 = cryoModule.Dictionary.join(var3, { price = selectedTimedOptionPrice })
					end
				end
			end
		end
		return t
	end, {
		p1.priceLineContent,
		if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then selectedTimedOptionPrice else nil,
		if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then p1.timedOptions else nil,
		if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then var1 else nil
	})
	local var4 = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then if p1.priceLineContent then true else p1.timedOptions else nil
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		tag = "fill self-stretch",
		Size = p1.Size,
		AutomaticSize = p1.AutomaticSize,
		LayoutOrder = p1.LayoutOrder
	}
	local t_1 = {}
	
	if fFlagAXDurables2Option and p1.onRemove then
		local var5
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
			ItemCardFooterTitle = reactModule.createElement(itemCardTitle, { LayoutOrder = 1, title = p1.title or "" })
		}
		
		if p1.itemSubType or p1.creatorName then
			var5 = reactModule.createElement
			var5 = var5(foundationModule.View, {
				tag = "row align-x-left gap-xxsmall size-full-0 auto-y",
				LayoutOrder = 2
			}, {
				ItemSubType = if p1.itemSubType then reactModule.createElement(text, {
					LayoutOrder = 1,
					textStyle = var1.Color.Content.Default,
					fontStyle = var1.Typography.BodyMedium,
					Text = p1.itemSubType,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				}) else nil,
				Spacer = if p1.itemSubType and not fFlagAXMISSmallUIChanges then reactModule.createElement(icon, {
					name = "icons/controls/keys/period",
					LayoutOrder = 2,
					size = iconSize.Small
				}) else nil,
				Divider = if p1.creatorName and fFlagAXMISSmallUIChanges then reactModule.createElement(icon, {
					name = "icons/controls/keys/period",
					LayoutOrder = 2,
					size = iconSize.Small
				}) else nil,
				CreatorName = if p1.creatorName then reactModule.createElement(text, {
					tag = "fill self-stretch",
					LayoutOrder = 3,
					textStyle = var1.Color.Content.Default,
					fontStyle = var1.Typography.BodyMedium,
					Text = if p1.creatorHasVerifiedBadge then `{p1.creatorName}{verifiedBadgesModule.emoji.verified}` else p1.creatorName,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				}) else nil
			})
		else
			var5 = nil
		end
		t_5.ItemCardFooterInfo = var5
		t_5.BundleParts = if p1.bundlePartsText and not p1.timedOptions then reactModule.createElement(foundationModule.View, {
			tag = "auto-xy padding-xsmall radius-small bg-surface-100",
			LayoutOrder = 3
		}, {
			Text = reactModule.createElement(text, {
				textStyle = var1.Color.Content.Default,
				fontStyle = var1.Typography.BodySmall,
				Text = p1.bundlePartsText,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextTruncate = Enum.TextTruncate.SplitWord
			})
		}) else nil
		t_3.Left = createElement_2(view_2, t_4, t_5)
		t_3.Right = if p1.onRemove then reactModule.createElement(foundationModule.View, { tag = "auto-xy", LayoutOrder = 2 }, reactModule.createElement(foundationModule.IconButton, {
			icon = "x",
			isCircular = true,
			testId = "catalogRowItemCardRemoveButton",
			variant = foundationModule.Enums.ButtonVariant.Standard,
			onActivated = p1.onRemove
		})) else nil
		createElement_1 = createElement_1(view_1, t_2, t_3)
	else
		local var6
		createElement_1 = reactModule.createElement
		local var7 = "Frame"
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
				Padding = UDim.new(0, var1.Gap.XSmall)
			}),
			ItemCardFooterTitle = reactModule.createElement(itemCardTitle, { LayoutOrder = 1, title = p1.title or "" })
		}
		
		if p1.itemSubType or p1.creatorName then
			var6 = reactModule.createElement
			var6 = var6("Frame", {
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
					Padding = UDim.new(0, var1.Gap.XXSmall)
				}),
				ItemSubType = if p1.itemSubType then reactModule.createElement(text, {
					LayoutOrder = 1,
					textStyle = var1.Color.Content.Default,
					fontStyle = var1.Typography.BodyMedium,
					Text = p1.itemSubType,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				}) else nil,
				Spacer = if p1.itemSubType and not fFlagAXMISSmallUIChanges then reactModule.createElement(icon, {
					name = "icons/controls/keys/period",
					LayoutOrder = 2,
					size = iconSize.Small
				}) else nil,
				Divider = if p1.creatorName and fFlagAXMISSmallUIChanges then reactModule.createElement(icon, {
					name = "icons/controls/keys/period",
					LayoutOrder = 2,
					size = iconSize.Small
				}) else nil,
				CreatorName = if p1.creatorName then reactModule.createElement(text, {
					tag = "fill self-stretch",
					LayoutOrder = 3,
					textStyle = var1.Color.Content.Default,
					fontStyle = var1.Typography.BodyMedium,
					Text = if p1.creatorHasVerifiedBadge then `{p1.creatorName}{verifiedBadgesModule.emoji.verified}` else p1.creatorName,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextTruncate = Enum.TextTruncate.SplitWord
				}) else nil
			})
		else
			var6 = nil
		end
		t_3.ItemCardFooterInfo = var6
		t_3.BundleParts = if p1.bundlePartsText then reactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundColor3 = var1.Color.Surface.Surface_100.Color3,
			BackgroundTransparency = var1.Color.Surface.Surface_100.Transparency,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Radius.Small) }),
			UIPadding = reactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, var1.Padding.XSmall),
				PaddingLeft = UDim.new(0, var1.Padding.XSmall),
				PaddingRight = UDim.new(0, var1.Padding.XSmall),
				PaddingBottom = UDim.new(0, var1.Padding.XSmall)
			}),
			Text = reactModule.createElement(text, {
				textStyle = var1.Color.Content.Default,
				fontStyle = var1.Typography.BodySmall,
				Text = p1.bundlePartsText,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.XY,
				TextTruncate = Enum.TextTruncate.SplitWord
			})
		}) else nil
		createElement_1 = createElement_1(var7, t_2, t_3)
	end
	local var8
	t_1.TopSection = createElement_1
	t_1.BottomPrice = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard or (not p1.priceLineContent or #p1.priceLineContent <= 0) then nil else reactModule.createElement(foundationModule.View, {
		tag = "auto-xy row gap-xsmall position-bottom-left anchor-bottom-left"
	}, useMemo)
	
	if (fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard) and var4 then
		var8 = reactModule.createElement
		var8 = var8(foundationModule.View, {
			tag = if fFlagAXDurables2Option and p1.hideTimedOptionSelections then "auto-x row gap-xsmall align-y-center position-bottom-left anchor-bottom-left" else "auto-xy row gap-xsmall align-y-center position-bottom-left anchor-bottom-left",
			Size = if fFlagAXDurables2Option and p1.hideTimedOptionSelections then UDim2.fromOffset(0, var1.Size.Size_1200) else nil
		}, cryoModule.Dictionary.join(if fFlagAXDurables2Option and p1.hideTimedOptionSelections and p1.timedOptions and ((not p1.isOwned or p1.expirationTime) and p1.itemStatusInCheckout == nil) then {} else useMemo, {
			WearTimeOptions = if fFlagAXDurables2Option and p1.hideTimedOptionSelections or not p1.timedOptions or p1.isOwned and not p1.expirationTime then nil else reactModule.createElement(foundationModule.View, { tag = "auto-xy padding-left-small", LayoutOrder = 100 }, {
				WearTimeSelectedOptionInList = if p1.wearTimeSelectedOptionInList then reactModule.createElement(p1.wearTimeSelectedOptionInList, {
					options = p1.timedOptions,
					selectedTimedOptionIndexInReducer = if fFlagAXDurablesForMIS then p1.selectedTimedOptionIndexInReducer else nil,
					onOptionActivated = function(p2)
						-- upvalues: p1 (ref), setSelectedTimedOptionPrice (write)
						local var9 = p1.timedOptions[p2]
						
						if var9 then
							if setSelectedTimedOptionPrice then
								setSelectedTimedOptionPrice(var9.price)
							end
							if p1.onTimedOptionPriceChanged then
								p1.onTimedOptionPriceChanged(var9.price, if var9.days == 0 then nil else var9.days)
							end
						end
					end
				}) else nil
			}),
			Badge = if fFlagAXDurables2Option and p1.offerApplied then reactModule.createElement(foundationModule.Popover.Root, { isOpen = p1.showOfferPillTooltip or false }, {
				Anchor = reactModule.createElement(foundationModule.Popover.Anchor, { LayoutOrder = 101 }, {
					Badge = reactModule.createElement(foundationModule.Badge, {
						icon = {
							name = foundationModule.Enums.IconName.TagSparkle,
							position = foundationModule.Enums.IconPosition.Left
						},
						text = p1.offersLocalized and p1.offersLocalized.OfferApplied,
						variant = foundationModule.Enums.BadgeVariant.Neutral,
						shape = foundationModule.Enums.BadgeShape.Pill,
						size = foundationModule.Enums.BadgeSize.XSmall
					})
				}),
				Content = reactModule.createElement(foundationModule.Popover.Content, {
					align = foundationModule.Enums.PopoverAlign.Center,
					side = foundationModule.Enums.PopoverSide.Top,
					radius = foundationModule.Enums.Radius.Medium,
					backgroundStyle = var1.Color.System.Contrast
				}, {
					TooltipContent = reactModule.createElement(foundationModule.View, {
						tag = "col gap-xsmall auto-xy padding-x-medium padding-y-small"
					}, {
						TooltipText = reactModule.createElement(text, {
							tag = "auto-xy text-title-medium text-truncate-end content-inverse-emphasis",
							Text = p1.offersLocalized and p1.offersLocalized.OfferAppliedTooltip
						})
					})
				})
			}) else nil
		}))
	else
		var8 = nil
	end
	t_1.BottomContent = var8
	
	return createElement(view, t, t_1)
end