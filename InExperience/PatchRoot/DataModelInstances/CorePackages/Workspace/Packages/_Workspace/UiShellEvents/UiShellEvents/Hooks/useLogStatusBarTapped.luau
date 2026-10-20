local UiShellEvents = script:FindFirstAncestor("UiShellEvents")
local Parent = UiShellEvents.Parent
local ReactModule = require(Parent.React)
local UseNavigationFunction = require(Parent.Navigation).useNavigation
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local GetCurrentRouteStateFunction = require(Parent.Navigation).getCurrentRouteState
local AppEventIngestService = require(Parent.RoactServiceTags).AppEventIngestService
local AppUserInputService = require(Parent.RoactServiceTags).AppUserInputService
local UiStatusBarTappedEventModule = require(UiShellEvents.Analytics.uiStatusBarTappedEvent)

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AppEventIngestService (copy), AppUserInputService (copy), UseNavigationFunction (copy), GetCurrentRouteStateFunction (copy), ReactModule (copy), UiStatusBarTappedEventModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppEventIngestService)
	local UseRoactServiceResult1 = UseRoactServiceFunction(AppUserInputService)
	local CurrentRouteState = GetCurrentRouteStateFunction((UseNavigationFunction())) or {}
	local P0 = p1 or (CurrentRouteState.name or "Unknown")
	ReactModule.useEffect(function()
		-- upvalues: UseRoactServiceResult1 (copy), UiStatusBarTappedEventModule (upval), UseRoactServiceResult (copy), P0 (copy)
		local StatusBarTappedConnection = UseRoactServiceResult1.StatusBarTapped:Connect(function()
			-- upvalues: UiStatusBarTappedEventModule (upval), UseRoactServiceResult (upval), P0 (upval)
			UiStatusBarTappedEventModule(UseRoactServiceResult, "StatusBar", { page = P0 })
		end)
		
		return function()
			-- upvalues: StatusBarTappedConnection (copy)
			StatusBarTappedConnection:Disconnect()
		end
	end, { UseRoactServiceResult, UseRoactServiceResult1, P0 })
end