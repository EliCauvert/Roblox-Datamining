local parent = script.Parent.Parent
local analyticsModule = require(parent.Analytics)
local constantsModule = require(parent.Constants)
local constantsInterfaceModule = require(parent.ConstantsInterface)
local getFFlagUGCValidateLegFullBodySeparationModule = require(parent.flags.getFFlagUGCValidateLegFullBodySeparation)
local getFFlagUGCValidateMigrateBodyPartBoundsModule = require(parent.flags.getFFlagUGCValidateMigrateBodyPartBounds)
local getFFlagUGCValidateMigrateCageGeometryModule = require(parent.flags.getFFlagUGCValidateMigrateCageGeometry)
local getFFlagUGCValidateMigratePoseBlockingModule = require(parent.flags.getFFlagUGCValidateMigratePoseBlocking)
local _ = require(parent.util.Types)
local failureReasonsAccumulatorModule = require(parent.util.FailureReasonsAccumulator)
local validateWithSchemaModule = require(parent.util.validateWithSchema)
local validateAssetBoundsModule = require(parent.validation.validateAssetBounds)
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateBodyBlockingTestsModule = require(parent.util.ValidateBodyBlockingTests)
local validateAssetBodyPartCagesModule = require(parent.validation.ValidateAssetBodyPartCages)
local validateLegsSeparationModule = require(parent.validation.ValidateLegsSeparation)
local createDynamicHeadMeshPartSchemaModule = require(parent.util.createDynamicHeadMeshPartSchema)
local createLimbsAndTorsoSchemaModule = require(parent.util.createLimbsAndTorsoSchema)
local resetPhysicsDataModule = require(parent.util.resetPhysicsData)
local parseContentIdsModule = require(parent.util.ParseContentIds)
local r15plusUtilsModule = require(parent.util.R15plusUtils)
local getFFlagDebugAllowHRDUploadOnBundleBackendModule = require(parent.flags.getFFlagDebugAllowHRDUploadOnBundleBackend)

local function _(p1, p2)
	for i, v in p1 do
		if v.Name == p2 then
			return v
		end
	end
	return nil
end

local function validateAllAssetsWithSchema(value, p3, p4)
	-- upvalues: validateSingleInstanceModule (ref), validateWithSchemaModule (ref), createDynamicHeadMeshPartSchemaModule (ref), createLimbsAndTorsoSchemaModule (ref)
	for i, v in value do
		if Enum.AssetType.DynamicHead == v.assetTypeEnum then
			if validateSingleInstanceModule(v.allSelectedInstances, p4) then
				if not validateWithSchemaModule(createDynamicHeadMeshPartSchemaModule(p4), v.allSelectedInstances[1], p4).success then
					return false
				end
			end
			return false
		else
			for i_1, v_1 in p3 do
				local var1
				for i_2, v_2 in v.allSelectedInstances do
					if v_2.Name == v_1 then
						var1 = v_2
						if var1 then
							if not validateWithSchemaModule(createLimbsAndTorsoSchemaModule(v.assetTypeEnum, v_1, p4), var1, p4).success then
								return false
							end
						end
						return false
					end
				end
				var1 = nil
			end
		end
	end
	return true
end

local function validateCorrectAssetTypesExist(value)
	-- upvalues: constantsInterfaceModule (ref)
	local t = {}
	local count = #constantsInterfaceModule.getBodyPartAssets()
	local var2 = 0
	
	for i, v in value do
		if constantsInterfaceModule.isBodyPart(v.assetTypeEnum) then
			if not t[v.assetTypeEnum] then
				t[v.assetTypeEnum] = true
				var2 += 1
				continue
			end
			return false
		end
		return false
	end
	return var2 == count
end

local function createAllBodyPartsTable(p5, p6)
	local t = {}
	
	for i, v in p6 do
		if Enum.AssetType.DynamicHead == v.assetTypeEnum then
			t[v.allSelectedInstances[1].Name] = v.allSelectedInstances[1]
			continue
		end
		local var3
		for i_1, v_1 in v.allSelectedInstances do
			if v_1.Name == p5 then
				var3 = v_1
				for i_2, i_1 in var3:GetChildren() do
					t[i_1.Name] = i_1
				end
			end
		end
		var3 = nil
	end
	return t
end

