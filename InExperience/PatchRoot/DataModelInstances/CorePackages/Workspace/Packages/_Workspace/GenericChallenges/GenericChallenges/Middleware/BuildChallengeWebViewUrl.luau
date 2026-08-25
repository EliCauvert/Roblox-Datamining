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
	local var11 = "unknown"
	
	if platform == Enum.Platform.Android then
		var11 = "android"
		
		return var11
	elseif platform == Enum.Platform.IOS then
		var11 = "ios"
		
		return var11
	elseif platform == Enum.Platform.Windows then
		var11 = "windows"
		
		return var11
	elseif platform == Enum.Platform.OSX then
		var11 = "osx"
		
		return var11
	elseif platform == Enum.Platform.UWP then
		var11 = "uwp"
		
		return var11
	elseif platform == Enum.Platform.XBoxOne then
		var11 = "xbox"
	end
	return var11
end

local function getChallengeTypeQueryParameters(p0, p1)
	-- upvalues: challengeTypeModule (ref), captchaActionTypeModule (ref), twoStepVerificationActionTypeModule (ref)
	if p0 == challengeTypeModule.Captcha then
		assert(p1.actionType ~= nil, "actionType must be provided to render captcha")
		assert(p1.dataExchangeBlob ~= nil, "dataExchangeBlob must be provided to render captcha")
		assert(p1.captchaId ~= nil, "captchaId must be provided to render captcha")
		
		return {
			["action-type"] = captchaActionTypeModule.toRawValue(p1.actionType),
			["data-exchange-blob"] = p1.dataExchangeBlob,
			["captcha-id"] = p1.captchaId
		}
	elseif p0 == challengeTypeModule.TwoStepVerification then
		assert(p1.challengeId ~= nil, "challengeId must be provided to render 2sv")
		assert(p1.userId ~= nil, "userId must be provided to render 2sv")
		assert(p1.actionType ~= nil, "actionType must be provided to render 2sv")
		assert(p1.allowRememberDevice ~= nil, "allowRememberDevice must be provided to render 2sv")
		local t = {
			["challenge-id"] = p1.challengeId,
			["user-id"] = p1.userId,
			["action-type"] = twoStepVerificationActionTypeModule.toRawValue(p1.actionType),
			["allow-remember-device"] = if p1.allowRememberDevice then "true" else "false",
			["client-supports-2sv-recovery"] = if p1.clientSupports2svRecovery then "true" else "false"
		}
		
		if p1.recoverySessionId ~= nil and string.len(p1.recoverySessionId) > 0 then
			t["recovery-session-id"] = p1.recoverySessionId
		end
		return t
	elseif p0 == challengeTypeModule.SecurityQuestions then
		assert(p1.sessionId ~= nil, "sessionId must be provided to render security questions")
		assert(p1.userId ~= nil, "userId must be provided to render security questions")
		
		return { ["user-id"] = p1.userId, ["session-id"] = p1.sessionId }
	elseif p0 == challengeTypeModule.Reauthentication then
		return {}
	elseif p0 == challengeTypeModule.Generic then
		assert(p1.genericChallengeId ~= nil, "genericChallengeId must be provided to render challenge")
		assert(p1.genericChallengeType ~= nil, "genericChallengeType must be provided to render challenge")
		assert(p1.genericChallengeMetadata ~= nil, "genericChallengeMetadata must be provided to render challenge")
		
		return {
			["generic-challenge-id"] = p1.genericChallengeId,
			["generic-challenge-type"] = p1.genericChallengeType,
			["challenge-metadata-json"] = p1.genericChallengeMetadata
		}
	end
	return {}
end

return function(p2, p3, p4)
	-- upvalues: challengeTypeModule (ref), constantsModule (ref), getUserAppTypeQueryParam (ref), notificationService (ref), getChallengeTypeQueryParameters (ref), base64 (ref), urlBuilder (ref), urlBase (ref), cryoModule (ref)
	if p2 ~= nil then
		assert(p4 == nil, "challenge parameters cannot be specified for generic challenge rendering")
		assert(string.len(p2.challengeId) > 0, "challenge id does not exist")
		assert(p2.challengeType.typed ~= nil, "challenge is of an unknown type")
	end
	local generic = challengeTypeModule.Generic
	
	if p3 ~= nil then
		assert(challengeTypeModule.toRawValue(p3) ~= nil, "challenge type is not valid")
		generic = p3
	end
	local var14
	local t = {
		[constantsModule.appTypeQueryParam] = getUserAppTypeQueryParam(),
		[constantsModule.challengeTypeQueryParam] = challengeTypeModule.toRawValue(generic),
		[constantsModule.darkModeQueryParam] = if string.lower(notificationService.SelectedTheme) == "dark" then "true" else "false"
	}
	local _ = nil
	
	if p4 == nil then
		assert(p2 ~= nil, "challenge headers must be defined for generic challenge rendering")
		var14 = {
			[constantsModule.genericChallengeIdQueryParam] = p2.challengeId,
			[constantsModule.genericChallengeTypeQueryParam] = p2.challengeType.raw,
			[constantsModule.challengeMetadataJsonQueryParam] = base64.EncodeUrl(p2.challengeMetadata.decoded)
		}
	else
		var14 = getChallengeTypeQueryParameters(generic, p4)
	end
	return urlBuilder.new({
		path = "challenge/cdn/hybrid",
		base = urlBase.WWW,
		query = cryoModule.Dictionary.join(t, var14)
	})()
end