local Parent = script:FindFirstAncestor("RobloxAppNavigation").Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseEarlyIsFocusedFunction = require(Parent.Navigation).useEarlyIsFocused
local OnScreenContextModule = require(script.Parent.OnScreenContext)

return function() --[[ Line: 9 | Named "useIsRouteOnScreen" ]]
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), OnScreenContextModule (copy), UseEarlyIsFocusedFunction (copy)
	local UseNavigationResult = UseNavigationFunction()
	local Key = if UseNavigationResult.state then UseNavigationResult.state.key else nil
	local UseContextResult = ReactModule.useContext(OnScreenContextModule)
	local UseEarlyIsFocusedResult = UseEarlyIsFocusedFunction()
	
	return if UseContextResult == nil or UseContextResult.isOnScreen == nil then UseEarlyIsFocusedResult else UseContextResult.isOnScreen == true and (UseContextResult.currentRouteKey == nil or UseContextResult.currentRouteKey == Key)
end