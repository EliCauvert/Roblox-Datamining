local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local Parent = GenericChallenges.Parent
local Players = game:GetService("Players")
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local FullscreenPageWithSafeArea = require(Parent.AppBlox).FullscreenPageWithSafeArea
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local FocusNavigableSurfaceWrapper = FocusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local PersonaLivenessContainerModule = require(script.Parent.PersonaLivenessContainer)
local PersonaLivenessServiceWrapperModule = require(script.Parent.PersonaLivenessServiceWrapper)
local QRDeepLinkDialog = require(Parent.IdentityVerification).QRDeepLinkDialog
local BiometricTypeEnum = require(script.Parent.Parent.Common.Enums).BiometricTypeEnum
local TelemetryReasonsModule = require(script.Parent.Parent.Common.TelemetryReasons)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppLogging = require(Parent.RoactServiceTags).AppLogging
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local BiometricChallengeEventModule = require(script.Parent.Parent.Common.BiometricChallengeEvent)
local ChallengeEventConstantsModule = require(GenericChallenges.Utils.ChallengeEventConstants)
local GetFFlagEnhancedPersonaLivenessEventsFunction = require(Parent.SharedFlags).GetFFlagEnhancedPersonaLivenessEvents
local PersonaLivenessV2QrPollDelaySec = game:DefineFastInt("PersonaLivenessV2QrPollDelaySec", 6)
local PersonaLivenessV2QrPollMaxRetries = game:DefineFastInt("PersonaLivenessV2QrPollMaxRetries", 60)

local function defaultGetLocalUserId()
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer then LocalPlayer.UserId else nil
end

local function _(p1): string
	return "https://ro.blox.com/Ebh5" .. "?pid=QR_code&c=liveness_onelink" .. "&is_retargeting=false" .. "&af_dp=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(p1) .. "&deep_link_value=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(p1)
end

