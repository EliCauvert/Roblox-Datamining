local Parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local FFlagRenameDeprecatedUIBloxTokens = require(Parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local UseCursorFunction = require(Parent.UIBlox).App.SelectionCursor.useCursor

return function(Frame)
	-- upvalues: UseDesignTokensFunction (copy), UseCursorFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), ReactModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseCursorResult = UseCursorFunction(UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Radius.Small else UseDesignTokensResult.Semantic.Radius.Small), if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_200 else UseDesignTokensResult.Global.Space_100)
	local Size350 = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_350 else UseDesignTokensResult.Global.Space_175
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(false)
	
	return ReactModule.createElement("ScrollingFrame", {
		LayoutOrder = Frame.LayoutOrder,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = Frame.size,
		ScrollBarThickness = if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_100 else UseDesignTokensResult.Global.Size_50,
		ScrollBarImageColor3 = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Shift.Shift_400 else UseDesignTokensResult.Semantic.Color.Ui.Emphasis).Color3,
		ScrollBarImageTransparency = (if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Color.Shift.Shift_400 else UseDesignTokensResult.Semantic.Color.Ui.Emphasis).Transparency,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(1, -Size350, 0, 0),
		SelectionImageObject = UseCursorResult,
		Selectable = UseBindingResult,
		[ReactModule.Change.AbsoluteCanvasSize] = function(ScrollFrame)
			-- upvalues: UseBindingResult2 (copy)
			UseBindingResult2(ScrollFrame.AbsoluteWindowSize.Y < ScrollFrame.AbsoluteCanvasSize.Y)
		end
	}, ReactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, Size350) }), ReactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then UseDesignTokensResult.Size.Size_600 else UseDesignTokensResult.Global.Space_300)
	}), Frame.children)
end