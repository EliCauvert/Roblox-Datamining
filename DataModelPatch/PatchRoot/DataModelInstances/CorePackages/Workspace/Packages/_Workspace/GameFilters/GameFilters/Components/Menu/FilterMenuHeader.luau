local Parent = script:FindFirstAncestor("GameFilters").Parent
local FoundationModule = require(Parent.Foundation)
local IconButton = FoundationModule.IconButton
local IconSize = FoundationModule.Enums.IconSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local FFlagLuaAppChartsFilterOptionTextTag = require(Parent.SharedFlags).FFlagLuaAppChartsFilterOptionTextTag

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ResponsiveModule (copy), ReactModule (copy), FFlagLuaAppChartsFilterOptionTextTag (copy), IconButton (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local HeadingSmall = UseTokensResult.Typography.HeadingSmall
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = if FFlagLuaAppChartsFilterOptionTextTag then nil else UDim2.fromScale(1, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = Frame.LayoutOrder,
		[ReactModule.Change.AbsoluteSize] = function(Frame1)
			-- upvalues: Frame (copy)
			Frame.onHeightChanged(Frame1.AbsoluteSize.Y)
		end
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.Medium),
			PaddingBottom = UDim.new(0, UseTokensResult.Padding.Medium),
			PaddingLeft = UDim.new(0, UseTokensResult.Padding.XXLarge),
			PaddingRight = UDim.new(0, UseTokensResult.Padding.XXLarge)
		}),
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalFlex = Enum.UIFlexAlignment.SpaceBetween,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Title = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			TextWrapped = true,
			AutomaticSize = Enum.AutomaticSize.XY,
			Text = Frame.title,
			Font = HeadingSmall.Font,
			TextSize = HeadingSmall.FontSize,
			TextColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		CloseButton = if IsUsePreferredInputResultMatch then nil else ReactModule.createElement(IconButton, {
			LayoutOrder = 2,
			icon = "icons/navigation/close",
			size = IconSize.Small,
			onActivated = Frame.onCloseButtonActivated
		})
	})
end