local parent = script:FindFirstAncestor("BulkPurchaseApp").Parent
local reactModule = require(parent.React)
local useDesignTokens = require(parent.Style).useDesignTokens
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local useCursor = require(parent.UIBlox).App.SelectionCursor.useCursor

return function(p0) --[[ line: 17 | named "FullPagePromptScrollList" ]]
	-- upvalues: useDesignTokens (ref), useCursor (ref), fFlagRenameDeprecatedUIBloxTokens (ref), reactModule (ref)
	local var1 = useDesignTokens()
	local var2 = useCursor(UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then var1.Radius.Small else var1.Semantic.Radius.Small), if fFlagRenameDeprecatedUIBloxTokens then var1.Size.Size_200 else var1.Global.Space_100)
	local var3 = if fFlagRenameDeprecatedUIBloxTokens then var1.Size.Size_350 else var1.Global.Space_175
	local var4, var5 = reactModule.useBinding(false)
	
	return reactModule.createElement("ScrollingFrame", {
		LayoutOrder = p0.LayoutOrder,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = p0.size,
		ScrollBarThickness = if fFlagRenameDeprecatedUIBloxTokens then var1.Size.Size_100 else var1.Global.Size_50,
		ScrollBarImageColor3 = (if fFlagRenameDeprecatedUIBloxTokens then var1.Color.Shift.Shift_400 else var1.Semantic.Color.Ui.Emphasis).Color3,
		ScrollBarImageTransparency = (if fFlagRenameDeprecatedUIBloxTokens then var1.Color.Shift.Shift_400 else var1.Semantic.Color.Ui.Emphasis).Transparency,
		AutomaticCanvasSize = Enum.AutomaticSize.Y,
		CanvasSize = UDim2.new(1, -var3, 0, 0),
		SelectionImageObject = var2,
		Selectable = var4,
		[reactModule.Change.AbsoluteCanvasSize] = function(p1) --[[ line: 55 ]]
			-- upvalues: var5 (ref)
			var5(p1.AbsoluteWindowSize.Y < p1.AbsoluteCanvasSize.Y)
		end
	}, reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, var3) }), reactModule.createElement("UIListLayout", {
		SortOrder = Enum.SortOrder.LayoutOrder,
		HorizontalAlignment = Enum.HorizontalAlignment.Center,
		VerticalAlignment = Enum.VerticalAlignment.Top,
		Padding = UDim.new(0, if fFlagRenameDeprecatedUIBloxTokens then var1.Size.Size_600 else var1.Global.Space_300)
	}), p0.children)
end