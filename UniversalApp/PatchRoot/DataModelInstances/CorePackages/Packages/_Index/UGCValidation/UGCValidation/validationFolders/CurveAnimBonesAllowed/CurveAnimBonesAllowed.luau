local parent = script.Parent.Parent.Parent
local httpService = game:GetService("HttpService")
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local APIUtilModule = require(parent.util.APIUtil)
local getFFlagUGCValidateEmotesBonesAllowedModule = require(parent.flags.getFFlagUGCValidateEmotesBonesAllowed)
local getFFlagUGCValidateEmotesBoneUserVerificationModule = require(parent.flags.getFFlagUGCValidateEmotesBoneUserVerification)
local getFFlagUGCValidateAnimBonesSupportModule = require(parent.flags.getFFlagUGCValidateAnimBonesSupport)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if getFFlagUGCValidateAnimBonesSupportModule() and require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = { validationEnumsModule.SharedDataMember.consumerConfig }
t.conditionalData = { validationEnumsModule.SharedDataMember.curveAnimBoneData }

function t.fflag()
	-- upvalues: getFFlagUGCValidateEmotesBonesAllowedModule (ref), getFFlagUGCValidateAnimBonesSupportModule (ref)
	return getFFlagUGCValidateEmotesBonesAllowedModule() or getFFlagUGCValidateAnimBonesSupportModule()
end

t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function checkTrustedCreatorPermission()
	-- upvalues: APIUtilModule (ref), httpService (ref)
	local var9, var10 = APIUtilModule.requestAndRetryGet(string.format("https://itemconfiguration.%s/v1/permissions/action-allowed-for-item-type?trustedCreatorCheck=true&action=1&assetType=61", APIUtilModule.getBaseDomain()))
	
	if not var9 then
		return false, "Failed to check trusted creator permission: " .. tostring(var10)
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), var10 (ref)
		return httpService:JSONDecode(var10)
	end)
	
	if ok then
		return status.isActionAllowed == true, nil
	end
	return false, "Failed to decode permission response"
end

function t.run(p0, p1)
	-- upvalues: getFFlagUGCValidateEmotesBoneUserVerificationModule (ref), validationEnumsModule (ref), errorSourceStringsModule (ref), checkTrustedCreatorPermission (ref)
	if not getFFlagUGCValidateEmotesBoneUserVerificationModule() then return end
	local consumerEnv = p1.consumerConfig.consumerEnv
	
	if consumerEnv == validationEnumsModule.ConsumerEnv.IEC then
		p0:fail(errorSourceStringsModule.Keys.CurveAnim_BonesNotAllowed)
		
		return
	elseif consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
		if not p1.consumerConfig.backendConfigs.isUserInTrustedCreatorProgram then
			p0:fail(errorSourceStringsModule.Keys.CurveAnim_BonesNotAllowed)
		end
		return
	else
		local var11, var12 = checkTrustedCreatorPermission()
		
		if var12 then
			p0:forceError(var12)
		end
		if not var11 then
			p0:fail(errorSourceStringsModule.Keys.CurveAnim_BonesNotAllowed)
		end
	end
end

return t