local function PersonaLivenessQRFlow(p1)
	-- upvalues: UseDispatchFunction (copy), UseRoactServiceFunction (copy), AppLogging (copy), RoactNetworking (copy), UseSelectorFunction (copy), defaultGetLocalUserId (copy), UseLocalizationFunction (copy), ReactModule (copy), GetFFlagEnhancedPersonaLivenessEventsFunction (copy), BiometricChallengeEventModule (copy), ChallengeEventConstantsModule (copy), BiometricTypeEnum (copy), TelemetryReasonsModule (copy), PersonaLivenessV2QrPollMaxRetries (copy), PersonaLivenessV2QrPollDelaySec (copy), Loading (copy), IconSize (copy), FullscreenPageWithSafeArea (copy), FocusNavigableSurfaceWrapper (copy), FocusNavigableSurfaceIdentifierEnum (copy), QRDeepLinkDialog (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(AppLogging)
	local UseRoactServiceResult1 = UseRoactServiceFunction(RoactNetworking)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.UserAccess and p2.UserAccess.restrictionDetail
	end)
	local v1: number = (p1.getLocalUserId or defaultGetLocalUserId)()
	local Text = if v1 and v1 > 0 then "https://ro.blox.com/Ebh5" .. "?pid=QR_code&c=liveness_onelink" .. "&is_retargeting=false" .. "&af_dp=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(v1) .. "&deep_link_value=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(v1) else nil
	local UseLocalizationResult = UseLocalizationFunction({
		title = "Feature.BiometricChallenge.Title.QRHandoff",
		description = "Feature.BiometricChallenge.Content.ScanQR",
		footer = {
			"Feature.BiometricChallenge.Content.QRHelpFull",
			prompt = "<b>" .. UseLocalizationFunction({
				prompt = "Feature.BiometricChallenge.Content.QRHelpPrompt"
			}).prompt .. "</b>"
		}
	})
	local UseRefResult = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(Reason)
		-- upvalues: UseRefResult (copy), p1 (copy), GetFFlagEnhancedPersonaLivenessEventsFunction (upval), UseRoactServiceResult (copy), BiometricChallengeEventModule (upval), ChallengeEventConstantsModule (upval), BiometricTypeEnum (upval)
		if UseRefResult.current then return end
		UseRefResult.current = true
		p1.onChallengeAbandoned("")
		
		if GetFFlagEnhancedPersonaLivenessEventsFunction() then
			UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
				challengeId = p1.challengeId,
				biometricType = BiometricTypeEnum.PersonaLiveness,
				reason = Reason
			})
			
			return
		else
			UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
				challengeId = p1.challengeId,
				biometricType = BiometricTypeEnum.PersonaLiveness
			})
		end
	end, {
		UseRoactServiceResult,
		p1.challengeId,
		p1.onChallengeAbandoned
	})
	local UseResult1 = ReactModule.useCallback(function(p2, Reason)
		-- upvalues: UseRefResult (copy), p1 (copy), GetFFlagEnhancedPersonaLivenessEventsFunction (upval), UseRoactServiceResult (copy), BiometricChallengeEventModule (upval), ChallengeEventConstantsModule (upval), BiometricTypeEnum (upval)
		if UseRefResult.current then return end
		UseRefResult.current = true
		p1.onChallengeFailed(p2)
		
		if GetFFlagEnhancedPersonaLivenessEventsFunction() then
			UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p1.challengeId,
				biometricType = BiometricTypeEnum.PersonaLiveness,
				reason = Reason
			})
			
			return
		else
			UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p1.challengeId,
				biometricType = BiometricTypeEnum.PersonaLiveness
			})
		end
	end, {})
	ReactModule.useEffect(function()
		-- upvalues: Text (copy), GetFFlagEnhancedPersonaLivenessEventsFunction (upval), UseResult1 (copy), TelemetryReasonsModule (upval)
		if not Text then
			if GetFFlagEnhancedPersonaLivenessEventsFunction() then
				UseResult1("MissingLocalUserId", TelemetryReasonsModule.NullUserId)
				
				return
			end
			UseResult1("MissingLocalUserId")
		end
	end, { Text, UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: Text (copy), UseSelectorResult (copy), GetFFlagEnhancedPersonaLivenessEventsFunction (upval), UseRefResult (copy), UseRoactServiceResult (copy), BiometricChallengeEventModule (upval), ChallengeEventConstantsModule (upval), p1 (copy), BiometricTypeEnum (upval), TelemetryReasonsModule (upval), UseResult (copy)
		if not Text or UseSelectorResult ~= nil then return end
		if not GetFFlagEnhancedPersonaLivenessEventsFunction() then
			UseResult()
			
			return
		end
		if not UseRefResult.current then
			UseRefResult.current = true
			UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
				challengeId = p1.challengeId,
				biometricType = BiometricTypeEnum.PersonaLiveness,
				reason = TelemetryReasonsModule.QRCompleted
			})
			p1.onChallengeAbandoned("")
			
			return
		end
	end, {
		UseSelectorResult, Text, UseResult, UseRoactServiceResult, p1.challengeId,
		p1.onChallengeAbandoned
	})
	ReactModule.useEffect(function()
		-- upvalues: Text (copy), GetFFlagEnhancedPersonaLivenessEventsFunction (upval), UseRoactServiceResult (copy), BiometricChallengeEventModule (upval), ChallengeEventConstantsModule (upval), p1 (copy), BiometricTypeEnum (upval), TelemetryReasonsModule (upval), PersonaLivenessV2QrPollMaxRetries (upval), PersonaLivenessV2QrPollDelaySec (upval), UseDispatchResult (copy), UseRoactServiceResult1 (copy), UseResult1 (copy)
		if not Text then return end
		if GetFFlagEnhancedPersonaLivenessEventsFunction() then
			UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeDisplayed,
				challengeId = p1.challengeId,
				biometricType = BiometricTypeEnum.PersonaLiveness,
				reason = TelemetryReasonsModule.QRDisplayed
			})
		end
		local Flag = false
		task.spawn(function()
			-- upvalues: PersonaLivenessV2QrPollMaxRetries (upval), PersonaLivenessV2QrPollDelaySec (upval), Flag (ref), p1 (upval), UseDispatchResult (upval), UseRoactServiceResult1 (upval), GetFFlagEnhancedPersonaLivenessEventsFunction (upval), UseResult1 (upval), TelemetryReasonsModule (upval)
			for _ = 1, PersonaLivenessV2QrPollMaxRetries do
				task.wait(PersonaLivenessV2QrPollDelaySec)
				
				if Flag then return end
				if p1.ApiFetchAccessStatus then
					UseDispatchResult(p1.ApiFetchAccessStatus(UseRoactServiceResult1))
				end
			end
			if not Flag then
				if GetFFlagEnhancedPersonaLivenessEventsFunction() then
					UseResult1("Timeout", TelemetryReasonsModule.QRPollingTimeout)
					
					return
				end
				UseResult1("Timeout")
			end
		end)
		
		return function()
			-- upvalues: Flag (ref)
			Flag = true
		end
	end, {})
	
	return if Text then ReactModule.createElement("ScreenGui", {
		DisplayOrder = 200,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Overlay = ReactModule.createElement(FullscreenPageWithSafeArea, { includeStatusBar = false, useFullScalePage = true }, {
			FocusNavigableSurface = ReactModule.createElement(FocusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.ModerationOverlay
			}, {
				Dialog = ReactModule.createElement(QRDeepLinkDialog, {
					deeplink = Text,
					title = UseLocalizationResult.title,
					description = UseLocalizationResult.description,
					footer = UseLocalizationResult.footer,
					onClose = if GetFFlagEnhancedPersonaLivenessEventsFunction() then function()
						-- upvalues: UseResult (copy), TelemetryReasonsModule (upval)
						UseResult(TelemetryReasonsModule.QRUserAbandon)
					end else UseResult
				})
			})
		})
	}) else ReactModule.createElement(Loading, {
		size = IconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end

return function(p2)
	-- upvalues: PersonaLivenessServiceWrapperModule (copy), ReactModule (copy), PersonaLivenessContainerModule (copy), PersonaLivenessQRFlow (copy)
	return if PersonaLivenessServiceWrapperModule.isAvailable() then ReactModule.createElement(PersonaLivenessContainerModule, {
		challengeId = p2.challengeId,
		onChallengeCompleted = p2.onChallengeCompleted,
		onChallengeAbandoned = p2.onChallengeAbandoned,
		onChallengeFailed = p2.onChallengeFailed
	}) else ReactModule.createElement(PersonaLivenessQRFlow, p2)
end