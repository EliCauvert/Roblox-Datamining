local reactModule = require(script.Parent.Parent.Parent.Parent.React)
local _ = require(script.Parent.Parent.FlatList)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1 = if p1.cellRendererKey then p1.cellRendererKey else "CellRendererView"
	local var2 = if p1.initialIndex then p1.initialIndex else 1
	local listRef = p1.listRef
	local onSelectedIndexChanged = p1.onSelectedIndexChanged
	local viewOffset = p1.viewOffset
	local var3 = p1.animated ~= nil or p1.animated
	local var4 = reactModule.useRef(var2)
	local data = p1.data
	
	return reactModule.useCallback(function(p2, _, _, p3)
		-- upvalues: var1 (ref), var4 (ref), data (ref), onSelectedIndexChanged (ref), listRef (ref), var3 (ref), viewOffset (ref)
		if p3 and p3:IsDescendantOf(p2) then
			local var5 = p3:FindFirstAncestor(var1)
			
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
	}), reactModule.useCallback(function(p2)
		-- upvalues: listRef (ref)
		local var5 = p2.index * p2.averageItemLength
		
		if listRef and listRef.current then
			listRef.current:scrollToOffset({ offset = var5 })
			
			return
		end
		warn("Animated scrolling failed, the ref to the ScrollView is nil.This could indicate that you are selecting focus before the ScrollView has mounted.")
	end, { listRef })
end