local reactModule = require(game:GetService("CorePackages").Packages.React)
local _ = require(script:FindFirstAncestor("ChromeShared").Service.ChromeUtils)

return function(p1)
	-- upvalues: reactModule (ref)
	if p1 then
		local var1, var2 = reactModule.useState(p1:get())
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var2 (ref), var1 (ref)
			local var3 = p1:connect(function()
				-- upvalues: var2 (copy), p1 (copy)
				var2(p1:get())
			end)
			
			if var1 ~= p1:get() then
				var2(p1:get())
			end
			return function()
				-- upvalues: var3 (ref)
				var3:disconnect()
			end
		end, { p1 })
		
		return var1
	end
	warn("observableValue undefined")
	
	return nil
end