local Parent = script:FindFirstAncestor("Navigation").Parent
local ReactModule = require(Parent.React)
local RoactNavigationModule = require(Parent.RoactNavigation)
local UseNavigationModule = require(script.Parent.useNavigation)

return function()
	-- upvalues: UseNavigationModule (copy), ReactModule (copy), RoactNavigationModule (copy)
	local UseNavigationModuleResult = UseNavigationModule()
	local UseStateResult, UseStateResult2 = ReactModule.useState(UseNavigationModuleResult.isFocused())
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy), UseNavigationModuleResult (copy), RoactNavigationModule (upval)
		UseStateResult2(UseNavigationModuleResult.isFocused())
		local AddListenerResult = UseNavigationModuleResult.addListener(RoactNavigationModule.Events.WillFocus, function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(true)
		end)
		local AddListenerResult1 = UseNavigationModuleResult.addListener(RoactNavigationModule.Events.WillBlur, function()
			-- upvalues: UseStateResult2 (upval)
			UseStateResult2(false)
		end)
		
		return function()
			-- upvalues: AddListenerResult (copy), AddListenerResult1 (copy)
			AddListenerResult.remove()
			AddListenerResult1.remove()
		end
	end, { UseNavigationModuleResult })
	
	return UseStateResult
end