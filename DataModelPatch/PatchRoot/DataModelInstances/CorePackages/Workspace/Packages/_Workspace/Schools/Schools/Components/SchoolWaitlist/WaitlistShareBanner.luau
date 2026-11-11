local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Button = FoundationModule.Button
local Image = FoundationModule.Image
local Text = FoundationModule.Text
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextKeysModule = require(Schools.Common.TextKeys)
local ConstantsModule = require(Schools.Common.Constants)

return function(Frame)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), ReactModule (copy), View (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy), ConstantsModule (copy), Image (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		title = Frame.titleKey,
		body = Frame.bodyKey,
		shareAction = TextKeysModule.ShareBannerAction
	})
	local HasMediaImage: boolean = Frame.hasMedia and Frame.mediaImage ~= nil
	
	return ReactModule.createElement(View, {
		tag = "row size-full-0 auto-y stroke-standard stroke-default radius-medium clip bg-surface-100",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Content = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "col align-x-left grow gap-xsmall size-0-0 auto-y padding-large"
		}, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "size-full-0 auto-y text-label-large text-wrap text-align-x-left content-emphasis",
				Text = UseLocalizationResult.title
			}),
			Body = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-left content-default",
				Text = UseLocalizationResult.body
			}),
			CTA = ReactModule.createElement(View, {
				LayoutOrder = 3,
				tag = "row align-x-left size-full-0 auto-y padding-top-medium"
			}, {
				ShareButton = ReactModule.createElement(Button, {
					text = UseLocalizationResult.shareAction,
					variant = ButtonVariant.Emphasis,
					size = InputSize.Small,
					onActivated = Frame.onShare
				})
			})
		}),
		Media = if HasMediaImage then ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "align-x-center align-y-center",
			Size = UDim2.new(0, ConstantsModule.Waitlist.MEDIA_WIDTH, 0, ConstantsModule.Waitlist.MEDIA_HEIGHT)
		}, {
			MediaImage = ReactModule.createElement(Image, {
				BackgroundTransparency = 1,
				Image = Frame.mediaImage,
				Size = UDim2.fromScale(1, 1),
				ScaleType = Enum.ScaleType.Fit
			})
		}) else nil
	})
end