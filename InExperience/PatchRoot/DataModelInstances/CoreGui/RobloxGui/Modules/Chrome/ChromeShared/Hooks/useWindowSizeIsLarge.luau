local reactModule = require(game:GetService("CorePackages").Packages.React)

return function(p0)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(p0:getIsLarge())
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var2 (ref), var1 (ref)
		local var3 = p0:connect(function()
			-- upvalues: var2 (copy), p0 (copy)
			var2(p0:getIsLarge())
		end)
		
		if var1 ~= p0:getIsLarge() then
			var2(p0:getIsLarge())
		end
		return function()
			-- upvalues: var3 (ref)
			var3:disconnect()
		end
	end, { p0 })
	
	return var1
end