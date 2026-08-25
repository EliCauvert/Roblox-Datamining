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
local personaLivenessV2QrPollDelaySec = game:DefineFastInt("PersonaLivenessV2QrPollDelaySec", 6)
local personaLivenessV2QrPollMaxRetries = game:DefineFastInt("PersonaLivenessV2QrPollMaxRetries", 60)

local function defaultGetLocalUserId()
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer then localPlayer.UserId else nil
end

local function _(p0)
	return "https://ro.blox.com/Ebh5" .. "?pid=QR_code&c=liveness_onelink" .. "&is_retargeting=false" .. "&af_dp=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(p0) .. "&deep_link_value=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(p0)
end

local function PersonaLivenessQRFlow(p1)
	-- upvalues: useDispatch (ref), useRoactService (ref), appLogging (ref), roactNetworking (ref), useSelector (ref), defaultGetLocalUserId (ref), useLocalization (ref), reactModule (ref), getFFlagEnhancedPersonaLivenessEvents (ref), biometricChallengeEventModule (ref), challengeEventConstantsModule (ref), biometricTypeEnum (ref), telemetryReasonsModule (ref), personaLivenessV2QrPollMaxRetries (ref), personaLivenessV2QrPollDelaySec (ref), loading (ref), iconSize (ref), fullscreenPageWithSafeArea (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), QRDeepLinkDialog (ref)
	local var14 = useDispatch()
	local var15 = useRoactService(appLogging)
	local var16 = useRoactService(roactNetworking)
	local var17 = useSelector(function(p2)
		return p2.UserAccess and p2.UserAccess.restrictionDetail
	end)
	local var18 = (p1.getLocalUserId or defaultGetLocalUserId)()
	local var19 = if var18 and var18 > 0 then "https://ro.blox.com/Ebh5" .. "?pid=QR_code&c=liveness_onelink" .. "&is_retargeting=false" .. "&af_dp=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(var18) .. "&deep_link_value=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(var18) else nil
	local var20 = useLocalization({
		title = "Feature.BiometricChallenge.Title.QRHandoff",
		description = "Feature.BiometricChallenge.Content.ScanQR",
		footer = {
			"Feature.BiometricChallenge.Content.QRHelpFull",
			prompt = "<b>" .. useLocalization({
				prompt = "Feature.BiometricChallenge.Content.QRHelpPrompt"
			}).prompt .. "</b>"
		}
	})
	local var21 = reactModule.useRef(false)
	local var22 = reactModule.useCallback(function(p3)
		-- upvalues: var21 (ref), p1 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var15 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), biometricTypeEnum (copy)
		if var21.current then return end
		var21.current = true
		p1.onChallengeAbandoned("")
		
		if getFFlagEnhancedPersonaLivenessEvents() then
			var15:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
				challengeId = p1.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = p3
			})
			
			return
		end
		var15:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
			challengeId = p1.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness
		})
	end, { var15, p1.challengeId, p1.onChallengeAbandoned })
	local var23 = reactModule.useCallback(function(p4, p5)
		-- upvalues: var21 (ref), p1 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var15 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), biometricTypeEnum (copy)
		if var21.current then return end
		var21.current = true
		p1.onChallengeFailed(p4)
		
		if getFFlagEnhancedPersonaLivenessEvents() then
			var15:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p1.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = p5
			})
			
			return
		end
		var15:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
			challengeId = p1.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness
		})
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var23 (ref), telemetryReasonsModule (copy)
		if not var19 then
			if getFFlagEnhancedPersonaLivenessEvents() then
				var23("MissingLocalUserId", telemetryReasonsModule.NullUserId)
				
				return
			end
			var23("MissingLocalUserId")
		end
	end, { var19, var23 })
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), var17 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var21 (ref), var15 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), p1 (ref), biometricTypeEnum (copy), telemetryReasonsModule (copy), var22 (ref)
		if not var19 or var17 ~= nil then return end
		if not getFFlagEnhancedPersonaLivenessEvents() then
			var22()
			
			return
		elseif var21.current then
			return
		end
		var21.current = true
		var15:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
			challengeId = p1.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness,
			reason = telemetryReasonsModule.QRCompleted
		})
		p1.onChallengeAbandoned("")
	end, {
		var17, var19, var22, var15, p1.challengeId, p1.onChallengeAbandoned
	})
	reactModule.useEffect(function()
		-- upvalues: var19 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var15 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), p1 (ref), biometricTypeEnum (copy), telemetryReasonsModule (copy), personaLivenessV2QrPollMaxRetries (copy), personaLivenessV2QrPollDelaySec (copy), var14 (ref), var16 (ref), var23 (ref)
		if not var19 then return end
		if getFFlagEnhancedPersonaLivenessEvents() then
			var15:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeDisplayed,
				challengeId = p1.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = telemetryReasonsModule.QRDisplayed
			})
		end
		local var24 = false
		task.spawn(function()
			-- upvalues: personaLivenessV2QrPollMaxRetries (copy), personaLivenessV2QrPollDelaySec (copy), var24 (write), p1 (copy), var14 (copy), var16 (copy), getFFlagEnhancedPersonaLivenessEvents (copy), var23 (copy), telemetryReasonsModule (copy)
			for _ = 1, personaLivenessV2QrPollMaxRetries do
				task.wait(personaLivenessV2QrPollDelaySec)
				
				if not var24 then
					if p1.ApiFetchAccessStatus then
						var14(p1.ApiFetchAccessStatus(var16))
					end
				end
				return
			end
			if not var24 then
				if getFFlagEnhancedPersonaLivenessEvents() then
					var23("Timeout", telemetryReasonsModule.QRPollingTimeout)
					
					return
				end
				var23("Timeout")
			end
		end)
		
		return function()
			-- upvalues: var24 (write)
			var24 = true
		end
	end, {})
	
	return if var19 then reactModule.createElement("ScreenGui", {
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
					deeplink = var19,
					title = var20.title,
					description = var20.description,
					footer = var20.footer,
					onClose = if getFFlagEnhancedPersonaLivenessEvents() then function()
						-- upvalues: var22 (ref), telemetryReasonsModule (copy)
						var22(telemetryReasonsModule.QRUserAbandon)
					end else var22
				})
			})
		})
	}) else reactModule.createElement(loading, {
		size = iconSize.Medium,
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5)
	})
end

return function(p6)
	-- upvalues: personaLivenessServiceWrapperModule (ref), reactModule (ref), personaLivenessContainerModule (ref), PersonaLivenessQRFlow (ref)
	return if personaLivenessServiceWrapperModule.isAvailable() then reactModule.createElement(personaLivenessContainerModule, {
		challengeId = p6.challengeId,
		onChallengeCompleted = p6.onChallengeCompleted,
		onChallengeAbandoned = p6.onChallengeAbandoned,
		onChallengeFailed = p6.onChallengeFailed
	}) else reactModule.createElement(PersonaLivenessQRFlow, p6)
end