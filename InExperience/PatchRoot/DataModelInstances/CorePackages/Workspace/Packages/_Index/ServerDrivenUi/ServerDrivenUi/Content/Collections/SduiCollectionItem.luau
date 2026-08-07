local parent = script:FindFirstAncestor("ServerDrivenUi").Parent
local reactModule = require(parent.React)
local cryoModule = require(parent.Cryo)
local impressionsTagUtility = require(parent.Impressions).ImpressionsTagUtility
local fFlagSduiPoolBackedFeed = require(parent.SharedFlags).FFlagSduiPoolBackedFeed

return reactModule.memo(function(p0) --[[ line: 34 | named "SduiCollectionItem" ]]
	-- upvalues: fFlagSduiPoolBackedFeed (ref), reactModule (ref), impressionsTagUtility (ref), cryoModule (ref)
	local layoutOrder = p0.layoutOrder
	local size = p0.size
	local position = p0.position
	local anchorPoint = p0.anchorPoint
	local zIndex = p0.zIndex
	local automaticSize = p0.automaticSize
	local var2 = if fFlagSduiPoolBackedFeed then p0.innerWrapperSize else nil
	local var3 = reactModule.useRef(nil)
	reactModule.useEffect(function() --[[ line: 44 ]]
		-- upvalues: impressionsTagUtility (copy), var3 (ref), p0 (ref)
		impressionsTagUtility.AddTag(var3, p0.impressionsTag, p0.index)
		
		return function() --[[ line: 46 ]]
			-- upvalues: impressionsTagUtility (copy), var3 (copy), p0 (copy)
			impressionsTagUtility.RemoveTag(var3, p0.impressionsTag, p0.index)
		end
	end, { var3, p0.impressionsTag, p0.index })
	local var4 = reactModule.useCallback(function(p1) --[[ line: 51 ]]
		-- upvalues: var3 (ref), impressionsTagUtility (copy), p0 (ref)
		var3.current = p1
		
		if p1 then
			impressionsTagUtility.AddTag(var3, p0.impressionsTag, p0.index)
		end
	end, { p0.impressionsTag, p0.index })
	local var5 = reactModule.useCallback(function(p2) --[[ line: 58 ]]
		-- upvalues: p0 (ref)
		if p0.onItemSizeChanged then
			p0.onItemSizeChanged(p0.index, p2)
		end
	end, { p0.onItemSizeChanged, p0.index })
	local _ = nil
	local var6 = if fFlagSduiPoolBackedFeed and var2 ~= nil then {
		InnerWrapper = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ref = var4,
			Size = var2,
			Position = UDim2.fromScale(0, 0)
		}, p0.children)
	} else p0.children
	
	if p0.minHeightBinding then
		var6 = cryoModule.Dictionary.join(var6 or {}, {
			SizeConstraint = reactModule.createElement("UISizeConstraint", {
				MinSize = p0.minHeightBinding:map(function(p3) --[[ line: 85 ]]
					return Vector2.new(0, if p3 and p3 > 0 then p3 else 0)
				end)
			})
		})
	end
	return reactModule.createElement("Frame", {
		ref = if fFlagSduiPoolBackedFeed and var2 ~= nil then nil else var4,
		AnchorPoint = anchorPoint,
		Position = position,
		Size = size,
		LayoutOrder = layoutOrder or p0.index,
		ZIndex = zIndex,
		BackgroundTransparency = 1,
		AutomaticSize = automaticSize,
		[reactModule.Change.AbsoluteSize] = if p0.onItemSizeChanged then var5 else nil,
		[reactModule.Tag] = if p0.testId then `data-testid={p0.testId}` else nil
	}, var6)
end)