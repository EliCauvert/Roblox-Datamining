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

local function _(p0) --[[ line: 29 | named "hasEmissiveInMeshTextures" ]]
	for i, v in p0 do
		if v.EmissiveMask then
			return true
		end
	end
	return false
end

local function checkEmissivePermission(p1) --[[ line: 38 ]]
	-- upvalues: APIUtilModule (ref), httpService (ref)
	if not p1.assetType then
		return false, "Unable to determine asset type for emissive permission check"
	end
	local var6, var7 = APIUtilModule.requestAndRetryGet(string.format("https://itemconfiguration.%s/v1/permissions/action-allowed-for-item-type?action=1&assetType=%s", APIUtilModule.getBaseDomain(), tostring(p1.assetType.Value)))
	
	if not var6 then
		return false, "Failed to check emissive map permission: " .. tostring(var7)
	end
	local ok, status = pcall(function() --[[ line: 54 ]]
		-- upvalues: httpService (copy), var7 (ref)
		return httpService:JSONDecode(var7)
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

function t.run(p2, p3) --[[ line: 69 ]]
	-- upvalues: validationEnumsModule (ref), errorSourceStringsModule (ref), checkEmissivePermission (ref)
	local var8
	for i, v in p3.meshTextures do
		if v.EmissiveMask then
			var8 = true
			if not var8 then return end
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
				local var9, var10 = checkEmissivePermission(p3.uploadEnum)
				
				if var10 then
					p2:forceError(var10)
				end
				if not var9 then
					p2:fail(errorSourceStringsModule.Keys.EmissiveMap_NotAllowed)
				end
				return
			end
		end
	end
	var8 = false
end

return t