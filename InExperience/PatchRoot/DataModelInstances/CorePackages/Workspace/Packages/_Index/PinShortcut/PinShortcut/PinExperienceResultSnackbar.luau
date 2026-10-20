local Parent = script:FindFirstAncestor("PinShortcut").Parent
local LoggingProtocolModule = require(Parent.LoggingProtocol)
local ReactModule = require(Parent.React)
local CloseCentralOverlayFunction = require(Parent.CentralOverlay).Thunks.CloseCentralOverlay
local Enums = require(Parent.Foundation).Enums
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local SnackbarWrapper = require(Parent.AppBlox).SnackbarWrapper
local TelemetryCountersModule = require(script.Parent.TelemetryCounters)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagAddPinExperienceTargetDestinationGUACPolicy = require(Parent.SharedFlags).FFlagAddPinExperienceTargetDestinationGUACPolicy
local FFlagPinShortcutSnackbarTelemetryEnabledModule = require(script.Parent.Flags.FFlagPinShortcutSnackbarTelemetryEnabled)

return ReactModule.memo(function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), CloseCentralOverlayFunction (copy), UseLocalizationFunction (copy), FFlagAddPinExperienceTargetDestinationGUACPolicy (copy), GetAppFeaturePoliciesFunction (copy), Enums (copy), FFlagPinShortcutSnackbarTelemetryEnabledModule (copy), LoggingProtocolModule (copy), TelemetryCountersModule (copy), SnackbarWrapper (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseDispatchResult (copy), CloseCentralOverlayFunction (upval)
		UseDispatchResult(CloseCentralOverlayFunction())
	end, { UseDispatchResult })
	local IsStatusMatch = p1.status == Enum.PinExperienceStatus.Success
	local IsStatusMatch1 = p1.status == Enum.PinExperienceStatus.AlreadyExists
	local ExperienceName = p1.experienceName
	local UseLocalizationResult = UseLocalizationFunction({
		successDesktop = {
			"InstantApps.Shortcuts.Label.SuccessAddingExperienceToDesktop",
			experience_name = ExperienceName
		},
		successHomeScreen = {
			"InstantApps.Shortcuts.Label.SuccessAddingExperienceToHomeScreen",
			experience_name = ExperienceName
		},
		alreadyExists = {
			"InstantApps.Shortcuts.Label.ShortcutAlreadyExists",
			experience_name = ExperienceName
		},
		failedDesktop = {
			"InstantApps.Shortcuts.Label.FailedToAddExperienceToDesktop",
			experience_name = ExperienceName
		},
		failedHomeScreen = {
			"InstantApps.Shortcuts.Label.FailedToAddExperienceToHomeScreen",
			experience_name = ExperienceName
		},
		viewShortcut = { "InstantApps.Shortcuts.Label.ViewShortcut" },
		tryAgain = { "InstantApps.Shortcuts.Label.TryAgain" }
	})
	local PinExperienceTargetDestination = if FFlagAddPinExperienceTargetDestinationGUACPolicy then GetAppFeaturePoliciesFunction().getPinExperienceTargetDestination() else "HomeScreen"
	local SuccessDesktop = nil
	local Icon = nil
	
	if IsStatusMatch then
		SuccessDesktop = if PinExperienceTargetDestination == "Desktop" then UseLocalizationResult.successDesktop else UseLocalizationResult.successHomeScreen
		Icon = {
			name = Enums.IconName.CircleCheck,
			variant = Enums.IconVariant.Filled
		}
	elseif IsStatusMatch1 then
		SuccessDesktop = UseLocalizationResult.alreadyExists
		Icon = { name = Enums.IconName.CircleI }
	else
		SuccessDesktop = if PinExperienceTargetDestination == "Desktop" then UseLocalizationResult.failedDesktop else UseLocalizationResult.failedHomeScreen
		Icon = { name = Enums.IconName.TriangleExclamation }
	end
	if FFlagPinShortcutSnackbarTelemetryEnabledModule then
		ReactModule.useEffect(function()
			-- upvalues: IsStatusMatch (copy), IsStatusMatch1 (copy), LoggingProtocolModule (upval), TelemetryCountersModule (upval)
			LoggingProtocolModule.default:logRobloxTelemetryCounter(TelemetryCountersModule.SnackbarShown, 1, {
				action = if IsStatusMatch then "Success" elseif IsStatusMatch1 then "AlreadyExists" else "Failure"
			})
		end, {})
	end
	local TryAgain = nil
	local OnButtonActivated: (() -> ())? = nil
	
	if IsStatusMatch and p1.onViewShortcut then
		TryAgain = UseLocalizationResult.viewShortcut
		
		OnButtonActivated = function()
			-- upvalues: FFlagPinShortcutSnackbarTelemetryEnabledModule (upval), LoggingProtocolModule (upval), TelemetryCountersModule (upval), UseResult (copy), p1 (copy)
			if FFlagPinShortcutSnackbarTelemetryEnabledModule then
				LoggingProtocolModule.default:logRobloxTelemetryCounter(TelemetryCountersModule.SnackbarButtonPressed, 1, { action = "ViewShortcut" })
			end
			UseResult()
			p1.onViewShortcut()
		end
	elseif not IsStatusMatch and not IsStatusMatch1 and p1.onRetry then
		TryAgain = UseLocalizationResult.tryAgain
		
		OnButtonActivated = function()
			-- upvalues: FFlagPinShortcutSnackbarTelemetryEnabledModule (upval), LoggingProtocolModule (upval), TelemetryCountersModule (upval), UseResult (copy), p1 (copy)
			if FFlagPinShortcutSnackbarTelemetryEnabledModule then
				LoggingProtocolModule.default:logRobloxTelemetryCounter(TelemetryCountersModule.SnackbarButtonPressed, 1, { action = "TryAgain" })
			end
			UseResult()
			p1.onRetry()
		end
	end
	local IsStatusMatch2: boolean = IsStatusMatch or IsStatusMatch1
	
	return ReactModule.createElement(SnackbarWrapper, {
		titleText = SuccessDesktop,
		icon = Icon,
		buttonText = TryAgain,
		onButtonActivated = OnButtonActivated,
		closeSnackbar = UseResult,
		autoDismissDelaySeconds = if IsStatusMatch2 then 5 else nil,
		hideCloseAffordance = if IsStatusMatch2 then true else false
	})
end)