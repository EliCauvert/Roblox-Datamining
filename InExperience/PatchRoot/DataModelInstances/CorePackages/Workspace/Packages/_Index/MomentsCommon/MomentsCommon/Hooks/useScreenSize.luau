local reactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)

return function()
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(function()
		local currentCamera = workspace.CurrentCamera
		
		return if currentCamera then currentCamera.ViewportSize else Vector2.new(1e999, 1e999)
	end)
	local var3, var4 = reactModule.useState(workspace.CurrentCamera)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var4 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera then
			var2(currentCamera.ViewportSize)
		end
		local var5 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
			-- upvalues: var4 (copy)
			var4(workspace.CurrentCamera)
		end)
		
		return function()
			-- upvalues: var5 (ref)
			var5:Disconnect()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var2 (ref)
		if var3 then
			var2(var3.ViewportSize)
			local var5 = var3:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				-- upvalues: var3 (copy), var2 (copy)
				if var3 then
					var2(var3.ViewportSize)
				end
			end)
			
			return function()
				-- upvalues: var5 (ref)
				var5:Disconnect()
			end
		end
	end, { var3 })
	
	return var1
end