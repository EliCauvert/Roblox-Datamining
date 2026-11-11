local ReactModule = require(script.Parent.Parent.Parent.React)

return function()
	-- upvalues: ReactModule (copy)
	local CurrentCamera = workspace.CurrentCamera
	local UseStateResult, UseStateResult2 = ReactModule.useState(if CurrentCamera then CurrentCamera.ViewportSize else Vector2.new(1280, 720))
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		local CurrentCamera = workspace.CurrentCamera
		
		if CurrentCamera then
			UseStateResult2(CurrentCamera.ViewportSize)
			local Connection = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				-- upvalues: UseStateResult2 (upval), CurrentCamera (copy)
				UseStateResult2(CurrentCamera.ViewportSize)
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		else
			return function() end
		end
	end, {})
	
	return UseStateResult
end