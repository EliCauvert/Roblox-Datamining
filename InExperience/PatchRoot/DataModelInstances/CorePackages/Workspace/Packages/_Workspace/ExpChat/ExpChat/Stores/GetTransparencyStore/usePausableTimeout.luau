local reactModule = require(script:FindFirstAncestor("ExpChat").Parent.React)

return function(p0, p1, p2) --[[ line: 9 | named "usePausableTimeout" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(0)
	reactModule.useEffect(function() --[[ line: 11 ]]
		-- upvalues: p1 (ref), p0 (ref), var1 (ref), p2 (ref)
		if p1 <= 0 or not p0 then
			return nil
		end
		local processTime = os.clock()
		local delayedThread = task.delay(math.max(0, p1 - var1.current), p2)
		
		return function() --[[ line: 18 ]]
			-- upvalues: var1 (copy), processTime (ref), delayedThread (ref)
			var1.current += os.clock() - processTime
			pcall(task.cancel, delayedThread)
		end
	end, { p0, p1, p2 })
end