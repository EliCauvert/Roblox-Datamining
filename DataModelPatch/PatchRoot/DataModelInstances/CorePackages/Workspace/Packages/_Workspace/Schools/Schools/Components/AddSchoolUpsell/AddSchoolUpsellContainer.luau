local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local UseNavigationFocusFunction = require(Parent.Navigation).useNavigationFocus
local AddSchoolUpsellModule = require(script.Parent.AddSchoolUpsell)
local RoutesModule = require(Schools.Navigation.Routes)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local NavigateBackFunction = require(Parent.NavigationRodux).Thunks.NavigateBack

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseNavigationFocusFunction (copy), ReactModule (copy), RoutesModule (copy), NavigateBackFunction (copy), AddSchoolUpsellModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local Navigation = p1.navigation
	
	return ReactModule.createElement(AddSchoolUpsellModule, {
		isOpen = UseNavigationFocusFunction(),
		onContinue = ReactModule.useCallback(function()
			-- upvalues: Navigation (copy), RoutesModule (upval)
			Navigation.navigate(RoutesModule.VerifyEmail)
		end, { Navigation }),
		onClose = ReactModule.useCallback(function()
			-- upvalues: Navigation (copy), UseDispatchResult (copy), NavigateBackFunction (upval)
			if Navigation.isFocused() then
				UseDispatchResult(NavigateBackFunction())
			end
		end, { Navigation, UseDispatchResult })
	})
end