local parent = script:FindFirstAncestor("AppChat").Parent
local reactModule = require(parent.React)
local useCursor = require(parent.Foundation).Hooks.useCursor
local t = {
	Size36x36 = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-36x36.png",
	Size48x48 = "rbxasset://textures/ui/LuaChat/graphic/gr-profile-border-48x48.png"
}

return function(p0)
	-- upvalues: t (ref), useCursor (ref), reactModule (ref)
	return reactModule.createElement("ImageButton", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = p0.circleInteriorBackgroundColor3,
		BackgroundTransparency = p0.circleInteriorBackgroundTransparency,
		BorderSizePixel = 0,
		Image = "",
		SelectionImageObject = useCursor(),
		AutoButtonColor = false,
		ClipsDescendants = true,
		[reactModule.Event.Activated] = p0.onActivated,
		Selectable = p0.selectable,
		LayoutOrder = p0.LayoutOrder
	}, {
		imageMask = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 2,
			Image = t[p0.overlaySize or "Size36x36"],
			ImageColor3 = p0.circleColor3,
			ImageTransparency = p0.circleTransparency,
			Size = UDim2.fromScale(1, 1)
		}, p0.renderAboveMask)
	}, p0.children)
end