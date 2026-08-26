local parent = script:FindFirstAncestor("PeopleReactView").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local view = require(parent.Foundation).View

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), signalsModule (ref), view (ref)
	local var1, var2 = reactModule.useState(-1)
	local var3 = reactModule.useMemo(function()
		-- upvalues: reactModule (copy), p1 (ref)
		return reactModule.joinBindings({ itemWidth = p1.itemWidth, itemHeight = p1.itemHeight }):map(function(p2)
			return UDim2.fromOffset(p2.itemWidth, p2.itemHeight)
		end)
	end, {})
	local var4 = reactModule.joinBindings({
		numColumns = p1.numColumns,
		itemWidth = p1.itemWidth,
		itemHeight = p1.itemHeight
	})
	local var5 = reactModule.useMemo(function()
		-- upvalues: var4 (ref), var1 (ref), p1 (ref)
		return var4:map(function(p2)
			-- upvalues: var1 (copy), p1 (copy)
			return UDim2.fromOffset((var1 - 1) % p2.numColumns * (p2.itemWidth + p1.gapSize), math.floor((var1 - 1) / p2.numColumns) * (p2.itemHeight + p1.gapSize))
		end)
	end, { var1, p1.gapSize })
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), p1 (ref), var2 (ref)
		local var6 = signalsModule.createEffect(function(p2)
			-- upvalues: p1 (copy), var2 (copy)
			local minVirtualizedIndex = p1.getMinVirtualizedIndex(p2)
			local var7 = p1.getMaxVirtualizedIndex(p2) - minVirtualizedIndex + 1
			var2(minVirtualizedIndex + (p1.relativeIndex - ((minVirtualizedIndex - 1) % var7 + 1)) % var7)
		end)
		
		return function()
			-- upvalues: var6 (ref)
			var6()
		end
	end, {
		p1.relativeIndex,
		p1.getMinVirtualizedIndex,
		p1.getMaxVirtualizedIndex
	})
	
	return reactModule.createElement(view, {
		Size = var3,
		Position = var5,
		ZIndex = if var1 == 1 then 2 else 1
	}, { Item = p1.getElement(var1) })
end)