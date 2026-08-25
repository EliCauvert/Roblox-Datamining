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

local function _(p0, p1)
	for i, v in p0 do
		if v.Name == p1 then
			return v
		end
	end
	return nil
end

local function validateAllAssetsWithSchema(value, p2, p3)
	-- upvalues: validateSingleInstanceModule (ref), validateWithSchemaModule (ref), createDynamicHeadMeshPartSchemaModule (ref), createLimbsAndTorsoSchemaModule (ref)
	for i, v in value do
		if Enum.AssetType.DynamicHead == v.assetTypeEnum then
			if validateSingleInstanceModule(v.allSelectedInstances, p3) then
				if not validateWithSchemaModule(createDynamicHeadMeshPartSchemaModule(p3), v.allSelectedInstances[1], p3).success then
					return false
				end
			end
			return false
		else
			for i_1, v_1 in p2 do
				local var26
				for i_2, v_2 in v.allSelectedInstances do
					if v_2.Name == v_1 then
						var26 = v_2
						if var26 then
							if not validateWithSchemaModule(createLimbsAndTorsoSchemaModule(v.assetTypeEnum, v_1, p3), var26, p3).success then
								return false
							end
						end
						return false
					end
				end
				var26 = nil
			end
		end
	end
	return true
end

local function validateCorrectAssetTypesExist(value)
	-- upvalues: constantsInterfaceModule (ref)
	local t = {}
	local count = #constantsInterfaceModule.getBodyPartAssets()
	local var29 = 0
	
	for i, v in value do
		if constantsInterfaceModule.isBodyPart(v.assetTypeEnum) then
			if not t[v.assetTypeEnum] then
				t[v.assetTypeEnum] = true
				var29 += 1
				continue
			end
			return false
		end
		return false
	end
	return var29 == count
end

local function createAllBodyPartsTable(p4, p5)
	local t = {}
	
	for i, v in p5 do
		if Enum.AssetType.DynamicHead == v.assetTypeEnum then
			t[v.allSelectedInstances[1].Name] = v.allSelectedInstances[1]
			continue
		end
		local var31
		for i_1, v_1 in v.allSelectedInstances do
			if v_1.Name == p4 then
				var31 = v_1
				for i_2, i_1 in var31:GetChildren() do
					t[i_1.Name] = i_1
				end
			end
		end
		var31 = nil
	end
	return t
end

local function validateMeshIds(p6, p7)
	-- upvalues: parseContentIdsModule (ref), analyticsModule (ref)
	local t = { MeshPart = { "MeshId" } }
	local t_1 = { MeshPart = { MeshId = true } }
	
	for i, v in p6 do
		for i_1, v_1 in v.allSelectedInstances do
			if not parseContentIdsModule.parseWithErrorCheck({}, {}, v_1, t, t_1, p7) then
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateFullBody_MeshIdsMissing, nil, p7)
				
				return false, {
					"Unable to run full body validation due to previous errors detected while processing individual body parts"
				}
			end
		end
	end
	return true
end

local function validateInstanceHierarchy(p8, p9, p10)
	-- upvalues: validateCorrectAssetTypesExist (ref), analyticsModule (ref), validateAllAssetsWithSchema (ref), validateMeshIds (ref)
	local var34 = if p10 then p10.isServer else nil
	
	if validateCorrectAssetTypesExist(p8) then
		if not validateAllAssetsWithSchema(p8, p9, p10) then
			analyticsModule.reportFailure(analyticsModule.ErrorType.validateFullBody_InstancesMissing, nil, p10)
			
			return false, {
				"Unable to run full body validation due to previous errors detected while processing individual body parts."
			}
		end
		local var35, var36 = validateMeshIds(p8, p10)
		
		if var35 then
			return true
		end
		return false, var36
	else
		analyticsModule.reportFailure(analyticsModule.ErrorType.validateFullBody_IncorrectAssetTypeSet, nil, p10)
		
		if var34 then
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
		local var37, var38 = resetPhysicsDataModule(v.allSelectedInstances, value)
		
		if not var37 then
			return false, { var38 }
		end
	end
	return true
end

return function(p11)
	-- upvalues: getFFlagDebugAllowHRDUploadOnBundleBackendModule (ref), r15plusUtilsModule (ref), constantsModule (ref), validateInstanceHierarchy (ref), resetAllPhysicsData (ref), failureReasonsAccumulatorModule (ref), createAllBodyPartsTable (ref), getFFlagUGCValidateMigratePoseBlockingModule (ref), validateBodyBlockingTestsModule (ref), analyticsModule (ref), getFFlagUGCValidateMigrateCageGeometryModule (ref), validateAssetBodyPartCagesModule (ref), getFFlagUGCValidateMigrateBodyPartBoundsModule (ref), validateAssetBoundsModule (ref), getFFlagUGCValidateLegFullBodySeparationModule (ref), validateLegsSeparationModule (ref)
	assert(p11.fullBodyData ~= nil, "fullBodyData required in validationContext for validateFullBody")
	local fullBodyData = p11.fullBodyData
	local requireAllFolders = p11.requireAllFolders
	
	if getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(p11.isBackendBundleUpload == true)
	end
	local list = { constantsModule.FOLDER_NAMES.R15ArtistIntent }
	
	if requireAllFolders then
		table.insert(list, constantsModule.FOLDER_NAMES.R15Fixed)
	end
	local var40, var41 = validateInstanceHierarchy(fullBodyData, list, p11)
	
	if var40 then
		local var42, var43 = resetAllPhysicsData(p11)
		
		if var42 then
			local var44 = failureReasonsAccumulatorModule.new()
			
			for i, v in list do
				local var45 = createAllBodyPartsTable(v, fullBodyData)
				assert(var45)
				
				if getFFlagUGCValidateMigratePoseBlockingModule() or validateBodyBlockingTestsModule.validateAll(var45, p11) then
					if not getFFlagUGCValidateMigrateCageGeometryModule() then
						var44:updateReasons(validateAssetBodyPartCagesModule.validateFullBody(var45, p11))
					end
					if not getFFlagUGCValidateMigrateBodyPartBoundsModule() then
						var44:updateReasons(validateAssetBoundsModule(var45, nil, p11))
					end
					if not getFFlagUGCValidateMigratePoseBlockingModule() and getFFlagUGCValidateLegFullBodySeparationModule() then
						var44:updateReasons(validateLegsSeparationModule.validateFullBody(var45, p11))
					end
				end
				analyticsModule.reportFailure(analyticsModule.ErrorType.validateFullBody_ZeroMeshSize, nil, p11)
				
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
			return var44:getFinalResults()
		elseif getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
			r15plusUtilsModule.setIsBackendBundleUpload(false)
		end
		return false, var43
	elseif getFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		r15plusUtilsModule.setIsBackendBundleUpload(false)
	end
	return false, var41
end