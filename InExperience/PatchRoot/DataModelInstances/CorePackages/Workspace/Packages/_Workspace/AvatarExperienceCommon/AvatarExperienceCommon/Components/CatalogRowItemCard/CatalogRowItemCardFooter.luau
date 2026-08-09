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

return function(p0) --[[ line: 72 | named "CatalogRowItemCardFooter" ]]
	-- upvalues: useTokens (ref), fFlagAXDurablesForMIS (ref), fFlagAXEnableTimedOptionsForCatalogRowCard (ref), reactModule (ref), cryoModule (ref), fFlagAXMISWithOffers (ref), iconSize (ref), foundationModule (ref), fFlagAXDurables2Option (ref), itemCardPriceLine (ref), fFlagAXMISSmallUIChanges (ref), itemCardTitle (ref), text (ref), icon (ref), verifiedBadgesModule (ref)
	local var7 = useTokens()
	local selectedTimedOptionPrice = nil
	local setSelectedTimedOptionPrice = nil
	
	if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard then
		selectedTimedOptionPrice = p0.selectedTimedOptionPrice
		setSelectedTimedOptionPrice = p0.setSelectedTimedOptionPrice
	end
	local createElement_1
	local useMemo = reactModule.useMemo
	useMemo = useMemo(function() --[[ line: 83 ]]
		-- upvalues: p0 (ref), cryoModule (copy), fFlagAXDurablesForMIS (copy), fFlagAXEnableTimedOptionsForCatalogRowCard (copy), selectedTimedOptionPrice (write), fFlagAXMISWithOffers (copy), var7 (ref), iconSize (copy), reactModule (copy), foundationModule (copy), fFlagAXDurables2Option (copy), itemCardPriceLine (copy), fFlagAXMISSmallUIChanges (copy)
		local t = {}
		
		if p0.priceLineContent and #p0.priceLineContent > 0 then
			local var28
			for i, v in p0.priceLineContent do
				local var27 = cryoModule.Dictionary.omit(v, { "strikethrough" })
				
				if (fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard) and (selectedTimedOptionPrice and v.type == "price") then
					if v.isOriginalPrice and p0.timedOptions then
						var28 = selectedTimedOptionPrice
						
						for i_1, v_1 in p0.timedOptions do
							if v_1.price == selectedTimedOptionPrice and v_1.discountInformation then
								var28 = v_1.discountInformation.originalPrice
								break
							end
						end
						var27 = cryoModule.Dictionary.join(var27, { price = var28 })
						
						if var28 ~= selectedTimedOptionPrice or fFlagAXMISWithOffers and (not fFlagAXMISWithOffers or v.shouldShowOriginalPrice) then
							if fFlagAXMISWithOffers and v.priceInRobuxDiscountedByOffers then
								var27 = cryoModule.Dictionary.join(var27, { price = v.priceInRobuxDiscountedByOffers })
							end
							if (fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard) and v.strikethrough then
								var27 = cryoModule.Dictionary.join(var27, {
									colorStyle = var7.Color.Content.Muted,
									iconSize = iconSize.XSmall,
									fontStyle = var7.Typography.BodySmall
								})
							end
							t[`PriceLine{i}`] = reactModule.createElement(foundationModule.View, {
								tag = if fFlagAXDurables2Option then "auto-xy padding-top-xsmall" else "auto-xy",
								LayoutOrder = i
							}, {
								ItemCardPriceLine = reactModule.createElement(itemCardPriceLine, { content = var27 }),
								Strikethrough = if v.strikethrough then reactModule.createElement(foundationModule.View, {
									tag = "bg-system-neutral anchor-center-center position-center-center size-full-50",
									Size = if fFlagAXMISSmallUIChanges then UDim2.new(1, 0, 0, 1) else nil
								}) else nil
							})
						end
					else
						var27 = cryoModule.Dictionary.join(var27, { price = selectedTimedOptionPrice })
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
	local var9 = if fFlagAXDurables2Option then reactModule.createElement(foundationModule.View, { tag = "row gap-medium align-y-center auto-xy" }, reactModule.useMemo(function() --[[ line: 179 ]]
		-- upvalues: p0 (ref), reactModule (copy), foundationModule (copy), setSelectedTimedOptionPrice (write)
		local t = {}
		
		if p0.timedOptions then
			for i, v in p0.timedOptions do
				if v.days == 3 or v.days == 0 then
					local createElement_1
					local var30 = `Option{i}`
					local createElement = reactModule.createElement
					local view = foundationModule.View
					local t_1 = {
						tag = "auto-xy padding-top-small",
						LayoutOrder = #p0.timedOptions - i + 1
					}
					local t_2 = {}
					
					if p0.wearTimeOptionButton then
						local var35
						createElement_1 = reactModule.createElement
						local wearTimeOptionButton = p0.wearTimeOptionButton
						local t_3 = {}
						local t_4 = { days = v.days, price = v.price }
						
						if p0.selectedTimedOptionIndexInReducer then
							var35 = i == p0.selectedTimedOptionIndexInReducer
							var35 = nil
						else
							var35 = v.selected
						end
						t_4.selected = var35
						t_3.option = t_4
						
						function t_3.onActivated() --[[ line: 197 ]]
							-- upvalues: p0 (copy), i (ref), setSelectedTimedOptionPrice (copy)
							local var36 = p0.timedOptions[i]
							
							if var36 then
								if setSelectedTimedOptionPrice then
									setSelectedTimedOptionPrice(var36.price)
								end
								if p0.onTimedOptionPriceChanged then
									p0.onTimedOptionPriceChanged(var36.price, if var36.days == 0 then nil else var36.days)
								end
							end
						end
						
						createElement_1 = createElement_1(wearTimeOptionButton, t_3)
					else
						createElement_1 = nil
					end
					t_2.Button = createElement_1
					t[var30] = createElement(view, t_1, t_2)
				end
			end
		end
		return t
	end, {
		p0.timedOptions,
		p0.onTimedOptionPriceChanged,
		p0.selectedTimedOptionIndexInReducer,
		p0.wearTimeOptionButton,
		setSelectedTimedOptionPrice
	})) else nil
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		tag = "fill self-stretch",
		Size = p0.Size,
		AutomaticSize = p0.AutomaticSize,
		LayoutOrder = p0.LayoutOrder
	}
	local t_1 = {}
	
	if fFlagAXDurables2Option then
		local var20
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
			var20 = reactModule.createElement
			var20 = var20(foundationModule.View, {
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
			var20 = nil
		end
		t_5.ItemCardFooterInfo = var20
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
		local var15
		createElement_1 = reactModule.createElement
		local var12 = "Frame"
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
			var15 = reactModule.createElement
			var15 = var15("Frame", {
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
			var15 = nil
		end
		t_3.ItemCardFooterInfo = var15
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
		createElement_1 = createElement_1(var12, t_2, t_3)
	end
	local var21
	t_1.TopSection = createElement_1
	t_1.BottomPrice = if fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard or (not p0.priceLineContent or #p0.priceLineContent <= 0) then nil else reactModule.createElement(foundationModule.View, {
		tag = "auto-xy row gap-xsmall position-bottom-left anchor-bottom-left"
	}, useMemo)
	
	if (fFlagAXDurablesForMIS or fFlagAXEnableTimedOptionsForCatalogRowCard) and var8 then
		local var25
		var21 = reactModule.createElement
		local view_1 = foundationModule.View
		local t_2 = {
			tag = "auto-xy row gap-xsmall align-y-center position-bottom-left anchor-bottom-left",
			Position = if fFlagAXDurables2Option and p0.timedOptions and (not p0.isOwned or p0.expirationTime) then UDim2.new(0, 0, 1, var7.Gap.XSmall) else nil
		}
		local join = cryoModule.Dictionary.join
		local var23 = useMemo
		local t_3 = {}
		
		if p0.timedOptions and (not p0.isOwned or p0.expirationTime) then
			var25 = reactModule.createElement
			var25 = var25(foundationModule.View, { tag = "auto-xy padding-left-small", LayoutOrder = 100 }, {
				WearTimeSelectedOptionInList = if fFlagAXDurables2Option or not p0.wearTimeSelectedOptionInList then nil else reactModule.createElement(p0.wearTimeSelectedOptionInList, {
					options = p0.timedOptions,
					selectedTimedOptionIndexInReducer = if fFlagAXDurablesForMIS then p0.selectedTimedOptionIndexInReducer else nil,
					onOptionActivated = function(p1) --[[ line: 459 ]]
						-- upvalues: p0 (ref), setSelectedTimedOptionPrice (write)
						local var37 = p0.timedOptions[p1]
						
						if var37 then
							if setSelectedTimedOptionPrice then
								setSelectedTimedOptionPrice(var37.price)
							end
							if p0.onTimedOptionPriceChanged then
								p0.onTimedOptionPriceChanged(var37.price, if var37.days == 0 then nil else var37.days)
							end
						end
					end
				}),
				OptionsButtonsView = if fFlagAXDurables2Option then var9 else nil
			})
		else
			var25 = nil
		end
		t_3.WearTimeOptions = var25
		var21 = var21(view_1, t_2, join(var23, t_3))
	else
		var21 = nil
	end
	t_1.BottomContent = var21
	
	return createElement(view, t, t_1)
end