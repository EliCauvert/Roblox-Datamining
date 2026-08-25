local reactModule = require(script.Parent.Parent.Parent.React)

return function()
	-- upvalues: reactModule (ref)
	local currentCamera = workspace.CurrentCamera
	local var1, var2 = reactModule.useState(if currentCamera then currentCamera.ViewportSize else Vector2.new(1280, 720))
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera then
			var2(currentCamera.ViewportSize)
			local var3 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				-- upvalues: var2 (copy), currentCamera (ref)
				var2(currentCamera.ViewportSize)
			end)
			
			return function()
				-- upvalues: var3 (ref)
				var3:Disconnect()
			end
		end
		return function() end
	end, {})
	
	return var1
end