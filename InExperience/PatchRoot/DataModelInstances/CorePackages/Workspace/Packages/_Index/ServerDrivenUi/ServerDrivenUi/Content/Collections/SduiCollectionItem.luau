local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility
local fFlagSduiPoolBackedFeed = require(parent.SharedFlags).FFlagSduiPoolBackedFeed

return reactModule.memo(function(p1)
	-- upvalues: fFlagSduiPoolBackedFeed (ref), reactModule (ref), impressionsTagUtility (ref), cryoModule (ref)
	local layoutOrder = p1.layoutOrder
	local size = p1.size
	local position = p1.position
	local anchorPoint = p1.anchorPoint
	local zIndex = p1.zIndex
	local automaticSize = p1.automaticSize
	local var1 = if fFlagSduiPoolBackedFeed then p1.innerWrapperSize else nil
	local var2 = reactModule.useRef(nil)
	reactModule.useEffect(function()
		-- upvalues: impressionsTagUtility (copy), var2 (ref), p1 (ref)
		impressionsTagUtility.AddTag(var2, p1.impressionsTag, p1.index)
		
		return function()
			-- upvalues: impressionsTagUtility (copy), var2 (copy), p1 (copy)
			impressionsTagUtility.RemoveTag(var2, p1.impressionsTag, p1.index)
		end
	end, { var2, p1.impressionsTag, p1.index })
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref), impressionsTagUtility (copy), p1 (ref)
		var2.current = p2
		
		if p2 then
			impressionsTagUtility.AddTag(var2, p1.impressionsTag, p1.index)
		end
	end, { p1.impressionsTag, p1.index })
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		if p1.onItemSizeChanged then
			p1.onItemSizeChanged(p1.index, p2)
		end
	end, { p1.onItemSizeChanged, p1.index })
	local _ = nil
	local var5 = if fFlagSduiPoolBackedFeed and var1 ~= nil then {
		InnerWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ref = var3,
			Size = var1,
			Position = UDim2.fromScale(0, 0)
		}, p1.children)
	} else p1.children
	
	if p1.minHeightBinding then
		var5 = cryoModule.Dictionary.join(var5 or {}, {
			SizeConstraint = reactModule.createElement("UISizeConstraint", {
				MinSize = p1.minHeightBinding:map(function(p2)
					return Vector2.new(0, if p2 and p2 > 0 then p2 else 0)
				end)
			})
		})
	end
	return reactModule.createElement("Frame", {
		ref = if fFlagSduiPoolBackedFeed and var1 ~= nil then nil else var3,
		AnchorPoint = anchorPoint,
		Position = position,
		Size = size,
		LayoutOrder = layoutOrder or p1.index,
		ZIndex = zIndex,
		BackgroundTransparency = 1,
		AutomaticSize = automaticSize,
		[reactModule.Change.AbsoluteSize] = if p1.onItemSizeChanged then var4 else nil,
		[reactModule.Tag] = if p1.testId then `data-testid={p1.testId}` else nil
	}, var5)
end)