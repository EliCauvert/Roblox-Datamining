local ReactModule = require(script:FindFirstAncestor("Foundation").Parent.React)

return function(p1, Callback)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1 or false)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy)
		if p1 ~= nil then
			UseStateResult2(p1)
		end
	end, { p1 })
	
	return UseStateResult, (ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), UseStateResult2 (copy), Callback (copy)
		if p1 == nil then
			UseStateResult2(p2)
		end
		Callback(p2)
	end, { p1, Callback }))
end