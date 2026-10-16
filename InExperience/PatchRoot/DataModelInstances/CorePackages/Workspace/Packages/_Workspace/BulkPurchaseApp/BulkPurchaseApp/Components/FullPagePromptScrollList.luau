local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseCursorFunction = require(Parent.UIBlox).App.SelectionCursor.useCursor

return function(Frame) --[[ Line: 15 | Named "FullPagePromptScrollList" ]]
	-- upvalues: UseDesignTokensFunction (copy), UseCursorFunction (copy), ReactModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseCursorResult = UseCursorFunction(UDim.new(0, UseDesignTokensResult.Radius.Small), UseDesignTokensResult.Size.Size_200)
	local Size350 = UseDesignTokensResult.Size.Size_350
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	
	return ReactModule.createElement("ScrollingFrame", {
		LayoutOrder = Frame.LayoutOrder,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = Frame.size,
		ScrollBarThickness = UseDesignTokensResult.Size.Size_100,
		ScrollBarImageColor3 = UseDesignTokensResult.Color.Shift.Shift_400.Color3,
		ScrollBarImageTransparency = UseDesignTokensResult.Color.Shift.Shift_400.Transparency,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(1, -Size350, 0, 0),
		SelectionImageObject = UseCursorResult,
		Selectable = UseBindingResult,
		[ReactModule.Change.AbsoluteCanvasSize] = function(ScrollFrame) --[[ Line: 35 ]]
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(ScrollFrame.AbsoluteWindowSize.Y < ScrollFrame.AbsoluteCanvasSize.Y)
		end
	}, ReactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, Size350) }), ReactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Padding = UDim.new(0, UseDesignTokensResult.Size.Size_600)
	}), Frame.children)
end