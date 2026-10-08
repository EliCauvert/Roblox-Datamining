local accountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local parent = accountUpgrade.Parent
local reactModule = require(parent.React)
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local authCommonModule = require(parent.AuthCommon)
local authBackgroundContainer = authCommonModule.Components.AuthBackgroundContainer
local isLoggedOutUserId = authCommonModule.Utils.isLoggedOutUserId
local logoutReasonNames = authCommonModule.Enums.LogoutReasonNames
local accountUpgradeAppShellFlowModule = require(accountUpgrade.AppShell.AccountUpgradeAppShellFlow)
local accountUpgradeFlowModule = require(accountUpgrade.AccountUpgradeFlow)
local accountUpgradePageModule = require(accountUpgrade.MobilePage.AccountUpgradePage)
local fFlagAccountUpgradeFullPageOnPhoneModule = require(accountUpgrade.MobilePage.FFlagAccountUpgradeFullPageOnPhone)
local useMobilePageModule = require(accountUpgrade.MobilePage.useMobilePage)
local oAuth = accountUpgradeFlowModule.OAuth
local roactUtilsModule = require(parent.RoactUtils)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useStore = roactUtilsModule.Hooks.RoactRodux.useStore
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactServiceTagsModule = require(parent.RoactServiceTags)

local function renderLandingArt()
	-- upvalues: reactModule (ref), authBackgroundContainer (ref)
	return reactModule.createElement(authBackgroundContainer)
end

return function(p1)
	-- upvalues: useDispatch (ref), useRoactService (ref), roactServiceTagsModule (ref), useSelector (ref), reactModule (ref), logoutReasonNames (ref), useStore (ref), isLoggedOutUserId (ref), fFlagAccountUpgradeFullPageOnPhoneModule (ref), useMobilePageModule (ref), accountUpgradePageModule (ref), oAuth (ref), fullscreenPageWithSafeArea (ref), renderLandingArt (ref), accountUpgradeAppShellFlowModule (ref)
	local var1 = useDispatch()
	local var2 = useRoactService(roactServiceTagsModule.RoactNetworking)
	local var3 = useRoactService(roactServiceTagsModule.AppGuiService)
	local var4 = useSelector(function(p2)
		local var5 = if p2.Users and p2.LocalUserId then p2.Users[p2.LocalUserId] else nil
		
		return if var5 then var5.name else nil
	end)
	local refreshUserAccess = p1.refreshUserAccess
	local var5 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), refreshUserAccess (ref), var2 (ref)
		var1(refreshUserAccess(var2))
	end, { var1, refreshUserAccess, var2 })
	local refreshUserAccessAfterUpgrade = p1.refreshUserAccessAfterUpgrade or refreshUserAccess
	local var6 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), refreshUserAccessAfterUpgrade (ref), var2 (ref)
		var1(refreshUserAccessAfterUpgrade(var2))
	end, { var1, refreshUserAccessAfterUpgrade, var2 })
	local logoutThunk = p1.LogoutThunk
	local var7 = reactModule.useMemo(function()
		-- upvalues: logoutThunk (ref), var1 (ref), var2 (ref), var3 (ref), logoutReasonNames (copy)
		return if logoutThunk == nil then nil else function()
			-- upvalues: var1 (copy), logoutThunk (copy), var2 (copy), var3 (copy), logoutReasonNames (copy)
			var1(logoutThunk(var2, var3, logoutReasonNames.Moderation))
		end
	end, { var1, logoutThunk, var2, var3 })
	local var8 = useStore()
	local setDarkThemeOverride = p1.setDarkThemeOverride
	local clearThemeOverride = p1.clearThemeOverride
	reactModule.useEffect(function()
		-- upvalues: setDarkThemeOverride (ref), clearThemeOverride (ref), isLoggedOutUserId (copy), var8 (ref)
		if setDarkThemeOverride then
			setDarkThemeOverride()
		end
		return function()
			-- upvalues: clearThemeOverride (copy), isLoggedOutUserId (copy), var8 (copy)
			if clearThemeOverride and not isLoggedOutUserId(var8:getState().LocalUserId) then
				clearThemeOverride()
			end
		end
	end, { var8, setDarkThemeOverride, clearThemeOverride })
	
	return if if fFlagAccountUpgradeFullPageOnPhoneModule then useMobilePageModule() else nil then reactModule.createElement(accountUpgradePageModule, {
		flow = oAuth,
		currentUsername = var4,
		onSignOut = var7,
		onComplete = var6,
		onUnrecoverableFailure = var5
	}) else reactModule.createElement(fullscreenPageWithSafeArea, {
		includeStatusBar = true,
		renderFullscreenBackground = renderLandingArt
	}, {
		Flow = reactModule.createElement(accountUpgradeAppShellFlowModule, {
			hasBackdrop = true,
			flow = oAuth,
			currentUsername = var4,
			onSignOut = var7,
			onComplete = var6,
			onUnrecoverableFailure = var5
		})
	})
end