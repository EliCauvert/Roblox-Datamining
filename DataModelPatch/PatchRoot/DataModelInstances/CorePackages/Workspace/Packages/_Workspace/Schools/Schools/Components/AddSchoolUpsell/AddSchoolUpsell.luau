local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(Schools.Common.TextKeys)
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local Image = FoundationModule.Image
local Button = FoundationModule.Button
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local Icon1 = require(Parent.BuilderIcons).Icon
FoundationModule.Utility.preloadCloudAssets("pictograms/group_exp")

local function PerkRow(p1)
	-- upvalues: ReactModule (copy), View (copy), Icon (copy), IconSize (copy), Text (copy)
	return ReactModule.createElement(View, {
		tag = "row items-center gap-small size-full-0 auto-y",
		LayoutOrder = p1.layoutOrder
	}, {
		Icon = ReactModule.createElement(Icon, { LayoutOrder = 1, name = p1.icon, size = IconSize.Medium }),
		Label = ReactModule.createElement(Text, {
			LayoutOrder = 2,
			tag = "fill auto-y text-body-medium text-align-x-left text-truncate-end content-default",
			Text = p1.text
		})
	})
end

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), Sheet (copy), View (copy), Image (copy), Text (copy), PerkRow (copy), Icon1 (copy), Button (copy), InputSize (copy), ButtonVariant (copy), FillBehavior (copy)
	local NoIsOpen = p1.isOpen == nil or p1.isOpen
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		heading = TextKeysModule.UpsellHeading,
		body = TextKeysModule.UpsellBody,
		perkFindFriends = TextKeysModule.UpsellPerkFindFriends,
		perkPlayAndChat = TextKeysModule.UpsellPerkPlayAndChat,
		perkTrends = TextKeysModule.UpsellPerkTrends,
		disclaimer = TextKeysModule.UpsellDisclaimer,
		actionContinue = TextKeysModule.UpsellActionContinue
	})
	
	return ReactModule.createElement(Sheet.Root, {
		testId = "schools-add-school-upsell-sheet",
		isOpen = NoIsOpen,
		onClose = p1.onClose
	}, {
		Content = ReactModule.createElement(Sheet.Content, nil, {
			Illustration = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "col items-center size-full-0 auto-y padding-bottom-medium"
			}, {
				Art = ReactModule.createElement(Image, {
					Image = "pictograms/group_exp",
					testId = "schools-add-school-upsell-hero",
					imageStyle = UseTokensResult.Color.Content.Emphasis,
					ScaleType = Enum.ScaleType.Fit,
					Size = UDim2.fromOffset(320 * UseTokensResult.Config.UI.Scale, 180 * UseTokensResult.Config.UI.Scale)
				})
			}),
			Header = ReactModule.createElement(View, {
				LayoutOrder = 2,
				tag = "col gap-xsmall size-full-0 auto-y"
			}, {
				Heading = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "size-full-0 auto-y text-heading-medium text-wrap text-align-x-left content-emphasis",
					Text = UseLocalizationResult.heading
				}),
				Body = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
					Text = UseLocalizationResult.body
				})
			}),
			Perks = ReactModule.createElement(View, {
				LayoutOrder = 3,
				tag = "col gap-medium size-full-0 auto-y padding-top-small"
			}, {
				FindFriends = ReactModule.createElement(PerkRow, {
					layoutOrder = 1,
					icon = Icon1.PersonMagnifyingGlass,
					text = UseLocalizationResult.perkFindFriends
				}),
				PlayAndChat = ReactModule.createElement(PerkRow, {
					layoutOrder = 2,
					icon = Icon1.ThreePeople,
					text = UseLocalizationResult.perkPlayAndChat
				}),
				Trends = ReactModule.createElement(PerkRow, {
					layoutOrder = 3,
					icon = Icon1.Flame,
					text = UseLocalizationResult.perkTrends
				})
			}),
			Disclaimer = ReactModule.createElement(Text, {
				LayoutOrder = 4,
				tag = "size-full-0 auto-y padding-top-small text-body-medium text-wrap text-align-x-left content-default",
				Text = UseLocalizationResult.disclaimer
			})
		}),
		Actions = ReactModule.createElement(Sheet.Actions, nil, {
			Continue = ReactModule.createElement(Button, {
				LayoutOrder = 1,
				text = UseLocalizationResult.actionContinue,
				size = InputSize.Large,
				variant = ButtonVariant.Emphasis,
				fillBehavior = FillBehavior.Fill,
				onActivated = p1.onContinue
			})
		})
	})
end