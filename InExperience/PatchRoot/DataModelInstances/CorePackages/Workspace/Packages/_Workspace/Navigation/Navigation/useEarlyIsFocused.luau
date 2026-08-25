local parent = script:FindFirstAncestor("Navigation").Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local useNavigationModule = require(script.Parent.useNavigation)

return function()
	-- upvalues: useNavigationModule (ref), reactModule (ref), roactNavigationModule (ref)
	local var3 = useNavigationModule()
	local var4, var5 = reactModule.useState(var3.isFocused())
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var3 (ref), roactNavigationModule (copy)
		var5(var3.isFocused())
		local var6 = var3.addListener(roactNavigationModule.Events.WillFocus, function()
			-- upvalues: var5 (copy)
			var5(true)
		end)
		local var7 = var3.addListener(roactNavigationModule.Events.WillBlur, function()
			-- upvalues: var5 (copy)
			var5(false)
		end)
		
		return function()
			-- upvalues: var6 (ref), var7 (ref)
			var6.remove()
			var7.remove()
		end
	end, { var3 })
	
	return var4
end