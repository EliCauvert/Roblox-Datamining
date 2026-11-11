local CorePackages = game:GetService("CorePackages")
local HttpService = game:GetService("HttpService")
local ReactModule = require(CorePackages.Packages.React)
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local AppLogging = require(CorePackages.Workspace.Packages.RoactServiceTags).AppLogging
local BiometricChallengeEventModule = require(Modules.LuaApp.Analytics.RobloxTelemetryConfigs.BiometricChallengeEvent)
local ChallengeEventConstantsModule = require(Modules.LuaApp.Components.Challenge.ChallengeEventConstants)
local GenericChallengesModule = require(CorePackages.Workspace.Packages.GenericChallenges)
local PersonaLivenessContainerFunction = GenericChallengesModule.Middleware.Challenges.PersonaLivenessContainer
local PersonaLivenessContainerV2Function = GenericChallengesModule.Middleware.Challenges.PersonaLivenessContainerV2
local BiometricTypeEnum = GenericChallengesModule.Middleware.Challenges.PersonaLivenessEnums.BiometricTypeEnum
local FFlagEnablePersonaLivenessQR = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnablePersonaLivenessQR
local ApiFetchAccessStatusModule = require(Modules.LuaApp.Thunks.Moderation.ApiFetchAccessStatus)

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), AppLogging (copy), HttpService (copy), ReactModule (copy), BiometricChallengeEventModule (copy), ChallengeEventConstantsModule (copy), BiometricTypeEnum (copy), FFlagEnablePersonaLivenessQR (copy), PersonaLivenessContainerV2Function (copy), ApiFetchAccessStatusModule (copy), PersonaLivenessContainerFunction (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(AppLogging)
	local BiometricType = HttpService:JSONDecode(p1.challengeMetadata).biometricType
	ReactModule.useEffect(function()
		-- upvalues: UseRoactServiceResult (copy), BiometricChallengeEventModule (upval), ChallengeEventConstantsModule (upval), p1 (copy), BiometricType (copy), BiometricTypeEnum (upval)
		UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
			context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInitialized,
			challengeId = p1.challengeId,
			biometricType = BiometricType
		})
		
		if BiometricType ~= BiometricTypeEnum.PersonaLiveness then
			UseRoactServiceResult:logRobloxTelemetryEvent(BiometricChallengeEventModule, {}, {
				context = ChallengeEventConstantsModule.ChallengeLifecycleEventConstants.ChallengeInvalidated,
				challengeId = p1.challengeId,
				biometricType = BiometricType
			})
			p1.onChallengeFailed(BiometricType)
		end
	end, {})
	
	return if BiometricType == BiometricTypeEnum.PersonaLiveness then if FFlagEnablePersonaLivenessQR then PersonaLivenessContainerV2Function({
		challengeId = p1.challengeId,
		onChallengeCompleted = p1.onChallengeCompleted,
		onChallengeAbandoned = p1.onChallengeAbandoned,
		onChallengeFailed = p1.onChallengeFailed,
		ApiFetchAccessStatus = ApiFetchAccessStatusModule
	}) else PersonaLivenessContainerFunction({
		challengeId = p1.challengeId,
		onChallengeCompleted = p1.onChallengeCompleted,
		onChallengeAbandoned = p1.onChallengeAbandoned,
		onChallengeFailed = p1.onChallengeFailed
	}) else ReactModule.createElement(ReactModule.Fragment, nil, {})
end