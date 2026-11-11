local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local FoundationModule = require(Parent1.Foundation)
local Text = FoundationModule.Text
local IconButton = FoundationModule.IconButton
local IconSize = FoundationModule.Enums.IconSize
local View = FoundationModule.View
local LocalizationService = game:GetService("LocalizationService")
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local FormatNumberModule = require(Parent.Utility.formatNumber)

return function(p1)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), View (copy), Text (copy), FormatNumberModule (copy), LocalizationService (copy), IconButton (copy), IconSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux",
		CurrentBalance = "IAPExperience.InsufficientRobux.Text.CurrentBalance"
	})
	
	return ReactModule.createElement(View, {
		tag = "size-full-300",
		padding = { right = UDim.new(0, -12), left = UDim.new(0, -12) }
	}, {
		TitleArea = ReactModule.createElement(View, { tag = "col gap-xsmall size-full align-x-center" }, {
			Title = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Size = UDim2.new(1, 0, 0, 0),
				Text = UseLocalizationResult.NeedMoreRobux
			}),
			SubTitle = ReactModule.createElement(Text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default",
				Size = UDim2.new(1, 0, 0, 0),
				Text = UseLocalizationResult.CurrentBalance .. " " .. utf8.char(57346) .. FormatNumberModule(LocalizationService.RobloxLocaleId, p1.balanceAmount)
			})
		}),
		CloseButton = ReactModule.createElement(IconButton, {
			icon = "icons/navigation/close",
			size = IconSize.Medium,
			onActivated = p1.cancelPurchaseActivated
		})
	})
end