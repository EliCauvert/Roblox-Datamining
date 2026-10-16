local UGCValidationService = game:GetService("UGCValidationService")
local UGCValidationModule = require(game:GetService("CorePackages").Packages.UGCValidation)
local UGCValidationWithContextEntrypointFeatureEngineFeature = game:GetEngineFeature("UGCValidationWithContextEntrypointFeature")
local UGCValidateMigrateSchemaProperties2 = game:DefineFastFlag("UGCValidateMigrateSchemaProperties2", false)
local UGCValidateForwardIECRestrictedUserIds = game:DefineFastFlag("UGCValidateForwardIECRestrictedUserIds", false)

local function UGCValidationFunction(p1) --[[ Line: 10 ]]
	-- upvalues: UGCValidationWithContextEntrypointFeatureEngineFeature (copy), UGCValidationModule (copy), UGCValidateMigrateSchemaProperties2 (copy), UGCValidateForwardIECRestrictedUserIds (copy)
	local Instances = p1.instances
	local AssetType = p1.assetType
	local IsServer = p1.isServer
	local FullBodyData = p1.fullBodyData
	local AllowUnreviewedAssets = p1.allowUnreviewedAssets
	local RestrictedUserIds = p1.restrictedUserIds
	local Token = p1.token
	local UniverseId = p1.universeId
	local RequireAllFolders = p1.requireAllFolders
	local BypassFlags = {
		skipSnapshot = true,
		skipPhysicsDataReset = true,
		skipValidateHSR = true
	}
	local ValidateFullBodyWithContextResult = nil
	local ValidateFullBodyWithContextResult2 = nil
	
	if UGCValidationWithContextEntrypointFeatureEngineFeature then
		local config = {
			allowEditableInstances = true,
			shouldYield = true,
			validateMeshPartAccessories = true,
			instances = Instances,
			assetTypeEnum = AssetType,
			isServer = IsServer,
			allowUnreviewedAssets = AllowUnreviewedAssets,
			restrictedUserIds = RestrictedUserIds,
			token = Token,
			universeId = UniverseId,
			requireAllFolders = RequireAllFolders,
			bypassFlags = BypassFlags
		}
		local config1 = {
			allowEditableInstances = true,
			shouldYield = true,
			validateMeshPartAccessories = false,
			fullBodyData = FullBodyData,
			isServer = IsServer,
			bypassFlags = BypassFlags,
			requireAllFolders = RequireAllFolders
		}
		
		if FullBodyData then
			ValidateFullBodyWithContextResult, ValidateFullBodyWithContextResult2 = UGCValidationModule.validateFullBodyWithContext(config1)
		else
			ValidateFullBodyWithContextResult, ValidateFullBodyWithContextResult2 = UGCValidationModule.validateWithContext(config)
		end
	elseif FullBodyData then
		ValidateFullBodyWithContextResult, ValidateFullBodyWithContextResult2 = UGCValidationModule.validateFullBody(FullBodyData, IsServer, true, BypassFlags, true, RequireAllFolders)
	else
		ValidateFullBodyWithContextResult, ValidateFullBodyWithContextResult2 = UGCValidationModule.validate(Instances, AssetType, IsServer, AllowUnreviewedAssets, RestrictedUserIds, Token, UniverseId, true, BypassFlags, true, true, RequireAllFolders)
	end
	local config = {
		source = if IsServer then "InExpServer" else "InExpClient",
		enforceR15FolderStructure = RequireAllFolders or false,
		skipAssetQualityChecks = UGCValidationModule.shouldSkipAssetQualityChecks and UGCValidationModule.shouldSkipAssetQualityChecks() or nil,
		iecConfigs = if UGCValidateMigrateSchemaProperties2 then {
			token = Token,
			universeId = UniverseId,
			restrictedUserIds = if UGCValidateForwardIECRestrictedUserIds then RestrictedUserIds else nil
		} else nil
	}
	local CombineResultsIntoLegacyResult, CombineResultsIntoLegacyResult2 = UGCValidationModule.combineResultsIntoLegacy(ValidateFullBodyWithContextResult, ValidateFullBodyWithContextResult2, if FullBodyData then UGCValidationModule.ValidateFinalizedBundle(FullBodyData, Enum.BundleType.BodyParts, config) else UGCValidationModule.ValidateAsset(Instances, AssetType, config))
	
	if CombineResultsIntoLegacyResult then
		return true, { "Success" }
	else
		return false, CombineResultsIntoLegacyResult2
	end
end

return function() --[[ Line: 119 | Named "Install" ]]
	-- upvalues: UGCValidationService (copy), UGCValidationFunction (copy)
	UGCValidationService:RegisterUGCValidationFunction(UGCValidationFunction)
end