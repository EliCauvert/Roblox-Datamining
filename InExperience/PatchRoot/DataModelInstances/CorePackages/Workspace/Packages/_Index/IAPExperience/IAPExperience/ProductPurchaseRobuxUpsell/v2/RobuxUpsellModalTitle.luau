local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local text = foundationModule.Text
local iconButton = foundationModule.IconButton
local iconSize = foundationModule.Enums.IconSize
local view = foundationModule.View
local localizationService = game:GetService("LocalizationService")
local useLocalization = require(parent_1.Localization).Hooks.useLocalization
local formatNumberModule = require(parent.Utility.formatNumber)

return function(p0) --[[ line: 25 | named "RobuxUpsellModalTitle" ]]
	-- upvalues: useLocalization (ref), reactModule (ref), view (ref), text (ref), formatNumberModule (ref), localizationService (ref), iconButton (ref), iconSize (ref)
	local var4 = useLocalization({
		NeedMoreRobux = "IAPExperience.RobuxUpsell.Text.NeedMoreRobux",
		CurrentBalance = "IAPExperience.InsufficientRobux.Text.CurrentBalance"
	})
	
	return reactModule.createElement(view, {
		tag = "size-full-300",
		padding = { right = UDim.new(0, -12), left = UDim.new(0, -12) }
	}, {
		TitleArea = reactModule.createElement(view, { tag = "col gap-xsmall size-full align-x-center" }, {
			Title = reactModule.createElement(text, {
				LayoutOrder = 1,
				tag = "auto-xy text-heading-small content-emphasis",
				Size = UDim2.new(1, 0, 0, 0),
				Text = var4.NeedMoreRobux
			}),
			SubTitle = reactModule.createElement(text, {
				LayoutOrder = 2,
				tag = "auto-xy text-body-medium content-default",
				Size = UDim2.new(1, 0, 0, 0),
				Text = var4.CurrentBalance .. " " .. utf8.char(57346) .. formatNumberModule(localizationService.RobloxLocaleId, p0.balanceAmount)
			})
		}),
		CloseButton = reactModule.createElement(iconButton, {
			icon = "icons/navigation/close",
			size = iconSize.Medium,
			onActivated = p0.cancelPurchaseActivated
		})
	})
end