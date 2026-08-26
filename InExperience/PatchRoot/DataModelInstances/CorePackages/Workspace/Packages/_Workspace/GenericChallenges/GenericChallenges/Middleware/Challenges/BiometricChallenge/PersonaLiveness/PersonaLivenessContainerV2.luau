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

local function _(p1)
	return "https://ro.blox.com/Ebh5" .. "?pid=QR_code&c=liveness_onelink" .. "&is_retargeting=false" .. "&af_dp=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(p1) .. "&deep_link_value=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(p1)
end

local function PersonaLivenessQRFlow(p1)
	-- upvalues: useDispatch (ref), useRoactService (ref), appLogging (ref), roactNetworking (ref), useSelector (ref), defaultGetLocalUserId (ref), useLocalization (ref), reactModule (ref), getFFlagEnhancedPersonaLivenessEvents (ref), biometricChallengeEventModule (ref), challengeEventConstantsModule (ref), biometricTypeEnum (ref), telemetryReasonsModule (ref), personaLivenessV2QrPollMaxRetries (ref), personaLivenessV2QrPollDelaySec (ref), loading (ref), iconSize (ref), fullscreenPageWithSafeArea (ref), focusNavigableSurfaceWrapper (ref), focusNavigableSurfaceIdentifierEnum (ref), QRDeepLinkDialog (ref)
	local var1 = useDispatch()
	local var2 = useRoactService(appLogging)
	local var3 = useRoactService(roactNetworking)
	local var4 = useSelector(function(p2)
		return p2.UserAccess and p2.UserAccess.restrictionDetail
	end)
	local var5 = (p1.getLocalUserId or defaultGetLocalUserId)()
	local var6 = if var5 and var5 > 0 then "https://ro.blox.com/Ebh5" .. "?pid=QR_code&c=liveness_onelink" .. "&is_retargeting=false" .. "&af_dp=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(var5) .. "&deep_link_value=" .. "roblox%3A%2F%2Fnavigation%2Faccount_unlock%3Fuser_id=" .. tostring(var5) else nil
	local var7 = useLocalization({
		title = "Feature.BiometricChallenge.Title.QRHandoff",
		description = "Feature.BiometricChallenge.Content.ScanQR",
		footer = {
			"Feature.BiometricChallenge.Content.QRHelpFull",
			prompt = "<b>" .. useLocalization({
				prompt = "Feature.BiometricChallenge.Content.QRHelpPrompt"
			}).prompt .. "</b>"
		}
	})
	local var8 = reactModule.useRef(false)
	local var9 = reactModule.useCallback(function(p2)
		-- upvalues: var8 (ref), p1 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var2 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), biometricTypeEnum (copy)
		if var8.current then return end
		var8.current = true
		p1.onChallengeAbandoned("")
		
		if getFFlagEnhancedPersonaLivenessEvents() then
			var2:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
				challengeId = p1.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = p2
			})
			
			return
		end
		var2:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeAbandoned,
			challengeId = p1.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness
		})
	end, { var2, p1.challengeId, p1.onChallengeAbandoned })
	local var10 = reactModule.useCallback(function(p2, p3)
		-- upvalues: var8 (ref), p1 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var2 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), biometricTypeEnum (copy)
		if var8.current then return end
		var8.current = true
		p1.onChallengeFailed(p2)
		
		if getFFlagEnhancedPersonaLivenessEvents() then
			var2:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p1.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = p3
			})
			
			return
		end
		var2:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
			challengeId = p1.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness
		})
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var10 (ref), telemetryReasonsModule (copy)
		if not var6 then
			if getFFlagEnhancedPersonaLivenessEvents() then
				var10("MissingLocalUserId", telemetryReasonsModule.NullUserId)
				
				return
			end
			var10("MissingLocalUserId")
		end
	end, { var6, var10 })
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var4 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var8 (ref), var2 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), p1 (ref), biometricTypeEnum (copy), telemetryReasonsModule (copy), var9 (ref)
		if not var6 or var4 ~= nil then return end
		if not getFFlagEnhancedPersonaLivenessEvents() then
			var9()
			
			return
		elseif var8.current then
			return
		end
		var8.current = true
		var2:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
			context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeCompleted,
			challengeId = p1.challengeId,
			biometricType = biometricTypeEnum.PersonaLiveness,
			reason = telemetryReasonsModule.QRCompleted
		})
		p1.onChallengeAbandoned("")
	end, {
		var4, var6, var9, var2, p1.challengeId, p1.onChallengeAbandoned
	})
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), getFFlagEnhancedPersonaLivenessEvents (copy), var2 (ref), biometricChallengeEventModule (copy), challengeEventConstantsModule (copy), p1 (ref), biometricTypeEnum (copy), telemetryReasonsModule (copy), personaLivenessV2QrPollMaxRetries (copy), personaLivenessV2QrPollDelaySec (copy), var1 (ref), var3 (ref), var10 (ref)
		if not var6 then return end
		if getFFlagEnhancedPersonaLivenessEvents() then
			var2:logRobloxTelemetryEvent(biometricChallengeEventModule, {}, {
				context = challengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeDisplayed,
				challengeId = p1.challengeId,
				biometricType = biometricTypeEnum.PersonaLiveness,
				reason = telemetryReasonsModule.QRDisplayed
			})
		end
		local var11 = false
		task.spawn(function()
			-- upvalues: personaLivenessV2QrPollMaxRetries (copy), personaLivenessV2QrPollDelaySec (copy), var11 (write), p1 (copy), var1 (copy), var3 (copy), getFFlagEnhancedPersonaLivenessEvents (copy), var10 (copy), telemetryReasonsModule (copy)
			for _ = 1, personaLivenessV2QrPollMaxRetries do
				task.wait(personaLivenessV2QrPollDelaySec)
				
				if not var11 then
					if p1.ApiFetchAccessStatus then
						var1(p1.ApiFetchAccessStatus(var3))
					end
				end
				return
			end
			if not var11 then
				if getFFlagEnhancedPersonaLivenessEvents() then
					var10("Timeout", telemetryReasonsModule.QRPollingTimeout)
					
					return
				end
				var10("Timeout")
			end
		end)
		
		return function()
			-- upvalues: var11 (write)
			var11 = true
		end
	end, {})
	
	return if var6 then reactModule.createElement("ScreenGui", {
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
					deeplink = var6,
					title = var7.title,
					description = var7.description,
					footer = var7.footer,
					onClose = if getFFlagEnhancedPersonaLivenessEvents() then function()
						-- upvalues: var9 (ref), telemetryReasonsModule (copy)
						var9(telemetryReasonsModule.QRUserAbandon)
					end else var9
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