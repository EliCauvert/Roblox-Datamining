local reactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)

return function() --[[ line: 21 ]]
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(function() --[[ line: 22 ]]
		local currentCamera = workspace.CurrentCamera
		
		return if currentCamera then currentCamera.ViewportSize else Vector2.new(1e999, 1e999)
	end)
	local var3, var4 = reactModule.useState(workspace.CurrentCamera)
	reactModule.useEffect(function() --[[ line: 28 ]]
		-- upvalues: var2 (ref), var4 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera then
			var2(currentCamera.ViewportSize)
		end
		local var5 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ line: 34 ]]
			-- upvalues: var4 (copy)
			var4(workspace.CurrentCamera)
		end)
		
		return function() --[[ line: 38 ]]
			-- upvalues: var5 (ref)
			var5:Disconnect()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 43 ]]
		-- upvalues: var3 (ref), var2 (ref)
		if var3 then
			var2(var3.ViewportSize)
			local var6 = var3:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ line: 54 ]]
				-- upvalues: var3 (copy), var2 (copy)
				if var3 then
					var2(var3.ViewportSize)
				end
			end)
			
			return function() --[[ line: 60 ]]
				-- upvalues: var6 (ref)
				var6:Disconnect()
			end
		end
	end, { var3 })
	
	return var1
end