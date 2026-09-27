local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), impressionsTagUtility (ref), cryoModule (ref)
	local layoutOrder = p1.layoutOrder
	local size = p1.size
	local position = p1.position
	local anchorPoint = p1.anchorPoint
	local zIndex = p1.zIndex
	local automaticSize = p1.automaticSize
	local innerWrapperSize = p1.innerWrapperSize
	local var1 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var1 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var1, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var1 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var1, p1.impressionsTag, p1.index)
		end
	end, { var1, p1.impressionsTag, p1.index })
	local var2 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), impressionsTagUtility (copy), p1 (ref)
		var1.current = p2
		
		if p2 then
			impressionsTagUtility.AddTag(var1, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		if p1.onItemSizeChanged then
			p1.onItemSizeChanged(p1.index, p2)
		end
	end, { p1.onItemSizeChanged, p1.index })
	local var4 = if innerWrapperSize ~= nil then p1.children else {
		InnerWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ref = var2,
			Size = innerWrapperSize,
			Position = UDim2.fromScale(0, 0)
		}, p1.children)
	}
	
	if p1.minHeightBinding then
		var4 = cryoModule.Dictionary.join(var4 or {}, {
			SizeConstraint = reactModule.createElement("UISizeConstraint", {
				MinSize = p1.minHeightBinding:map(function(p2)
					return Vector2.new(0, if p2 and p2 > 0 then p2 else 0)
				end)
			})
		})
	end
	return reactModule.createElement("Frame", {
		ref = if innerWrapperSize ~= nil then var2 else nil,
		AnchorPoint = anchorPoint,
		Position = position,
		Size = size,
		LayoutOrder = layoutOrder or p1.index,
		ZIndex = zIndex,
		BackgroundTransparency = 1,
		AutomaticSize = automaticSize,
		[reactModule.Change.AbsoluteSize] = if p1.onItemSizeChanged then var3 else nil,
		[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
	}, var4)
end)