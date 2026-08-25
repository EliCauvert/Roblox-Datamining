local UGCValidationService = game:GetService("UGCValidationService")
local UGCValidationModule = require(game:GetService("CorePackages").Packages.UGCValidation)
local UGCValidationWithContextEntrypointFeatureEngineFeature = game:GetEngineFeature("UGCValidationWithContextEntrypointFeature")
local UGCValidateMigrateSchemaProperties2 = game:DefineFastFlag("UGCValidateMigrateSchemaProperties2", false)
local UGCValidateForwardIECRestrictedUserIds = game:DefineFastFlag("UGCValidateForwardIECRestrictedUserIds", false)

local function UGCValidationFunction(p0)
	-- upvalues: UGCValidationWithContextEntrypointFeatureEngineFeature (ref), UGCValidationModule (ref), UGCValidateMigrateSchemaProperties2 (ref), UGCValidateForwardIECRestrictedUserIds (ref)
	local var11, var12
	local instances = p0.instances
	local assetType = p0.assetType
	local isServer = p0.isServer
	local fullBodyData = p0.fullBodyData
	local allowUnreviewedAssets = p0.allowUnreviewedAssets
	local restrictedUserIds = p0.restrictedUserIds
	local token = p0.token
	local universeId = p0.universeId
	local requireAllFolders = p0.requireAllFolders
	local t = {
		skipSnapshot = true,
		skipPhysicsDataReset = true,
		skipValidateHSR = true
	}
	local _ = nil
	local _ = nil
	local _ = nil
	local _ = nil
	
	if UGCValidationWithContextEntrypointFeatureEngineFeature then
		local t_1 = {
			allowEditableInstances = true,
			shouldYield = true,
			validateMeshPartAccessories = true,
			instances = instances,
			assetTypeEnum = assetType,
			isServer = isServer,
			allowUnreviewedAssets = allowUnreviewedAssets,
			restrictedUserIds = restrictedUserIds,
			token = token,
			universeId = universeId,
			requireAllFolders = requireAllFolders,
			bypassFlags = t
		}
		local t_2 = {
			allowEditableInstances = true,
			shouldYield = true,
			validateMeshPartAccessories = false,
			fullBodyData = fullBodyData,
			isServer = isServer,
			bypassFlags = t,
			requireAllFolders = requireAllFolders
		}
		
		if fullBodyData then
			local var9, var10 = UGCValidationModule.validateFullBodyWithContext(t_2)
			var11 = var9
			var12 = var10
		else
			local var13, var14 = UGCValidationModule.validateWithContext(t_1)
			var11 = var13
			var12 = var14
		end
	elseif fullBodyData then
		local var15, var16 = UGCValidationModule.validateFullBody(fullBodyData, isServer, true, t, true, requireAllFolders)
		var11 = var15
		var12 = var16
	else
		local var17, var18 = UGCValidationModule.validate(instances, assetType, isServer, allowUnreviewedAssets, restrictedUserIds, token, universeId, true, t, true, true, requireAllFolders)
		var11 = var17
		var12 = var18
	end
	local t_1 = {
		source = if isServer then "InExpServer" else "InExpClient",
		enforceR15FolderStructure = requireAllFolders or false,
		skipAssetQualityChecks = UGCValidationModule.shouldSkipAssetQualityChecks and UGCValidationModule.shouldSkipAssetQualityChecks() or nil,
		iecConfigs = if UGCValidateMigrateSchemaProperties2 then {
			token = token,
			universeId = universeId,
			restrictedUserIds = if UGCValidateForwardIECRestrictedUserIds then restrictedUserIds else nil
		} else nil
	}
	local var20, var21 = UGCValidationModule.combineResultsIntoLegacy(var11, var12, if fullBodyData then UGCValidationModule.ValidateFinalizedBundle(fullBodyData, Enum.BundleType.BodyParts, t_1) else UGCValidationModule.ValidateAsset(instances, assetType, t_1))
	
	if var20 then
		return true, { "Success" }
	end
	return false, var21
end

return function()
	-- upvalues: UGCValidationService (ref), UGCValidationFunction (ref)
	UGCValidationService:RegisterUGCValidationFunction(UGCValidationFunction)
end