local function validateMeshIds(p7, p8)
	-- upvalues: parseContentIdsModule (ref), analyticsModule (ref)
	local t = { MeshPart = { "MeshId" } }
	local t_1 = { MeshPart = { MeshId = true } }
	
	for i, v in p7 do
		for i_1, v_1 in v.allSelectedInstances do
			if not parseContentIdsModule.parseWithErrorCheck({}, {}, v_1, t, t_1, p8) then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateFullBody_MeshIdsMissing, nil, p8)
				
				return false, {
					"Unable to run full body validation due to previous errors detected while processing individual body parts"
				}
			end
		end
	end
	return true
end

local function validateInstanceHierarchy(p9, p10, p11)
	-- upvalues: validateCorrectAssetTypesExist (ref), analyticsModule (ref), validateAllAssetsWithSchema (ref), validateMeshIds (ref)
	local var4 = if p11 then p11.isServer else nil
	
	if validateCorrectAssetTypesExist(p9) then
		if not validateAllAssetsWithSchema(p9, p10, p11) then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateFullBody_InstancesMissing, nil, p11)
			
			return false, {
				"Unable to run full body validation due to previous errors detected while processing individual body parts."
			}
		end
		local var5, var6 = validateMeshIds(p9, p11)
		
		if var5 then
			return true
		end
		return false, var6
	else
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateFullBody_IncorrectAssetTypeSet, nil, p11)
		
		if var4 then
			error("Full body check did not receive the correct set of body part Asset Types (i.e. Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg). Make sure the body model is valid and try again.")
		end
		return false, {
			"Full body check did not receive the correct set of body part Asset Types (i.e. Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg). Make sure the body model is valid and try again."
		}
	end
end

local function resetAllPhysicsData(value)
	-- upvalues: resetPhysicsDataModule (ref)
	for i, v in value.fullBodyData do
		local var4, var5 = resetPhysicsDataModule(v.allSelectedInstances, value)
		
		if not var4 then
			return false, { var5 }
		end
	end
	return true
end

return function(p9)
	-- upvalues: getFFlagDebugAllowHRDUploadOnBundleBackendModule (ref), r15plusUtilsModule (ref), constantsModule (ref), validateInstanceHierarchy (ref), resetAllPhysicsData (ref), failureReasonsAccumulatorModule (ref), createAllBodyPartsTable (ref), getFFlagUGCValidateMigratePoseBlockingModule (ref), validateBodyBlockingTestsModule (ref), analyticsModule (ref), getFFlagUGCValidateMigrateCageGeometryModule (ref), validateAssetBodyPartCagesModule (ref), getFFlagUGCValidateMigrateBodyPartBoundsModule (ref), validateAssetBoundsModule (ref), getFFlagUGCValidateLegFullBodySeparationModule (ref), validateLegsSeparationModule (ref)
	assert(p9.fullBodyData ~= nil, "fullBodyData required in validationContext for validateFullBody")
	local fullBodyData = p9.fullBodyData
	local requireAllFolders = p9.requireAllFolders
	
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(p9.isBackendBundleUpload == true)
	end
	local list = { constantsModule.FOLDER_NAMES.R15ArtistIntent }
	
	if requireAllFolders then
		table.insert(list, constantsModule.FOLDER_NAMES.R15Fixed)
	end
	local var6, var7 = validateInstanceHierarchy(fullBodyData, list, p9)
	
	if var6 then
		local var8, var9 = resetAllPhysicsData(p9)
		
		if var8 then
			local var10 = failureReasonsAccumulatorModule.new()
			
			for i, v in list do
				local var11 = createAllBodyPartsTable(v, fullBodyData)
				assert(var11)
				
				if getFFlagUGCValidateMigratePoseBlockingModule() or validateBodyBlockingTestsModule.validateAll(var11, p9) then
					if not getFFlagUGCValidateMigrateCageGeometryModule() then
						var10:updateReasons(validateAssetBodyPartCagesModule.validateFullBody(var11, p9))
					end
					if not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
						var10:updateReasons(validateAssetBoundsModule(var11, nil, p9))
					end
					if not getFFlagUGCValidateMigratePoseBlockingModule() and getFFlagUGCValidateLegFullBodySeparationModule() then
						var10:updateReasons(validateLegsSeparationModule.validateFullBody(var11, p9))
					end
				end
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateFullBody_ZeroMeshSize, nil, p9)
				
				if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
					r15plusUtilsModule.setIsBackendBundleUpload(false)
				end
				return false, {
					"Unable to run full body validation due to previous errors detected while processing individual body parts."
				}
			end
			if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
				r15plusUtilsModule.setIsBackendBundleUpload(false)
			end
			return var10:getFinalResults()
		elseif getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
			r15plusUtilsModule.setIsBackendBundleUpload(false)
		end
		return false, var9
	elseif getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(false)
	end
	return false, var7
end