local Parent = script:FindFirstAncestor("AvatarExperienceUIKit").Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.ViewRecycler)
local _ = require(script.Parent.RecycledFeedTypes)

return function(p1, p2, p3)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		-- upvalues: p1 (copy)
		return if p1 == nil or p1 <= 0 then nil else p1
	end)
	local UseRefResult = ReactModule.useRef(UseStateResult ~= nil)
	local UseRefResult1 = ReactModule.useRef(true)
	local UseRefResult2 = ReactModule.useRef({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(0)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		return function()
			-- upvalues: UseRefResult1 (upval)
			UseRefResult1.current = false
		end
	end, {})
	local UseResult = ReactModule.useCallback(function(p4)
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy), UseRefResult1 (copy), UseStateResult2_1 (copy)
		if UseRefResult.current and not UseRefResult2.current[p4] then
			UseRefResult2.current[p4] = true
			task.defer(function()
				-- upvalues: UseRefResult1 (upval), UseStateResult2_1 (upval)
				if UseRefResult1.current then
					UseStateResult2_1(function(p5: number): number
						return p5 + 1
					end)
				end
			end)
			
			return
		end
	end, {})
	local UseResult1 = ReactModule.useCallback(function(p4)
		-- upvalues: UseRefResult (copy), UseStateResult2_2 (copy)
		if UseRefResult.current then
			UseStateResult2_2(p4)
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: p3 (copy), UseStateResult (copy), UseStateResult3 (copy), p2 (copy), UseRefResult2 (copy), UseStateResult2_3 (copy), UseStateResult4 (copy), UseRefResult (copy), UseStateResult2 (copy)
		local Current = p3.current
		
		if UseStateResult == nil or Current == nil or UseStateResult3 == nil then return end
		for i = UseStateResult3.firstIndex, UseStateResult3.lastIndex do
			local v1 = p2[i]
			
			if v1 ~= nil and not UseRefResult2.current[v1.key] then return end
		end
		local ScrollState = Current.getScrollState()
		local Smallest = math.min(UseStateResult, ScrollState.scrollOffset + ScrollState.viewportLength)
		
		if ScrollState.scrollOffset < Smallest and ScrollState.scrollOffset < Current.scrollToOffset(Smallest) then
			UseStateResult2_3(UseStateResult4 + 1)
			
			return
		else
			Current.scrollToOffset(UseStateResult)
			UseRefResult.current = false
			UseStateResult2(nil)
		end
	end, {
		UseStateResult,
		UseStateResult3,
		UseStateResult1,
		UseStateResult4,
		p2
	})
	
	return {
		isRestoring = UseStateResult ~= nil,
		onRowMeasured = UseResult,
		onVisibleRangeChanged = UseResult1
	}
end