local dependenciesModule = require(script:FindFirstAncestor("SocialLibraries").dependencies)
local react = dependenciesModule.React
local getTextBoundsAsync = dependenciesModule.Foundation.Utility.getTextBoundsAsync

return function(p1, p2, p3, p4)
	-- upvalues: react (ref), getTextBoundsAsync (ref)
	local var1, var2 = react.useState(nil)
	react.useEffect(function()
		-- upvalues: getTextBoundsAsync (copy), p1 (ref), p2 (ref), p3 (ref), p4 (ref), var2 (ref)
		local var3 = false
		task.spawn(function()
			-- upvalues: getTextBoundsAsync (copy), p1 (copy), p2 (copy), p3 (copy), p4 (copy), var3 (write), var2 (copy)
			local var4 = getTextBoundsAsync(p1, p2, p3, p4)
			
			if var4 and not var3 then
				var2(var4)
			end
		end)
		
		return function()
			-- upvalues: var3 (write)
			var3 = true
		end
	end, { p1, p2, p3, p4 })
	
	return var1
end