local reactModule = require(game:GetService("CorePackages").Packages.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(p1:getIsLarge())
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var1 (ref)
		local var3 = p1:connect(function()
			-- upvalues: var2 (copy), p1 (copy)
			var2(p1:getIsLarge())
		end)
		
		if var1 ~= p1:getIsLarge() then
			var2(p1:getIsLarge())
		end
		return function()
			-- upvalues: var3 (ref)
			var3:disconnect()
		end
	end, { p1 })
	
	return var1
end