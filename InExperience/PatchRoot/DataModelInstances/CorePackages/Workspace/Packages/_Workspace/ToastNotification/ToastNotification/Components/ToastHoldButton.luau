local userInputService = game:GetService("UserInputService")
local parent = script:FindFirstAncestor("ToastNotification").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local iconWithHoldAnimation = require(parent.AppShortcutBar).IconWithHoldAnimation

return function(p0) --[[ line: 21 ]]
	-- upvalues: useTokens (ref), reactModule (ref), iconWithHoldAnimation (ref), userInputService (ref)
	local iconSize = p0.iconSize or useTokens().Size.Size_350
	
	return reactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(iconSize, iconSize),
		LayoutOrder = p0.layoutOrder,
		Visible = p0.visible,
		GroupTransparency = p0.iconTransparency
	}, {
		HoldIcon = reactModule.createElement(iconWithHoldAnimation, {
			size = UDim2.fromScale(1, 1),
			icon = userInputService:GetImageForKeyCode(Enum.KeyCode.ButtonSelect),
			iconSize = iconSize,
			progress = p0.progress
		})
	})
end