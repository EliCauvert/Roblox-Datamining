local ReactModule = require(script.Parent.Parent.React)

return function() --[[ Line: 6 ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(workspace.CurrentCamera)
	ReactModule.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: UseStateResult2_1 (copy)
		local Connection = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 11 ]]
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(workspace.CurrentCamera)
		end)
		UseStateResult2_1(workspace.CurrentCamera)
		
		return function() --[[ Line: 17 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 22 ]]
		-- upvalues: UseStateResult1 (copy), UseStateResult2 (copy)
		if not UseStateResult1 then return end
		UseStateResult2(UseStateResult1.ViewportSize)
		local Connection = UseStateResult1:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 28 ]]
			-- upvalues: UseStateResult2 (upval), UseStateResult1 (upval)
			UseStateResult2(UseStateResult1.ViewportSize)
		end)
		
		return function() --[[ Line: 32 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseStateResult1 })
	
	return UseStateResult
end