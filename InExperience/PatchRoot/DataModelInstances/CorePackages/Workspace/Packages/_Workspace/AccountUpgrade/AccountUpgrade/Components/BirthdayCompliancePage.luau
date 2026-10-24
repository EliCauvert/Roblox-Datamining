local AppStorageService = game:GetService("AppStorageService")
local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local StyleModule = require(Parent.Style)
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local AuthCommonModule = require(Parent.AuthCommon)
local AuthBackgroundContainer = AuthCommonModule.Components.AuthBackgroundContainer
local UseOpenDisclaimerLinksFunction = AuthCommonModule.Hooks.useOpenDisclaimerLinks
local IsLoggedOutUserIdFunction = AuthCommonModule.Utils.isLoggedOutUserId
local UpdateLoginEntryDataFunction = AuthCommonModule.Utils.updateLoginEntryData
local User = AuthCommonModule.Thunks.User
local AuthLocalStorageKeys = AuthCommonModule.Enums.AuthLocalStorageKeys
local LogoutReasonNames = AuthCommonModule.Enums.LogoutReasonNames
local FFlagAccountUpgradeHideAccountOnSignOutModule = require(AccountUpgrade.Flags.FFlagAccountUpgradeHideAccountOnSignOut)
local FFlagAccountUpgradeOAuthDialogFitsContentModule = require(AccountUpgrade.Flags.FFlagAccountUpgradeOAuthDialogFitsContent)
local FFlagAccountUpgradeDialogDarkThemeModule = require(AccountUpgrade.Flags.FFlagAccountUpgradeDialogDarkTheme)
local AccountUpgradeAppShellFlowModule = require(AccountUpgrade.AppShell.AccountUpgradeAppShellFlow)
local AccountUpgradePageModule = require(AccountUpgrade.MobilePage.AccountUpgradePage)
local FFlagAccountUpgradeFullPageOnPhoneModule = require(AccountUpgrade.MobilePage.FFlagAccountUpgradeFullPageOnPhone)
local UseMobilePageModule = require(AccountUpgrade.MobilePage.useMobilePage)
local _ = require(AccountUpgrade.Components.useAccountUpgradeViewModel)
local OAuth = require(AccountUpgrade.AccountUpgradeFlow).OAuth
local View = FoundationModule.View
local Style = {
	themeName = FoundationModule.Enums.ColorMode.Dark,
	fontName = StyleModule.Constants.FontName.Gotham
}
local RoactUtilsModule = require(Parent.RoactUtils)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseStoreFunction = RoactUtilsModule.Hooks.RoactRodux.useStore
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactServiceTagsModule = require(Parent.RoactServiceTags)

local function renderLandingArt()
	-- upvalues: ReactModule (copy), AuthBackgroundContainer (copy)
	return ReactModule.createElement(AuthBackgroundContainer)
end

