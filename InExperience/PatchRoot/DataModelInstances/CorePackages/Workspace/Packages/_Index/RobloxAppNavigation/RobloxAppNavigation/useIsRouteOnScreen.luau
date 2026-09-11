local parent = script:FindFirstAncestor("RobloxAppNavigation").Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useEarlyIsFocused = require(parent.Navigation).useEarlyIsFocused
local onScreenContextModule = require(script.Parent.OnScreenContext)

return function()
	-- upvalues: useNavigation (ref), reactModule (ref), onScreenContextModule (ref), useEarlyIsFocused (ref)
	local var1 = useNavigation()
	local var2 = reactModule.useContext(onScreenContextModule)
	
	return if var2 == nil or var2.isOnScreen == nil then useEarlyIsFocused() else var2.isOnScreen == true and (if var2.currentRouteKey ~= nil then var2.currentRouteKey == (if var1.state then var1.state.key else nil) else true)
end