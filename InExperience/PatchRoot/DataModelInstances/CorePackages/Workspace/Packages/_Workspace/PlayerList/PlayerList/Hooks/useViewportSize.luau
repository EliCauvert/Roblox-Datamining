local reactModule = require(script.Parent.Parent.Parent.React)

return function() --[[ line: 6 | named "useViewportSize" ]]
	-- upvalues: reactModule (ref)
	local currentCamera = workspace.CurrentCamera
	local var1, var2 = reactModule.useState(if currentCamera then currentCamera.ViewportSize else Vector2.new(1280, 720))
	reactModule.useEffect(function() --[[ line: 11 ]]
		-- upvalues: var2 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera then
			var2(currentCamera.ViewportSize)
			local var3 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ line: 17 ]]
				-- upvalues: var2 (copy), currentCamera (ref)
				var2(currentCamera.ViewportSize)
			end)
			
			return function() --[[ line: 20 ]]
				-- upvalues: var3 (ref)
				var3:Disconnect()
			end
		end
		return function() --[[ line: 14 ]] end
	end, {})
	
	return var1
end