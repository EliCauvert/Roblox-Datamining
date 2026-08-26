local _ = require(script.Parent.ChallengeHeaders)
local genericChallenges = script:FindFirstAncestor("GenericChallenges")
local constantsModule = require(genericChallenges.Utils.constants)
local challengeTypeModule = require(genericChallenges.Types.ChallengeType)
local _ = require(genericChallenges.Types.ChallengeParameters)
local twoStepVerificationActionTypeModule = require(genericChallenges.Types.TwoStepVerificationActionType)
local captchaActionTypeModule = require(genericChallenges.Types.CaptchaActionType)
local parent = genericChallenges.Parent
local base64 = require(parent.AuthCommon).Utils.Base64
local notificationService = game:GetService("NotificationService")
local userInputService = game:GetService("UserInputService")
local urlBuilder = require(parent.UrlBuilder).UrlBuilder
local urlBase = require(parent.UrlBuilder).UrlBase
local cryoModule = require(parent.Cryo)

local function _()
	-- upvalues: notificationService (ref)
	return if string.lower(notificationService.SelectedTheme) == "dark" then "true" else "false"
end

local function getUserAppTypeQueryParam()
	-- upvalues: userInputService (ref)
	local platform = userInputService:GetPlatform()
	local var1 = "unknown"
	
	if platform == Enum.Platform.Android then
		var1 = "android"
		
		return var1
	elseif platform == Enum.Platform.IOS then
		var1 = "ios"
		
		return var1
	elseif platform == Enum.Platform.Windows then
		var1 = "windows"
		
		return var1
	elseif platform == Enum.Platform.OSX then
		var1 = "osx"
		
		return var1
	elseif platform == Enum.Platform.UWP then
		var1 = "uwp"
		
		return var1
	elseif platform == Enum.Platform.XBoxOne then
		var1 = "xbox"
	end
	return var1
end

local function getChallengeTypeQueryParameters(p1, p2)
	-- upvalues: challengeTypeModule (ref), captchaActionTypeModule (ref), twoStepVerificationActionTypeModule (ref)
	if p1 == challengeTypeModule.Captcha then
		assert(p2.actionType ~= nil, "actionType must be provided to render captcha")
		assert(p2.dataExchangeBlob ~= nil, "dataExchangeBlob must be provided to render captcha")
		assert(p2.captchaId ~= nil, "captchaId must be provided to render captcha")
		
		return {
			["action-type"] = captchaActionTypeModule.toRawValue(p2.actionType),
			["data-exchange-blob"] = p2.dataExchangeBlob,
			["captcha-id"] = p2.captchaId
		}
	elseif p1 == challengeTypeModule.TwoStepVerification then
		assert(p2.challengeId ~= nil, "challengeId must be provided to render 2sv")
		assert(p2.userId ~= nil, "userId must be provided to render 2sv")
		assert(p2.actionType ~= nil, "actionType must be provided to render 2sv")
		assert(p2.allowRememberDevice ~= nil, "allowRememberDevice must be provided to render 2sv")
		local t = {
			["challenge-id"] = p2.challengeId,
			["user-id"] = p2.userId,
			["action-type"] = twoStepVerificationActionTypeModule.toRawValue(p2.actionType),
			["allow-remember-device"] = if p2.allowRememberDevice then "true" else "false",
			["client-supports-2sv-recovery"] = if p2.clientSupports2svRecovery then "true" else "false"
		}
		
		if p2.recoverySessionId ~= nil and string.len(p2.recoverySessionId) > 0 then
			t["recovery-session-id"] = p2.recoverySessionId
		end
		return t
	elseif p1 == challengeTypeModule.SecurityQuestions then
		assert(p2.sessionId ~= nil, "sessionId must be provided to render security questions")
		assert(p2.userId ~= nil, "userId must be provided to render security questions")
		
		return { ["user-id"] = p2.userId, ["session-id"] = p2.sessionId }
	elseif p1 == challengeTypeModule.Reauthentication then
		return {}
	elseif p1 == challengeTypeModule.Generic then
		assert(p2.genericChallengeId ~= nil, "genericChallengeId must be provided to render challenge")
		assert(p2.genericChallengeType ~= nil, "genericChallengeType must be provided to render challenge")
		assert(p2.genericChallengeMetadata ~= nil, "genericChallengeMetadata must be provided to render challenge")
		
		return {
			["generic-challenge-id"] = p2.genericChallengeId,
			["generic-challenge-type"] = p2.genericChallengeType,
			["challenge-metadata-json"] = p2.genericChallengeMetadata
		}
	end
	return {}
end

return function(p1, p2, p3)
	-- upvalues: challengeTypeModule (ref), constantsModule (ref), getUserAppTypeQueryParam (ref), notificationService (ref), getChallengeTypeQueryParameters (ref), base64 (ref), urlBuilder (ref), urlBase (ref), cryoModule (ref)
	if p1 ~= nil then
		assert(p3 == nil, "challenge parameters cannot be specified for generic challenge rendering")
		assert(string.len(p1.challengeId) > 0, "challenge id does not exist")
		assert(p1.challengeType.typed ~= nil, "challenge is of an unknown type")
	end
	local generic = challengeTypeModule.Generic
	
	if p2 ~= nil then
		assert(challengeTypeModule.toRawValue(p2) ~= nil, "challenge type is not valid")
		generic = p2
	end
	local var1
	local t = {
		[constantsModule.appTypeQueryParam] = getUserAppTypeQueryParam(),
		[constantsModule.challengeTypeQueryParam] = challengeTypeModule.toRawValue(generic),
		[constantsModule.darkModeQueryParam] = if string.lower(notificationService.SelectedTheme) == "dark" then "true" else "false"
	}
	local _ = nil
	
	if p3 == nil then
		assert(p1 ~= nil, "challenge headers must be defined for generic challenge rendering")
		var1 = {
			[constantsModule.genericChallengeIdQueryParam] = p1.challengeId,
			[constantsModule.genericChallengeTypeQueryParam] = p1.challengeType.raw,
			[constantsModule.challengeMetadataJsonQueryParam] = base64.EncodeUrl(p1.challengeMetadata.decoded)
		}
	else
		var1 = getChallengeTypeQueryParameters(generic, p3)
	end
	return urlBuilder.new({
		path = "challenge/cdn/hybrid",
		base = urlBase.WWW,
		query = cryoModule.Dictionary.join(t, var1)
	})()
end