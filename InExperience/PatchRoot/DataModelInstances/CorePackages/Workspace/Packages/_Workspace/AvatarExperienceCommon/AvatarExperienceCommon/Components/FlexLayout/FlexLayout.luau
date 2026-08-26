local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useDesignTokens = require(parent.Style).useDesignTokens

return function(p1)
	-- upvalues: useDesignTokens (ref), reactModule (ref), dashModule (ref)
	local var1 = if p1.flexSlot and p1.rigidSlot then p1.margin or useDesignTokens().Size.Size_400 else 0
	local flexDirection = p1.flexDirection or Enum.FillDirection.Horizontal
	local reverse = p1.reverse or false
	local var2, var3 = reactModule.useBinding(Vector2.new(0, 0))
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: flexDirection (ref), var1 (ref)
		return if flexDirection == Enum.FillDirection.Horizontal then UDim2.new(1, -(p2.X + var1), 1, 0) else UDim2.new(1, 0, 1, -(p2.Y + var1))
	end, { flexDirection, var1 })
	local cloned = table.clone(p1)
	cloned.flexDirection = nil
	cloned.reverse = nil
	cloned.rigidSlot = nil
	cloned.flexSlot = nil
	cloned.margin = nil
	cloned.padding = nil
	
	return reactModule.createElement("Frame", dashModule.join({
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = if flexDirection == Enum.FillDirection.Horizontal then UDim2.fromScale(1, 0) else UDim2.fromScale(0, 1),
		AutomaticSize = if flexDirection == Enum.FillDirection.Horizontal then Enum.AutomaticSize.Y else Enum.AutomaticSize.X
	}, cloned), {
		UILayout = reactModule.createElement("UIListLayout", {
			FillDirection = flexDirection,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, var1)
		}),
		Padding = if p1.padding then reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, p1.padding.top or 0),
			PaddingRight = UDim.new(0, p1.padding.right or 0),
			PaddingBottom = UDim.new(0, p1.padding.bottom or 0),
			PaddingLeft = UDim.new(0, p1.padding.left or 0)
		}) else nil,
		Flex = if p1.flexSlot then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = if reverse then 1 else 0,
			Size = var2:map(var4)
		}, p1.flexSlot) else nil,
		Rigid = if p1.rigidSlot then reactModule.createElement("Frame", {
			LayoutOrder = if reverse then 0 else 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if flexDirection == Enum.FillDirection.Horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			[reactModule.Change.AbsoluteSize] = function(p2)
				-- upvalues: var3 (ref)
				var3(p2.AbsoluteSize)
			end
		}, p1.rigidSlot) else nil
	})
end