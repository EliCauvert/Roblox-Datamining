local Parent = script:FindFirstAncestor("Navigation").Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseNavigationModule = require(script.Parent.useNavigation)

return function() --[[ Line: 13 | Named "useNavigationFocus" ]]
	-- upvalues: UseNavigationModule (copy), ReactModule (copy), RoactNavigationModule (copy)
	local UseNavigationModuleResult = UseNavigationModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseNavigationModuleResult.isFocused())
	ReactModule.useEffect(function() --[[ Line: 18 ]]
		-- upvalues: UseNavigationModuleResult (copy), RoactNavigationModule (upval), UseStateResult2 (copy)
		local AddListenerResult = UseNavigationModuleResult.addListener(RoactNavigationModule.Events.WillFocus, function() --[[ Line: 19 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end)
		local AddListenerResult1 = UseNavigationModuleResult.addListener(RoactNavigationModule.Events.WillBlur, function() --[[ Line: 22 ]]
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
		UseStateResult2(UseNavigationModuleResult.isFocused())
		
		return function() --[[ Line: 27 ]]
			-- upvalues: AddListenerResult (copy), AddListenerResult1 (copy)
			AddListenerResult.remove()
			AddListenerResult1.remove()
		end
	end, {})
	
	return UseStateResult
end