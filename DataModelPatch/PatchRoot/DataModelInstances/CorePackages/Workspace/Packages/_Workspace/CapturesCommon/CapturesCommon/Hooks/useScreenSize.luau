local ReactModule = require(script.Parent.Parent.Parent.React)

return function()
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(workspace.CurrentCamera)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2_1 (copy), UseStateResult1 (copy), UseStateResult2 (copy)
		local Connection = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function()
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(workspace.CurrentCamera)
		end)
		
		if UseStateResult1 then
			UseStateResult2(UseStateResult1.ViewportSize)
		end
		return function()
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult1 (copy), UseStateResult2 (copy)
		if not UseStateResult1 then return end
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