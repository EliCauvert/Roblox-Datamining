local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local scrollView = foundationModule.ScrollView
local visibility = foundationModule.Enums.Visibility
local useTokens = foundationModule.Hooks.useTokens
local fFlagSharePplPickerModule = require(shareSheet.Flags.FFlagSharePplPicker)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), scrollView (ref), fFlagSharePplPickerModule (ref), visibility (ref)
	local var1 = useTokens()
	
	return reactModule.createElement(scrollView, {
		tag = "size-full-0 auto-y",
		LayoutOrder = p1.LayoutOrder,
		padding = if fFlagSharePplPickerModule and p1.hasHorizontalPadding == false then nil else {
			left = UDim.new(0, var1.Padding.XLarge),
			right = UDim.new(0, var1.Padding.XLarge)
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
			Padding = UDim.new(0, var1.Padding.Medium)
		}
	}, p1.children)
end