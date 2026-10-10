local parent = script.Parent.Parent.Parent
local httpService = game:GetService("HttpService")
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local APIUtilModule = require(parent.util.APIUtil)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		validationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = { validationEnumsModule.SharedDataMember.consumerConfig },
	conditionalData = { validationEnumsModule.SharedDataMember.curveAnimBoneData },
	expectedFailures = {},
	prereqTests = {
		validationEnumsModule.ValidationModule.CurveAnimDataAvailable
	}
}

local function checkTrustedCreatorPermission()
	-- upvalues: APIUtilModule (ref), httpService (ref)
	local var1, var2 = APIUtilModule.requestAndRetryGet(string.format("https://itemconfiguration.%s/v1/permissions/action-allowed-for-item-type?trustedCreatorCheck=true&action=1&assetType=61", APIUtilModule.getBaseDomain()))
	
	if not var1 then
		return false, "Failed to check trusted creator permission: " .. tostring(var2)
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), var2 (ref)
		return httpService:JSONDecode(var2)
	end)
	
	if ok then
		return status.isActionAllowed == true, nil
	end
	return false, "Failed to decode permission response"
end

function t.run(p1, p2)
	-- upvalues: validationEnumsModule (ref), errorSourceStringsModule (ref), checkTrustedCreatorPermission (ref)
	local validationEnv = p2.consumerConfig.validationEnv
	
	if validationEnv == validationEnumsModule.ValidationEnv.IEC then
		p1:fail(errorSourceStringsModule.Keys.CurveAnim_BonesNotAllowed)
		
		return
	elseif validationEnv == validationEnumsModule.ValidationEnv.Backend then
		if not p2.consumerConfig.backendConfigs.isUserInTrustedCreatorProgram then
			p1:fail(errorSourceStringsModule.Keys.CurveAnim_BonesNotAllowed)
		end
		return
	else
		local var1, var2 = checkTrustedCreatorPermission()
		
		if var2 then
			p1:forceError(var2)
		end
		if not var1 then
			p1:fail(errorSourceStringsModule.Keys.CurveAnim_BonesNotAllowed)
		end
	end
end

return t