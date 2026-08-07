local parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local _ = require(parent.Chrome)
local reactModule = require(parent.React)

return function(p0) --[[ line: 12 | named "useNotificationCount" ]]
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(not p0:isEmpty())
	local var3, var4 = reactModule.useBinding(p0:get().value or 0)
	reactModule.useEffect(function() --[[ line: 16 ]]
		-- upvalues: p0 (ref), var2 (ref), var4 (ref)
		p0:connect(function(p1) --[[ line: 17 ]]
			-- upvalues: p0 (copy), var2 (copy), var4 (copy)
			if p0:isEmpty() then
				var2(false)
				
				return
			end
			var4(math.min(p1.value, 99))
			var2(true)
		end)
	end, { p0 })
	
	return var1, var3
end