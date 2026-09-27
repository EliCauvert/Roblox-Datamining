local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(p1)
	var4.current = p1
	local var5 = reactModule.useCallback(function(p2)
		-- upvalues: var4 (ref), var2 (ref), var3 (ref)
		local current = var4.current
		local y = p2.AbsoluteSize.Y
		
		if current ~= nil and y > 0 and (y ~= var2.current or current ~= var3.current) then
			var2.current = y
			var3.current = current
			current(y)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var5 (ref)
		local current = var1.current
		
		if current ~= nil then
			var5(current)
		end
	end)
	
	return { rowRef = var1, onAbsoluteSizeChanged = var5 }
end