local ReactModule = require(game:GetService("CorePackages").Packages.React)

return function(p1) --[[ Line: 4 ]]
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1:getIsLarge())
	ReactModule.useEffect(function() --[[ Line: 7 ]]
		-- upvalues: p1 (copy), UseStateResult2 (copy), UseStateResult (copy)
		local Connection = p1:connect(function() --[[ Line: 8 ]]
			-- upvalues: UseStateResult2 (upval), p1 (upval)
			UseStateResult2(p1:getIsLarge())
		end)
		
		if UseStateResult ~= p1:getIsLarge() then
			UseStateResult2(p1:getIsLarge())
		end
		return function() --[[ Line: 16 ]]
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, { p1 })
	
	return UseStateResult
end