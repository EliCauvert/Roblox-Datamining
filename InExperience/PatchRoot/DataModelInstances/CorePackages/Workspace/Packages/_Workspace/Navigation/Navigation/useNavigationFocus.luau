local parent = script:FindFirstAncestor("Navigation").Parent
local reactModule = require(parent.React)
local roactNavigationModule = require(parent.RoactNavigation)
local useNavigationModule = require(script.Parent.useNavigation)

return function() --[[ line: 13 | named "useNavigationFocus" ]]
	-- upvalues: useNavigationModule (ref), reactModule (ref), roactNavigationModule (ref)
	local var3 = useNavigationModule()
	local var4, var5 = reactModule.useState(var3.isFocused())
	reactModule.useEffect(function() --[[ line: 18 ]]
		-- upvalues: var3 (ref), roactNavigationModule (copy), var5 (ref)
		local var6 = var3.addListener(roactNavigationModule.Events.WillFocus, function() --[[ line: 19 ]]
			-- upvalues: var5 (copy)
			var5(true)
		end)
		local var7 = var3.addListener(roactNavigationModule.Events.WillBlur, function() --[[ line: 22 ]]
			-- upvalues: var5 (copy)
			var5(false)
		end)
		var5(var3.isFocused())
		
		return function() --[[ line: 27 ]]
			-- upvalues: var6 (ref), var7 (ref)
			var6.remove()
			var7.remove()
		end
	end, {})
	
	return var4
end