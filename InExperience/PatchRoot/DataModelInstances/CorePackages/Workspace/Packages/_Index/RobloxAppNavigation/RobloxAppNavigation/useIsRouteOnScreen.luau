local Parent = script:FindFirstAncestor("RobloxAppNavigation").Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseEarlyIsFocusedFunction = require(Parent.Navigation).useEarlyIsFocused
local GetCurrentNavigationStateFunction = require(Parent.Navigation).getCurrentNavigationState
local OnScreenContextModule = require(script.Parent.OnScreenContext)
local EnableOnScreenAPICheckDescendants = game:DefineFastFlag("EnableOnScreenAPICheckDescendants", false)

return function() --[[ Line: 12 | Named "useIsRouteOnScreen" ]]
	-- upvalues: UseNavigationFunction (copy), ReactModule (copy), OnScreenContextModule (copy), UseEarlyIsFocusedFunction (copy), EnableOnScreenAPICheckDescendants (copy), GetCurrentNavigationStateFunction (copy)
	local UseNavigationResult = UseNavigationFunction()
	local Key = if UseNavigationResult.state then UseNavigationResult.state.key else nil
	local UseContextResult = ReactModule.useContext(OnScreenContextModule)
	local UseEarlyIsFocusedResult = UseEarlyIsFocusedFunction()
	
	if UseContextResult == nil or UseContextResult.isOnScreen == nil then
		return UseEarlyIsFocusedResult
	end
	if not EnableOnScreenAPICheckDescendants then
		return UseContextResult.isOnScreen == true and (UseContextResult.currentRouteKey == nil or UseContextResult.currentRouteKey == Key)
	end
	local NoCurrentRouteKey: boolean = UseContextResult.currentRouteKey == nil or UseContextResult.currentRouteKey == Key
	
	if not NoCurrentRouteKey and UseNavigationResult.state then
		NoCurrentRouteKey = UseContextResult.currentRouteKey == GetCurrentNavigationStateFunction(UseNavigationResult.state).key
	end
	return UseContextResult.isOnScreen == true and NoCurrentRouteKey
end