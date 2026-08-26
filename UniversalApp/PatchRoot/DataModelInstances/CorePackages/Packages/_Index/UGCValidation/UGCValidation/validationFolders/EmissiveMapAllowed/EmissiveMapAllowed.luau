local parent = script.Parent.Parent.Parent
local httpService = game:GetService("HttpService")
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local APIUtilModule = require(parent.util.APIUtil)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD,
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.RIGID_ACCESSORY,
		validationEnumsModule.UploadCategory.MAKEUP
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.consumerConfig,
		validationEnumsModule.SharedDataMember.uploadEnum,
		validationEnumsModule.SharedDataMember.meshTextures
	},
	fflag = require(parent.flags.getFFlagUGCValidateEmissiveMapAllowed),
	expectedFailures = {}
}

local function _(p1)
	for i, v in p1 do
		if v.EmissiveMask then
			return true
		end
	end
	return false
end

local function checkEmissivePermission(p2)
	-- upvalues: APIUtilModule (ref), httpService (ref)
	if not p2.assetType then
		return false, "Unable to determine asset type for emissive permission check"
	end
	local var1, var2 = APIUtilModule.requestAndRetryGet(string.format("https://itemconfiguration.%s/v1/permissions/action-allowed-for-item-type?action=1&assetType=%s", APIUtilModule.getBaseDomain(), tostring(p2.assetType.Value)))
	
	if not var1 then
		return false, "Failed to check emissive map permission: " .. tostring(var2)
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), var2 (ref)
		return httpService:JSONDecode(var2)
	end)
	
	if not ok then
		return false, "Failed to decode emissive map permission response"
	end
	local metadataPermissions = status.metadataPermissions
	
	if metadataPermissions then
		return metadataPermissions.EmissiveResult == true, nil
	end
	return false, nil
end

function t.run(p2, p3)
	-- upvalues: validationEnumsModule (ref), errorSourceStringsModule (ref), checkEmissivePermission (ref)
	local var1
	for i, v in p3.meshTextures do
		if v.EmissiveMask then
			var1 = true
			if not var1 then return end
			local consumerEnv = p3.consumerConfig.consumerEnv
			
			if consumerEnv == validationEnumsModule.ConsumerEnv.IEC then
				p2:fail(errorSourceStringsModule.Keys.EmissiveMap_NotAllowed)
				
				return
			elseif consumerEnv == validationEnumsModule.ConsumerEnv.Backend then
				if not p3.consumerConfig.backendConfigs.isEmissiveAllowed then
					p2:fail(errorSourceStringsModule.Keys.EmissiveMap_NotAllowed)
				end
				return
			else
				local var2, var3 = checkEmissivePermission(p3.uploadEnum)
				
				if var3 then
					p2:forceError(var3)
				end
				if not var2 then
					p2:fail(errorSourceStringsModule.Keys.EmissiveMap_NotAllowed)
				end
				return
			end
		end
	end
	var1 = false
end

return t