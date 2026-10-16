local Parent = script:FindFirstAncestor("AppBlox").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local InfoCarouselCellModule = require(script.Parent.InfoCarouselCell)

return function(Frame) --[[ Line: 18 ]]
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), InfoCarouselCellModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Padding = Frame.padding or UseDesignTokensResult.Size.Size_600
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	
	local function v7(Frame) --[[ Line: 24 ]]
		-- upvalues: UseBindingResult2 (copy)
		UseBindingResult2(Frame.AbsoluteSize.Y)
	end
	
	local Elements = {}
	
	for i, entry in Frame.data do
		Elements["Cell" .. i] = ReactModule.createElement(InfoCarouselCellModule, {
			LayoutOrder = i * 2,
			headerText = entry.headerText,
			bodyText = entry.bodyText,
			icon = entry.icon,
			iconSize = Frame.iconSize,
			onActivated = entry.onActivated,
			padding = Frame.cellPadding
		})
		
		if i < #Frame.data then
			Elements["Divider" .. i] = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = i * 2 + 1,
				Size = UseBindingResult:map(function(p1: number): UDim2 --[[ Line: 42 ]]
					return UDim2.fromOffset(1, p1 / 2)
				end),
				BorderColor3 = UseDesignTokensResult.Color.Stroke.Emphasis.Color3,
				BackgroundTransparency = UseDesignTokensResult.Color.Stroke.Emphasis.Transparency
			})
		end
	end
	return ReactModule.createElement("ScrollingFrame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		LayoutOrder = Frame.LayoutOrder,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ScrollBarThickness = 0,
		ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
		[ReactModule.Change.AbsoluteSize] = v7
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, Padding)
		}),
		Cells = ReactModule.createElement(ReactModule.Fragment, {}, Elements)
	})
end