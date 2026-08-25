local reactModule = require(game:GetService("CorePackages").Packages.React)
local _ = require(script:FindFirstAncestor("ChromeShared").Service.ChromeUtils)

return function(p0, p1)
	-- upvalues: reactModule (ref)
	if p0 then
		local var1, var2 = reactModule.useState(p1(p0:get()))
		reactModule.useEffect(function()
			-- upvalues: p0 (ref), var2 (ref), p1 (ref), var1 (ref)
			local var3 = p0:connect(function()
				-- upvalues: var2 (copy), p1 (copy), p0 (copy)
				var2(p1(p0:get()))
			end)
			local var4 = p1(p0:get())
			
			if var1 ~= var4 then
				var2(var4)
			end
			return function()
				-- upvalues: var3 (ref)
				var3:disconnect()
			end
		end, { p0 })
		
		return var1
	end
	warn("observableValue undefined")
	
	return nil
end