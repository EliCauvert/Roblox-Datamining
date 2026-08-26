local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(0)
	
	local function handleAction()
		-- upvalues: p2 (ref), var2 (ref), var1 (ref), p1 (ref), p3 (ref)
		local processTime = os.clock()
		
		if p2 ~= nil and var2.current ~= nil and processTime - var2.current < p2 then return end
		var2.current = processTime
		local current = var1.current
		
		if current ~= nil then
			task.cancel(current)
		end
		var1.current = task.delay(p1, function()
			-- upvalues: p3 (copy)
			p3()
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