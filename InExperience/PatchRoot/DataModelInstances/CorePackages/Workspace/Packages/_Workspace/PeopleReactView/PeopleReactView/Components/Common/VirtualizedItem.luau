local Parent = script:FindFirstAncestor("PeopleReactView").Parent
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local View = require(Parent.Foundation).View

return ReactModule.memo(function(p1) --[[ Line: 24 | Named "VirtualizedItem" ]]
	-- upvalues: ReactModule (copy), SignalsModule (copy), View (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(-1)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 27 ]]
		-- upvalues: ReactModule (upval), p1 (copy)
		return ReactModule.joinBindings({ itemWidth = p1.itemWidth, itemHeight = p1.itemHeight }):map(function(p2): UDim2 --[[ Line: 28 ]]
			return UDim2.fromOffset(p2.itemWidth, p2.itemHeight)
		end)
	end, {})
	local JoinBindingsResult = ReactModule.joinBindings({
		numColumns = p1.numColumns,
		itemWidth = p1.itemWidth,
		itemHeight = p1.itemHeight
	})
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 41 ]]
		-- upvalues: JoinBindingsResult (copy), UseStateResult (copy), p1 (copy)
		return JoinBindingsResult:map(function(p2): UDim2 --[[ Line: 42 ]]
			-- upvalues: UseStateResult (upval), p1 (upval)
			return UDim2.fromOffset((UseStateResult - 1) % p2.numColumns * (p2.itemWidth + p1.gapSize), math.floor((UseStateResult - 1) / p2.numColumns) * (p2.itemHeight + p1.gapSize))
		end)
	end, { UseStateResult, p1.gapSize })
	ReactModule.useEffect(function() --[[ Line: 50 ]]
		-- upvalues: SignalsModule (upval), p1 (copy), UseStateResult2 (copy)
		local Effect = SignalsModule.createEffect(function(p2) --[[ Line: 53 ]]
			-- upvalues: p1 (upval), UseStateResult2 (upval)
			local MinVirtualizedIndex: number = p1.getMinVirtualizedIndex(p2)
			local NewMaxVirtualizedIndex = p1.getMaxVirtualizedIndex(p2) - MinVirtualizedIndex + 1
			UseStateResult2(MinVirtualizedIndex + (p1.relativeIndex - ((MinVirtualizedIndex - 1) % NewMaxVirtualizedIndex + 1)) % NewMaxVirtualizedIndex)
		end)
		
		return function() --[[ Line: 62 ]]
			-- upvalues: Effect (copy)
			Effect()
		end
	end, {
		p1.relativeIndex,
		p1.getMinVirtualizedIndex,
		p1.getMaxVirtualizedIndex
	})
	
	return ReactModule.createElement(View, {
		Size = UseMemoResult,
		Position = UseMemoResult1,
		ZIndex = if UseStateResult == 1 then 2 else 1
	}, { Item = p1.getElement(UseStateResult) })
end)