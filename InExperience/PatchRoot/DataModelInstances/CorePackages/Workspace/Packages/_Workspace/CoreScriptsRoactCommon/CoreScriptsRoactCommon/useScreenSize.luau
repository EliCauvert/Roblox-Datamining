local reactModule = require(script.Parent.Parent.React)

return function()
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(Vector2.new(0, 0))
	local var3, var4 = reactModule.useState(workspace.CurrentCamera)
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		local var5 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
			-- upvalues: var4 (copy)
			var4(workspace.CurrentCamera)
		end)
		var4(workspace.CurrentCamera)
		
		return function()
			-- upvalues: var5 (ref)
			var5:Disconnect()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var2 (ref)
		if var3 then
			var2(var3.ViewportSize)
			local var6 = var3:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				-- upvalues: var2 (copy), var3 (copy)
				var2(var3.ViewportSize)
			end)
			
			return function()
				-- upvalues: var6 (ref)
				var6:Disconnect()
			end
		end
	end, { var3 })
	
	return var1
end