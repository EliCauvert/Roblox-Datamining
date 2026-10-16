local Parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens

return function(Tbl) --[[ Line: 23 | Named "FlexLayout" ]]
	-- upvalues: UseDesignTokensFunction (copy), ReactModule (copy), DashModule (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local Margin = if Tbl.flexSlot and Tbl.rigidSlot then Tbl.margin or UseDesignTokensResult.Size.Size_400 else 0
	local FlexDirection = Tbl.flexDirection or Enum.FillDirection.Horizontal
	local Reverse = Tbl.reverse or false
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(Vector2.new(0, 0))
	local UseResult = ReactModule.useCallback(function(Vector): UDim2 --[[ Line: 31 ]]
		-- upvalues: FlexDirection (copy), Margin (copy)
		return if FlexDirection == Enum.FillDirection.Horizontal then UDim2.new(1, -(Vector.X + Margin), 1, 0) else UDim2.new(1, 0, 1, -(Vector.Y + Margin))
	end, { FlexDirection, Margin })
	local Copy = table.clone(Tbl)
	Copy.flexDirection = nil
	Copy.reverse = nil
	Copy.rigidSlot = nil
	Copy.flexSlot = nil
	Copy.margin = nil
	Copy.padding = nil
	
	return ReactModule.createElement("Frame", DashModule.join({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = if FlexDirection == Enum.FillDirection.Horizontal then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 1),
		AutomaticSize = if FlexDirection == Enum.FillDirection.Horizontal then Enum.AutomaticSize.Y else Enum.AutomaticSize.X
	}, Copy), {
		UILayout = ReactModule.createElement("UIListLayout", {
			FillDirection = FlexDirection,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, Margin)
		}),
		Padding = if Tbl.padding then ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, Tbl.padding.top or 0),
			PaddingRight = UDim.new(0, Tbl.padding.right or 0),
			PaddingBottom = UDim.new(0, Tbl.padding.bottom or 0),
			PaddingLeft = UDim.new(0, Tbl.padding.left or 0)
		}) else nil,
		Flex = if Tbl.flexSlot then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = if Reverse then 1 else 0,
			Size = UseBindingResult:map(UseResult)
		}, Tbl.flexSlot) else nil,
		Rigid = if Tbl.rigidSlot then ReactModule.createElement("Frame", {
			LayoutOrder = if Reverse then 0 else 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if FlexDirection == Enum.FillDirection.Horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			[ReactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 90 ]]
				-- upvalues: UseBindingResult2 (copy)
				UseBindingResult2(Frame.AbsoluteSize)
			end
		}, Tbl.rigidSlot) else nil
	})
end