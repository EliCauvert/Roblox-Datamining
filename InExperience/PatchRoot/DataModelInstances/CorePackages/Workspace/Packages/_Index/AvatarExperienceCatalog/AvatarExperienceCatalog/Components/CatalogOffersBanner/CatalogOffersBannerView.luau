local parent = script:FindFirstAncestor("AvatarExperienceCatalog").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local getFoundationIconNameModule = require(script.Parent.getFoundationIconName)
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), getFoundationIconNameModule (ref), iconVariant (ref), iconSize (ref), iconName (ref), buttonVariant (ref), inputSize (ref)
	return reactModule.createElement(foundationModule.View, {
		testId = "CatalogOffersBanner",
		tag = p1.rootTags,
		Size = p1.Size,
		Position = p1.Position
	}, {
		BannerRow = reactModule.createElement(foundationModule.View, {
			tag = "row items-center gap-medium size-full-0 auto-y padding-x-medium padding-bottom-small padding-top-xsmall",
			LayoutOrder = 1
		}, {
			Leading = if p1.offerModalTapAreaEnabled and p1.onOfferBannerActivated then reactModule.createElement(foundationModule.View, {
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
							style = p1.iconEmphasisStyle,
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
				})
			}) else reactModule.createElement(foundationModule.View, {
				tag = "row items-center grow gap-medium auto-y",
				LayoutOrder = 1
			}, {
				Icon = reactModule.createElement(foundationModule.Icon, {
					LayoutOrder = 1,
					name = getFoundationIconNameModule(p1.iconName),
					variant = iconVariant.Regular,
					size = iconSize.Large,
					style = p1.iconEmphasisStyle,
					AnchorPoint = Vector2.new(0.5, 0.5)
				}),
				Title = reactModule.createElement(foundationModule.Text, {
					RichText = true,
					tag = "align-y-center grow auto-xy text-title-medium text-wrap text-align-x-left",
					LayoutOrder = 2,
					Text = p1.titleText,
					textStyle = p1.titleContentEmphasisStyle
				})
			}),
			Close = reactModule.createElement(foundationModule.View, {
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
		})
	})
end