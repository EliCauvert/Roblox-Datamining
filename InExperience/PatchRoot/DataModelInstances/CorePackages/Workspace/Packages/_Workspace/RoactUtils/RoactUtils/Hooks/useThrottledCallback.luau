local parent = script:FindFirstAncestor("RoactUtils").Parent
local reactModule = require(parent.React)
local promiseModule = require(parent.Promise)

return function(value, p1)
	-- upvalues: reactModule (ref), promiseModule (ref)
	local var1 = reactModule.useRef(value)
	local var2 = reactModule.useRef(p1)
	var1.current = value
	var2.current = p1
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(0)
	local var5 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var2 (ref), var4 (ref), var1 (ref), promiseModule (copy)
		if var3.current then return end
		local var6 = var4.current + (var2.current or 0) - tick()
		
		local function runCallback()
			-- upvalues: var1 (copy), var4 (copy), var3 (copy)
			var1.current()
			var4.current = tick()
			var3.current = nil
		end
		
		if var6 > 0 then
			var3.current = promiseModule.delay(var6):andThen(runCallback)
			
			return
		end
		var1.current()
		var4.current = tick()
		var3.current = nil
	end)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var1 (ref)
		return function()
			-- upvalues: var3 (copy), var1 (copy)
			local current = var3.current
			
			if current then
				current:cancel()
				var1.current()
			end
		end
	end, {})
	
	return var5
end