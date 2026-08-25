local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0, p1, p2)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(0)
	
	local function handleAction()
		-- upvalues: p1 (ref), var2 (ref), var1 (ref), p0 (ref), p2 (ref)
		local processTime = os.clock()
		
		if p1 ~= nil and var2.current ~= nil and processTime - var2.current < p1 then return end
		var2.current = processTime
		local current = var1.current
		
		if current ~= nil then
			task.cancel(current)
		end
		var1.current = task.delay(p0, function()
			-- upvalues: p2 (copy)
			p2()
		end)
	end
	
	reactModule.useEffect(function()
		-- upvalues: var1 (ref)
		return function()
			-- upvalues: var1 (copy)
			local current = var1.current
			
			if current ~= nil then
				task.cancel(current)
			end
		end
	end, { var1 })
	
	return handleAction
end