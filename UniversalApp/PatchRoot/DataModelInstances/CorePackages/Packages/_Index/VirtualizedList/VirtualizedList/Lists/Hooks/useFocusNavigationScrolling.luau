local ReactModule = require(script.Parent.Parent.Parent.Parent.React)
local _ = require(script.Parent.Parent.FlatList)

return function(p1)
	-- upvalues: ReactModule (copy)
	local CellRendererKey = if p1.cellRendererKey then p1.cellRendererKey else "CellRendererView"
	local ListRef = p1.listRef
	local OnSelectedIndexChangedFunction = p1.onSelectedIndexChanged
	local ViewOffset = p1.viewOffset
	local NoAnimated = p1.animated == nil or p1.animated
	local UseRefResult = ReactModule.useRef(if p1.initialIndex then p1.initialIndex else 1)
	local Data = p1.data
	
	return ReactModule.useCallback(function(Ancestor, _, _, Object)
		-- upvalues: CellRendererKey (copy), UseRefResult (copy), Data (copy), OnSelectedIndexChangedFunction (copy), ListRef (copy), NoAnimated (copy), ViewOffset (copy)
		if Object and Object:IsDescendantOf(Ancestor) then
			local CellRendererKey1 = Object:FindFirstAncestor(CellRendererKey)
			
			if not CellRendererKey1 or not CellRendererKey1.LayoutOrder then
				return nil
			end
			if CellRendererKey1.LayoutOrder == UseRefResult.current or #Data < CellRendererKey1.LayoutOrder or CellRendererKey1.LayoutOrder < 1 then
				return nil
			end
			UseRefResult.current = CellRendererKey1.LayoutOrder
			
			if OnSelectedIndexChangedFunction then
				OnSelectedIndexChangedFunction(UseRefResult.current)
			end
			if not ListRef or not ListRef.current then
				return nil
			end
			ListRef.current:scrollToIndex({
				index = UseRefResult.current,
				animated = NoAnimated,
				viewOffset = ViewOffset
			})
		end
		return nil
	end, {
		ListRef, UseRefResult, CellRendererKey, OnSelectedIndexChangedFunction,
		NoAnimated, ViewOffset, Data
	}), (ReactModule.useCallback(function(p2)
		-- upvalues: ListRef (copy)
		local ScaledIndex = p2.index * p2.averageItemLength
		
		if ListRef and ListRef.current then
			ListRef.current:scrollToOffset({ offset = ScaledIndex })
			
			return
		else
			warn("Animated scrolling failed, the ref to the ScrollView is nil.This could indicate that you are selecting focus before the ScrollView has mounted.")
		end
	end, { ListRef }))
end