local parent = script:FindFirstAncestor("Impressions").Parent
local reactModule = require(parent.React)
local useViewportBounds = require(parent.ViewportUtils).useViewportBounds

return function(p1)
	-- upvalues: useViewportBounds (ref), reactModule (ref)
	local var1 = useViewportBounds()
	local threshold = p1.threshold or 0.5
	local var2 = reactModule.useRef(false)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useCallback(function()
		-- upvalues: var2 (ref), p1 (ref), var1 (ref), threshold (ref)
		if var2.current then return end
		local current = p1.targetRef.current
		
		if not current or not current.Visible or (current.AbsoluteSize.X == 0 or current.AbsoluteSize.Y == 0) then return end
		local x = current.AbsolutePosition.X
		
		if math.max(0, math.min(x + current.AbsoluteSize.X, var1.max.X) - math.max(x, var1.min.X)) <= 0 then return end
		local y = current.AbsolutePosition.Y
		
		if threshold <= math.max(0, math.min(y + current.AbsoluteSize.Y, var1.max.Y) - math.max(y, var1.min.Y)) / current.AbsoluteSize.Y then
			var2.current = true
			p1.onImpression()
		end
	end, { p1.targetRef, p1.onImpression, threshold, var1 })
	local var5 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var4 (ref)
		if var3.current then
			task.cancel(var3.current)
		end
		var3.current = task.delay(0.2, function()
			-- upvalues: var3 (copy), var4 (copy)
			var3.current = nil
			var4()
		end)
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var5 (ref), var3 (ref)
		local current = p1.targetRef.current
		
		if current then
			var5()
			local var6 = current:GetPropertyChangedSignal("AbsolutePosition"):Connect(var5)
			local var7 = current:GetPropertyChangedSignal("AbsoluteSize"):Connect(var5)
			local var8 = current:GetPropertyChangedSignal("Visible"):Connect(var5)
			
			return function()
				-- upvalues: var3 (copy), var6 (ref), var7 (ref), var8 (ref)
				if var3.current then
					task.cancel(var3.current)
					var3.current = nil
				end
				var6:Disconnect()
				var7:Disconnect()
				var8:Disconnect()
			end
		end
		return nil
	end, { p1.targetRef, var5 })
	
	return nil
end