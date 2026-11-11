local UserInputService = game:GetService("UserInputService")
local RoactModule = require(game:GetService("CoreGui").RobloxGui.Modules.Common.Roact)
local OnScreenKeyboardWindow = RoactModule.PureComponent:extend("OnScreenKeyboardWindow")

function OnScreenKeyboardWindow.init(p1)
	p1.state = { onScreenKeyboardHeight = 0 }
end

function OnScreenKeyboardWindow.didMount(p1)
	-- upvalues: UserInputService (copy)
	p1.keyboardVisibleChanged = UserInputService:GetPropertyChangedSignal("OnScreenKeyboardVisible"):connect(function()
		-- upvalues: UserInputService (upval), p1 (copy)
		p1:setState({
			onScreenKeyboardHeight = UserInputService.OnScreenKeyboardVisible and UserInputService.OnScreenKeyboardSize.Y or 0
		})
	end)
end

function OnScreenKeyboardWindow.willUnmount(p1)
	if p1.keyboardVisibleChanged then
		p1.keyboardVisibleChanged:disconnect()
		p1.keyboardVisibleChanged = nil
	end
end

function OnScreenKeyboardWindow.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 1, -p1.state.onScreenKeyboardHeight),
		Position = UDim2.new(0.5, 0, 0, 0),
		AnchorPoint = Vector2.new(0.5, 0)
	}, p1.props.Contents)
end

return OnScreenKeyboardWindow