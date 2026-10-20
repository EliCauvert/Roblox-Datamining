local ReactModule = require(game:GetService("CorePackages").Packages.React)

return function(p1)
	-- upvalues: ReactModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1:getIsLarge())
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), UseStateResult (copy)
		local Connection = p1:connect(function()
			-- upvalues: UseStateResult2 (upval), p1 (upval)
			UseStateResult2(p1:getIsLarge())
		end)
		
		if UseStateResult ~= p1:getIsLarge() then
			UseStateResult2(p1:getIsLarge())
		end
		return function()
			-- upvalues: Connection (copy)
			Connection:disconnect()
		end
	end, { p1 })
	
	return UseStateResult
end