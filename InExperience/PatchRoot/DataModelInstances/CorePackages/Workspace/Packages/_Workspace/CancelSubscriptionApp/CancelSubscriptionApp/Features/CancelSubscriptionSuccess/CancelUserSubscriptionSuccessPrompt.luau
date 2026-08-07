local parent = script:FindFirstAncestor("CancelSubscriptionApp").Parent
local reactModule = require(parent.React)
local UIBloxModule = require(parent.UIBlox)
local toast = UIBloxModule.App.Dialog.Toast
local useLocalization = require(parent.Localization).Hooks.useLocalization
local block = UIBloxModule.App.ImageSet.Images["icons/logo/block"]
local t = {
	heading = "CoreScripts.CancelUserSubscriptionPrompt.SuccessPrompt.Heading"
}

return function(p0) --[[ line: 17 | named "CancelUserSubscriptionSuccessPrompt" ]]
	-- upvalues: useLocalization (ref), t (ref), reactModule (ref), toast (ref), block (ref)
	return reactModule.createElement(toast, {
		duration = 3,
		layoutOrder = 1,
		show = true,
		toastContent = {
			swipeUpDismiss = true,
			toastTitle = useLocalization(t).heading,
			iconImage = block,
			onAppeared = function() --[[ line: 23 ]] end,
			onDismissed = p0.onDismissed or function() --[[ line: 24 ]] end
		},
		anchorPoint = Vector2.new(0.5, 0),
		position = UDim2.new(0.5, 0, 0, 20),
		size = UDim2.new(0.5, -24, 0, 0)
	})
end