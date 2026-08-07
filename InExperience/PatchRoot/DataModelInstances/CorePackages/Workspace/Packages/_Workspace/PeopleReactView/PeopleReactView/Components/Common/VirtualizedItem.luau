local parent = script:FindFirstAncestor("PeopleReactView").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local view = require(parent.Foundation).View

return reactModule.memo(function(p0) --[[ line: 24 | named "VirtualizedItem" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), view (ref)
	local var2, var3 = reactModule.useState(-1)
	local var4 = reactModule.useMemo(function() --[[ line: 27 ]]
		-- upvalues: reactModule (copy), p0 (ref)
		return reactModule.joinBindings({ itemWidth = p0.itemWidth, itemHeight = p0.itemHeight }):map(function(p1) --[[ line: 28 ]]
			return UDim2.fromOffset(p1.itemWidth, p1.itemHeight)
		end)
	end, {})
	local var5 = reactModule.joinBindings({
		numColumns = p0.numColumns,
		itemWidth = p0.itemWidth,
		itemHeight = p0.itemHeight
	})
	local var6 = reactModule.useMemo(function() --[[ line: 41 ]]
		-- upvalues: var5 (ref), var2 (ref), p0 (ref)
		return var5:map(function(p2) --[[ line: 42 ]]
			-- upvalues: var2 (copy), p0 (copy)
			return UDim2.fromOffset((var2 - 1) % p2.numColumns * (p2.itemWidth + p0.gapSize), math.floor((var2 - 1) / p2.numColumns) * (p2.itemHeight + p0.gapSize))
		end)
	end, { var2, p0.gapSize })
	reactModule.useEffect(function() --[[ line: 50 ]]
		-- upvalues: signalsModule (copy), p0 (ref), var3 (ref)
		local var7 = signalsModule.createEffect(function(p3) --[[ line: 53 ]]
			-- upvalues: p0 (copy), var3 (copy)
			local minVirtualizedIndex = p0.getMinVirtualizedIndex(p3)
			local var9 = p0.getMaxVirtualizedIndex(p3) - minVirtualizedIndex + 1
			var3(minVirtualizedIndex + (p0.relativeIndex - ((minVirtualizedIndex - 1) % var9 + 1)) % var9)
		end)
		
		return function() --[[ line: 62 ]]
			-- upvalues: var7 (ref)
			var7()
		end
	end, {
		p0.relativeIndex,
		p0.getMinVirtualizedIndex,
		p0.getMaxVirtualizedIndex
	})
	
	return reactModule.createElement(view, {
		Size = var4,
		Position = var6,
		ZIndex = if var2 == 1 then 2 else 1
	}, { Item = p0.getElement(var2) })
end)