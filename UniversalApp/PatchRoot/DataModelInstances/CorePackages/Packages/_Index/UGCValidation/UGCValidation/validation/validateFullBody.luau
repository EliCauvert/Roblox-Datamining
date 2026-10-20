local Parent = script.Parent.Parent
local AnalyticsModule = require(Parent.Analytics)
local ConstantsModule = require(Parent.Constants)
local ConstantsInterfaceModule = require(Parent.ConstantsInterface)
local _ = require(Parent.util.Types)
local FailureReasonsAccumulatorModule = require(Parent.util.FailureReasonsAccumulator)
local ValidateWithSchemaModule = require(Parent.util.validateWithSchema)
local ValidateSingleInstanceModule = require(Parent.validation.validateSingleInstance)
local CreateDynamicHeadMeshPartSchemaModule = require(Parent.util.createDynamicHeadMeshPartSchema)
local CreateLimbsAndTorsoSchemaModule = require(Parent.util.createLimbsAndTorsoSchema)
local ResetPhysicsDataModule = require(Parent.util.resetPhysicsData)
local ParseContentIdsModule = require(Parent.util.ParseContentIds)
local R15plusUtilsModule = require(Parent.util.R15plusUtils)
local GetFFlagDebugAllowHRDUploadOnBundleBackendModule = require(Parent.flags.getFFlagDebugAllowHRDUploadOnBundleBackend)

local function _(List, Name)
	for _, value in List do
		if value.Name == Name then
			return value
		end
	end
	return nil
end

local function validateAllAssetsWithSchema(List, List1, p1): boolean
	-- upvalues: ValidateSingleInstanceModule (copy), ValidateWithSchemaModule (copy), CreateDynamicHeadMeshPartSchemaModule (copy), CreateLimbsAndTorsoSchemaModule (copy)
	local v1 = nil
	for _, value in List do
		if Enum.AssetType.DynamicHead ~= value.assetTypeEnum then
			for _, value1 in List1 do
				v1 = nil
				
				for _, allSelectedInstance in value.allSelectedInstances do
					if allSelectedInstance.Name == value1 then
						v1 = allSelectedInstance
						break
					end
				end
				if not v1 then
					return false
				elseif not ValidateWithSchemaModule(CreateLimbsAndTorsoSchemaModule(value.assetTypeEnum, value1, p1), v1, p1).success then
					return false
				end
			end
		elseif ValidateSingleInstanceModule(value.allSelectedInstances, p1) then
			if not ValidateWithSchemaModule(CreateDynamicHeadMeshPartSchemaModule(p1), value.allSelectedInstances[1], p1).success then
				return false
			end
		else
			return false
		end
	end
	return true
end

local function validateCorrectAssetTypesExist(List): boolean
	-- upvalues: ConstantsInterfaceModule (copy)
	local t = {}
	local Count = #ConstantsInterfaceModule.getBodyPartAssets()
	local Count1 = 0
	
	for _, value in List do
		if not ConstantsInterfaceModule.isBodyPart(value.assetTypeEnum) then
			return false
		end
		if t[value.assetTypeEnum] then
			return false
		end
		t[value.assetTypeEnum] = true
		Count1 += 1
	end
	return Count1 == Count
end

local function createAllBodyPartsTable(Name, FullBodyData)
	local AllSelectedInstances = {}
	local Object = nil
	
	for _, value in FullBodyData do
		if Enum.AssetType.DynamicHead == value.assetTypeEnum then
			AllSelectedInstances[value.allSelectedInstances[1].Name] = value.allSelectedInstances[1]
			continue
		end
		Object = nil
		
		for _, allSelectedInstance in value.allSelectedInstances do
			if allSelectedInstance.Name == Name then
				Object = allSelectedInstance
				break
			end
		end
		for _, child in Object:GetChildren() do
			AllSelectedInstances[child.Name] = child
		end
	end
	return AllSelectedInstances
end

local function validateMeshIds(List, p2)
	-- upvalues: ParseContentIdsModule (copy), AnalyticsModule (copy)
	local config = { MeshPart = { "MeshId" } }
	local config1 = { MeshPart = { MeshId = true } }
	
	for _, value in List do
		for _, allSelectedInstance in value.allSelectedInstances do
			if not ParseContentIdsModule.parseWithErrorCheck({}, {}, allSelectedInstance, config, config1, p2) then
				AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateFullBody_MeshIdsMissing, nil, p2)
				
				return false, {
					"Unable to run full body validation due to previous errors detected while processing individual body parts"
				}
			end
		end
	end
	return true
