local v1 = script
local GetEngineFeatureUGCValidationWithContextEntrypointModule = require(v1.flags.getEngineFeatureUGCValidationWithContextEntrypoint)
local AnalyticsModule = require(v1.Analytics)
local ConstantsModule = require(v1.Constants)
local BundlesMetadataModule = require(v1.util.BundlesMetadata)
local CanUploadBundlesAsyncModule = require(v1.util.canUploadBundlesAsync)
local CreateUGCBodyPartFoldersModule = require(v1.util.createUGCBodyPartFolders)
local IsLayeredClothingModule = require(v1.util.isLayeredClothing)
local RigidOrLayeredAllowedModule = require(v1.util.RigidOrLayeredAllowed)
local _ = require(v1.util.Types)
local CreateEditableInstancesForContextModule = require(v1.util.createEditableInstancesForContext)
local DestroyEditableInstancesModule = require(v1.util.destroyEditableInstances)
local ValidationHintsModule = require(v1.util.ValidationHints)
local ValidateInternalModule = require(v1.validation.validateInternal)
local ValidateLayeredClothingAccessoryMeshPartAssetFormatModule = require(v1.validation.validateLayeredClothingAccessoryMeshPartAssetFormat)
local ValidateLegacyAccessoryMeshPartAssetFormatModule = require(v1.validation.validateLegacyAccessoryMeshPartAssetFormat)
local ValidateFullBodyModule = require(v1.validation.validateFullBody)
local ValidateShoesModule = require(v1.validation.validateShoes)
local ValidateBundleReadyForUploadModule = require(v1.validation.validateBundleReadyForUpload)
local ValidateShoesBundleReadyForUploadModule = require(v1.validation.validateShoesBundleReadyForUpload)
local ValidateAnimationBundleReadyForUploadModule = require(v1.validation.validateAnimationBundleReadyForUpload)
local ValidateDynamicHeadMeshPartFormatModule = require(v1.validation.validateDynamicHeadMeshPartFormat)
local ValidationManagerModule = require(v1.validationSystem.ValidationManager)
local LegacyValidationAdapterModule = require(v1.util.LegacyValidationAdapter)
local UGCValidationModule = {
	ValidateAsset = ValidationManagerModule.ValidateAsset,
	ValidateFinalizedBundle = ValidationManagerModule.ValidateFinalizedBundle,
	combineResultsIntoLegacy = LegacyValidationAdapterModule.combineResultsIntoLegacy,
	mergeLegacyIntoModern = LegacyValidationAdapterModule.mergeLegacyIntoModern,
	isFolderStructureEnabled = require(v1.flags.getFFlagUGCValidationEnableFolderStructure),
	isEntrypointMergingEnabled = require(v1.flags.getFFlagUGCValidationCombineEntrypointResults),
	SplitHrdInUpload = require(v1.util.SplitHumanoidRigDescriptionForUpload).fixUploadInstance
}

