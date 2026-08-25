local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local useDesignTokens = require(parent.Style).useDesignTokens

return function(p0)
	-- upvalues: useDesignTokens (ref), reactModule (ref), dashModule (ref)
	local var2 = if p0.flexSlot and p0.rigidSlot then p0.margin or useDesignTokens().Size.Size_400 else 0
	local flexDirection = p0.flexDirection or Enum.FillDirection.Horizontal
	local reverse = p0.reverse or false
	local var5, var6 = reactModule.useBinding(Vector2.new(0, 0))
	local var7 = reactModule.useCallback(function(p1)
		-- upvalues: flexDirection (ref), var2 (ref)
		return if flexDirection == Enum.FillDirection.Horizontal then UDim2.new(1, -(p1.X + var2), 1, 0) else UDim2.new(1, 0, 1, -(p1.Y + var2))
	end, { flexDirection, var2 })
	local cloned = table.clone(p0)
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
			Padding = UDim.new(0, var2)
		}),
		Padding = if p0.padding then reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, p0.padding.top or 0),
			PaddingRight = UDim.new(0, p0.padding.right or 0),
			PaddingBottom = UDim.new(0, p0.padding.bottom or 0),
			PaddingLeft = UDim.new(0, p0.padding.left or 0)
		}) else nil,
		Flex = if p0.flexSlot then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = if reverse then 1 else 0,
			Size = var5:map(var7)
		}, p0.flexSlot) else nil,
		Rigid = if p0.rigidSlot then reactModule.createElement("Frame", {
			LayoutOrder = if reverse then 0 else 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if flexDirection == Enum.FillDirection.Horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			[reactModule.Change.AbsoluteSize] = function(p2)
				-- upvalues: var6 (ref)
				var6(p2.AbsoluteSize)
			end
		}, p0.rigidSlot) else nil
	})
end