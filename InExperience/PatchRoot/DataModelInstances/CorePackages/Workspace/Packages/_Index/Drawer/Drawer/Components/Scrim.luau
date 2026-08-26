local parent = script:FindFirstAncestor("Drawer").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local drawerScrimCanBeModal = game:DefineFastFlag("DrawerScrimCanBeModal", false)

return reactModule.forwardRef(function(p1, p2)
	-- upvalues: useTokens (ref), reactModule (ref), drawerScrimCanBeModal (ref)
	return reactModule.createElement("TextButton", {
		ref = p2,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = p1.transparencyBinding,
		BackgroundColor3 = useTokens().Color.Common.Scrim.Color3,
		ClipsDescendants = false,
		Text = "",
		AutoButtonColor = false,
		ZIndex = p1.zIndex,
		[reactModule.Change.AbsoluteSize] = p1.onSizeChanged,
		[reactModule.Event.Activated] = p1.onActivated,
		BorderSizePixel = 0,
		Modal = if drawerScrimCanBeModal then p1.isModal else nil
	}, p1.children)
end)