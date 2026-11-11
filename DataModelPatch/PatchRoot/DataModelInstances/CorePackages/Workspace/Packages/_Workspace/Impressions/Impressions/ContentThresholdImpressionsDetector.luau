local Parent = script:FindFirstAncestor("Impressions").Parent
local ReactModule = require(Parent.React)
local UseViewportBoundsFunction = require(Parent.ViewportUtils).useViewportBounds

return function(p1)
	-- upvalues: UseViewportBoundsFunction (copy), ReactModule (copy)
	local UseViewportBoundsResult = UseViewportBoundsFunction()
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(nil)
	local UseRefResult3 = ReactModule.useRef(p1.impressionsTag)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseViewportBoundsResult (copy), UseRefResult1 (copy), UseRefResult (copy)
		local Current = p1.containerRef.current
		
		if not Current then return end
		local Floored = math.floor(p1.fullContentHeight)
		
		if Floored <= 0 then return end
		if Current.AbsoluteSize.Y == 0 then return end
		local Y = Current.AbsolutePosition.Y
		local NewY = Y + Current.AbsoluteSize.Y
		local Y1: number = (if p1.viewportBoundsOffset then {
			min = UseViewportBoundsResult.min + p1.viewportBoundsOffset.min,
			max = UseViewportBoundsResult.max + p1.viewportBoundsOffset.max
		} else UseViewportBoundsResult).max.Y
		
		if Y1 <= 0 then return end
		UseRefResult1.current = math.max(UseRefResult1.current, math.clamp(math.min(NewY, Y1) - Y, 0, Floored) / Floored)
		local List = {}
		
		for i, threshold in p1.thresholds do
			if not UseRefResult.current[i] and threshold <= UseRefResult1.current then
				UseRefResult.current[i] = true
				table.insert(List, p1.thresholds[i])
			end
		end
		if #List > 0 then
			p1.sendImpressions(List)
		end
	end, {
		p1.containerRef, p1.fullContentHeight, p1.thresholds, p1.viewportBoundsOffset,
		p1.sendImpressions, UseViewportBoundsResult
	})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult2 (copy), UseResult (copy)
		if UseRefResult2.current then
			task.cancel(UseRefResult2.current)
		end
		UseRefResult2.current = task.delay(0.2, function()
			-- upvalues: UseRefResult2 (upval), UseResult (upval)
			UseRefResult2.current = nil
			UseResult()
		end)
	end, { UseResult })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy), p1 (copy), UseRefResult (copy), UseRefResult1 (copy), UseResult1 (copy)
		if UseRefResult3.current ~= p1.impressionsTag then
			UseRefResult3.current = p1.impressionsTag
			UseRefResult.current = {}
			UseRefResult1.current = 0
			UseResult1()
		end
	end, { p1.impressionsTag, UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseResult1 (copy), UseRefResult2 (copy)
		local Current = p1.containerRef.current
		
		if Current then
			UseResult1()
			local Connection = Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(UseResult1)
			local Connection1 = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(UseResult1)
			
			return function()
				-- upvalues: UseRefResult2 (upval), Connection (copy), Connection1 (copy)
				if UseRefResult2.current then
					task.cancel(UseRefResult2.current)
					UseRefResult2.current = nil
				end
				Connection:Disconnect()
				Connection1:Disconnect()
			end
		else
			return nil
		end
	end, { p1.containerRef, UseResult1 })
	
	return nil
end