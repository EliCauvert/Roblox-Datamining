local _script = script
local getEngineFeatureUGCValidationWithContextEntrypointModule = require(_script.flags.getEngineFeatureUGCValidationWithContextEntrypoint)
local analyticsModule = require(_script.Analytics)
local constantsModule = require(_script.Constants)
local bundlesMetadataModule = require(_script.util.BundlesMetadata)
local canUploadBundlesAsyncModule = require(_script.util.canUploadBundlesAsync)
local createUGCBodyPartFoldersModule = require(_script.util.createUGCBodyPartFolders)
local isLayeredClothingModule = require(_script.util.isLayeredClothing)
local rigidOrLayeredAllowedModule = require(_script.util.RigidOrLayeredAllowed)
local _ = require(_script.util.Types)
local createEditableInstancesForContextModule = require(_script.util.createEditableInstancesForContext)
local destroyEditableInstancesModule = require(_script.util.destroyEditableInstances)
local validationHintsModule = require(_script.util.ValidationHints)
local validateInternalModule = require(_script.validation.validateInternal)
local validateLayeredClothingAccessoryMeshPartAssetFormatModule = require(_script.validation.validateLayeredClothingAccessoryMeshPartAssetFormat)
local validateLegacyAccessoryMeshPartAssetFormatModule = require(_script.validation.validateLegacyAccessoryMeshPartAssetFormat)
local validateFullBodyModule = require(_script.validation.validateFullBody)
local validateShoesModule = require(_script.validation.validateShoes)
local validateBundleReadyForUploadModule = require(_script.validation.validateBundleReadyForUpload)
local validateShoesBundleReadyForUploadModule = require(_script.validation.validateShoesBundleReadyForUpload)
local validateAnimationBundleReadyForUploadModule = require(_script.validation.validateAnimationBundleReadyForUpload)
local validateDynamicHeadMeshPartFormatModule = require(_script.validation.validateDynamicHeadMeshPartFormat)
local validationManagerModule = require(_script.validationSystem.ValidationManager)
local legacyValidationAdapterModule = require(_script.util.LegacyValidationAdapter)
local t = {
	ValidateAsset = validationManagerModule.ValidateAsset,
	ValidateFinalizedBundle = validationManagerModule.ValidateFinalizedBundle,
	combineResultsIntoLegacy = legacyValidationAdapterModule.combineResultsIntoLegacy,
	mergeLegacyIntoModern = legacyValidationAdapterModule.mergeLegacyIntoModern,
	isBackendInExperienceViaCanPublishEnabled = require(_script.flags.getFFlagUGCValidateBackendInExperienceViaCanPublish),
	shouldSkipAssetQualityChecks = require(_script.flags.getFFlagDebugUGCDisableAssetQualityChecks),
	SplitHrdInUpload = require(_script.util.SplitHumanoidRigDescriptionForUpload).fixUploadInstance
}

