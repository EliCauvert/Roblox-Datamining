local ReactModule = require(script:FindFirstAncestor("PeopleReactView").Parent.React)

return function(p1) --[[ Line: 10 ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function() --[[ Line: 13 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		local Connection = nil
		local Connection1 = nil
		
		if p1.current then
			Connection = p1.current.InputBegan:Connect(function() --[[ Line: 18 ]]
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end)
			Connection1 = p1.current.InputEnded:Connect(function() --[[ Line: 21 ]]
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(true)
			end)
		end
		return function() --[[ Line: 26 ]]
			-- upvalues: Connection (ref), Connection1 (ref)
			if Connection then
				Connection:Disconnect()
			end
			if Connection1 then
				Connection1:Disconnect()
			end
		end
	end, {})
	
	return UseStateResult
end