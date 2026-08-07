local reactModule = require(script:FindFirstAncestor("ReactUtils").Parent.React)

return function(p0, p1, p2) --[[ line: 7 | named "useEventConnection" ]]
	-- upvalues: reactModule (ref)
	local var1 = reactModule.useMemo(function() --[[ line: 8 ]]
		-- upvalues: p1 (ref)
		return p1
	end, p2)
	reactModule.useEffect(function() --[[ line: 12 ]]
		-- upvalues: p0 (ref), var1 (ref)
		if p0 == nil then
			return nil
		end
		local var2 = p0:Connect(var1)
		
		return function() --[[ line: 19 ]]
			-- upvalues: var2 (ref)
			var2:Disconnect()
		end
	end, { p0, var1 })
end