if GetEngineFeatureUGCValidationWithContextEntrypointModule() then
	function UGCValidationModule.validateWithContext(IsServer)
		-- upvalues: AnalyticsModule (copy), CreateEditableInstancesForContextModule (copy), ValidateInternalModule (copy), DestroyEditableInstancesModule (copy)
		assert(IsServer.instances ~= nil, "instances required in validationContext for validateWithContext")
		assert(IsServer.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateWithContext")
		local Instances = IsServer.instances
		local IsServer1 = IsServer.isServer
		local AssetTypeEnum = IsServer.assetTypeEnum
		local AllowEditableInstances = IsServer.allowEditableInstances
		local CurrentTime = tick()
		AnalyticsModule.setMetadata({
			entrypoint = "validate",
			assetType = AssetTypeEnum.Name,
			isServer = IsServer1
		})
		local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(Instances, AllowEditableInstances)
		
		if not ProcessAllResult then
			if not IsServer1 then
				return ProcessAllResult, ProcessAllResult2
			end
			error(ProcessAllResult2[1])
		end
		IsServer.editableMeshes = ProcessAllResult2.editableMeshes
		IsServer.editableImages = ProcessAllResult2.editableImages
		IsServer.lastTickSeconds = tick()
		
		if IsServer.requireAllFolders == nil then
			IsServer.requireAllFolders = true
		end
		local ValidateInternalModuleResult, ValidateInternalModuleResult2 = ValidateInternalModule(IsServer)
		DestroyEditableInstancesModule(IsServer.editableMeshes, IsServer.editableImages)
		
		if ValidateInternalModuleResult then
			AnalyticsModule.recordScriptTime(script.Name, CurrentTime, IsServer)
			AnalyticsModule.reportScriptTimes(IsServer)
		end
		AnalyticsModule.reportCounter(ValidateInternalModuleResult, if AssetTypeEnum == Enum.AssetType.DynamicHead then "Head" else "BodyPart", IsServer)
		
		return ValidateInternalModuleResult, ValidateInternalModuleResult2
	end
end
function UGCValidationModule.validate(Instances, AssetTypeEnum, IsServer, AllowUnreviewedAssets, RestrictedUserIds, Token, UniverseId, AllowEditableInstances, BypassFlags, ShouldYield, p1, p2)
	-- upvalues: AnalyticsModule (copy), CreateEditableInstancesForContextModule (copy), ValidateInternalModule (copy), DestroyEditableInstancesModule (copy)
	local CurrentTime = tick()
	AnalyticsModule.setMetadata({
		entrypoint = "validate",
		assetType = AssetTypeEnum.Name,
		isServer = IsServer
	})
	local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(Instances, AllowEditableInstances)
	
	if not ProcessAllResult then
		if not IsServer then
			return ProcessAllResult, ProcessAllResult2
		end
		error(ProcessAllResult2[1])
	end
	local config = {
		isAsync = false,
		instances = Instances,
		assetTypeEnum = AssetTypeEnum,
		allowUnreviewedAssets = AllowUnreviewedAssets,
		restrictedUserIds = RestrictedUserIds,
		isServer = IsServer,
		token = Token,
		universeId = UniverseId,
		allowEditableInstances = AllowEditableInstances,
		bypassFlags = BypassFlags,
		validateMeshPartAccessories = p1 == nil or p1,
		lastTickSeconds = tick(),
		shouldYield = ShouldYield,
		editableMeshes = ProcessAllResult2.editableMeshes,
		editableImages = ProcessAllResult2.editableImages,
		requireAllFolders = p2 == nil or p2
	}
	local ValidateInternalModuleResult, ValidateInternalModuleResult2 = ValidateInternalModule(config)
	DestroyEditableInstancesModule(config.editableMeshes, config.editableImages)
	
	if ValidateInternalModuleResult then
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, config)
		AnalyticsModule.reportScriptTimes(config)
	end
	AnalyticsModule.reportCounter(ValidateInternalModuleResult, if AssetTypeEnum == Enum.AssetType.DynamicHead then "Head" else "BodyPart", config)
	
	return ValidateInternalModuleResult, ValidateInternalModuleResult2
end

function UGCValidationModule.validateAsync(Instances, AssetTypeEnum, Callback: (any, any) -> (), IsServer, AllowUnreviewedAssets, RestrictedUserIds)
	-- upvalues: AnalyticsModule (copy), CreateEditableInstancesForContextModule (copy), ValidateInternalModule (copy), DestroyEditableInstancesModule (copy)
	AnalyticsModule.setMetadata({
		entrypoint = "validateAsync",
		assetType = AssetTypeEnum.Name,
		isServer = IsServer
	})
	local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(Instances)
	
	if not ProcessAllResult then
		if IsServer then
			error(ProcessAllResult2[1])
		else
			Callback(ProcessAllResult, ProcessAllResult2)
		end
	end
	local config = {
		token = "",
		isAsync = true,
		validateMeshPartAccessories = false,
		instances = Instances,
		assetTypeEnum = AssetTypeEnum,
		allowUnreviewedAssets = AllowUnreviewedAssets,
		restrictedUserIds = RestrictedUserIds,
		isServer = IsServer,
		editableMeshes = ProcessAllResult2.editableMeshes,
		editableImages = ProcessAllResult2.editableImages
	}
	coroutine.wrap(function()
		-- upvalues: Callback (copy), ValidateInternalModule (upval), config (copy), DestroyEditableInstancesModule (upval)
		Callback(ValidateInternalModule(config))
		DestroyEditableInstancesModule(config.editableMeshes, config.editableImages)
	end)()
end

