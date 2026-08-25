local reactModule = require(script:FindFirstAncestor("CurrencyTransfers").Parent.React)

return function(p0, p1)
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useRef(false)
	
	return reactModule.useCallback(function(p2)
		-- upvalues: p0 (ref), var1 (ref), p1 (ref)
		if p0 then
			p0(p2)
		end
		if p2 and not var1.current then
			var1.current = true
			task.spawn(function()
				-- upvalues: p1 (copy), p2 (ref)
				task.wait(p1 or 0.05)
				
				if p2 and p2.Parent then
					p2:CaptureFocus()
				end
			end)
		end
	end, { p0, p1 })
end