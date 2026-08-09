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
	isFolderStructureEnabled = require(_script.flags.getFFlagUGCValidationEnableFolderStructure),
	isEntrypointMergingEnabled = require(_script.flags.getFFlagUGCValidationCombineEntrypointResults),
	SplitHrdInUpload = require(_script.util.SplitHumanoidRigDescriptionForUpload).fixUploadInstance
}

if getEngineFeatureUGCValidationWithContextEntrypointModule() then
	function t.validateWithContext(p0) --[[ line: 49 ]]
		-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateInternalModule (ref), destroyEditableInstancesModule (ref)
		assert(p0.instances ~= nil, "instances required in validationContext for validateWithContext")
		assert(p0.assetTypeEnum ~= nil, "assetTypeEnum required in validationContext for validateWithContext")
		local instances = p0.instances
		local isServer = p0.isServer
		local assetTypeEnum = p0.assetTypeEnum
		local allowEditableInstances = p0.allowEditableInstances
		local currentTime = tick()
		analyticsModule.setMetadata({
			entrypoint = "validate",
			assetType = assetTypeEnum.Name,
			isServer = isServer
		})
		local var25, var26 = createEditableInstancesForContextModule.processAll(instances, allowEditableInstances)
		
		if not var25 then
			if isServer then
				error(var26[1])
			else
				return var25, var26
			end
		end
		p0.editableMeshes = var26.editableMeshes
		p0.editableImages = var26.editableImages
		p0.lastTickSeconds = tick()
		
		if p0.requireAllFolders == nil then
			p0.requireAllFolders = true
		end
		local var27, var28 = validateInternalModule(p0)
		destroyEditableInstancesModule(p0.editableMeshes, p0.editableImages)
		
		if var27 then
			analyticsModule.recordScriptTime(script.Name, currentTime, p0)
			analyticsModule.reportScriptTimes(p0)
		end
		analyticsModule.reportCounter(var27, if assetTypeEnum == Enum.AssetType.DynamicHead then "Head" else "BodyPart", p0)
		
		return var27, var28
	end
end
function t.validate(p1, p2, p3, p4, p5, p6, p7, p8, p9, p10, p11, p12) --[[ line: 109 ]]
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateInternalModule (ref), destroyEditableInstancesModule (ref)
	local currentTime = tick()
	analyticsModule.setMetadata({
		entrypoint = "validate",
		assetType = p2.Name,
		isServer = p3
	})
	local var30, var31 = createEditableInstancesForContextModule.processAll(p1, p8)
	
	if not var30 then
		if p3 then
			error(var31[1])
		else
			return var30, var31
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
		editableMeshes = var31.editableMeshes,
		editableImages = var31.editableImages,
		requireAllFolders = p12 ~= nil or p12
	}
	local var33, var34 = validateInternalModule(t)
	destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
	
	if var33 then
		analyticsModule.recordScriptTime(script.Name, currentTime, t)
		analyticsModule.reportScriptTimes(t)
	end
	analyticsModule.reportCounter(var33, if p2 == Enum.AssetType.DynamicHead then "Head" else "BodyPart", t)
	
	return var33, var34
end

function t.validateAsync(p13, p14, p15, p16, p17, p18) --[[ line: 180 ]]
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateInternalModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "validateAsync",
		assetType = p14.Name,
		isServer = p16
	})
	local var35, var36 = createEditableInstancesForContextModule.processAll(p13)
	
	if not var35 then
		if p16 then
			error(var36[1])
		else
			p15(var35, var36)
		end
	end
	local t = {
		token = "",
		isAsync = true,
		validateMeshPartAccessories = false,
		instances = p13,
		assetTypeEnum = p14,
		allowUnreviewedAssets = p17,
		restrictedUserIds = p18,
		isServer = p16,
		editableMeshes = var36.editableMeshes,
		editableImages = var36.editableImages
	}
	coroutine.wrap(function() --[[ line: 216 ]]
		-- upvalues: p15 (ref), validateInternalModule (copy), t (ref), destroyEditableInstancesModule (copy)
		p15(validateInternalModule(t))
		destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
	end)()