function UGCValidationModule.validateMeshPartFormat(Instances, AssetTypeEnum, IsServer, AllowUnreviewedAssets, RestrictedUserIds)
	-- upvalues: AnalyticsModule (copy), CreateEditableInstancesForContextModule (copy), ValidateDynamicHeadMeshPartFormatModule (copy), DestroyEditableInstancesModule (copy)
	AnalyticsModule.setMetadata({
		entrypoint = "validateMeshPartFormat",
		assetType = AssetTypeEnum.Name,
		isServer = IsServer
	})
	assert(Enum.AssetType.DynamicHead == AssetTypeEnum)
	local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(Instances)
	
	if not ProcessAllResult then
		if not IsServer then
			return ProcessAllResult, ProcessAllResult2
		end
		error(ProcessAllResult2[1])
	end
	local config = {
		validateMeshPartAccessories = false,
		instances = Instances,
		assetTypeEnum = AssetTypeEnum,
		allowUnreviewedAssets = AllowUnreviewedAssets,
		restrictedUserIds = RestrictedUserIds,
		isServer = IsServer,
		editableMeshes = ProcessAllResult2.editableMeshes,
		editableImages = ProcessAllResult2.editableImages
	}
	local ValidateDynamicHeadMeshPartFormatModuleResult, ValidateDynamicHeadMeshPartFormatModuleResult2 = ValidateDynamicHeadMeshPartFormatModule(config)
	DestroyEditableInstancesModule(config.editableMeshes, config.editableImages)
	
	return ValidateDynamicHeadMeshPartFormatModuleResult, ValidateDynamicHeadMeshPartFormatModuleResult2
end

function UGCValidationModule.validateAsyncMeshPartFormat(Instances, AssetTypeEnum, Callback: (any, any) -> (), IsServer, AllowUnreviewedAssets, RestrictedUserIds)
	-- upvalues: AnalyticsModule (copy), CreateEditableInstancesForContextModule (copy), ValidateDynamicHeadMeshPartFormatModule (copy), DestroyEditableInstancesModule (copy)
	AnalyticsModule.setMetadata({
		entrypoint = "validateAsyncMeshPartFormat",
		assetType = AssetTypeEnum.Name,
		isServer = IsServer
	})
	assert(Enum.AssetType.DynamicHead == AssetTypeEnum)
	local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(Instances)
	
	if not ProcessAllResult then
		if IsServer then
			error(ProcessAllResult2[1])
		else
			Callback(ProcessAllResult, ProcessAllResult2)
		end
	end
	local config = {
		validateMeshPartAccessories = false,
		instances = Instances,
		assetTypeEnum = AssetTypeEnum,
		allowUnreviewedAssets = AllowUnreviewedAssets,
		restrictedUserIds = RestrictedUserIds,
		isServer = IsServer,
		editableMeshes = ProcessAllResult2.editableMeshes,
		editableImages = ProcessAllResult2.editableImages
	}
	coroutine.wrap(function()
		-- upvalues: Callback (copy), ValidateDynamicHeadMeshPartFormatModule (upval), config (copy), DestroyEditableInstancesModule (upval)
		Callback(ValidateDynamicHeadMeshPartFormatModule(config))
		DestroyEditableInstancesModule(config.editableMeshes, config.editableImages)
	end)()
end

