local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local useCursor = require(parent.UIBlox).App.SelectionCursor.useCursor

return function(p0) --[[ line: 15 | named "FullPagePromptScrollList" ]]
	-- upvalues: useDesignTokens (ref), useCursor (ref), reactModule (ref)
	local var1 = useDesignTokens()
	local var2 = useCursor(UDim.new(0, var1.Radius.Small), var1.Size.Size_200)
	local size350 = var1.Size.Size_350
	local var3, var4 = reactModule.useBinding(false)
	
	return reactModule.createElement("ScrollingFrame", {
		LayoutOrder = p0.LayoutOrder,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = p0.size,
		ScrollBarThickness = var1.Size.Size_100,
		ScrollBarImageColor3 = var1.Color.Shift.Shift_400.Color3,
		ScrollBarImageTransparency = var1.Color.Shift.Shift_400.Transparency,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(1, -size350, 0, 0),
		SelectionImageObject = var2,
		Selectable = var3,
		[reactModule.Change.AbsoluteCanvasSize] = function(p1) --[[ line: 35 ]]
			-- upvalues: var4 (ref)
			var4(p1.AbsoluteWindowSize.Y < p1.AbsoluteCanvasSize.Y)
		end
	}, reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, size350) }), reactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Padding = UDim.new(0, var1.Size.Size_600)
	}), p0.children)
end