end

function t.validateMeshPartFormat(p19, p20, p21, p22, p23) --[[ line: 226 ]]
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateDynamicHeadMeshPartFormatModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "validateMeshPartFormat",
		assetType = p20.Name,
		isServer = p21
	})
	assert(Enum.AssetType.DynamicHead == p20)
	local var38, var39 = createEditableInstancesForContextModule.processAll(p19)
	
	if not var38 then
		if p21 then
			error(var39[1])
		else
			return var38, var39
		end
	end
	local t = {
		validateMeshPartAccessories = false,
		instances = p19,
		assetTypeEnum = p20,
		allowUnreviewedAssets = p22,
		restrictedUserIds = p23,
		isServer = p21,
		editableMeshes = var39.editableMeshes,
		editableImages = var39.editableImages
	}
	local var41, var42 = validateDynamicHeadMeshPartFormatModule(t)
	destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
	
	return var41, var42
end

function t.validateAsyncMeshPartFormat(p24, p25, p26, p27, p28, p29) --[[ line: 273 ]]
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateDynamicHeadMeshPartFormatModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "validateAsyncMeshPartFormat",
		assetType = p25.Name,
		isServer = p27
	})
	assert(Enum.AssetType.DynamicHead == p25)
	local var43, var44 = createEditableInstancesForContextModule.processAll(p24)
	
	if not var43 then
		if p27 then
			error(var44[1])
		else
			p26(var43, var44)
		end
	end
	local t = {
		validateMeshPartAccessories = false,
		instances = p24,
		assetTypeEnum = p25,
		allowUnreviewedAssets = p28,
		restrictedUserIds = p29,
		isServer = p27,
		editableMeshes = var44.editableMeshes,
		editableImages = var44.editableImages
	}
	coroutine.wrap(function() --[[ line: 311 ]]
		-- upvalues: p26 (ref), validateDynamicHeadMeshPartFormatModule (copy), t (ref), destroyEditableInstancesModule (copy)
		p26(validateDynamicHeadMeshPartFormatModule(t))
		destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
	end)()
end

if getEngineFeatureUGCValidationWithContextEntrypointModule() then
	function t.validateMeshPartAssetFormatWithContext(value) --[[ line: 321 ]]
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
		local var46, var47 = createEditableInstancesForContextModule.processAll(instances)
		
		if not var46 then
			if isServer then
				error(var47[1])
			else
				return var46, var47
			end
		end
		local var50, var51
		value.editableMeshes = var47.editableMeshes
		value.editableImages = var47.editableImages
		value.validateMeshPartAccessories = false
		local _ = nil
		local _ = nil
		
		if isLayeredClothingModule(instances[1]) then
			local var48, var49 = validateLayeredClothingAccessoryMeshPartAssetFormatModule(specialMeshAccessory, value)
			var50 = var48
			var51 = var49
		else
			local var52, var53 = validateLegacyAccessoryMeshPartAssetFormatModule(specialMeshAccessory, value)
			var50 = var52
			var51 = var53
		end
		destroyEditableInstancesModule(value.editableMeshes, value.editableImages)
		
		return var50, var51
	end
