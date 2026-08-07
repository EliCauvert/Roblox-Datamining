local reactModule = require(script.Parent.Parent.Parent.Parent.React)
local _ = require(script.Parent.Parent.FlatList)

return function(p0) --[[ line: 40 | named "useFocusNavigationScrolling" ]]
	-- upvalues: reactModule (ref)
	local var1 = if p0.cellRendererKey then p0.cellRendererKey else "CellRendererView"
	local var2 = if p0.initialIndex then p0.initialIndex else 1
	local listRef = p0.listRef
	local onSelectedIndexChanged = p0.onSelectedIndexChanged
	local viewOffset = p0.viewOffset
	local var3 = p0.animated ~= nil or p0.animated
	local var4 = reactModule.useRef(var2)
	local data = p0.data
	
	return reactModule.useCallback(function(p1, _, _, p2) --[[ line: 64 ]]
		-- upvalues: var1 (ref), var4 (ref), data (ref), onSelectedIndexChanged (ref), listRef (ref), var3 (ref), viewOffset (ref)
		if p2 and p2:IsDescendantOf(p1) then
			local var5 = p2:FindFirstAncestor(var1)
			
			if not var5 or not var5.LayoutOrder then
				return nil
			elseif var5.LayoutOrder == var4.current or #data < var5.LayoutOrder or var5.LayoutOrder < 1 then
				return nil
			end
			var4.current = var5.LayoutOrder
			
			if onSelectedIndexChanged then
				onSelectedIndexChanged(var4.current)
			end
			if not listRef or not listRef.current then
				return nil
			end
			listRef.current:scrollToIndex({
				index = var4.current,
				animated = var3,
				viewOffset = viewOffset
			})
		end
		return nil
	end, {
		listRef, var4, var1, onSelectedIndexChanged, var3, viewOffset, data
	}), reactModule.useCallback(function(p3) --[[ line: 50 ]]
		-- upvalues: listRef (ref)
		local var6 = p3.index * p3.averageItemLength
		
		if listRef and listRef.current then
			listRef.current:scrollToOffset({ offset = var6 })
			
			return
		end
		warn("Animated scrolling failed, the ref to the ScrollView is nil.This could indicate that you are selecting focus before the ScrollView has mounted.")
	end, { listRef })
end