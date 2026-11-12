local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FFlagShareSheetDesktopReadinessModule = require(ShareSheet.Flags.FFlagShareSheetDesktopReadiness)
local FFlagShareSheetScrollArrowsModule = require(ShareSheet.Flags.FFlagShareSheetScrollArrows)
local ShareSheetRowWithScrollArrowsModule = require(script.Parent.ShareSheetRowWithScrollArrows)
local ScrollView = FoundationModule.ScrollView
local Visibility = FoundationModule.Enums.Visibility
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(Frame)
	-- upvalues: FFlagShareSheetScrollArrowsModule (copy), FFlagShareSheetDesktopReadinessModule (copy), ReactModule (copy), ShareSheetRowWithScrollArrowsModule (copy), UseTokensFunction (copy), ScrollView (copy), Visibility (copy)
	if FFlagShareSheetScrollArrowsModule and not FFlagShareSheetDesktopReadinessModule then
		return ReactModule.createElement(ShareSheetRowWithScrollArrowsModule, Frame)
	else
		local UseTokensResult = UseTokensFunction()
		local Margin = if FFlagShareSheetDesktopReadinessModule then Frame.margin else UseTokensResult.Padding.XLarge
		
		return ReactModule.createElement(ScrollView, {
			tag = "size-full-0 auto-y",
			LayoutOrder = Frame.LayoutOrder,
			padding = { left = UDim.new(0, Margin), right = UDim.new(0, Margin) },
			scroll = {
				AutomaticSize = Enum.AutomaticSize.Y,
				AutomaticCanvasSize = Enum.AutomaticSize.X,
				CanvasSize = UDim2.fromScale(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.X,
				ScrollingEnabled = if FFlagShareSheetDesktopReadinessModule then Frame.isScrollingEnabled else nil,
				scrollBarVisibility = Visibility.None
			},
			layout = {
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				Padding = UDim.new(0, if FFlagShareSheetDesktopReadinessModule then Frame.gap else UseTokensResult.Padding.Medium)
			}
		}, Frame.children)
	end
end