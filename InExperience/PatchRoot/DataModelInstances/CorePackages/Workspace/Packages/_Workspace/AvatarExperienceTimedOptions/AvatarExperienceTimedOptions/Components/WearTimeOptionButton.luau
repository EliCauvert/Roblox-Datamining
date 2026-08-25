local parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local _ = require(parent.AvatarExperienceCommon)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local text = foundationModule.Text
local enums = foundationModule.Enums
local fFlagAXDurables2Option = avatarExperienceFlagsModule.FFlagAXDurables2Option

return reactModule.forwardRef(function(p0, _)
	-- upvalues: useTokens (ref), useLocalization (ref), fFlagAXDurables2Option (ref), reactModule (ref), foundationModule (ref), enums (ref), text (ref)
	local var3 = useTokens()
	local var4 = useLocalization({
		infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite",
		xDay = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay",
			num = p0.option.days
		},
		xDays = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays",
			num = p0.option.days
		},
		buy = if fFlagAXDurables2Option then "Feature.Catalog.Action.Buy" else nil,
		rent = if fFlagAXDurables2Option then "Feature.Catalog.Action.Rent" else nil
	})
	
	return reactModule.createElement(foundationModule.View, {
		tag = {
			["row align-y-center gap-small padding-medium radius-medium stroke-standard"] = true,
			["align-x-center"] = if fFlagAXDurables2Option then p0.isFullWidth else nil,
			["stroke-thick"] = p0.option.selected,
			["stroke-system-contrast"] = p0.option.selected,
			["stroke-emphasis"] = not p0.option.selected
		},
		onActivated = p0.onActivated,
		AutomaticSize = if fFlagAXDurables2Option and p0.isFullWidth then Enum.AutomaticSize.None else Enum.AutomaticSize.X,
		Size = if fFlagAXDurables2Option and p0.isFullWidth then UDim2.new(1, 0, 0, var3.Size.Size_800) else UDim2.new(0, 0, 0, var3.Size.Size_1000),
		stateLayer = { affordance = enums.StateLayerAffordance.None },
		selection = { Selectable = true }
	}, {
		DaysLabel = reactModule.createElement(text, {
			tag = "auto-xy text-title-small content-emphasis",
			LayoutOrder = 1,
			Text = if p0.option.days == 0 then if fFlagAXDurables2Option then var4.buy else var4.infinite elseif p0.option.days == 1 then if fFlagAXDurables2Option then var4.rent else var4.xDay elseif fFlagAXDurables2Option then var4.rent else var4.xDays,
			RichText = if fFlagAXDurables2Option then true else nil,
			selection = { Selectable = false }
		}),
		PriceTag = reactModule.createElement(foundationModule.View, {
			LayoutOrder = 2,
			tag = if fFlagAXDurables2Option then "row align-y-center gap-xxsmall auto-xy" else "row align-y-center gap-xsmall auto-xy"
		}, {
			RobuxIcon = reactModule.createElement(foundationModule.Icon, {
				LayoutOrder = 1,
				name = enums.IconName.Robux,
				variant = enums.IconVariant.Filled,
				size = enums.IconSize.XSmall
			}),
			PriceLabel = reactModule.createElement(text, {
				tag = "auto-xy text-body-small",
				LayoutOrder = 2,
				Text = if fFlagAXDurables2Option and p0.option.selected and p0.option.priceInRobuxDiscountedByOffers then tostring(p0.option.priceInRobuxDiscountedByOffers) else tostring(p0.option.price),
				selection = { Selectable = false }
			})
		}),
		OriginalPriceTag = if fFlagAXDurables2Option and (p0.option.discountInformation or p0.option.priceInRobuxDiscountedByOffers and p0.option.selected and p0.option.priceInRobuxDiscountedByOffers < p0.option.price) then reactModule.createElement(foundationModule.View, { tag = "auto-xy", LayoutOrder = 3 }, {
			PriceContent = reactModule.createElement(foundationModule.View, { tag = "row align-y-center gap-xxsmall auto-xy" }, {
				RobuxIcon = reactModule.createElement(foundationModule.Icon, {
					LayoutOrder = 1,
					name = enums.IconName.Robux,
					variant = enums.IconVariant.Filled,
					size = enums.IconSize.XSmall,
					style = var3.Color.Content.Muted
				}),
				PriceLabel = reactModule.createElement(text, {
					tag = "auto-xy text-body-small content-muted",
					LayoutOrder = 2,
					Text = if p0.option.discountInformation then tostring(p0.option.discountInformation.originalPrice) else tostring(p0.option.price),
					selection = { Selectable = false }
				})
			}),
			Strikethrough = reactModule.createElement(foundationModule.View, {
				tag = "position-center-center anchor-center-center bg-system-neutral",
				Size = UDim2.new(1, 0, 0, 1)
			})
		}) else nil
	})
end)