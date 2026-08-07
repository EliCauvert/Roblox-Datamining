local parent = script:FindFirstAncestor("Drawer").Parent
local reactModule = require(parent.React)
local useTokens = require(parent.Foundation).Hooks.useTokens
local drawerScrimCanBeModal = game:DefineFastFlag("DrawerScrimCanBeModal", false)

return reactModule.forwardRef(function(p0, p1) --[[ line: 18 ]]
	-- upvalues: useTokens (ref), reactModule (ref), drawerScrimCanBeModal (ref)
	return reactModule.createElement("TextButton", {
		ref = p1,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = p0.transparencyBinding,
		BackgroundColor3 = useTokens().Color.Common.Scrim.Color3,
		ClipsDescendants = false,
		Text = "",
		AutoButtonColor = false,
		ZIndex = p0.zIndex,
		[reactModule.Change.AbsoluteSize] = p0.onSizeChanged,
		[reactModule.Event.Activated] = p0.onActivated,
		BorderSizePixel = 0,
		Modal = if drawerScrimCanBeModal then p0.isModal else nil
	}, p0.children)
end)