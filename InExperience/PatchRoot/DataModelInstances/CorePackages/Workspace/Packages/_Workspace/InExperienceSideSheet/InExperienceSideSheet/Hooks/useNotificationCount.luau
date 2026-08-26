local parent = script:FindFirstAncestor("InExperienceSideSheet").Parent
local _ = require(parent.Chrome)
local reactModule = require(parent.React)

return function(p1)
	-- upvalues: reactModule (ref)
	local var1, var2 = reactModule.useState(not p1:isEmpty())
	local var3, var4 = reactModule.useBinding(p1:get().value or 0)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var4 (ref)
		p1:connect(function(p2)
			-- upvalues: p1 (copy), var2 (copy), var4 (copy)
			if p1:isEmpty() then
				var2(false)
				
				return
			end
			var4(math.min(p2.value, 99))
			var2(true)
		end)
	end, { p1 })
	
	return var1, var3
end