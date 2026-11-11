local Parent = script.Parent.Parent.Parent
local HttpService = game:GetService("HttpService")
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local APIUtilModule = require(Parent.util.APIUtil)
local GetFFlagUGCValidateEmotesBonesAllowedModule = require(Parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local GetFFlagUGCValidateEmotesBoneUserVerificationModule = require(Parent.flags.getFFlagUGCValidateEmotesBoneUserVerification)
local GetFFlagUGCValidateAnimBonesSupportModule = require(Parent.flags.getFFlagUGCValidateAnimBonesSupport)
local GetFFlagUGCValidationAnimationPackSupportModule = require(Parent.flags.getFFlagUGCValidationAnimationPackSupport)
local config = {
	categories = { ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if GetFFlagUGCValidateAnimBonesSupportModule() and GetFFlagUGCValidationAnimationPackSupportModule() then
	table.insert(config.categories, ValidationEnumsModule.UploadCategory.ANIMATION)
end
config.requiredData = { ValidationEnumsModule.SharedDataMember.consumerConfig }
config.conditionalData = { ValidationEnumsModule.SharedDataMember.curveAnimBoneData }

function config.fflag()
	-- upvalues: GetFFlagUGCValidateEmotesBonesAllowedModule (copy), GetFFlagUGCValidateAnimBonesSupportModule (copy)
	return GetFFlagUGCValidateEmotesBonesAllowedModule() or GetFFlagUGCValidateAnimBonesSupportModule()
end

config.expectedFailures = {}
config.prereqTests = {
	ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function checkTrustedCreatorPermission()
	-- upvalues: APIUtilModule (copy), HttpService (copy)
	local RequestAndRetryGetResult, RequestAndRetryGetResult2 = APIUtilModule.requestAndRetryGet((string.format("https://itemconfiguration.%s/v1/permissions/action-allowed-for-item-type?trustedCreatorCheck=true&action=1&assetType=61", APIUtilModule.getBaseDomain())))
	
	if not RequestAndRetryGetResult then
		return false, "Failed to check trusted creator permission: " .. tostring(RequestAndRetryGetResult2)
	end
	local Success, Result = pcall(function()
		-- upvalues: HttpService (upval), RequestAndRetryGetResult2 (copy)
		return HttpService:JSONDecode(RequestAndRetryGetResult2)
	end)
	
	if Success then
		return Result.isActionAllowed == true, nil
	else
		return false, "Failed to decode permission response"
	end
end

function config.run(p1, p2)
	-- upvalues: GetFFlagUGCValidateEmotesBoneUserVerificationModule (copy), ValidationEnumsModule (copy), ErrorSourceStringsModule (copy), checkTrustedCreatorPermission (copy)
	if not GetFFlagUGCValidateEmotesBoneUserVerificationModule() then return end
	local ConsumerEnv = p2.consumerConfig.consumerEnv
	
	if ConsumerEnv == ValidationEnumsModule.ConsumerEnv.IEC then
		p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BonesNotAllowed)
		
		return
	end
	if ConsumerEnv ~= ValidationEnumsModule.ConsumerEnv.Backend then
		local CheckTrustedCreatorPermissionResult, CheckTrustedCreatorPermissionResult2 = checkTrustedCreatorPermission()
		
		if CheckTrustedCreatorPermissionResult2 then
			p1:forceError(CheckTrustedCreatorPermissionResult2)
		end
		if not CheckTrustedCreatorPermissionResult then
			p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BonesNotAllowed)
		end
		return
	elseif not p2.consumerConfig.backendConfigs.isUserInTrustedCreatorProgram then
		p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_BonesNotAllowed)
	end
end

return config