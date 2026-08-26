local parent = script:FindFirstAncestor("AppBlox").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local infoCarouselCellModule = require(script.Parent.InfoCarouselCell)

return function(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), infoCarouselCellModule (ref)
	local var1 = useDesignTokens()
	local padding = p1.padding or var1.Size.Size_600
	local var2, var3 = reactModule.useBinding(0)
	
	local var4 = function(p2)
		-- upvalues: var3 (ref)
		var3(p2.AbsoluteSize.Y)
	end
	
	local t = {}
	
	for i, v in p1.data do
		t["Cell" .. i] = reactModule.createElement(infoCarouselCellModule, {
			LayoutOrder = i * 2,
			headerText = v.headerText,
			bodyText = v.bodyText,
			icon = v.icon,
			iconSize = p1.iconSize,
			onActivated = v.onActivated,
			padding = p1.cellPadding
		})
		
		if i < #p1.data then
			t["Divider" .. i] = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = i * 2 + 1,
				Size = var2:map(function(p2)
					return UDim2.fromOffset(1, p2 / 2)
				end),
				BorderColor3 = var1.Color.Stroke.Emphasis.Color3,
				BackgroundTransparency = var1.Color.Stroke.Emphasis.Transparency
			})
		end
	end
	return reactModule.createElement("ScrollingFrame", {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		AutomaticCanvasSize = Enum.AutomaticSize.XY,
		BackgroundTransparency = 1,
		LayoutOrder = p1.LayoutOrder,
		ScrollingDirection = Enum.ScrollingDirection.X,
		ScrollBarThickness = 0,
		ElasticBehavior = Enum.ElasticBehavior.WhenScrollable,
		[reactModule.Change.AbsoluteSize] = var4
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