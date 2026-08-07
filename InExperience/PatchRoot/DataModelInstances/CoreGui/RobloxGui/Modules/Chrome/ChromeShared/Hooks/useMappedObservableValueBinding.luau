local reactModule = require(game:GetService("CorePackages").Packages.React)
local _ = require(script:FindFirstAncestor("ChromeShared").Service.ChromeUtils)

return function(p0, p1) --[[ line: 7 ]]
	-- upvalues: reactModule (ref)
	if p0 then
		local var1 = p1 or function(p2) --[[ line: 17 ]]
			return p2
		end
		local var2, var3 = reactModule.useBinding(var1(p0:get()))
		reactModule.useEffect(function() --[[ line: 24 ]]
			-- upvalues: p0 (ref), var3 (ref), var1 (write)
			local var4 = p0:connect(function() --[[ line: 25 ]]
				-- upvalues: var3 (copy), var1 (copy), p0 (copy)
				var3(var1(p0:get()))
			end)
			var3(var1(p0:get()))
			
			return function() --[[ line: 31 ]]
				-- upvalues: var4 (ref)
				var4:disconnect()
			end
		end, { p0 })
		
		return var2
	end
	warn("observableValue undefined")
	
	return reactModule.useBinding(nil)
end