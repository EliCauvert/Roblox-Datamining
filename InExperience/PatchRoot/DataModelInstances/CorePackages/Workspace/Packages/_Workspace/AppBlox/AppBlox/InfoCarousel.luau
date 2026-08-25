local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local infoCarouselCellModule = require(script.Parent.InfoCarouselCell)

return function(p0)
	-- upvalues: useDesignTokens (ref), reactModule (ref), infoCarouselCellModule (ref)
	local var2 = useDesignTokens()
	local padding = p0.padding or var2.Size.Size_600
	local var4, var5 = reactModule.useBinding(0)
	
	local var6 = function(p1)
		-- upvalues: var5 (ref)
		var5(p1.AbsoluteSize.Y)
	end
	
	local t = {}
	
	for i, v in p0.data do
		t["Cell" .. i] = reactModule.createElement(infoCarouselCellModule, {
			LayoutOrder = i * 2,
			headerText = v.headerText,
			bodyText = v.bodyText,
			icon = v.icon,
			iconSize = p0.iconSize,
			onActivated = v.onActivated,
			padding = p0.cellPadding
		})
		
		if i < #p0.data then
			t["Divider" .. i] = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = i * 2 + 1,
				Size = var4:map(function(p2)
					return UDim2.fromOffset(1, p2 / 2)
				end),
				BorderColor3 = var2.Color.Stroke.Emphasis.Color3,
				BackgroundTransparency = var2.Color.Stroke.Emphasis.Transparency
			})
		end
	end
	return reactModule.createElement("ScrollingFrame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		LayoutOrder = p0.LayoutOrder,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ScrollBarThickness = 0,
		ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
		[reactModule.Change.AbsoluteSize] = var6
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, padding)
		}),
		Cells = reactModule.createElement(reactModule.Fragment, {}, t)
	})
end