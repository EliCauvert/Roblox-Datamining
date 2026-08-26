local uiShellEvents = script:FindFirstAncestor("UiShellEvents")
local parent = uiShellEvents.Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local getCurrentRouteState = require(parent.Navigation).getCurrentRouteState
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local appUserInputService = require(parent.RoactServiceTags).AppUserInputService
local uiStatusBarTappedEventModule = require(uiShellEvents.Analytics.uiStatusBarTappedEvent)

return function(p1)
	-- upvalues: useRoactService (ref), appEventIngestService (ref), appUserInputService (ref), useNavigation (ref), getCurrentRouteState (ref), reactModule (ref), uiStatusBarTappedEventModule (ref)
	local var1 = useRoactService(appEventIngestService)
	local var2 = useRoactService(appUserInputService)
	p1 = p1 or ((getCurrentRouteState(useNavigation()) or {}).name or "Unknown")
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), uiStatusBarTappedEventModule (copy), var1 (ref), p1 (ref)
		local statusBarTappedConnection = var2.StatusBarTapped:Connect(function()
			-- upvalues: uiStatusBarTappedEventModule (copy), var1 (copy), p1 (copy)
			uiStatusBarTappedEventModule(var1, "StatusBar", { page = p1 })
		end)
		
		return function()
			-- upvalues: statusBarTappedConnection (ref)
			statusBarTappedConnection:Disconnect()
		end
	end, { var1, var2, p1 })
end