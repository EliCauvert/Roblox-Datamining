local reactModule = require(game:GetService("CorePackages").Packages.React)

return function()
	-- upvalues: reactModule (ref)
	local var1 = nil
	local var2 = nil
	local var3, var4 = reactModule.useState(Vector2.new(0, 0))
	
	local var5 = function()
		-- upvalues: var4 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera then
			var4(Vector2.new(currentCamera.ViewportSize.X, currentCamera.ViewportSize.Y))
		end
	end
	
	local var6 = function()
		-- upvalues: var2 (write), var5 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if var2 then
			pcall(function()
				-- upvalues: var2 (copy)
				var2:Disconnect()
			end)
			var2 = nil
		end
		if currentCamera then
			var2 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(var5)
		end
	end
	
	reactModule.useEffect(function()
		-- upvalues: var1 (write), var6 (ref), var4 (ref), var2 (write)
		var1 = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(var6)
		var6()
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera then
			var4(Vector2.new(currentCamera.ViewportSize.X, currentCamera.ViewportSize.Y))
		end
		return function()
			-- upvalues: var1 (copy), var2 (copy)
			if var1 then
				var1:Disconnect()
			end
			if var2 then
				var2:Disconnect()
			end
		end
	end, {})
	
	return var3
end