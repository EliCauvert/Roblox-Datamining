local parent = script:FindFirstAncestor("PinShortcut").Parent
local appBloxModule = require(parent.AppBlox)
local centralOverlayModule = require(parent.CentralOverlay)
local localizationModule = require(parent.Localization)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local sharedFlagsModule = require(parent.SharedFlags)
local universalAppPolicyModule = require(parent.UniversalAppPolicy)
local closeCentralOverlay = centralOverlayModule.Thunks.CloseCentralOverlay
local enums = foundationModule.Enums
local getAppFeaturePolicies = universalAppPolicyModule.getAppFeaturePolicies
local snackbarWrapper = appBloxModule.SnackbarWrapper
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local fFlagAddPinExperienceTargetDestinationGUACPolicy = sharedFlagsModule.FFlagAddPinExperienceTargetDestinationGUACPolicy

return reactModule.memo(function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), closeCentralOverlay (ref), useLocalization (ref), fFlagAddPinExperienceTargetDestinationGUACPolicy (ref), getAppFeaturePolicies (ref), enums (ref), snackbarWrapper (ref)
	local alreadyExists, t
	local var1 = useDispatch()
	local var2 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), closeCentralOverlay (copy)
		var1(closeCentralOverlay())
	end, { var1 })
	local var3 = p1.status == Enum.PinExperienceStatus.Success
	local var4 = p1.status == Enum.PinExperienceStatus.AlreadyExists
	local experienceName = p1.experienceName
	local var5 = useLocalization({
		successDesktop = {
			"InstantApps.Shortcuts.Label.SuccessAddingExperienceToDesktop",
			experience_name = experienceName
		},
		successHomeScreen = {
			"InstantApps.Shortcuts.Label.SuccessAddingExperienceToHomeScreen",
			experience_name = experienceName
		},
		alreadyExists = {
			"InstantApps.Shortcuts.Label.ShortcutAlreadyExists",
			experience_name = experienceName
		},
		failedDesktop = {
			"InstantApps.Shortcuts.Label.FailedToAddExperienceToDesktop",
			experience_name = experienceName
		},
		failedHomeScreen = {
			"InstantApps.Shortcuts.Label.FailedToAddExperienceToHomeScreen",
			experience_name = experienceName
		},
		viewShortcut = { "InstantApps.Shortcuts.Label.ViewShortcut" },
		tryAgain = { "InstantApps.Shortcuts.Label.TryAgain" }
	})
	local _ = nil
	local _ = nil
	local var6 = if fFlagAddPinExperienceTargetDestinationGUACPolicy then getAppFeaturePolicies().getPinExperienceTargetDestination() else "HomeScreen"
	
	if var3 then
		alreadyExists = if var6 == "Desktop" then var5.successDesktop else var5.successHomeScreen
		t = {
			name = enums.IconName.CircleCheck,
			variant = enums.IconVariant.Filled
		}
	elseif var4 then
		alreadyExists = var5.alreadyExists
		t = { name = enums.IconName.CircleI }
	else
		alreadyExists = if var6 == "Desktop" then var5.failedDesktop else var5.failedHomeScreen
		t = { name = enums.IconName.TriangleExclamation }
	end
	local tryAgain = nil
	local var7 = nil
	
	if var3 and p1.onViewShortcut then
		tryAgain = var5.viewShortcut
		
		var7 = function()
			-- upvalues: var2 (ref), p1 (ref)
			var2()
			p1.onViewShortcut()
		end
	elseif not var3 and not var4 and p1.onRetry then
		tryAgain = var5.tryAgain
		
		var7 = function()
			-- upvalues: var2 (ref), p1 (ref)
			var2()
			p1.onRetry()
		end
	end
	local var8 = var3 or var4
	
	return reactModule.createElement(snackbarWrapper, {
		titleText = alreadyExists,
		icon = t,
		buttonText = tryAgain,
		onButtonActivated = var7,
		closeSnackbar = var2,
		autoDismissDelaySeconds = if var8 then 5 else nil,
		hideCloseAffordance = if var8 then true else false
	})
end)