if GetEngineFeatureUGCValidationWithContextEntrypointModule() then
	function UGCValidationModule.validateMeshPartAssetFormatWithContext(IsServer)
		-- upvalues: AnalyticsModule (copy), CreateEditableInstancesForContextModule (copy), IsLayeredClothingModule (copy), ValidateLayeredClothingAccessoryMeshPartAssetFormatModule (copy), ValidateLegacyAccessoryMeshPartAssetFormatModule (copy), DestroyEditableInstancesModule (copy)
		assert(IsServer.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateMeshPartAssetFormatWithContext")
		assert(IsServer.instances ~= nil, "instances required in validationContext for validateMeshPartAssetFormatWithContext")
		local Instances = IsServer.instances
		local IsServer1 = IsServer.isServer
		local SpecialMeshAccessory = IsServer.specialMeshAccessory
		AnalyticsModule.setMetadata({
			entrypoint = "validateMeshPartAssetFormat2",
			assetType = IsServer.assetTypeEnum.Name,
			isServer = IsServer1
		})
		local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(Instances)
		
		if not ProcessAllResult then
			if not IsServer1 then
				return ProcessAllResult, ProcessAllResult2
			end
			error(ProcessAllResult2[1])
		end
		IsServer.editableMeshes = ProcessAllResult2.editableMeshes
		IsServer.editableImages = ProcessAllResult2.editableImages
		IsServer.validateMeshPartAccessories = false
		local ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult = nil
		local ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult2 = nil
		
		if IsLayeredClothingModule(Instances[1]) then
			ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult, ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult2 = ValidateLayeredClothingAccessoryMeshPartAssetFormatModule(SpecialMeshAccessory, IsServer)
		else
			ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult, ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult2 = ValidateLegacyAccessoryMeshPartAssetFormatModule(SpecialMeshAccessory, IsServer)
		end
		DestroyEditableInstancesModule(IsServer.editableMeshes, IsServer.editableImages)
		
		return ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult, ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult2
	end
end
function UGCValidationModule.validateMeshPartAssetFormat2(Entry, p1, AssetTypeEnum, IsServer, AllowUnreviewedAssets, _)
	-- upvalues: AnalyticsModule (copy), CreateEditableInstancesForContextModule (copy), IsLayeredClothingModule (copy), ValidateLayeredClothingAccessoryMeshPartAssetFormatModule (copy), ValidateLegacyAccessoryMeshPartAssetFormatModule (copy), DestroyEditableInstancesModule (copy)
	AnalyticsModule.setMetadata({
		entrypoint = "validateMeshPartAssetFormat2",
		assetType = AssetTypeEnum.Name,
		isServer = IsServer
	})
	local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(Entry)
	
	if not ProcessAllResult then
		if not IsServer then
			return ProcessAllResult, ProcessAllResult2
		end
		error(ProcessAllResult2[1])
	end
	local config = {
		validateMeshPartAccessories = false,
		instances = Entry,
		assetTypeEnum = AssetTypeEnum,
		allowUnreviewedAssets = AllowUnreviewedAssets,
		isServer = IsServer,
		editableMeshes = ProcessAllResult2.editableMeshes,
		editableImages = ProcessAllResult2.editableImages
	}
	local ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult = nil
	local ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult2 = nil
	
	if IsLayeredClothingModule(Entry[1]) then
		ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult, ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult2 = ValidateLayeredClothingAccessoryMeshPartAssetFormatModule(p1, config)
	else
		ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult, ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult2 = ValidateLegacyAccessoryMeshPartAssetFormatModule(p1, config)
	end
	DestroyEditableInstancesModule(config.editableMeshes, config.editableImages)
	
	return ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult, ValidateLayeredClothingAccessoryMeshPartAssetFormatModuleResult2
end

UGCValidationModule.validateBundleReadyForUpload = ValidateBundleReadyForUploadModule
UGCValidationModule.validateShoesBundleReadyForUpload = ValidateShoesBundleReadyForUploadModule
UGCValidationModule.validateAnimationBundleReadyForUpload = ValidateAnimationBundleReadyForUploadModule
UGCValidationModule.util = {
	BundlesMetadata = BundlesMetadataModule,
	createUGCBodyPartFolders = CreateUGCBodyPartFoldersModule,
	canUploadBundlesAsync = CanUploadBundlesAsyncModule
}
UGCValidationModule.util.isLayeredClothingAllowed = RigidOrLayeredAllowedModule.isLayeredClothingAllowed
UGCValidationModule.util.isRigidAccessoryAllowed = RigidOrLayeredAllowedModule.isRigidAccessoryAllowed

if GetEngineFeatureUGCValidationWithContextEntrypointModule() then
	function UGCValidationModule.validateFullBodyWithContext(IsServer)
		-- upvalues: AnalyticsModule (copy), CreateEditableInstancesForContextModule (copy), ValidateFullBodyModule (copy), DestroyEditableInstancesModule (copy)
		assert(IsServer.fullBodyData ~= nil, "fullBodyData required in validationContext for validateFullBodyWithContext")
		local IsServer1 = IsServer.isServer
		local FullBodyData = IsServer.fullBodyData
		local AllowEditableInstances = IsServer.allowEditableInstances
		AnalyticsModule.setMetadata({
			entrypoint = "validateFullBody",
			assetType = "",
			isServer = IsServer1
		})
		local CurrentTime = tick()
		local List = {}
		
		for _, value in FullBodyData do
			for _, allSelectedInstance in value.allSelectedInstances do
				table.insert(List, allSelectedInstance)
			end
		end
		local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(List, AllowEditableInstances)
		
		if not ProcessAllResult then
			if not IsServer1 then
				return ProcessAllResult, ProcessAllResult2
			end
			error(ProcessAllResult2[1])
		end
		IsServer.editableMeshes = ProcessAllResult2.editableMeshes
		IsServer.editableImages = ProcessAllResult2.editableImages
		IsServer.lastTickSeconds = tick()
		
		if IsServer.requireAllFolders == nil then
			IsServer.requireAllFolders = true
		end
		local ValidateFullBodyModuleResult, ValidateFullBodyModuleResult2 = ValidateFullBodyModule(IsServer)
		DestroyEditableInstancesModule(IsServer.editableMeshes, IsServer.editableImages)
		
		if ValidateFullBodyModuleResult then
			AnalyticsModule.recordScriptTime(script.Name, CurrentTime, IsServer)
			AnalyticsModule.reportScriptTimes(IsServer)
		end
		AnalyticsModule.reportCounter(ValidateFullBodyModuleResult, "FullBody", IsServer)
		
		return ValidateFullBodyModuleResult, ValidateFullBodyModuleResult2
	end
end
function UGCValidationModule.validateFullBody(FullBodyData, IsServer, AllowEditableInstances, BypassFlags, ShouldYield, p1)
	-- upvalues: AnalyticsModule (copy), CreateEditableInstancesForContextModule (copy), ValidateFullBodyModule (copy), DestroyEditableInstancesModule (copy)
	AnalyticsModule.setMetadata({
		entrypoint = "validateFullBody",
		assetType = "",
		isServer = IsServer
	})
	local CurrentTime = tick()
	local List = {}
	
	for _, value in FullBodyData do
		for _, allSelectedInstance in value.allSelectedInstances do
			table.insert(List, allSelectedInstance)
		end
	end
	local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(List, AllowEditableInstances)
	
	if not ProcessAllResult then
		if not IsServer then
			return ProcessAllResult, ProcessAllResult2
		end
		error(ProcessAllResult2[1])
	end
	local config = {
		validateMeshPartAccessories = false,
		fullBodyData = FullBodyData,
		isServer = IsServer,
		allowEditableInstances = AllowEditableInstances,
		bypassFlags = BypassFlags,
		lastTickSeconds = tick(),
		shouldYield = ShouldYield,
		editableMeshes = ProcessAllResult2.editableMeshes,
		editableImages = ProcessAllResult2.editableImages,
		requireAllFolders = p1 == nil or p1
	}
	local ValidateFullBodyModuleResult, ValidateFullBodyModuleResult2 = ValidateFullBodyModule(config)
	DestroyEditableInstancesModule(config.editableMeshes, config.editableImages)
	
	if ValidateFullBodyModuleResult then
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, config)
		AnalyticsModule.reportScriptTimes(config)
	end
	AnalyticsModule.reportCounter(ValidateFullBodyModuleResult, "FullBody", config)
	
	return ValidateFullBodyModuleResult, ValidateFullBodyModuleResult2
