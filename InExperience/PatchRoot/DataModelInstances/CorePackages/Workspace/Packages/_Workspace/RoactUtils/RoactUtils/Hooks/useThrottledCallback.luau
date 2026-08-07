local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)

return function(value, p0) --[[ line: 20 | named "useThrottledCallback" ]]
	-- upvalues: reactModule (ref), promiseModule (ref)
	local var2 = reactModule.useRef(value)
	local var3 = reactModule.useRef(p0)
	var2.current = value
	var3.current = p0
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(0)
	local var6 = reactModule.useCallback(function() --[[ line: 30 ]]
		-- upvalues: var4 (ref), var3 (ref), var5 (ref), var2 (ref), promiseModule (copy)
		if var4.current then return end
		local var7 = var5.current + (var3.current or 0) - tick()
		
		local function runCallback() --[[ line: 39 ]]
			-- upvalues: var2 (copy), var5 (copy), var4 (copy)
			var2.current()
			var5.current = tick()
			var4.current = nil
		end
		
		if var7 > 0 then
			var4.current = promiseModule.delay(var7):andThen(runCallback)
			
			return
		end
		var2.current()
		var5.current = tick()
		var4.current = nil
	end)
	reactModule.useEffect(function() --[[ line: 53 ]]
		-- upvalues: var4 (ref), var2 (ref)
		return function() --[[ line: 54 ]]
			-- upvalues: var4 (copy), var2 (copy)
			local current = var4.current
			
			if current then
				current:cancel()
				var2.current()
			end
		end
	end, {})
	
	return var6
end