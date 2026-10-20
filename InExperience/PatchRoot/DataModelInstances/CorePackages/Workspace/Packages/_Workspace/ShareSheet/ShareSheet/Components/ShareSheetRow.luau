local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FFlagShareSheetScrollArrowsModule = require(ShareSheet.Flags.FFlagShareSheetScrollArrows)
local ShareSheetRowWithScrollArrowsModule = require(script.Parent.ShareSheetRowWithScrollArrows)
local ScrollView = FoundationModule.ScrollView
local Visibility = FoundationModule.Enums.Visibility
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagShareSheetPeoplePickerEnabledModule = require(ShareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)

return function(Frame)
	-- upvalues: FFlagShareSheetScrollArrowsModule (copy), ReactModule (copy), ShareSheetRowWithScrollArrowsModule (copy), UseTokensFunction (copy), ScrollView (copy), FFlagShareSheetPeoplePickerEnabledModule (copy), Visibility (copy)
	if FFlagShareSheetScrollArrowsModule then
		return ReactModule.createElement(ShareSheetRowWithScrollArrowsModule, Frame)
	else
		local UseTokensResult = UseTokensFunction()
		
		return ReactModule.createElement(ScrollView, {
			tag = "size-full-0 auto-y",
			LayoutOrder = Frame.LayoutOrder,
			padding = if FFlagShareSheetPeoplePickerEnabledModule and Frame.hasHorizontalPadding == false then nil else {
				left = UDim.new(0, UseTokensResult.Padding.XLarge),
				right = UDim.new(0, UseTokensResult.Padding.XLarge)
			},
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = Visibility.None
			},
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, UseTokensResult.Padding.Medium)
			}
		}, Frame.children)
	end
end