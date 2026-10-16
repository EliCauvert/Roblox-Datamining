local Parent = script:FindFirstAncestor("Navigation").Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseNavigationModule = require(script.Parent.useNavigation)

return function() --[[ Line: 15 | Named "useEarlyIsFocused" ]]
	-- upvalues: UseNavigationModule (copy), ReactModule (copy), RoactNavigationModule (copy)
	local UseNavigationModuleResult = UseNavigationModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseNavigationModuleResult.isFocused())
	ReactModule.useEffect(function() --[[ Line: 20 ]]
		-- upvalues: UseStateResult2 (copy), UseNavigationModuleResult (copy), RoactNavigationModule (upval)
		UseStateResult2(UseNavigationModuleResult.isFocused())
		local AddListenerResult = UseNavigationModuleResult.addListener(RoactNavigationModule.Events.WillFocus, function() --[[ Line: 24 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end)
		local AddListenerResult1 = UseNavigationModuleResult.addListener(RoactNavigationModule.Events.WillBlur, function() --[[ Line: 28 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
		
		return function() --[[ Line: 32 ]]
			-- upvalues: AddListenerResult (copy), AddListenerResult1 (copy)
			AddListenerResult.remove()
			AddListenerResult1.remove()
		end
	end, { UseNavigationModuleResult })
	
	return UseStateResult
end