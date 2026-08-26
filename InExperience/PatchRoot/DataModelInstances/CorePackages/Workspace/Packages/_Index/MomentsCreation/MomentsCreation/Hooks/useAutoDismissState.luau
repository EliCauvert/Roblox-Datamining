local reactModule = require(script:FindFirstAncestor("MomentsCreation").Parent.React)
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useRef = reactModule.useRef
local useState = reactModule.useState

return function(p1, p2)
	-- upvalues: useRef (ref), useState (ref), useCallback (ref), useEffect (ref)
	local var1 = useRef(nil)
	local var2, var3 = useState(p1 or true)
	local var4 = useCallback(function()
		-- upvalues: var1 (ref), var3 (ref), p2 (ref)
		if var1.current then
			task.cancel(var1.current)
		end
		var3(true)
		var1.current = task.delay(p2 or 5, function()
			-- upvalues: var3 (copy)
			var3(false)
		end)
	end, { p2, var2 })
	useEffect(function()
		-- upvalues: var4 (ref), var1 (ref)
		var4()
		
		return function()
			-- upvalues: var1 (copy)
			if var1.current then
				task.cancel(var1.current)
				var1.current = nil
			end
		end
	end, { p2 })
	
	return var2, var4
end