end

function UGCValidationModule.validateShoesWithContext(IsServer)
	-- upvalues: AnalyticsModule (copy), CreateEditableInstancesForContextModule (copy), ValidateShoesModule (copy), DestroyEditableInstancesModule (copy)
	assert(IsServer.fullBodyData ~= nil, "fullBodyData required in validationContext for validateShoes")
	local IsServer1 = IsServer.isServer
	local FullBodyData = IsServer.fullBodyData
	local AllowEditableInstances = IsServer.allowEditableInstances
	AnalyticsModule.setMetadata({
		entrypoint = "validateShoes",
		assetType = "",
		isServer = IsServer1
	})
	local CurrentTime = tick()
	local List = {}
	
	for _, value in FullBodyData do
		for _, allSelectedInstance in value.allSelectedInstances do
			table.insert(List, allSelectedInstance)
		end
	end
	local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(List, AllowEditableInstances)
	
	if not ProcessAllResult then
		if not IsServer1 then
			return ProcessAllResult, ProcessAllResult2
		end
		error(ProcessAllResult2[1])
	end
	IsServer.editableMeshes = ProcessAllResult2.editableMeshes
	IsServer.editableImages = ProcessAllResult2.editableImages
	IsServer.lastTickSeconds = tick()
	local ValidateShoesModuleResult, ValidateShoesModuleResult2 = ValidateShoesModule(IsServer)
	DestroyEditableInstancesModule(IsServer.editableMeshes, IsServer.editableImages)
	
	if ValidateShoesModuleResult then
		AnalyticsModule.recordScriptTime(script.Name, CurrentTime, IsServer)
		AnalyticsModule.reportScriptTimes(IsServer)
	end
	AnalyticsModule.reportCounter(ValidateShoesModuleResult, "Shoes", IsServer)
	
	return ValidateShoesModuleResult, ValidateShoesModuleResult2