if getEngineFeatureUGCValidationWithContextEntrypointModule() then
	function t.validateWithContext(p1)
		-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateInternalModule (ref), destroyEditableInstancesModule (ref)
		assert(p1.instances ~= nil, "instances required in validationContext for validateWithContext")
		assert(p1.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateWithContext")
		local instances = p1.instances
		local isServer = p1.isServer
		local assetTypeEnum = p1.assetTypeEnum
		local allowEditableInstances = p1.allowEditableInstances
		local currentTime = tick()
		analyticsModule.setMetadata({
			entrypoint = "validate",
			assetType = assetTypeEnum.Name,
			isServer = isServer
		})
		local var1, var2 = createEditableInstancesForContextModule.processAll(instances, allowEditableInstances)
		
		if not var1 then
			if isServer then
				error(var2[1])
			else
				return var1, var2
			end
		end
		p1.editableMeshes = var2.editableMeshes
		p1.editableImages = var2.editableImages
		p1.lastTickSeconds = tick()
		
		if p1.requireAllFolders == nil then
			p1.requireAllFolders = true
		end
		local var3, var4 = validateInternalModule(p1)
		destroyEditableInstancesModule(p1.editableMeshes, p1.editableImages)
		
		if var3 then
			analyticsModule.recordScriptTime(script.Name, currentTime, p1)
			analyticsModule.reportScriptTimes(p1)
		end
		analyticsModule.reportCounter(var3, if assetTypeEnum == Enum.AssetType.DynamicHead then "Head" else "BodyPart", p1)
		
		return var3, var4
	end
end
function t.validate(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12)
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateInternalModule (ref), destroyEditableInstancesModule (ref)
	local currentTime = tick()
	analyticsModule.setMetadata({
		entrypoint = "validate",
		assetType = p2.Name,
		isServer = p3
	})
	local var1, var2 = createEditableInstancesForContextModule.processAll(p1, p8)
	
	if not var1 then
		if p3 then
			error(var2[1])
		else
			return var1, var2
		end
	end
	local t = {
		isAsync = false,
		instances = p1,
		assetTypeEnum = p2,
		allowUnreviewedAssets = p4,
		restrictedUserIds = p5,
		isServer = p3,
		token = p6,
		universeId = p7,
		allowEditableInstances = p8,
		bypassFlags = p9,
		validateMeshPartAccessories = p11 ~= nil or p11,
		lastTickSeconds = tick(),
		shouldYield = p10,
		editableMeshes = var2.editableMeshes,
		editableImages = var2.editableImages,
		requireAllFolders = p12 ~= nil or p12
	}
	local var3, var4 = validateInternalModule(t)
	destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
	
	if var3 then
		analyticsModule.recordScriptTime(script.Name, currentTime, t)
		analyticsModule.reportScriptTimes(t)
	end
	analyticsModule.reportCounter(var3, if p2 == Enum.AssetType.DynamicHead then "Head" else "BodyPart", t)
	
	return var3, var4
end

function t.validateAsync(p1, p2, p3, p4, p5, p6)
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateInternalModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "validateAsync",
		assetType = p2.Name,
		isServer = p4
	})
	local var1, var2 = createEditableInstancesForContextModule.processAll(p1)
	
	if not var1 then
		if p4 then
			error(var2[1])
		else
			p3(var1, var2)
		end
	end
	local t = {
		token = "",
		isAsync = true,
		validateMeshPartAccessories = false,
		instances = p1,
		assetTypeEnum = p2,
		allowUnreviewedAssets = p5,
		restrictedUserIds = p6,
		isServer = p4,
		editableMeshes = var2.editableMeshes,
		editableImages = var2.editableImages
	}
	coroutine.wrap(function()
		-- upvalues: p3 (ref), validateInternalModule (copy), t (ref), destroyEditableInstancesModule (copy)
		p3(validateInternalModule(t))
		destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
	end)()
end

function t.validateMeshPartFormat(p1, p2, p3, p4, p5)
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateDynamicHeadMeshPartFormatModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "validateMeshPartFormat",
		assetType = p2.Name,
		isServer = p3
	})
	assert(Enum.AssetType.DynamicHead == p2)
	local var1, var2 = createEditableInstancesForContextModule.processAll(p1)
	
	if not var1 then
		if p3 then
			error(var2[1])
		else
			return var1, var2
		end
	end
	local t = {
		validateMeshPartAccessories = false,
		instances = p1,
		assetTypeEnum = p2,
		allowUnreviewedAssets = p4,
		restrictedUserIds = p5,
		isServer = p3,
		editableMeshes = var2.editableMeshes,
		editableImages = var2.editableImages
	}
	local var3, var4 = validateDynamicHeadMeshPartFormatModule(t)
	destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
	
	return var3, var4
end