end
function t.validateMeshPartAssetFormat2(value, p30, p31, p32, p33, _) --[[ line: 375 ]]
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), isLayeredClothingModule (ref), validateLayeredClothingAccessoryMeshPartAssetFormatModule (ref), validateLegacyAccessoryMeshPartAssetFormatModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "validateMeshPartAssetFormat2",
		assetType = p31.Name,
		isServer = p32
	})
	local var54, var55 = createEditableInstancesForContextModule.processAll(value)
	
	if not var54 then
		if p32 then
			error(var55[1])
		else
			return var54, var55
		end
	end
	local var59, var60
	local t = {
		validateMeshPartAccessories = false,
		instances = value,
		assetTypeEnum = p31,
		allowUnreviewedAssets = p33,
		isServer = p32,
		editableMeshes = var55.editableMeshes,
		editableImages = var55.editableImages
	}
	local _ = nil
	local _ = nil
	
	if isLayeredClothingModule(value[1]) then
		local var57, var58 = validateLayeredClothingAccessoryMeshPartAssetFormatModule(p30, t)
		var59 = var57
		var60 = var58
	else
		local var61, var62 = validateLegacyAccessoryMeshPartAssetFormatModule(p30, t)
		var59 = var61
		var60 = var62
	end
	destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
	
	return var59, var60
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
	function t.validateFullBodyWithContext(p34) --[[ line: 480 ]]
		-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateFullBodyModule (ref), destroyEditableInstancesModule (ref)
		assert(p34.fullBodyData ~= nil, "fullBodyData required in validationContext for validateFullBodyWithContext")
		local isServer = p34.isServer
		local fullBodyData = p34.fullBodyData
		local allowEditableInstances = p34.allowEditableInstances
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
		local var65, var66 = createEditableInstancesForContextModule.processAll(t, allowEditableInstances)
		
		if not var65 then
			if isServer then
				error(var66[1])
			else
				return var65, var66
			end
		end
		p34.editableMeshes = var66.editableMeshes
		p34.editableImages = var66.editableImages
		p34.lastTickSeconds = tick()
		
		if p34.requireAllFolders == nil then
			p34.requireAllFolders = true
		end
		local var67, var68 = validateFullBodyModule(p34)
		destroyEditableInstancesModule(p34.editableMeshes, p34.editableImages)
		
		if var67 then
			analyticsModule.recordScriptTime(script.Name, currentTime, p34)
			analyticsModule.reportScriptTimes(p34)
		end
		analyticsModule.reportCounter(var67, "FullBody", p34)
		
		return var67, var68
	end
end
function t.validateFullBody(p35, p36, p37, p38, p39, p40) --[[ line: 543 ]]
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateFullBodyModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "validateFullBody",
		assetType = "",
		isServer = p36
	})
	local currentTime = tick()
	local t = {}
	
	for i, v in p35 do
		for i_1, v_1 in v.allSelectedInstances do
			table.insert(t, v_1)
		end
	end
	local var71, var72 = createEditableInstancesForContextModule.processAll(t, p37)
	
	if not var71 then
		if p36 then
			error(var72[1])
		else
			return var71, var72
		end
	end
	local t_1 = {
		validateMeshPartAccessories = false,
		fullBodyData = p35,
		isServer = p36,
		allowEditableInstances = p37,
		bypassFlags = p38,
		lastTickSeconds = tick(),
		shouldYield = p39,
		editableMeshes = var72.editableMeshes,
		editableImages = var72.editableImages,
		requireAllFolders = p40 ~= nil or p40
	}
	local var74, var75 = validateFullBodyModule(t_1)
	destroyEditableInstancesModule(t_1.editableMeshes, t_1.editableImages)
	
	if var74 then
		analyticsModule.recordScriptTime(script.Name, currentTime, t_1)
		analyticsModule.reportScriptTimes(t_1)
	end
	analyticsModule.reportCounter(var74, "FullBody", t_1)
	
	return var74, var75
end

function t.validateShoesWithContext(p41) --[[ line: 605 ]]
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validateShoesModule (ref), destroyEditableInstancesModule (ref)
	assert(p41.fullBodyData ~= nil, "fullBodyData required in validationContext for validateShoes")
	local isServer = p41.isServer
	local fullBodyData = p41.fullBodyData
	local allowEditableInstances = p41.allowEditableInstances
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
	local var78, var79 = createEditableInstancesForContextModule.processAll(t, allowEditableInstances)
	
	if not var78 then
		if isServer then
			error(var79[1])
		else
			return var78, var79
		end
	end
	p41.editableMeshes = var79.editableMeshes
	p41.editableImages = var79.editableImages
	p41.lastTickSeconds = tick()
	local var80, var81 = validateShoesModule(p41)
	destroyEditableInstancesModule(p41.editableMeshes, p41.editableImages)
	
	if var80 then
		analyticsModule.recordScriptTime(script.Name, currentTime, p41)
		analyticsModule.reportScriptTimes(p41)
	end
	analyticsModule.reportCounter(var80, "Shoes", p41)
	
	return var80, var81