end

local function validateInstanceHierarchy(FullBodyData, p3, p4)
	-- upvalues: validateCorrectAssetTypesExist (copy), AnalyticsModule (copy), validateAllAssetsWithSchema (copy), validateMeshIds (copy)
	local IsServer = if p4 then p4.isServer else nil
	
	if not validateCorrectAssetTypesExist(FullBodyData) then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateFullBody_IncorrectAssetTypeSet, nil, p4)
		
		if IsServer then
			error("Full body check did not receive the correct set of body part Asset Types (i.e. Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg). Make sure the body model is valid and try again.")
		end
		return false, {
			"Full body check did not receive the correct set of body part Asset Types (i.e. Head, Torso, LeftArm, RightArm, LeftLeg, RightLeg). Make sure the body model is valid and try again."
		}
	elseif not validateAllAssetsWithSchema(FullBodyData, p3, p4) then
		AnalyticsModule.reportFailure(AnalyticsModule.ErrorType.validateFullBody_InstancesMissing, nil, p4)
		
		return false, {
			"Unable to run full body validation due to previous errors detected while processing individual body parts."
		}
	else
		local ValidateMeshIdsResult, ValidateMeshIdsResult2 = validateMeshIds(FullBodyData, p4)
		
		if ValidateMeshIdsResult then
			return true
		else
			return false, ValidateMeshIdsResult2
		end
	end
end

local function resetAllPhysicsData(p3)
	-- upvalues: ResetPhysicsDataModule (copy)
	local ResetPhysicsDataModuleResult2 = nil
	for _, value in p3.fullBodyData do
		local ResetPhysicsDataModuleResult
		ResetPhysicsDataModuleResult, ResetPhysicsDataModuleResult2 = ResetPhysicsDataModule(value.allSelectedInstances, p3)
		
		if not ResetPhysicsDataModuleResult then
			return false, { ResetPhysicsDataModuleResult2 }
		end
	end
	return true
end

return function(p4)
	-- upvalues: GetFFlagDebugAllowHRDUploadOnBundleBackendModule (copy), R15plusUtilsModule (copy), ConstantsModule (copy), validateInstanceHierarchy (copy), resetAllPhysicsData (copy), FailureReasonsAccumulatorModule (copy), createAllBodyPartsTable (copy)
	assert(p4.fullBodyData ~= nil, "fullBodyData required in validationContext for validateFullBody")
	local FullBodyData = p4.fullBodyData
	local RequireAllFolders = p4.requireAllFolders
	
	if GetFFlagDebugAllowHRDUploadOnBundleBackendModule() then
		R15plusUtilsModule.setIsBackendBundleUpload(p4.isBackendBundleUpload == true)
	end
	local List = { ConstantsModule.FOLDER_NAMES.R15ArtistIntent }
	
	if RequireAllFolders then
		table.insert(List, ConstantsModule.FOLDER_NAMES.R15Fixed)
	end
	local ValidateInstanceHierarchyResult, ValidateInstanceHierarchyResult2 = validateInstanceHierarchy(FullBodyData, List, p4)
	
	if ValidateInstanceHierarchyResult then
		local ResetAllPhysicsDataResult, ResetAllPhysicsDataResult2 = resetAllPhysicsData(p4)
		
		if ResetAllPhysicsDataResult then
			local NewFailureReasonsAccumulator = FailureReasonsAccumulatorModule.new()
			
			for _, value in List do
				assert((createAllBodyPartsTable(value, FullBodyData)))
			end
			if GetFFlagDebugAllowHRDUploadOnBundleBackendModule() then
				R15plusUtilsModule.setIsBackendBundleUpload(false)
			end
			return NewFailureReasonsAccumulator:getFinalResults()
		else
			if GetFFlagDebugAllowHRDUploadOnBundleBackendModule() then
				R15plusUtilsModule.setIsBackendBundleUpload(false)
			end
			return false, ResetAllPhysicsDataResult2
		end
	else
		if GetFFlagDebugAllowHRDUploadOnBundleBackendModule() then
			R15plusUtilsModule.setIsBackendBundleUpload(false)
		end
		return false, ValidateInstanceHierarchyResult2
	end
end