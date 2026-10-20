local Parent = script:FindFirstAncestor("AvatarExperienceTimedOptions").Parent
local _ = require(Parent.AvatarExperienceCommon)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Text = FoundationModule.Text
local Enums = FoundationModule.Enums
local FFlagAXDurables2Option = require(Parent.AvatarExperienceFlags).FFlagAXDurables2Option

return (ReactModule.forwardRef(function(p1, _)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), FFlagAXDurables2Option (copy), ReactModule (copy), FoundationModule (copy), Enums (copy), Text (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		infinite = "Feature.Durables.ItemDetails.WearTimeOptions.Button.Infinite",
		xDay = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDay",
			num = p1.option.days
		},
		xDays = {
			"Feature.Durables.ItemDetails.WearTimeOptions.Button.XDays",
			num = p1.option.days
		},
		buy = if FFlagAXDurables2Option then "Feature.Catalog.Action.Buy" else nil,
		rent = if FFlagAXDurables2Option then "Feature.Catalog.Action.Rent" else nil
	})
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = {
			["row align-y-center gap-small padding-medium radius-medium stroke-standard"] = true,
			["align-x-center"] = if FFlagAXDurables2Option then p1.isFullWidth else nil,
			["stroke-thick"] = p1.option.selected,
			["stroke-system-contrast"] = p1.option.selected,
			["stroke-emphasis"] = not p1.option.selected
		},
		onActivated = p1.onActivated,
		AutomaticSize = if FFlagAXDurables2Option and p1.isFullWidth then Enum.AutomaticSize.None else Enum.AutomaticSize.X,
		Size = if FFlagAXDurables2Option and p1.isFullWidth then UDim2.new(1, 0, 0, UseTokensResult.Size.Size_800) else UDim2.new(0, 0, 0, UseTokensResult.Size.Size_1000),
		stateLayer = { affordance = Enums.StateLayerAffordance.None },
		selection = { Selectable = true }
	}, {
		DaysLabel = ReactModule.createElement(Text, {
			tag = "auto-xy text-title-small content-emphasis",
			LayoutOrder = 1,
			Text = if p1.option.days == 0 then if FFlagAXDurables2Option then UseLocalizationResult.buy else UseLocalizationResult.infinite elseif p1.option.days == 1 then if FFlagAXDurables2Option then UseLocalizationResult.rent else UseLocalizationResult.xDay elseif FFlagAXDurables2Option then UseLocalizationResult.rent else UseLocalizationResult.xDays,
			RichText = if FFlagAXDurables2Option then true else nil,
			selection = { Selectable = false }
		}),
		PriceTag = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 2,
			tag = if FFlagAXDurables2Option then "row align-y-center gap-xxsmall auto-xy" else "row align-y-center gap-xsmall auto-xy"
		}, {
			RobuxIcon = ReactModule.createElement(FoundationModule.Icon, {
				LayoutOrder = 1,
				name = Enums.IconName.Robux,
				variant = Enums.IconVariant.Filled,
				size = Enums.IconSize.XSmall
			}),
			PriceLabel = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-small",
				LayoutOrder = 2,
				Text = if FFlagAXDurables2Option and p1.option.selected and p1.option.priceInRobuxDiscountedByOffers then tostring(p1.option.priceInRobuxDiscountedByOffers) else tostring(p1.option.price),
				selection = { Selectable = false }
			})
		}),
		OriginalPriceTag = if FFlagAXDurables2Option and (p1.option.discountInformation or p1.option.priceInRobuxDiscountedByOffers and (p1.option.selected and p1.option.priceInRobuxDiscountedByOffers < p1.option.price)) then ReactModule.createElement(FoundationModule.View, { tag = "auto-xy", LayoutOrder = 3 }, {
			PriceContent = ReactModule.createElement(FoundationModule.View, { tag = "row align-y-center gap-xxsmall auto-xy" }, {
				RobuxIcon = ReactModule.createElement(FoundationModule.Icon, {
					LayoutOrder = 1,
					name = Enums.IconName.Robux,
					variant = Enums.IconVariant.Filled,
					size = Enums.IconSize.XSmall,
					style = UseTokensResult.Color.Content.Muted
				}),
				PriceLabel = ReactModule.createElement(Text, {
					tag = "auto-xy text-body-small content-muted",
					LayoutOrder = 2,
					Text = if p1.option.discountInformation then tostring(p1.option.discountInformation.originalPrice) else tostring(p1.option.price),
					selection = { Selectable = false }
				})
			}),
			Strikethrough = ReactModule.createElement(FoundationModule.View, {
				tag = "position-center-center anchor-center-center bg-system-neutral",
				Size = UDim2.new(1, 0, 0, 1)
			})
		}) else nil
	})
end))