local reactModule = require(script:FindFirstAncestor("PeopleReactView").Parent.React)

return function(p0)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(false)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var2 (ref)
		local inputBeganConnection = nil
		local inputEndedConnection = nil
		
		if p0.current then
			inputBeganConnection = p0.current.InputBegan:Connect(function()
				-- upvalues: var2 (copy)
				var2(false)
			end)
			inputEndedConnection = p0.current.InputEnded:Connect(function()
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