function t.validateAsyncMeshPartFormat(p1, p2, p3, p4, p5, p6)
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateDynamicHeadMeshPartFormatModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "validateAsyncMeshPartFormat",
		assetType = p2.Name,
		isServer = p4
	})
	assert(Enum.AssetType.DynamicHead == p2)
	local var1, var2 = createEditableInstancesForContextModule.processAll(p1)
	
	if not var1 then
		if p4 then
			error(var2[1])
		else
			p3(var1, var2)
		end
	end
	local t = {
		validateMeshPartAccessories = false,
		instances = p1,
		assetTypeEnum = p2,
		allowUnreviewedAssets = p5,
		restrictedUserIds = p6,
		isServer = p4,
		editableMeshes = var2.editableMeshes,
		editableImages = var2.editableImages
	}
	coroutine.wrap(function()
		-- upvalues: p3 (ref), validateDynamicHeadMeshPartFormatModule (copy), t (ref), destroyEditableInstancesModule (copy)
		p3(validateDynamicHeadMeshPartFormatModule(t))
		destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
	end)()
end

if getEngineFeatureUGCValidationWithContextEntrypointModule() then
	function t.validateMeshPartAssetFormatWithContext(value)
		-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), isLayeredClothingModule (ref), validateLayeredClothingAccessoryMeshPartAssetFormatModule (ref), validateLegacyAccessoryMeshPartAssetFormatModule (ref), destroyEditableInstancesModule (ref)
		assert(value.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateMeshPartAssetFormatWithContext")
		assert(value.instances ~= nil, "instances required in validationContext for validateMeshPartAssetFormatWithContext")
		local instances = value.instances
		local assetTypeEnum = value.assetTypeEnum
		local isServer = value.isServer
		local specialMeshAccessory = value.specialMeshAccessory
		analyticsModule.setMetadata({
			entrypoint = "validateMeshPartAssetFormat2",
			assetType = assetTypeEnum.Name,
			isServer = isServer
		})
		local var1, var2 = createEditableInstancesForContextModule.processAll(instances)
		
		if not var1 then
			if isServer then
				error(var2[1])
			else
				return var1, var2
			end
		end
		local var3, var4
		value.editableMeshes = var2.editableMeshes
		value.editableImages = var2.editableImages
		value.validateMeshPartAccessories = false
		local _ = nil
		local _ = nil
		
		if isLayeredClothingModule(instances[1]) then
			local var5, var6 = validateLayeredClothingAccessoryMeshPartAssetFormatModule(specialMeshAccessory, value)
			var3 = var5
			var4 = var6
		else
			local var7, var8 = validateLegacyAccessoryMeshPartAssetFormatModule(specialMeshAccessory, value)
			var3 = var7
			var4 = var8
		end
		destroyEditableInstancesModule(value.editableMeshes, value.editableImages)
		
		return var3, var4
	end
end
function t.validateMeshPartAssetFormat2(value, p1, p2, p3, p4, _)
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), isLayeredClothingModule (ref), validateLayeredClothingAccessoryMeshPartAssetFormatModule (ref), validateLegacyAccessoryMeshPartAssetFormatModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "validateMeshPartAssetFormat2",
		assetType = p2.Name,
		isServer = p3
	})
	local var1, var2 = createEditableInstancesForContextModule.processAll(value)
	
	if not var1 then
		if p3 then
			error(var2[1])
		else
			return var1, var2
		end
	end
	local var3, var4
	local t = {
		validateMeshPartAccessories = false,
		instances = value,
		assetTypeEnum = p2,
		allowUnreviewedAssets = p4,
		isServer = p3,
		editableMeshes = var2.editableMeshes,
		editableImages = var2.editableImages
	}
	local _ = nil
	local _ = nil
	
	if isLayeredClothingModule(value[1]) then
		local var5, var6 = validateLayeredClothingAccessoryMeshPartAssetFormatModule(p1, t)
		var3 = var5
		var4 = var6
	else
		local var7, var8 = validateLegacyAccessoryMeshPartAssetFormatModule(p1, t)
		var3 = var7
		var4 = var8
	end
	destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
	
	return var3, var4
end

