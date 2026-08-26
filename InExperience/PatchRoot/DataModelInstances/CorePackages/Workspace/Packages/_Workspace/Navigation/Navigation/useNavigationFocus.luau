local parent = script:FindFirstAncestor("Navigation").Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local useNavigationModule = require(script.Parent.useNavigation)

return function()
	-- upvalues: useNavigationModule (ref), reactModule (ref), roactNavigationModule (ref)
	local var1 = useNavigationModule()
	local var2, var3 = reactModule.useState(var1.isFocused())
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), roactNavigationModule (copy), var3 (ref)
		local var4 = var1.addListener(roactNavigationModule.Events.WillFocus, function()
			-- upvalues: var3 (copy)
			var3(true)
		end)
		local var5 = var1.addListener(roactNavigationModule.Events.WillBlur, function()
			-- upvalues: var3 (copy)
			var3(false)
		end)
		var3(var1.isFocused())
		
		return function()
			-- upvalues: var4 (ref), var5 (ref)
			var4.remove()
			var5.remove()
		end
	end, {})
	
	return var2
end