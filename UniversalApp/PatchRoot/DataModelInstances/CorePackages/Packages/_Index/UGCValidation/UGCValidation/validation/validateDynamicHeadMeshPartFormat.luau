local Parent = script.Parent.Parent
local ValidateSingleInstanceModule = require(Parent.validation.validateSingleInstance)
local ValidateMeshPartBodyPartModule = require(Parent.validation.validateMeshPartBodyPart)
local ValidateDynamicHeadDataModule = require(Parent.validation.validateDynamicHeadData)
local _ = require(Parent.util.Types)
local CreateDynamicHeadMeshPartSchemaModule = require(Parent.util.createDynamicHeadMeshPartSchema)

return function(p1) --[[ Line: 10 | Named "validateDynamicHeadMeshPartFormat" ]]
	-- upvalues: ValidateSingleInstanceModule (copy), ValidateMeshPartBodyPartModule (copy), CreateDynamicHeadMeshPartSchemaModule (copy), ValidateDynamicHeadDataModule (copy)
	assert(p1.instances ~= nil, "instances required in validationContext for validateDynamicHeadMeshPartFormat")
	local Instances = p1.instances
	local ValidateSingleInstanceModuleResult, ValidateSingleInstanceModuleResult2 = ValidateSingleInstanceModule(Instances, p1)
	
	if not ValidateSingleInstanceModuleResult then
		return ValidateSingleInstanceModuleResult, ValidateSingleInstanceModuleResult2
	end
	local InstancesEntry = Instances[1]
	local ValidateMeshPartBodyPartModuleResult, ValidateMeshPartBodyPartModuleResult2 = ValidateMeshPartBodyPartModule(InstancesEntry, CreateDynamicHeadMeshPartSchemaModule(p1), p1)
	
	if ValidateMeshPartBodyPartModuleResult then
		return ValidateDynamicHeadDataModule(InstancesEntry, p1)
	else
		return false, ValidateMeshPartBodyPartModuleResult2
	end
end