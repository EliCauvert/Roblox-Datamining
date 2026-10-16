local Parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local GetFoundationIconNameModule = require(script.Parent.getFoundationIconName)
local AvatarExperienceFlagsModule = require(Parent.AvatarExperienceFlags)
local OfferExpiryBadge = require(Parent.AvatarExperienceCommon).Components.OfferExpiryBadge
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagAXUpdateOffersEndsUIWithBadge = AvatarExperienceFlagsModule.FFlagAXUpdateOffersEndsUIWithBadge
local FFlagAXRemoveOfferBannerIcon = AvatarExperienceFlagsModule.FFlagAXRemoveOfferBannerIcon

return function(p1) --[[ Line: 44 | Named "CatalogOffersBannerView" ]]
	-- upvalues: FFlagAXUpdateOffersEndsUIWithBadge (copy), UseTokensFunction (copy), ReactModule (copy), FoundationModule (copy), FFlagAXRemoveOfferBannerIcon (copy), GetFoundationIconNameModule (copy), IconVariant (copy), IconSize (copy), OfferExpiryBadge (copy), IconName (copy), ButtonVariant (copy), InputSize (copy)
	local UseTokensResult = if FFlagAXUpdateOffersEndsUIWithBadge then UseTokensFunction() else nil
	
	return ReactModule.createElement(FoundationModule.View, {
		testId = "CatalogOffersBanner",
		tag = p1.rootTags,
		backgroundStyle = if FFlagAXUpdateOffersEndsUIWithBadge then p1.backgroundStyle else nil,
		Size = p1.Size,
		Position = p1.Position
	}, {
		BannerRow = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 1,
			tag = if FFlagAXUpdateOffersEndsUIWithBadge then "row items-center gap-xsmall size-full-0 auto-y padding-x-medium padding-bottom-small padding-top-xsmall" else "row items-center gap-medium size-full-0 auto-y padding-x-medium padding-bottom-small padding-top-xsmall"
		}, {
			Leading = if p1.offerModalTapAreaEnabled and p1.onOfferBannerActivated then ReactModule.createElement(FoundationModule.View, {
				tag = "grow auto-y",
				LayoutOrder = 1,
				testId = "CatalogOffersBannerDirectApiTapArea"
			}, {
				HitTarget = ReactModule.createElement("TextButton", {
					Text = "",
					AutoButtonColor = false,
					BackgroundTransparency = 1,
					Size = UDim2.fromScale(1, 1),
					Selectable = false,
					[ReactModule.Event.Activated] = p1.onOfferBannerActivated
				}, {
					TapInner = ReactModule.createElement(FoundationModule.View, { tag = "row items-center gap-medium size-full-0 auto-y" }, {
						Icon = if FFlagAXRemoveOfferBannerIcon and not GetFoundationIconNameModule(p1.iconName) then nil else ReactModule.createElement(FoundationModule.Icon, {
							LayoutOrder = 1,
							name = GetFoundationIconNameModule(p1.iconName),
							variant = IconVariant.Filled,
							size = IconSize.Large,
							style = if FFlagAXUpdateOffersEndsUIWithBadge then UseTokensResult.Color.System.Contrast else p1.iconEmphasisStyle,
							AnchorPoint = Vector2.new(0.5, 0.5)
						}),
						Title = ReactModule.createElement(FoundationModule.Text, {
							RichText = true,
							tag = "align-y-center grow auto-xy text-title-medium text-wrap text-align-x-left",
							LayoutOrder = 2,
							Text = p1.titleText,
							textStyle = p1.titleContentEmphasisStyle
						}),
						ExpiryBadge = if FFlagAXUpdateOffersEndsUIWithBadge and p1.expirationTimeInUTC then ReactModule.createElement(OfferExpiryBadge, {
							layoutOrder = 3,
							expirationTimeInUTC = p1.expirationTimeInUTC
						}) else nil
					})
				})
			}) else ReactModule.createElement(FoundationModule.View, {
				tag = "row items-center grow gap-medium auto-y",
				LayoutOrder = 1
			}, {
				Icon = if FFlagAXRemoveOfferBannerIcon and not GetFoundationIconNameModule(p1.iconName) then nil else ReactModule.createElement(FoundationModule.Icon, {
					LayoutOrder = 1,
					name = GetFoundationIconNameModule(p1.iconName),
					variant = IconVariant.Regular,
					size = IconSize.Large,
					style = if FFlagAXUpdateOffersEndsUIWithBadge then UseTokensResult.Color.System.Contrast else p1.iconEmphasisStyle,
					AnchorPoint = Vector2.new(0.5, 0.5)
				}),
				Title = ReactModule.createElement(FoundationModule.Text, {
					RichText = true,
					tag = "align-y-center grow auto-xy text-title-medium text-wrap text-align-x-left",
					LayoutOrder = 2,
					Text = p1.titleText,
					textStyle = p1.titleContentEmphasisStyle
				})
			}),
			Close = ReactModule.createElement(FoundationModule.View, {
				tag = "row items-center auto-xy",
				LayoutOrder = 2,
				ZIndex = 2
			}, {
				CloseButton = ReactModule.createElement(FoundationModule.IconButton, {
					isCircular = true,
					testId = "CatalogOffersBannerClose",
					icon = IconName.XSmall,
					variant = ButtonVariant.Utility,
					size = InputSize.Small,
					onActivated = p1.onCloseActivated
				})
			})
		})
	})
end