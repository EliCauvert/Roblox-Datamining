local UGCValidationService = game:GetService("UGCValidationService")
local UGCValidationModule = require(game:GetService("CorePackages").Packages.UGCValidation)
local UGCValidationWithContextEntrypointFeatureEngineFeature = game:GetEngineFeature("UGCValidationWithContextEntrypointFeature")
local UGCValidateMigrateSchemaProperties2 = game:DefineFastFlag("UGCValidateMigrateSchemaProperties2", false)
local UGCValidateForwardIECRestrictedUserIds = game:DefineFastFlag("UGCValidateForwardIECRestrictedUserIds", false)

local function UGCValidationFunction(p1)
	-- upvalues: UGCValidationWithContextEntrypointFeatureEngineFeature (ref), UGCValidationModule (ref), UGCValidateMigrateSchemaProperties2 (ref), UGCValidateForwardIECRestrictedUserIds (ref)
	local var1, var2
	local instances = p1.instances
	local assetType = p1.assetType
	local isServer = p1.isServer
	local fullBodyData = p1.fullBodyData
	local allowUnreviewedAssets = p1.allowUnreviewedAssets
	local restrictedUserIds = p1.restrictedUserIds
	local token = p1.token
	local universeId = p1.universeId
	local requireAllFolders = p1.requireAllFolders
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
			local var3, var4 = UGCValidationModule.validateFullBodyWithContext(t_2)
			var1 = var3
			var2 = var4
		else
			local var5, var6 = UGCValidationModule.validateWithContext(t_1)
			var1 = var5
			var2 = var6
		end
	elseif fullBodyData then
		local var7, var8 = UGCValidationModule.validateFullBody(fullBodyData, isServer, true, t, true, requireAllFolders)
		var1 = var7
		var2 = var8
	else
		local var9, var10 = UGCValidationModule.validate(instances, assetType, isServer, allowUnreviewedAssets, restrictedUserIds, token, universeId, true, t, true, true, requireAllFolders)
		var1 = var9
		var2 = var10
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
	local var11, var12 = UGCValidationModule.combineResultsIntoLegacy(var1, var2, if fullBodyData then UGCValidationModule.ValidateFinalizedBundle(fullBodyData, Enum.BundleType.BodyParts, t_1) else UGCValidationModule.ValidateAsset(instances, assetType, t_1))
	
	if var11 then
		return true, { "Success" }
	end
	return false, var12
end

return function()
	-- upvalues: UGCValidationService (ref), UGCValidationFunction (ref)
	UGCValidationService:RegisterUGCValidationFunction(UGCValidationFunction)
end