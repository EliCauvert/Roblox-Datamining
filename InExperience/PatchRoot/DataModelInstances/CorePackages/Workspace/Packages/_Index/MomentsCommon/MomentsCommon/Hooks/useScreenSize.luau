local ReactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)

return function()
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(function()
		local CurrentCamera = workspace.CurrentCamera
		
		return if CurrentCamera then CurrentCamera.ViewportSize else Vector2.new(1e999, 1e999)
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(workspace.CurrentCamera)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UseStateResult2_1 (copy)
		local CurrentCamera = workspace.CurrentCamera
		
		if CurrentCamera then
			UseStateResult2(CurrentCamera.ViewportSize)
		end
		local Connection = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(workspace.CurrentCamera)
		end)
		
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
			-- upvalues: UseStateResult1 (upval), UseStateResult2 (upval)
			if UseStateResult1 then
				UseStateResult2(UseStateResult1.ViewportSize)
			end
		end)
		
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseStateResult1 })
	
	return UseStateResult
end