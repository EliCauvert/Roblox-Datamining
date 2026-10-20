local _ = require(script.Parent.ChallengeHeaders)
local GenericChallenges = script:FindFirstAncestor("GenericChallenges")
local ConstantsModule = require(GenericChallenges.Utils.constants)
local ChallengeTypeModule = require(GenericChallenges.Types.ChallengeType)
local _ = require(GenericChallenges.Types.ChallengeParameters)
local TwoStepVerificationActionTypeModule = require(GenericChallenges.Types.TwoStepVerificationActionType)
local CaptchaActionTypeModule = require(GenericChallenges.Types.CaptchaActionType)
local Parent = GenericChallenges.Parent
local Base64 = require(Parent.AuthCommon).Utils.Base64
local NotificationService = game:GetService("NotificationService")
local UserInputService = game:GetService("UserInputService")
local UrlBuilder = require(Parent.UrlBuilder).UrlBuilder
local UrlBase = require(Parent.UrlBuilder).UrlBase
local CryoModule = require(Parent.Cryo)

local function _(): string
	-- upvalues: NotificationService (copy)
	return if string.lower(NotificationService.SelectedTheme) == "dark" then "true" else "false"
end

local function getUserAppTypeQueryParam(): string
	-- upvalues: UserInputService (copy)
	local Platform = UserInputService:GetPlatform()
	local v1 = "unknown"
	
	if Platform == Enum.Platform.Android then
		v1 = "android"
		
		return v1
	end
	if Platform == Enum.Platform.IOS then
		v1 = "ios"
		
		return v1
	end
	if Platform == Enum.Platform.Windows then
		v1 = "windows"
		
		return v1
	end
	if Platform == Enum.Platform.OSX then
		v1 = "osx"
		
		return v1
	end
	if Platform == Enum.Platform.UWP then
		v1 = "uwp"
		
		return v1
	end
	if Platform == Enum.Platform.XBoxOne then
		v1 = "xbox"
	end
	return v1
end

local function getChallengeTypeQueryParameters(Generic, p1)
	-- upvalues: ChallengeTypeModule (copy), CaptchaActionTypeModule (copy), TwoStepVerificationActionTypeModule (copy)
	if Generic == ChallengeTypeModule.Captcha then
		assert(p1.actionType ~= nil, "actionType must be provided to render captcha")
		assert(p1.dataExchangeBlob ~= nil, "dataExchangeBlob must be provided to render captcha")
		assert(p1.captchaId ~= nil, "captchaId must be provided to render captcha")
		
		return {
			["action-type"] = CaptchaActionTypeModule.toRawValue(p1.actionType),
			["data-exchange-blob"] = p1.dataExchangeBlob,
			["captcha-id"] = p1.captchaId
		}
	end
	if Generic == ChallengeTypeModule.TwoStepVerification then
		assert(p1.challengeId ~= nil, "challengeId must be provided to render 2sv")
		assert(p1.userId ~= nil, "userId must be provided to render 2sv")
		assert(p1.actionType ~= nil, "actionType must be provided to render 2sv")
		assert(p1.allowRememberDevice ~= nil, "allowRememberDevice must be provided to render 2sv")
		local config = {
			["challenge-id"] = p1.challengeId,
			["user-id"] = p1.userId,
			["action-type"] = TwoStepVerificationActionTypeModule.toRawValue(p1.actionType),
			["allow-remember-device"] = if p1.allowRememberDevice then "true" else "false",
			["client-supports-2sv-recovery"] = if p1.clientSupports2svRecovery then "true" else "false"
		}
		
		if p1.recoverySessionId ~= nil and string.len(p1.recoverySessionId) > 0 then
			config["recovery-session-id"] = p1.recoverySessionId
		end
		return config
	elseif Generic == ChallengeTypeModule.SecurityQuestions then
		assert(p1.sessionId ~= nil, "sessionId must be provided to render security questions")
		assert(p1.userId ~= nil, "userId must be provided to render security questions")
		
		return { ["user-id"] = p1.userId, ["session-id"] = p1.sessionId }
	elseif Generic == ChallengeTypeModule.Reauthentication then
		return {}
	elseif Generic == ChallengeTypeModule.Generic then
		assert(p1.genericChallengeId ~= nil, "genericChallengeId must be provided to render challenge")
		assert(p1.genericChallengeType ~= nil, "genericChallengeType must be provided to render challenge")
		assert(p1.genericChallengeMetadata ~= nil, "genericChallengeMetadata must be provided to render challenge")
		
		return {
			["generic-challenge-id"] = p1.genericChallengeId,
			["generic-challenge-type"] = p1.genericChallengeType,
			["challenge-metadata-json"] = p1.genericChallengeMetadata
		}
	else
		return {}
	end
end

return function(p1, p2, p3)
	-- upvalues: ChallengeTypeModule (copy), ConstantsModule (copy), getUserAppTypeQueryParam (copy), NotificationService (copy), getChallengeTypeQueryParameters (copy), Base64 (copy), UrlBuilder (copy), UrlBase (copy), CryoModule (copy)
	if p1 ~= nil then
		assert(p3 == nil, "challenge parameters cannot be specified for generic challenge rendering")
		assert(string.len(p1.challengeId) > 0, "challenge id does not exist")
		assert(p1.challengeType.typed ~= nil, "challenge is of an unknown type")
	end
	local Generic = ChallengeTypeModule.Generic
	
	if p2 ~= nil then
		assert(ChallengeTypeModule.toRawValue(p2) ~= nil, "challenge type is not valid")
		Generic = p2
	end
	local IsDark = string.lower(NotificationService.SelectedTheme) == "dark"
	local config = {
		[ConstantsModule.appTypeQueryParam] = getUserAppTypeQueryParam(),
		[ConstantsModule.challengeTypeQueryParam] = ChallengeTypeModule.toRawValue(Generic),
		[ConstantsModule.darkModeQueryParam] = if IsDark then "true" else "false"
	}
	local ChallengeTypeQueryParameters = nil
	
	if p3 == nil then
		assert(p1 ~= nil, "challenge headers must be defined for generic challenge rendering")
		ChallengeTypeQueryParameters = {
			[ConstantsModule.genericChallengeIdQueryParam] = p1.challengeId,
			[ConstantsModule.genericChallengeTypeQueryParam] = p1.challengeType.raw,
			[ConstantsModule.challengeMetadataJsonQueryParam] = Base64.EncodeUrl(p1.challengeMetadata.decoded)
		}
	else
		ChallengeTypeQueryParameters = getChallengeTypeQueryParameters(Generic, p3)
	end
	return UrlBuilder.new({
		path = "challenge/cdn/hybrid",
		base = UrlBase.WWW,
		query = CryoModule.Dictionary.join(config, ChallengeTypeQueryParameters)
	})()
end