local parent = script:FindFirstAncestor("AvatarExperienceCommon").Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useDeviceInsets = require(parent.Responsive).useDeviceInsets
local _ = require(script.Parent.PhotoboothMomentsPageView)

return function(_)
	-- upvalues: useNavigation (ref), useDeviceInsets (ref), reactModule (ref)
	local var1 = useNavigation()
	
	return {
		topInset = useDeviceInsets().top,
		onBackButtonPressed = reactModule.useCallback(function()
			-- upvalues: var1 (ref)
			var1.goBack()
		end, { var1 })
	}
end