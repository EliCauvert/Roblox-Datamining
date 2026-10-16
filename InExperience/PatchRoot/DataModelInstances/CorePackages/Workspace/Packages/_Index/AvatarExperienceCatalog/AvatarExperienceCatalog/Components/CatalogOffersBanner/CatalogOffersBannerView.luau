local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local getFoundationIconNameModule = require(script.Parent.getFoundationIconName)
local avatarExperienceFlagsModule = require(parent.AvatarExperienceFlags)
local offerExpiryBadge = require(parent.AvatarExperienceCommon).Components.OfferExpiryBadge
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local useTokens = foundationModule.Hooks.useTokens
local fFlagAXUpdateOffersEndsUIWithBadge = avatarExperienceFlagsModule.FFlagAXUpdateOffersEndsUIWithBadge

return function(p1)
	-- upvalues: fFlagAXUpdateOffersEndsUIWithBadge (ref), useTokens (ref), reactModule (ref), foundationModule (ref), getFoundationIconNameModule (ref), iconVariant (ref), iconSize (ref), offerExpiryBadge (ref), iconName (ref), buttonVariant (ref), inputSize (ref)
	local var1
	local var2 = if fFlagAXUpdateOffersEndsUIWithBadge then useTokens() else nil
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		testId = "CatalogOffersBanner",
		tag = p1.rootTags,
		backgroundStyle = if fFlagAXUpdateOffersEndsUIWithBadge then p1.backgroundStyle else nil,
		Size = p1.Size,
		Position = p1.Position
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local view_1 = foundationModule.View
	local t_2 = {
		LayoutOrder = 1,
		tag = if fFlagAXUpdateOffersEndsUIWithBadge then "row items-center gap-xsmall size-full-0 auto-y padding-x-medium padding-bottom-small padding-top-xsmall" else "row items-center gap-medium size-full-0 auto-y padding-x-medium padding-bottom-small padding-top-xsmall"
	}
	local t_3 = {}
	
	if p1.offerModalTapAreaEnabled and p1.onOfferBannerActivated then
		var1 = reactModule.createElement
		var1 = var1(foundationModule.View, {
			tag = "grow auto-y",
			LayoutOrder = 1,
			testId = "CatalogOffersBannerDirectApiTapArea"
		}, {
			HitTarget = reactModule.createElement("TextButton", {
				Text = "",
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				Selectable = false,
				[reactModule.Event.Activated] = p1.onOfferBannerActivated
			}, {
				TapInner = reactModule.createElement(foundationModule.View, { tag = "row items-center gap-medium size-full-0 auto-y" }, {
					Icon = reactModule.createElement(foundationModule.Icon, {
						LayoutOrder = 1,
						name = getFoundationIconNameModule(p1.iconName),
						variant = iconVariant.Filled,
						size = iconSize.Large,
						style = if fFlagAXUpdateOffersEndsUIWithBadge then var2.Color.System.Contrast else p1.iconEmphasisStyle,
						AnchorPoint = Vector2.new(0.5, 0.5)
					}),
					Title = reactModule.createElement(foundationModule.Text, {
						RichText = true,
						tag = "align-y-center grow auto-xy text-title-medium text-wrap text-align-x-left",
						LayoutOrder = 2,
						Text = p1.titleText,
						textStyle = p1.titleContentEmphasisStyle
					}),
					ExpiryBadge = if fFlagAXUpdateOffersEndsUIWithBadge and p1.expirationTimeInUTC then reactModule.createElement(offerExpiryBadge, {
						layoutOrder = 3,
						expirationTimeInUTC = p1.expirationTimeInUTC
					}) else nil
				})
			})
		})
	else
		var1 = reactModule.createElement(foundationModule.View, {
			tag = "row items-center grow gap-medium auto-y",
			LayoutOrder = 1
		}, {
			Icon = reactModule.createElement(foundationModule.Icon, {
				LayoutOrder = 1,
				name = getFoundationIconNameModule(p1.iconName),
				variant = iconVariant.Regular,
				size = iconSize.Large,
				style = if fFlagAXUpdateOffersEndsUIWithBadge then var2.Color.System.Contrast else p1.iconEmphasisStyle,
				AnchorPoint = Vector2.new(0.5, 0.5)
			}),
			Title = reactModule.createElement(foundationModule.Text, {
				RichText = true,
				tag = "align-y-center grow auto-xy text-title-medium text-wrap text-align-x-left",
				LayoutOrder = 2,
				Text = p1.titleText,
				textStyle = p1.titleContentEmphasisStyle
			})
		})
	end
	t_3.Leading = var1
	t_3.Close = reactModule.createElement(foundationModule.View, {
		tag = "row items-center auto-xy",
		LayoutOrder = 2,
		ZIndex = 2
	}, {
		CloseButton = reactModule.createElement(foundationModule.IconButton, {
			isCircular = true,
			testId = "CatalogOffersBannerClose",
			icon = iconName.XSmall,
			variant = buttonVariant.Utility,
			size = inputSize.Small,
			onActivated = p1.onCloseActivated
		})
	})
	t_1.BannerRow = createElement_1(view_1, t_2, t_3)
	
	return createElement(view, t, t_1)
end