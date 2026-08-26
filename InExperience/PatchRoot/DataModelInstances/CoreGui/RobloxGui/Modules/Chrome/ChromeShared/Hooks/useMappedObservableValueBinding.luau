local reactModule = require(game:GetService("CorePackages").Packages.React)
local _ = require(script:FindFirstAncestor("ChromeShared").Service.ChromeUtils)

return function(p1, p2)
	-- upvalues: reactModule (ref)
	if p1 then
		local var1 = p2 or function(p3)
			return p3
		end
		local var2, var3 = reactModule.useBinding(var1(p1:get()))
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), var3 (ref), var1 (write)
			local var4 = p1:connect(function()
				-- upvalues: var3 (copy), var1 (copy), p1 (copy)
				var3(var1(p1:get()))
			end)
			var3(var1(p1:get()))
			
			return function()
				-- upvalues: var4 (ref)
				var4:disconnect()
			end
		end, { p1 })
		
		return var2
	end
	warn("observableValue undefined")
	
	return reactModule.useBinding(nil)
end