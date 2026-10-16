local UserInputService = game:GetService("UserInputService")
local Parent = script:FindFirstAncestor("ToastNotification").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local IconWithHoldAnimation = require(Parent.AppShortcutBar).IconWithHoldAnimation

return function(p1) --[[ Line: 21 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), IconWithHoldAnimation (copy), UserInputService (copy)
	local UseTokensResult = UseTokensFunction()
	local IconSize = p1.iconSize or UseTokensResult.Size.Size_350
	
	return ReactModule.createElement("CanvasGroup", {
		BackgroundTransparency = 1,
		Size = UDim2.fromOffset(IconSize, IconSize),
		LayoutOrder = p1.layoutOrder,
		Visible = p1.visible,
		GroupTransparency = p1.iconTransparency
	}, {
		HoldIcon = ReactModule.createElement(IconWithHoldAnimation, {
			size = UDim2.fromScale(1, 1),
			icon = UserInputService:GetImageForKeyCode(Enum.KeyCode.ButtonSelect),
			iconSize = IconSize,
			progress = p1.progress
		})
	})
end