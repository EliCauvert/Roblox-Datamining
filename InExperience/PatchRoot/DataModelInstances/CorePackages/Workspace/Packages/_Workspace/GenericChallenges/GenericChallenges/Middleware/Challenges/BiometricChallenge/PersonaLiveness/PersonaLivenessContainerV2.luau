local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local parent = genericChallenges.Parent
local playersService = game:GetService("Players")
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local useLocalization = require(parent.Localization).Hooks.useLocalization
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local fullscreenPageWithSafeArea = require(parent.AppBlox).FullscreenPageWithSafeArea
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local focusNavigableSurfaceWrapper = focusNavigationUtilsModule.FocusNavigableSurfaceWrapper
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local personaLivenessContainerModule = require(script.Parent.PersonaLivenessContainer)
local personaLivenessServiceWrapperModule = require(script.Parent.PersonaLivenessServiceWrapper)
local QRDeepLinkDialog = require(parent.IdentityVerification).QRDeepLinkDialog
local biometricTypeEnum = require(script.Parent.Parent.Common.Enums).BiometricTypeEnum
local telemetryReasonsModule = require(script.Parent.Parent.Common.TelemetryReasons)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appLogging = require(parent.RoactServiceTags).AppLogging
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local biometricChallengeEventModule = require(script.Parent.Parent.Common.BiometricChallengeEvent)
local challengeEventConstantsModule = require(genericChallenges.Utils.ChallengeEventConstants)
local getFFlagEnhancedPersonaLivenessEvents = require(parent.SharedFlags).GetFFlagEnhancedPersonaLivenessEvents
local fFlagUseSignalsForUserAccess = require(parent.SharedFlags).FFlagUseSignalsForUserAccess
local useSignalState = require(parent.SignalsReact).useSignalState
local var1 = if fFlagUseSignalsForUserAccess then require(parent.UserAccessStore).GetUserAccessStore else nil
local personaLivenessV2QrPollDelaySec = game:DefineFastInt("PersonaLivenessV2QrPollDelaySec", 6)
local personaLivenessV2QrPollMaxRetries = game:DefineFastInt("PersonaLivenessV2QrPollMaxRetries", 60)

local function defaultGetLocalUserId()
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer then localPlayer.UserId else nil
end

local function _(p1)
	return "https://ro.blox.com/Ebh5" .. "?pid=QR_code&c=liveness_onelink" .. "&is_retargeting=false" .. "&af_dp=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(p1) .. "&deep_link_value=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(p1)
end

