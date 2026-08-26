local parent = script:FindFirstAncestor("GameFilters").Parent
local foundationModule = require(parent.Foundation)
local iconButton = foundationModule.IconButton
local iconSize = foundationModule.Enums.IconSize
local useTokens = foundationModule.Hooks.useTokens
local reactModule = require(parent.React)
local responsiveModule = require(parent.Responsive)
local fFlagLuaAppChartsFilterOptionTextTag = require(parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag

return function(p1)
	-- upvalues: useTokens (ref), responsiveModule (ref), reactModule (ref), fFlagLuaAppChartsFilterOptionTextTag (ref), iconButton (ref), iconSize (ref)
	local var1 = useTokens()
	local headingSmall = var1.Typography.HeadingSmall
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = if fFlagLuaAppChartsFilterOptionTextTag then nil else UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.LayoutOrder,
		[reactModule.Change.AbsoluteSize] = function(p2)
			-- upvalues: p1 (ref)
			p1.onHeightChanged(p2.AbsoluteSize.Y)
		end
	}, {
		Padding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, var1.Padding.Medium),
			PaddingBottom = UDim.new(0, var1.Padding.Medium),
			PaddingLeft = UDim.new(0, var1.Padding.XXLarge),
			PaddingRight = UDim.new(0, var1.Padding.XXLarge)
		}),
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Title = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = p1.title,
			Font = headingSmall.Font,
			TextSize = headingSmall.FontSize,
			TextColor3 = var1.Color.Content.Emphasis.Color3,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		CloseButton = if responsiveModule.usePreferredInput() == responsiveModule.Input.Directional then nil else reactModule.createElement(iconButton, {
			LayoutOrder = 2,
			icon = "icons/navigation/close",
			size = iconSize.Small,
			onActivated = p1.onCloseButtonActivated
		})
	})
end