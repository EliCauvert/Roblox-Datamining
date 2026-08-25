local uiShellEvents = script:FindFirstAncestor("UiShellEvents")
local parent = uiShellEvents.Parent
local reactModule = require(parent.React)
local useNavigation = require(parent.Navigation).useNavigation
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local getCurrentRouteState = require(parent.Navigation).getCurrentRouteState
local appEventIngestService = require(parent.RoactServiceTags).AppEventIngestService
local appUserInputService = require(parent.RoactServiceTags).AppUserInputService
local uiStatusBarTappedEventModule = require(uiShellEvents.Analytics.uiStatusBarTappedEvent)

return function(p0)
	-- upvalues: useRoactService (ref), appEventIngestService (ref), appUserInputService (ref), useNavigation (ref), getCurrentRouteState (ref), reactModule (ref), uiStatusBarTappedEventModule (ref)
	local var3 = useRoactService(appEventIngestService)
	local var4 = useRoactService(appUserInputService)
	p0 = p0 or ((getCurrentRouteState(useNavigation()) or {}).name or "Unknown")
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), uiStatusBarTappedEventModule (copy), var3 (ref), p0 (ref)
		local statusBarTappedConnection = var4.StatusBarTapped:Connect(function()
			-- upvalues: uiStatusBarTappedEventModule (copy), var3 (copy), p0 (copy)
			uiStatusBarTappedEventModule(var3, "StatusBar", { page = p0 })
		end)
		
		return function()
			-- upvalues: statusBarTappedConnection (ref)
			statusBarTappedConnection:Disconnect()
		end
	end, { var3, var4, p0 })
end