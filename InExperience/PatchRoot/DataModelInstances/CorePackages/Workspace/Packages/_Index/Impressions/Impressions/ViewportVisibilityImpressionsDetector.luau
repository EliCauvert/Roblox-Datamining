local Parent = script:FindFirstAncestor("Impressions").Parent
local ReactModule = require(Parent.React)
local UseViewportBoundsFunction = require(Parent.ViewportUtils).useViewportBounds

return function(p1) --[[ Line: 21 | Named "ViewportVisibilityImpressionsDetector" ]]
	-- upvalues: UseViewportBoundsFunction (copy), ReactModule (copy)
	local UseViewportBoundsResult = UseViewportBoundsFunction()
	local Threshold = p1.threshold or 0.5
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 27 ]]
		-- upvalues: UseRefResult (copy), p1 (copy), UseViewportBoundsResult (copy), Threshold (copy)
		if UseRefResult.current then return end
		local Current = p1.targetRef.current
		
		if not Current or not Current.Visible or Current.AbsoluteSize.X == 0 or Current.AbsoluteSize.Y == 0 then return end
		local X: number = Current.AbsolutePosition.X
		
		if math.max(0, math.min(X + Current.AbsoluteSize.X, UseViewportBoundsResult.max.X) - math.max(X, UseViewportBoundsResult.min.X)) <= 0 then return end
		local Y: number = Current.AbsolutePosition.Y
		
		if Threshold <= math.max(0, math.min(Y + Current.AbsoluteSize.Y, UseViewportBoundsResult.max.Y) - math.max(Y, UseViewportBoundsResult.min.Y)) / Current.AbsoluteSize.Y then
			UseRefResult.current = true
			p1.onImpression()
		end
	end, {
		p1.targetRef,
		p1.onImpression,
		Threshold,
		UseViewportBoundsResult
	})
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 57 ]]
		-- upvalues: UseRefResult1 (copy), UseResult (copy)
		if UseRefResult1.current then
			task.cancel(UseRefResult1.current)
		end
		UseRefResult1.current = task.delay(0.2, function() --[[ Line: 61 ]]
			-- upvalues: UseRefResult1 (upval), UseResult (upval)
			UseRefResult1.current = nil
			UseResult()
		end)
	end, { UseResult })
	ReactModule.useEffect(function() --[[ Line: 68 ]]
		-- upvalues: p1 (copy), UseResult1 (copy), UseRefResult1 (copy)
		local Current = p1.targetRef.current
		
		if Current then
			UseResult1()
			local Connection = Current:GetPropertyChangedSignal("AbsolutePosition"):Connect(UseResult1)
			local Connection1 = Current:GetPropertyChangedSignal("AbsoluteSize"):Connect(UseResult1)
			local Connection2 = Current:GetPropertyChangedSignal("Visible"):Connect(UseResult1)
			
			return function() --[[ Line: 79 ]]
				-- upvalues: UseRefResult1 (upval), Connection (copy), Connection1 (copy), Connection2 (copy)
				if UseRefResult1.current then
					task.cancel(UseRefResult1.current)
					UseRefResult1.current = nil
				end
				Connection:Disconnect()
				Connection1:Disconnect()
				Connection2:Disconnect()
			end
		else
			return nil
		end
	end, { p1.targetRef, UseResult1 })
	
	return nil
end