local function PersonaLivenessQRFlow(p1)
	-- upvalues: useDispatch (ref), useRoactService (ref), appLogging (ref), roactNetworking (ref), fFlagUseSignalsForUserAccess (ref), useSignalState (ref), var1 (ref), useSelector (ref), defaultGetLocalUserId (ref), useLocalization (ref), reactModule (ref), getFFlagEnhancedPersonaLivenessEvents (ref), biometricChallengeEventModule (ref), challengeEventConstantsModule (ref), biometricTypeEnum (ref), telemetryReasonsModule (ref), personaLivenessV2QrPollMaxRetries (ref), personaLivenessV2QrPollDelaySec (ref), loading (ref), iconSize (ref), fullscreenPageWithSafeArea (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), QRDeepLinkDialog (ref)
	local var2 = useDispatch()
	local var3 = useRoactService(appLogging)
	local var4 = useRoactService(roactNetworking)
	local var5 = if fFlagUseSignalsForUserAccess then useSignalState(var1(false).getUserAccessRestrictionDetail) else useSelector(function(p2)
		return p2.UserAccess and p2.UserAccess.restrictionDetail
	end)
	local var6 = (p1.getLocalUserId or defaultGetLocalUserId)()
	local var7 = if var6 and var6 > 0 then "https://ro.blox.com/Ebh5" .. "?pid=QR_code&c=liveness_onelink" .. "&is_retargeting=false" .. "&af_dp=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(var6) .. "&deep_link_value=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(var6) else nil
	local var8 = useLocalization({
		title = "Feature.BiometricChallenge.Title.QRHandoff",
		description = "Feature.BiometricChallenge.Content.ScanQR",
		footer = {
			"Feature.BiometricChallenge.Content.QRHelpFull",
			prompt = "<b>" .. useLocalization({
				prompt = "Feature.BiometricChallenge.Content.QRHelpPrompt"
			}).prompt .. "</b>"
		}
	})
	local var9 = reactModule.useRef(false)
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref), p1 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var3 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), biometricTypeEnum (copy)
		if var9.current then return end
		var9.current = true
		p1.onChallengeAbandoned("")
		
		if getFFlagEnhancedPersonaLivenessEvents() then
			var3:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
				challengeId = p1.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = p2
			})
			
			return
		end
		var3:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
			challengeId = p1.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness
		})
	end, { var3, p1.challengeId, p1.onChallengeAbandoned })
	local var11 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var9 (ref), p1 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var3 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), biometricTypeEnum (copy)
		if var9.current then return end
		var9.current = true
		p1.onChallengeFailed(p2)
		
		if getFFlagEnhancedPersonaLivenessEvents() then
			var3:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p1.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = p3
			})
			
			return
		end
		var3:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
			challengeId = p1.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness
		})
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var11 (ref), telemetryReasonsModule (copy)
		if not var7 then
			if getFFlagEnhancedPersonaLivenessEvents() then
				var11("MissingLocalUserId", telemetryReasonsModule.NullUserId)
				
				return
			end
			var11("MissingLocalUserId")
		end
	end, { var7, var11 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), var5 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var9 (ref), var3 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), p1 (ref), biometricTypeEnum (copy), telemetryReasonsModule (copy), var10 (ref)
		if not var7 or var5 ~= nil then return end
		if not getFFlagEnhancedPersonaLivenessEvents() then
			var10()
			
			return
		elseif var9.current then
			return
		end
		var9.current = true
		var3:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
			challengeId = p1.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness,
			reason = telemetryReasonsModule.QRCompleted
		})
		p1.onChallengeAbandoned("")
	end, {
		var5, var7, var10, var3, p1.challengeId, p1.onChallengeAbandoned
	})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var3 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), p1 (ref), biometricTypeEnum (copy), telemetryReasonsModule (copy), personaLivenessV2QrPollMaxRetries (copy), personaLivenessV2QrPollDelaySec (copy), var2 (ref), var4 (ref), var11 (ref)
		if not var7 then return end
		if getFFlagEnhancedPersonaLivenessEvents() then
			var3:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeDisplayed,
				challengeId = p1.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = telemetryReasonsModule.QRDisplayed
			})
		end
		local var12 = false
		task.spawn(function()
			-- upvalues: personaLivenessV2QrPollMaxRetries (copy), personaLivenessV2QrPollDelaySec (copy), var12 (write), p1 (copy), var2 (copy), var4 (copy), getFFlagEnhancedPersonaLivenessEvents (copy), var11 (copy), telemetryReasonsModule (copy)
			for _ = 1, personaLivenessV2QrPollMaxRetries do
				task.wait(personaLivenessV2QrPollDelaySec)
				
				if not var12 then
					if p1.ApiFetchAccessStatus then
						var2(p1.ApiFetchAccessStatus(var4))
					end
				end
				return
			end
			if not var12 then
				if getFFlagEnhancedPersonaLivenessEvents() then
					var11("Timeout", telemetryReasonsModule.QRPollingTimeout)
					
					return
				end
				var11("Timeout")
			end
		end)
		
		return function()
			-- upvalues: var12 (write)
			var12 = true
		end
	end, {})
	
	return if var7 then reactModule.createElement("ScreenGui", {
		DisplayOrder = 200,
		IgnoreGuiInset = true,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Overlay = reactModule.createElement(fullscreenPageWithSafeArea, { includeStatusBar = false, useFullScalePage = true }, {
			FocusNavigableSurface = reactModule.createElement(focusNavigableSurfaceWrapper, {
				isIsolated = true,
				surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.ModerationOverlay
			}, {
				Dialog = reactModule.createElement(QRDeepLinkDialog, {
					deeplink = var7,
					title = var8.title,
					description = var8.description,
					footer = var8.footer,
					onClose = if getFFlagEnhancedPersonaLivenessEvents() then function()
						-- upvalues: var10 (ref), telemetryReasonsModule (copy)
						var10(telemetryReasonsModule.QRUserAbandon)
					end else var10
				})
			})
		})
	}) else reactModule.createElement(loading, {
		size = iconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end

return function(p2)
	-- upvalues: personaLivenessServiceWrapperModule (ref), reactModule (ref), personaLivenessContainerModule (ref), PersonaLivenessQRFlow (ref)
	return if personaLivenessServiceWrapperModule.isAvailable() then reactModule.createElement(personaLivenessContainerModule, {
		challengeId = p2.challengeId,
		onChallengeCompleted = p2.onChallengeCompleted,
		onChallengeAbandoned = p2.onChallengeAbandoned,
		onChallengeFailed = p2.onChallengeFailed
	}) else reactModule.createElement(PersonaLivenessQRFlow, p2)
end