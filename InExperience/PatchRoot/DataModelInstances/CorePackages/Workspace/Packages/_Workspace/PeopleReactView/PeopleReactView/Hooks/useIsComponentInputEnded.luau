local reactModule = require(script:FindFirstAncestor("PeopleReactView").Parent.React)

return function(p0) --[[ line: 10 ]]
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(false)
	reactModule.useEffect(function() --[[ line: 13 ]]
		-- upvalues: p0 (ref), var2 (ref)
		local inputBeganConnection = nil
		local inputEndedConnection = nil
		
		if p0.current then
			inputBeganConnection = p0.current.InputBegan:Connect(function() --[[ line: 18 ]]
				-- upvalues: var2 (copy)
				var2(false)
			end)
			inputEndedConnection = p0.current.InputEnded:Connect(function() --[[ line: 21 ]]
				-- upvalues: var2 (copy)
				var2(true)
			end)
		end
		return function() --[[ line: 26 ]]
			-- upvalues: inputBeganConnection (write), inputEndedConnection (write)
			if inputBeganConnection then
				inputBeganConnection:Disconnect()
			end
			if inputEndedConnection then
				inputEndedConnection:Disconnect()
			end
		end
	end, {})
	
	return var1
end