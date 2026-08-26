local reactModule = require(script:FindFirstAncestor("PeopleReactView").Parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref)
		local inputBeganConnection = nil
		local inputEndedConnection = nil
		
		if p1.current then
			inputBeganConnection = p1.current.InputBegan:Connect(function()
				-- upvalues: var2 (copy)
				var2(false)
			end)
			inputEndedConnection = p1.current.InputEnded:Connect(function()
				-- upvalues: var2 (copy)
				var2(true)
			end)
		end
		return function()
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