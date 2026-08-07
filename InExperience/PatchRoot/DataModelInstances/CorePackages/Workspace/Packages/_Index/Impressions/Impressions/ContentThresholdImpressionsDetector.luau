local parent = script:FindFirstAncestor("Impressions").Parent
local reactModule = require(parent.React)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds

return function(p0) --[[ line: 24 | named "ContentThresholdImpressionsDetector" ]]
	-- upvalues: useViewportBounds (ref), reactModule (ref)
	local var1 = useViewportBounds()
	local var2 = reactModule.useRef({})
	local var3 = reactModule.useRef(0)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(p0.impressionsTag)
	local var6 = reactModule.useCallback(function() --[[ line: 32 ]]
		-- upvalues: p0 (ref), var1 (ref), var3 (ref), var2 (ref)
		local current = p0.containerRef.current
		
		if not current then return end
		local floored = math.floor(p0.fullContentHeight)
		
		if floored <= 0 then return end
		if current.AbsoluteSize.Y == 0 then return end
		local y = current.AbsolutePosition.Y
		local var9 = y + current.AbsoluteSize.Y
		local y_1 = (if p0.viewportBoundsOffset then {
			min = var1.min + p0.viewportBoundsOffset.min,
			max = var1.max + p0.viewportBoundsOffset.max
		} else var1).max.Y
		
		if y_1 <= 0 then return end
		var3.current = math.max(var3.current, math.clamp(math.min(var9, y_1) - y, 0, floored) / floored)
		local t = {}
		
		for i, v in p0.thresholds do
			if not var2.current[i] and v <= var3.current then
				var2.current[i] = true
				table.insert(t, p0.thresholds[i])
			end
		end
		if #t > 0 then
			p0.sendImpressions(t)
		end
	end, {
		p0.containerRef, p0.fullContentHeight, p0.thresholds, p0.viewportBoundsOffset,
		p0.sendImpressions, var1
	})
	local var7 = reactModule.useCallback(function() --[[ line: 89 ]]
		-- upvalues: var4 (ref), var6 (ref)
		if var4.current then
			task.cancel(var4.current)
		end
		var4.current = task.delay(0.2, function() --[[ line: 93 ]]
			-- upvalues: var4 (copy), var6 (copy)
			var4.current = nil
			var6()
		end)
	end, { var6 })
	reactModule.useEffect(function() --[[ line: 99 ]]
		-- upvalues: var5 (ref), p0 (ref), var2 (ref), var3 (ref), var7 (ref)
		if var5.current ~= p0.impressionsTag then
			var5.current = p0.impressionsTag
			var2.current = {}
			var3.current = 0
			var7()
		end
	end, { p0.impressionsTag, var7 })
	reactModule.useEffect(function() --[[ line: 108 ]]
		-- upvalues: p0 (ref), var7 (ref), var4 (ref)
		local current = p0.containerRef.current
		
		if current then
			var7()
			local var11 = current:GetPropertyChangedSignal("AbsolutePosition"):Connect(var7)
			local var12 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(var7)
			
			return function() --[[ line: 118 ]]
				-- upvalues: var4 (copy), var11 (ref), var12 (ref)
				if var4.current then
					task.cancel(var4.current)
					var4.current = nil
				end
				var11:Disconnect()
				var12:Disconnect()
			end
		end
		return nil
	end, { p0.containerRef, var7 })
	
	return nil
end