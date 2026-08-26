local reactModule = require(script:FindFirstAncestor("SocialCarousel").Parent.React)

return function(p1, p2, p3, p4)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(not p1)
	local var2, var3 = reactModule.useState(not var1.current)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var1 (ref), p1 (ref), p2 (ref), p3 (ref), var3 (ref)
		if var2 or not var1.current then return end
		if p1 and p2.X > 1 and (p2.Y > 1 and p3 > 1) and p2.X >= p3 then
			local delayedThread = task.delay(0.5, function()
				-- upvalues: var3 (copy)
				var3(true)
			end)
			
			return function()
				-- upvalues: delayedThread (ref)
				pcall(task.cancel, delayedThread)
			end
		end
	end, {
		var2, p1, p2.X, p2.Y, p3, p4
	})
	
	return var2
end