t.validateBundleReadyForUpload = validateBundleReadyForUploadModule
t.validateShoesBundleReadyForUpload = validateShoesBundleReadyForUploadModule
t.validateAnimationBundleReadyForUpload = validateAnimationBundleReadyForUploadModule
t.util = {
	BundlesMetadata = bundlesMetadataModule,
	createUGCBodyPartFolders = createUGCBodyPartFoldersModule,
	canUploadBundlesAsync = canUploadBundlesAsyncModule
}
t.util.isLayeredClothingAllowed = rigidOrLayeredAllowedModule.isLayeredClothingAllowed
t.util.isRigidAccessoryAllowed = rigidOrLayeredAllowedModule.isRigidAccessoryAllowed

if getEngineFeatureUGCValidationWithContextEntrypointModule() then
	function t.validateFullBodyWithContext(p1)
		-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateFullBodyModule (ref), destroyEditableInstancesModule (ref)
		assert(p1.fullBodyData ~= nil, "fullBodyData required in validationContext for validateFullBodyWithContext")
		local isServer = p1.isServer
		local fullBodyData = p1.fullBodyData
		local allowEditableInstances = p1.allowEditableInstances
		analyticsModule.setMetadata({
			entrypoint = "validateFullBody",
			assetType = "",
			isServer = isServer
		})
		local currentTime = tick()
		local t = {}
		
		for i, v in fullBodyData do
			for i_1, v_1 in v.allSelectedInstances do
				table.insert(t, v_1)
			end
		end
		local var1, var2 = createEditableInstancesForContextModule.processAll(t, allowEditableInstances)
		
		if not var1 then
			if isServer then
				error(var2[1])
			else
				return var1, var2
			end
		end
		p1.editableMeshes = var2.editableMeshes
		p1.editableImages = var2.editableImages
		p1.lastTickSeconds = tick()
		
		if p1.requireAllFolders == nil then
			p1.requireAllFolders = true
		end
		local var3, var4 = validateFullBodyModule(p1)
		destroyEditableInstancesModule(p1.editableMeshes, p1.editableImages)
		
		if var3 then
			analyticsModule.recordScriptTime(script.Name, currentTime, p1)
			analyticsModule.reportScriptTimes(p1)
		end
		analyticsModule.reportCounter(var3, "FullBody", p1)
		
		return var3, var4
	end
end
function t.validateFullBody(p2, p3, p4, p5, p6, p7)
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateFullBodyModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "validateFullBody",
		assetType = "",
		isServer = p3
	})
	local currentTime = tick()
	local t = {}
	
	for i, v in p2 do
		for i_1, v_1 in v.allSelectedInstances do
			table.insert(t, v_1)
		end
	end
	local var5, var6 = createEditableInstancesForContextModule.processAll(t, p4)
	
	if not var5 then
		if p3 then
			error(var6[1])
		else
			return var5, var6
		end
	end
	local t_1 = {
		validateMeshPartAccessories = false,
		fullBodyData = p2,
		isServer = p3,
		allowEditableInstances = p4,
		bypassFlags = p5,
		lastTickSeconds = tick(),
		shouldYield = p6,
		editableMeshes = var6.editableMeshes,
		editableImages = var6.editableImages,
		requireAllFolders = p7 ~= nil or p7
	}
	local var7, var8 = validateFullBodyModule(t_1)
	destroyEditableInstancesModule(t_1.editableMeshes, t_1.editableImages)
	
	if var7 then
		analyticsModule.recordScriptTime(script.Name, currentTime, t_1)
		analyticsModule.reportScriptTimes(t_1)
	end
	analyticsModule.reportCounter(var7, "FullBody", t_1)
	
	return var7, var8
end

