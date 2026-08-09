local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local dashModule = require(parent.Dash)
local useDesignTokens = require(parent.Style).useDesignTokens

return function(p0) --[[ line: 25 | named "FlexLayout" ]]
	-- upvalues: useDesignTokens (ref), fFlagRenameDeprecatedUIBloxTokens (ref), reactModule (ref), dashModule (ref)
	local var2 = useDesignTokens()
	local var3 = if p0.flexSlot and p0.rigidSlot then p0.margin or (if fFlagRenameDeprecatedUIBloxTokens then var2.Size.Size_400 else var2.Global.Space_200) else 0
	local flexDirection = p0.flexDirection or Enum.FillDirection.Horizontal
	local reverse = p0.reverse or false
	local var6, var7 = reactModule.useBinding(Vector2.new(0, 0))
	local var8 = reactModule.useCallback(function(p1) --[[ line: 37 ]]
		-- upvalues: flexDirection (ref), var3 (ref)
		return if flexDirection == Enum.FillDirection.Horizontal then UDim2.new(1, -(p1.X + var3), 1, 0) else UDim2.new(1, 0, 1, -(p1.Y + var3))
	end, { flexDirection, var3 })
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
			Padding = UDim.new(0, var3)
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
			Size = var6:map(var8)
		}, p0.flexSlot) else nil,
		Rigid = if p0.rigidSlot then reactModule.createElement("Frame", {
			LayoutOrder = if reverse then 0 else 1,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = if flexDirection == Enum.FillDirection.Horizontal then UDim2.new(0, 0, 1, 0) else UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.XY,
			[reactModule.Change.AbsoluteSize] = function(p2) --[[ line: 96 ]]
				-- upvalues: var7 (ref)
				var7(p2.AbsoluteSize)
			end
		}, p0.rigidSlot) else nil
	})
end