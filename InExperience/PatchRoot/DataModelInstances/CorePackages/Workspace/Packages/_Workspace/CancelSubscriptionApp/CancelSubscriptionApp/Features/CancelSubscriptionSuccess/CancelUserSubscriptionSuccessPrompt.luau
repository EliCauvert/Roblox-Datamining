local Parent = script:FindFirstAncestor("CancelSubscriptionApp").Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local Toast = UIBloxModule.App.Dialog.Toast
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local IconsLogoBlock = UIBloxModule.App.ImageSet.Images["icons/logo/block"]
local config = {
	heading = "CoreScripts.CancelUserSubscriptionPrompt.SuccessPrompt.Heading"
}

return function(p1) --[[ Line: 17 | Named "CancelUserSubscriptionSuccessPrompt" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), ReactModule (copy), Toast (copy), IconsLogoBlock (copy)
	return ReactModule.createElement(Toast, {
		duration = 3,
		layoutOrder = 1,
		show = true,
		toastContent = {
			swipeUpDismiss = true,
			toastTitle = UseLocalizationFunction(config).heading,
			iconImage = IconsLogoBlock,
			onAppeared = function() --[[ Line: 23 ]] end,
			onDismissed = p1.onDismissed or function() --[[ Line: 24 ]] end
		},
		anchorPoint = Vector2.new(0.5, 0),
		position = UDim2.new(0.5, 0, 0, 20),
		size = UDim2.new(0.5, -24, 0, 0)
	})
end