function t.validateShoesWithContext(p8)
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateShoesModule (ref), destroyEditableInstancesModule (ref)
	assert(p8.fullBodyData ~= nil, "fullBodyData required in validationContext for validateShoes")
	local isServer = p8.isServer
	local fullBodyData = p8.fullBodyData
	local allowEditableInstances = p8.allowEditableInstances
	analyticsModule.setMetadata({
		entrypoint = "validateShoes",
		assetType = "",
		isServer = isServer
	})
	local currentTime = tick()
	local t = {}
	
	for i, v in fullBodyData do
		for i_1, v_1 in v.allSelectedInstances do
			table.insert(t, v_1)
		end
	end
	local var9, var10 = createEditableInstancesForContextModule.processAll(t, allowEditableInstances)
	
	if not var9 then
		if isServer then
			error(var10[1])
		else
			return var9, var10
		end
	end
	p8.editableMeshes = var10.editableMeshes
	p8.editableImages = var10.editableImages
	p8.lastTickSeconds = tick()
	local var11, var12 = validateShoesModule(p8)
	destroyEditableInstancesModule(p8.editableMeshes, p8.editableImages)
	
	if var11 then
		analyticsModule.recordScriptTime(script.Name, currentTime, p8)
		analyticsModule.reportScriptTimes(p8)
	end
	analyticsModule.reportCounter(var11, "Shoes", p8)
	
	return var11, var12
end

function t.preprocessDataAsync(p9, p10, p11, p12, p13)
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validationHintsModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "preprocessDataAsync",
		assetType = "",
		isServer = p10
	})
	local currentTime = tick()
	local t = {}
	
	for i, v in p9 do
		table.insert(t, v)
	end
	local var13, var14 = createEditableInstancesForContextModule.processAll(t, p11)
	
	if not var13 then
		if p10 then
			error(var14[1])
		else
			return { ok = false, errors = var14 }
		end
	end
	local t_1 = {
		validateMeshPartAccessories = false,
		isServer = p10,
		allowEditableInstances = p11,
		bypassFlags = p12,
		lastTickSeconds = tick(),
		shouldYield = p13,
		editableMeshes = var14.editableMeshes,
		editableImages = var14.editableImages
	}
	local var15 = validationHintsModule.preprocessDataAsync(p9, t_1)
	destroyEditableInstancesModule(t_1.editableMeshes, t_1.editableImages)
	
	if var15.ok then
		analyticsModule.recordScriptTime("preprocessDataAsync", currentTime, t_1)
		analyticsModule.reportScriptTimes(t_1)
	end
	return var15
end

function t.isPreprocessDataCached(p14, p15, p16)
	-- upvalues: analyticsModule (ref), validationHintsModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "isPreprocessDataCached",
		assetType = "",
		isServer = p16
	})
	local currentTime = tick()
	local var16 = validationHintsModule.isPreprocessDataCached(p14, p15)
	local t = { isServer = p16 }
	analyticsModule.recordScriptTime("isPreprocessDataCached", currentTime, t)
	analyticsModule.reportScriptTimes(t)
	
	return var16
end

function t.calculateScaleToValidateBoundsAsync(p14, p15, p16, p17, p18, p19)
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validationHintsModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "calculateScaleToValidateBoundsAsync",
		assetType = "",
		isServer = p15
	})
	local currentTime = tick()
	local var16 = nil
	
	if not p19 then
		local t = {}
		
		for i, v in p14 do
			table.insert(t, v)
		end
		local _ = nil
		local var17, var18 = createEditableInstancesForContextModule.processAll(t, p16)
		var16 = var18
		
		if not var17 then
			if p15 then
				error(var16[1])
			else
				return { ok = false, errors = var16 }
			end
		end
	end
	local t = {
		validateMeshPartAccessories = false,
		isServer = p15,
		allowEditableInstances = p16,
		bypassFlags = p17,
		lastTickSeconds = tick(),
		shouldYield = p18
	}
	
	if not p19 then
		t.editableMeshes = var16.editableMeshes
		t.editableImages = var16.editableImages
	end
	local var19 = validationHintsModule.calculateScaleToValidateBoundsAsync(p14, t, p19)
	
	if not p19 then
		destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
	end
	if var19.ok then
		analyticsModule.recordScriptTime("calculateScaleToValidateBoundsAsync", currentTime, t)
		analyticsModule.reportScriptTimes(t)
	end
	return var19
end

t.GUIDAttributeName = constantsModule.GUIDAttributeName

return t