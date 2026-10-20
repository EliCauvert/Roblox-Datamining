local ReactModule = require(script:FindFirstAncestor("TiltLoadingScreen").Parent.Parent.React)

return function()
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		local CurrentCamera = workspace.CurrentCamera
		
		return if CurrentCamera then CurrentCamera.ViewportSize else Vector2.new(0, 0)
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(workspace.CurrentCamera)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy)
		local Connection = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(workspace.CurrentCamera)
		end)
		UseStateResult2_1(workspace.CurrentCamera)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), UseStateResult2 (copy)
		if not UseStateResult1 then return end
		UseStateResult2(UseStateResult1.ViewportSize)
		local Connection = UseStateResult1:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: UseStateResult2 (upval), UseStateResult1 (upval)
			UseStateResult2(UseStateResult1.ViewportSize)
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseStateResult1 })
	
	return UseStateResult
end