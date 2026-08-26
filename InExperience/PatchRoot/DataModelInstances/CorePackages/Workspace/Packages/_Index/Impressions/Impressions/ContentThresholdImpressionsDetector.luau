local parent = script:FindFirstAncestor("Impressions").Parent
local reactModule = require(parent.React)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds

return function(p1)
	-- upvalues: useViewportBounds (ref), reactModule (ref)
	local var1 = useViewportBounds()
	local var2 = reactModule.useRef({})
	local var3 = reactModule.useRef(0)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(p1.impressionsTag)
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var1 (ref), var3 (ref), var2 (ref)
		local current = p1.containerRef.current
		
		if not current then return end
		local floored = math.floor(p1.fullContentHeight)
		
		if floored <= 0 then return end
		if current.AbsoluteSize.Y == 0 then return end
		local y = current.AbsolutePosition.Y
		local var7 = y + current.AbsoluteSize.Y
		local y_1 = (if p1.viewportBoundsOffset then {
			min = var1.min + p1.viewportBoundsOffset.min,
			max = var1.max + p1.viewportBoundsOffset.max
		} else var1).max.Y
		
		if y_1 <= 0 then return end
		var3.current = math.max(var3.current, math.clamp(math.min(var7, y_1) - y, 0, floored) / floored)
		local t = {}
		
		for i, v in p1.thresholds do
			if not var2.current[i] and v <= var3.current then
				var2.current[i] = true
				table.insert(t, p1.thresholds[i])
			end
		end
		if #t > 0 then
			p1.sendImpressions(t)
		end
	end, {
		p1.containerRef, p1.fullContentHeight, p1.thresholds, p1.viewportBoundsOffset,
		p1.sendImpressions, var1
	})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var4 (ref), var6 (ref)
		if var4.current then
			task.cancel(var4.current)
		end
		var4.current = task.delay(0.2, function()
			-- upvalues: var4 (copy), var6 (copy)
			var4.current = nil
			var6()
		end)
	end, { var6 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), p1 (ref), var2 (ref), var3 (ref), var8 (ref)
		if var5.current ~= p1.impressionsTag then
			var5.current = p1.impressionsTag
			var2.current = {}
			var3.current = 0
			var8()
		end
	end, { p1.impressionsTag, var8 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var8 (ref), var4 (ref)
		local current = p1.containerRef.current
		
		if current then
			var8()
			local var9 = current:GetPropertyChangedSignal("AbsolutePosition"):Connect(var8)
			local var10 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(var8)
			
			return function()
				-- upvalues: var4 (copy), var9 (ref), var10 (ref)
				if var4.current then
					task.cancel(var4.current)
					var4.current = nil
				end
				var9:Disconnect()
				var10:Disconnect()
			end
		end
		return nil
	end, { p1.containerRef, var8 })
	
	return nil
end