return function(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactServiceTagsModule (copy), UseSelectorFunction (copy), ReactModule (copy), UseStoreFunction (copy), FFlagAccountUpgradeHideAccountOnSignOutModule (copy), User (copy), LogoutReasonNames (copy), UpdateLoginEntryDataFunction (copy), AppStorageService (copy), AuthLocalStorageKeys (copy), FFlagAccountUpgradeOAuthDialogFitsContentModule (copy), UseOpenDisclaimerLinksFunction (copy), IsLoggedOutUserIdFunction (copy), FFlagAccountUpgradeFullPageOnPhoneModule (copy), UseMobilePageModule (copy), AccountUpgradePageModule (copy), OAuth (copy), AccountUpgradeAppShellFlowModule (copy), FFlagAccountUpgradeDialogDarkThemeModule (copy), View (copy), StyleModule (copy), Style (copy), FullscreenPageWithSafeArea (copy), renderLandingArt (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactServiceTagsModule.RoactNetworking)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactServiceTagsModule.AppGuiService)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		local User = if p2.Users and p2.LocalUserId then p2.Users[p2.LocalUserId] else nil
		
		return if User then User.name else nil
	end)
	local RefreshUserAccessFunction = p1.refreshUserAccess
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), RefreshUserAccessFunction (copy), UseRoactServiceResult (copy)
		UseDispatchResult(RefreshUserAccessFunction(UseRoactServiceResult))
	end, {
		UseDispatchResult,
		RefreshUserAccessFunction,
		UseRoactServiceResult
	})
	local RefreshUserAccessAfterUpgrade = p1.refreshUserAccessAfterUpgrade or RefreshUserAccessFunction
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), RefreshUserAccessAfterUpgrade (copy), UseRoactServiceResult (copy)
		UseDispatchResult(RefreshUserAccessAfterUpgrade(UseRoactServiceResult))
	end, {
		UseDispatchResult,
		RefreshUserAccessAfterUpgrade,
		UseRoactServiceResult
	})
	local UseStoreResult = UseStoreFunction()
	local LogoutThunkFunction = p1.LogoutThunk
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: LogoutThunkFunction (copy), UseStoreResult (copy), FFlagAccountUpgradeHideAccountOnSignOutModule (upval), User (upval), UseDispatchResult (copy), UseRoactServiceResult (copy), UseRoactServiceResult1 (copy), LogoutReasonNames (upval), UpdateLoginEntryDataFunction (upval), AppStorageService (upval), AuthLocalStorageKeys (upval)
		return if LogoutThunkFunction == nil then nil else function()
			-- upvalues: UseStoreResult (upval), FFlagAccountUpgradeHideAccountOnSignOutModule (upval), User (upval), UseDispatchResult (upval), LogoutThunkFunction (upval), UseRoactServiceResult (upval), UseRoactServiceResult1 (upval), LogoutReasonNames (upval), UpdateLoginEntryDataFunction (upval), AppStorageService (upval), AuthLocalStorageKeys (upval)
			local LocalUserId = UseStoreResult:getState().LocalUserId
			local Username = if FFlagAccountUpgradeHideAccountOnSignOutModule then User.fromLocalStorage().username else nil
			UseDispatchResult(LogoutThunkFunction(UseRoactServiceResult, UseRoactServiceResult1, LogoutReasonNames.Moderation))
			
			if FFlagAccountUpgradeHideAccountOnSignOutModule then
				UpdateLoginEntryDataFunction(tostring(LocalUserId), { showInAccountPicker = false })
				
				if AppStorageService:GetItem(AuthLocalStorageKeys.CredentialValue) == Username then
					AppStorageService:SetItem(AuthLocalStorageKeys.CredentialValue, "")
					AppStorageService:Flush()
				end
			end
		end
	end, {
		UseDispatchResult,
		LogoutThunkFunction,
		UseRoactServiceResult,
		UseRoactServiceResult1,
		UseStoreResult
	})
	local OnLegalLinkSelected = nil
	
	if FFlagAccountUpgradeOAuthDialogFitsContentModule then
		local UseOpenDisclaimerLinksResult = UseOpenDisclaimerLinksFunction()
		OnLegalLinkSelected = ReactModule.useCallback(function(p2)
			-- upvalues: UseOpenDisclaimerLinksResult (copy)
			if p2 == "terms" then
				UseOpenDisclaimerLinksResult.openTerms()
				
				return
			else
				UseOpenDisclaimerLinksResult.openPrivacy()
			end
		end, { UseOpenDisclaimerLinksResult })
	end
	local SetDarkThemeOverrideFunction = p1.setDarkThemeOverride
	local ClearThemeOverrideFunction = p1.clearThemeOverride
	ReactModule.useEffect(function()
		-- upvalues: SetDarkThemeOverrideFunction (copy), ClearThemeOverrideFunction (copy), IsLoggedOutUserIdFunction (upval), UseStoreResult (copy)
		if SetDarkThemeOverrideFunction then
			SetDarkThemeOverrideFunction()
		end
		return function()
			-- upvalues: ClearThemeOverrideFunction (upval), IsLoggedOutUserIdFunction (upval), UseStoreResult (upval)
			if ClearThemeOverrideFunction and not IsLoggedOutUserIdFunction(UseStoreResult:getState().LocalUserId) then
				ClearThemeOverrideFunction()
			end
		end
	end, {
		UseStoreResult,
		SetDarkThemeOverrideFunction,
		ClearThemeOverrideFunction
	})
	
	if if FFlagAccountUpgradeFullPageOnPhoneModule then UseMobilePageModule() else nil then
		return ReactModule.createElement(AccountUpgradePageModule, {
			flow = OAuth,
			currentUsername = UseSelectorResult,
			onSignOut = UseMemoResult,
			onLegalLinkSelected = OnLegalLinkSelected,
			onComplete = UseResult1,
			onUnrecoverableFailure = UseResult
		})
	end
	local Element = ReactModule.createElement(AccountUpgradeAppShellFlowModule, {
		hasBackdrop = true,
		flow = OAuth,
		currentUsername = UseSelectorResult,
		onSignOut = UseMemoResult,
		onLegalLinkSelected = OnLegalLinkSelected,
		onComplete = UseResult1,
		onUnrecoverableFailure = UseResult
	})
	
	if FFlagAccountUpgradeDialogDarkThemeModule then
		Element = ReactModule.createElement(View, { tag = "size-full" }, {
			Theme = ReactModule.createElement(StyleModule.UiModeStyleProvider, { style = Style }, { Flow = Element })
		})
	end
	return ReactModule.createElement(FullscreenPageWithSafeArea, {
		includeStatusBar = true,
		renderFullscreenBackground = renderLandingArt
	}, { Flow = Element })
end