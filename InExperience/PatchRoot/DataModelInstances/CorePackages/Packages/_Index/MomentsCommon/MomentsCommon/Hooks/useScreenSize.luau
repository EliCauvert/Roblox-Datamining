local ReactModule = require(script:FindFirstAncestor("MomentsCommon").Parent.React)

return function() --[[ Line: 6 ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(1e999, 1e999))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(workspace.CurrentCamera)
	ReactModule.useEffect(function() --[[ Line: 10 ]]
		-- upvalues: UseStateResult2_1 (copy), UseStateResult1 (copy), UseStateResult2 (copy)
		local Connection = workspace:GetPropertyChangedSignal("CurrentCamera"):Connect(function() --[[ Line: 11 ]]
			-- upvalues: UseStateResult2_1 (upval)
			UseStateResult2_1(workspace.CurrentCamera)
		end)
		
		if UseStateResult1 then
			UseStateResult2(UseStateResult1.ViewportSize)
		end
		return function() --[[ Line: 19 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 24 ]]
		-- upvalues: UseStateResult1 (copy), UseStateResult2 (copy)
		if not UseStateResult1 then return end
		local Connection = UseStateResult1:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ Line: 29 ]]
			-- upvalues: UseStateResult1 (upval), UseStateResult2 (upval)
			if UseStateResult1 then
				UseStateResult2(UseStateResult1.ViewportSize)
			end
		end)
		
		return function() --[[ Line: 35 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, { UseStateResult1 })
	
	return UseStateResult
end