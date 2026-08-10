local parent = script:FindFirstAncestor("ShareSheet").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local scrollView = foundationModule.ScrollView
local visibility = foundationModule.Enums.Visibility
local useTokens = foundationModule.Hooks.useTokens

return function(p0) --[[ line: 16 | named "ShareSheetRow" ]]
	-- upvalues: useTokens (ref), reactModule (ref), scrollView (ref), visibility (ref)
	local var2 = useTokens()
	
	return reactModule.createElement(scrollView, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p0.LayoutOrder,
		padding = {
			left = UDim.new(0, var2.Padding.XLarge),
			right = UDim.new(0, var2.Padding.XLarge)
		},
		scroll = {
			AutomaticSize = Enum.AutomaticSize.Y,
			AutomaticCanvasSize = Enum.AutomaticSize.X,
			CanvasSize = UDim2.fromScale(0, 0),
			ScrollingDirection = Enum.ScrollingDirection.X,
			scrollBarVisibility = visibility.None
		},
		layout = {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			Padding = UDim.new(0, var2.Padding.Medium)
		}
	}, p0.children)
end