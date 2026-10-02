local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local accountUpgradeAppShellFlowModule = require(accountUpgrade.AppShell.AccountUpgradeAppShellFlow)
local oAuth = require(accountUpgrade.AccountUpgradeFlow).OAuth
local authAnalyticsModule = require(parent.AuthAnalytics)
local authPageload = authAnalyticsModule.Events.authPageload
local eventStreamConstants = authAnalyticsModule.EventStreamConstants
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent.RoactServiceTags)

return function(p1)
	-- upvalues: useDispatch (ref), useRoactService (ref), roactServiceTagsModule (ref), useSelector (ref), reactModule (ref), authPageload (ref), eventStreamConstants (ref), oAuth (ref), accountUpgradeAppShellFlowModule (ref)
	local var1 = useDispatch()
	local var2 = useRoactService(roactServiceTagsModule.RoactNetworking)
	local var3 = useSelector(function(p2)
		local var4 = if p2.Users and p2.LocalUserId then p2.Users[p2.LocalUserId] else nil
		
		return if var4 then var4.name else nil
	end)
	reactModule.useEffect(function()
		-- upvalues: authPageload (copy), eventStreamConstants (copy), oAuth (copy)
		authPageload(eventStreamConstants.Context.AccountUpgrade, nil, nil, oAuth)
	end, {})
	local refreshUserAccess = p1.refreshUserAccess
	local var4 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), refreshUserAccess (ref), var2 (ref)
		var1(refreshUserAccess(var2))
	end, { var1, refreshUserAccess, var2 })
	
	return reactModule.createElement(accountUpgradeAppShellFlowModule, {
		hasBackdrop = true,
		flow = oAuth,
		currentUsername = var3,
		onComplete = var4,
		onUnrecoverableFailure = var4
	})
end