end

function UGCValidationModule.preprocessDataAsync(List, IsServer, AllowEditableInstances, BypassFlags, ShouldYield)
	-- upvalues: AnalyticsModule (copy), CreateEditableInstancesForContextModule (copy), ValidationHintsModule (copy), DestroyEditableInstancesModule (copy)
	AnalyticsModule.setMetadata({
		entrypoint = "preprocessDataAsync",
		assetType = "",
		isServer = IsServer
	})
	local CurrentTime = tick()
	local List1 = {}
	
	for _, value in List do
		table.insert(List1, value)
	end
	local ProcessAllResult, ProcessAllResult2 = CreateEditableInstancesForContextModule.processAll(List1, AllowEditableInstances)
	
	if not ProcessAllResult then
		if not IsServer then
			return { ok = false, errors = ProcessAllResult2 }
		end
		error(ProcessAllResult2[1])
	end
	local config = {
		validateMeshPartAccessories = false,
		isServer = IsServer,
		allowEditableInstances = AllowEditableInstances,
		bypassFlags = BypassFlags,
		lastTickSeconds = tick(),
		shouldYield = ShouldYield,
		editableMeshes = ProcessAllResult2.editableMeshes,
		editableImages = ProcessAllResult2.editableImages
	}
	local PreprocessDataAsyncResult = ValidationHintsModule.preprocessDataAsync(List, config)
	DestroyEditableInstancesModule(config.editableMeshes, config.editableImages)
	
	if PreprocessDataAsyncResult.ok then
		AnalyticsModule.recordScriptTime("preprocessDataAsync", CurrentTime, config)
		AnalyticsModule.reportScriptTimes(config)
	end
	return PreprocessDataAsyncResult
end

function UGCValidationModule.isPreprocessDataCached(p2, p3, IsServer)
	-- upvalues: AnalyticsModule (copy), ValidationHintsModule (copy)
	AnalyticsModule.setMetadata({
		entrypoint = "isPreprocessDataCached",
		assetType = "",
		isServer = IsServer
	})
	local IsPreprocessDataCached = ValidationHintsModule.isPreprocessDataCached(p2, p3)
	local config = { isServer = IsServer }
	AnalyticsModule.recordScriptTime("isPreprocessDataCached", tick(), config)
	AnalyticsModule.reportScriptTimes(config)
	
	return IsPreprocessDataCached
end

function UGCValidationModule.calculateScaleToValidateBoundsAsync(List, IsServer, AllowEditableInstances, BypassFlags, ShouldYield, AllowEditableInstances1)
	-- upvalues: AnalyticsModule (copy), CreateEditableInstancesForContextModule (copy), ValidationHintsModule (copy), DestroyEditableInstancesModule (copy)
	AnalyticsModule.setMetadata({
		entrypoint = "calculateScaleToValidateBoundsAsync",
		assetType = "",
		isServer = IsServer
	})
	local CurrentTime = tick()
	local Entry = nil
	
	if not AllowEditableInstances1 then
		local List1 = {}
		
		for _, value in List do
			table.insert(List1, value)
		end
		local ProcessAllResult
		ProcessAllResult, Entry = CreateEditableInstancesForContextModule.processAll(List1, AllowEditableInstances)
		
		if not ProcessAllResult then
			if not IsServer then
				return { ok = false, errors = Entry }
			end
			error(Entry[1])
		end
	end
	local config = {
		validateMeshPartAccessories = false,
		isServer = IsServer,
		allowEditableInstances = AllowEditableInstances,
		bypassFlags = BypassFlags,
		lastTickSeconds = tick(),
		shouldYield = ShouldYield
	}
	
	if not AllowEditableInstances1 then
		config.editableMeshes = Entry.editableMeshes
		config.editableImages = Entry.editableImages
	end
	local ScaleToValidateBoundsAsync = ValidationHintsModule.calculateScaleToValidateBoundsAsync(List, config, AllowEditableInstances1)
	
	if not AllowEditableInstances1 then
		DestroyEditableInstancesModule(config.editableMeshes, config.editableImages)
	end
	if ScaleToValidateBoundsAsync.ok then
		AnalyticsModule.recordScriptTime("calculateScaleToValidateBoundsAsync", CurrentTime, config)
		AnalyticsModule.reportScriptTimes(config)
	end
	return ScaleToValidateBoundsAsync
end

UGCValidationModule.GUIDAttributeName = ConstantsModule.GUIDAttributeName

return UGCValidationModule