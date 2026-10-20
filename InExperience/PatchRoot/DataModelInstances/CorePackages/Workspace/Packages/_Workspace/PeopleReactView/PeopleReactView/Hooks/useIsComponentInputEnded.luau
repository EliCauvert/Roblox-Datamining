local ReactModule = require(script:FindFirstAncestor("PeopleReactView").Parent.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		local Connection = nil
		local Connection1 = nil
		
		if p1.current then
			Connection = p1.current.InputBegan:Connect(function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(false)
			end)
			Connection1 = p1.current.InputEnded:Connect(function()
				-- upvalues: UseStateResult2 (upval)
				UseStateResult2(true)
			end)
		end
		return function()
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