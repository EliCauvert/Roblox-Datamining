local Parent = script:FindFirstAncestor("Drawer").Parent
local ReactModule = require(Parent.React)
local UseTokensFunction = require(Parent.Foundation).Hooks.useTokens
local DrawerScrimCanBeModal = game:DefineFastFlag("DrawerScrimCanBeModal", false)

return (ReactModule.forwardRef(function(p1, Ref) --[[ Line: 18 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), DrawerScrimCanBeModal (copy)
	return ReactModule.createElement("TextButton", {
		ref = Ref,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = p1.transparencyBinding,
		BackgroundColor3 = UseTokensFunction().Color.Common.Scrim.Color3,
		ClipsDescendants = false,
		Text = "",
		AutoButtonColor = false,
		ZIndex = p1.zIndex,
		[ReactModule.Change.AbsoluteSize] = p1.onSizeChanged,
		[ReactModule.Event.Activated] = p1.onActivated,
		BorderSizePixel = 0,
		Modal = if DrawerScrimCanBeModal then p1.isModal else nil
	}, p1.children)
end))