end

function t.preprocessDataAsync(p42, p43, p44, p45, p46) --[[ line: 657 ]]
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validationHintsModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "preprocessDataAsync",
		assetType = "",
		isServer = p43
	})
	local currentTime = tick()
	local t = {}
	
	for i, v in p42 do
		table.insert(t, v)
	end
	local var84, var85 = createEditableInstancesForContextModule.processAll(t, p44)
	
	if not var84 then
		if p43 then
			error(var85[1])
		else
			return { ok = false, errors = var85 }
		end
	end
	local t_1 = {
		validateMeshPartAccessories = false,
		isServer = p43,
		allowEditableInstances = p44,
		bypassFlags = p45,
		lastTickSeconds = tick(),
		shouldYield = p46,
		editableMeshes = var85.editableMeshes,
		editableImages = var85.editableImages
	}
	local var87 = validationHintsModule.preprocessDataAsync(p42, t_1)
	destroyEditableInstancesModule(t_1.editableMeshes, t_1.editableImages)
	
	if var87.ok then
		analyticsModule.recordScriptTime("preprocessDataAsync", currentTime, t_1)
		analyticsModule.reportScriptTimes(t_1)
	end
	return var87
end

function t.isPreprocessDataCached(p47, p48, p49) --[[ line: 716 ]]
	-- upvalues: analyticsModule (ref), validationHintsModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "isPreprocessDataCached",
		assetType = "",
		isServer = p49
	})
	local currentTime = tick()
	local var89 = validationHintsModule.isPreprocessDataCached(p47, p48)
	local t = { isServer = p49 }
	analyticsModule.recordScriptTime("isPreprocessDataCached", currentTime, t)
	analyticsModule.reportScriptTimes(t)
	
	return var89
end

function t.calculateScaleToValidateBoundsAsync(p50, p51, p52, p53, p54, p55) --[[ line: 741 ]]
	-- upvalues: analyticsModule (ref), createEditableInstancesForContextModule (ref), validationHintsModule (ref), destroyEditableInstancesModule (ref)
	analyticsModule.setMetadata({
		entrypoint = "calculateScaleToValidateBoundsAsync",
		assetType = "",
		isServer = p51
	})
	local currentTime = tick()
	local var92 = nil
	
	if not p55 then
		local t = {}
		
		for i, v in p50 do
			table.insert(t, v)
		end
		local _ = nil
		local var94, var95 = createEditableInstancesForContextModule.processAll(t, p52)
		var92 = var95
		
		if not var94 then
			if p51 then
				error(var92[1])
			else
				return { ok = false, errors = var92 }
			end
		end
	end
	local t = {
		validateMeshPartAccessories = false,
		isServer = p51,
		allowEditableInstances = p52,
		bypassFlags = p53,
		lastTickSeconds = tick(),
		shouldYield = p54
	}
	
	if not p55 then
		t.editableMeshes = var92.editableMeshes
		t.editableImages = var92.editableImages
	end
	local var97 = validationHintsModule.calculateScaleToValidateBoundsAsync(p50, t, p55)
	
	if not p55 then
		destroyEditableInstancesModule(t.editableMeshes, t.editableImages)
	end
	if var97.ok then
		analyticsModule.recordScriptTime("calculateScaleToValidateBoundsAsync", currentTime, t)
		analyticsModule.reportScriptTimes(t)
	end
	return var97
end

t.GUIDAttributeName = constantsModule.GUIDAttributeName

return t