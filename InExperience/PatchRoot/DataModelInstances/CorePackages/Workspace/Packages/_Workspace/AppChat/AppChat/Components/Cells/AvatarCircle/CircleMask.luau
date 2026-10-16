local Parent = script:FindFirstAncestor("AppChat").Parent
local ReactModule = require(Parent.React)
local UseCursorFunction = require(Parent.Foundation).Hooks.useCursor
local config = {
	Size36x36 = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-36x36.png",
	Size48x48 = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-48x48.png"
}

return function(Frame) --[[ Line: 28 | Named "CircleMask" ]]
	-- upvalues: config (copy), UseCursorFunction (copy), ReactModule (copy)
	return ReactModule.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Frame.circleInteriorBackgroundColor3,
		BackgroundTransparency = Frame.circleInteriorBackgroundTransparency,
		BorderSizePixel = 0,
		Image = "",
		SelectionImageObject = UseCursorFunction(),
		AutoButtonColor = false,
		ClipsDescendants = true,
		[ReactModule.Event.Activated] = Frame.onActivated,
		Selectable = Frame.selectable,
		LayoutOrder = Frame.LayoutOrder
	}, {
		imageMask = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Image = config[Frame.overlaySize or "Size36x36"],
			ImageColor3 = Frame.circleColor3,
			ImageTransparency = Frame.circleTransparency,
			Size = UDim2.fromScale(1, 1)
		}, Frame.renderAboveMask)
	}, Frame.children)
end