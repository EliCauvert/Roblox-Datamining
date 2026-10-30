local Parent = script:FindFirstAncestor("AvatarWorkshop").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local Image = FoundationModule.Image
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local Character = utf8.char(57344)

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), Character (copy), ReactModule (copy), FoundationModule (copy), StateLayerAffordance (copy), Image (copy), FillBehavior (copy), InputSize (copy), ButtonVariant (copy), IconSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({ detailsText = "Feature.Avatar.Label.DetailsButton" })
	local Text = if Frame.username and Frame.hasVerifiedBadge then `{Frame.username}{Character}` else Frame.username
	local HasTitle: boolean = Frame.title ~= nil or Text ~= nil or Frame.price ~= nil
	
	return ReactModule.createElement(FoundationModule.View, { tag = "size-full", LayoutOrder = Frame.LayoutOrder }, {
		Card = ReactModule.createElement(FoundationModule.View, {
			tag = "col gap-small size-full-0 auto-y",
			onActivated = Frame.onActivated,
			stateLayer = { affordance = StateLayerAffordance.None }
		}, {
			Thumbnail = ReactModule.createElement(Image, {
				LayoutOrder = 1,
				tag = {
					["size-full radius-medium clip bg-shift-200"] = true,
					["stroke-system-contrast"] = Frame.isSelected
				},
				aspectRatio = {
					AspectRatio = if Frame.vertical then 0.8 else 1,
					AspectType = Enum.AspectType.FitWithinMaxSize,
					DominantAxis = Enum.DominantAxis.Width
				},
				ScaleType = Enum.ScaleType.Crop,
				Image = Frame.image
			}, {
				DetailsOverlay = if Frame.showDetails then ReactModule.createElement(FoundationModule.View, { tag = "size-full padding-xxsmall" }, {
					DetailsButton = ReactModule.createElement(FoundationModule.Button, {
						AnchorPoint = Vector2.new(0.5, 1),
						Position = UDim2.fromScale(0.5, 1),
						fillBehavior = FillBehavior.Fill,
						size = InputSize.XSmall,
						text = UseLocalizationResult.detailsText,
						variant = ButtonVariant.OverMedia,
						onActivated = Frame.onDetailsActivated or function() end
					})
				}) else nil
			}),
			Content = if HasTitle then ReactModule.createElement(FoundationModule.View, {
				tag = "col gap-xsmall size-full-0 auto-y",
				LayoutOrder = 2
			}, {
				Title = if Frame.title == nil then nil else ReactModule.createElement(FoundationModule.Text, {
					tag = "size-full-0 auto-y text-title-small text-align-x-left text-truncate-end content-emphasis",
					LayoutOrder = 1,
					Text = Frame.title
				}),
				Username = if Text == nil then nil else ReactModule.createElement(FoundationModule.Text, {
					tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-end",
					LayoutOrder = 2,
					Text = Text
				}),
				Price = if Frame.price == nil then nil else ReactModule.createElement(FoundationModule.View, {
					tag = "row align-y-center gap-xxsmall size-full-0 auto-y",
					LayoutOrder = 3
				}, {
					Icon = ReactModule.createElement(FoundationModule.Icon, {
						tag = "content-emphasis",
						name = "robux",
						LayoutOrder = 1,
						size = IconSize.Small
					}),
					Amount = ReactModule.createElement(FoundationModule.Text, {
						tag = "auto-xy padding-x-xsmall text-body-medium text-align-x-left content-emphasis",
						LayoutOrder = 2,
						Text = tostring(Frame.price)
					})
				})
			}) else nil
		})
	})
end