local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(0)
	reactModule.useEffect(function()
		-- upvalues: p2 (ref), p1 (ref), var1 (ref), p3 (ref)
		if p2 <= 0 or not p1 then
			return nil
		end
		local processTime = os.clock()
		local delayedThread = task.delay(math.max(0, p2 - var1.current), p3)
		
		return function()
			-- upvalues: var1 (copy), processTime (ref), delayedThread (ref)
			var1.current += os.clock() - processTime
			pcall(task.cancel, delayedThread)
		end
	end, { p1, p2, p3 })
end