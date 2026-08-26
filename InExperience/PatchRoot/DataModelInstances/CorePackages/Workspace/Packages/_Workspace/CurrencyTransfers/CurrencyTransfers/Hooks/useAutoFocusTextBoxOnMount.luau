local reactModule = require(script:FindFirstAncestor("CurrencyTransfers").Parent.React)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(false)
	
	return reactModule.useCallback(function(p3)
		-- upvalues: p1 (ref), var1 (ref), p2 (ref)
		if p1 then
			p1(p3)
		end
		if p3 and not var1.current then
			var1.current = true
			task.spawn(function()
				-- upvalues: p2 (copy), p3 (ref)
				task.wait(p2 or 0.05)
				
				if p3 and p3.Parent then
					p3:CaptureFocus()
				end
			end)
		end
	end, { p1, p2 })
end