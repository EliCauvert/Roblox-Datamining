local reactModule = require(script.Parent.Parent.Parent.React)

return function() --[[ line: 6 ]]
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(Vector2.new(0, 0))
	local var3, var4 = reactModule.useState(workspace.CurrentCamera)
	reactModule.useEffect(function() --[[ line: 10 ]]
		-- upvalues: var4 (ref), var3 (ref), var2 (ref)
		local var5 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ line: 11 ]]
			-- upvalues: var4 (copy)
			var4(workspace.CurrentCamera)
		end)
		
		if var3 then
			var2(var3.ViewportSize)
		end
		return function() --[[ line: 19 ]]
			-- upvalues: var5 (ref)
			var5:Disconnect()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 24 ]]
		-- upvalues: var3 (ref), var2 (ref)
		if var3 then
			local var6 = var3:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ line: 29 ]]
				-- upvalues: var3 (copy), var2 (copy)
				if var3 then
					var2(var3.ViewportSize)
				end
			end)
			
			return function() --[[ line: 35 ]]
				-- upvalues: var6 (ref)
				var6:Disconnect()
			end
		end
	end, { var3 })
	
	return var1
end