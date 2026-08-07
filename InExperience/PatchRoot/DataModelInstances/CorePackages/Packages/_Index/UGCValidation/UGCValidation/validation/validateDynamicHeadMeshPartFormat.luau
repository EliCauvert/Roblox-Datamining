local parent = script.Parent.Parent
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateMeshPartBodyPartModule = require(parent.validation.validateMeshPartBodyPart)
local validateDynamicHeadDataModule = require(parent.validation.validateDynamicHeadData)
local _ = require(parent.util.Types)
local createDynamicHeadMeshPartSchemaModule = require(parent.util.createDynamicHeadMeshPartSchema)

return function(p0) --[[ line: 10 | named "validateDynamicHeadMeshPartFormat" ]]
	-- upvalues: validateSingleInstanceModule (ref), validateMeshPartBodyPartModule (ref), createDynamicHeadMeshPartSchemaModule (ref), validateDynamicHeadDataModule (ref)
	assert(p0.instances ~= nil, "instances required in validationContext for validateDynamicHeadMeshPartFormat")
	local instances = p0.instances
	local var4, var5 = validateSingleInstanceModule(instances, p0)
	
	if not var4 then
		return var4, var5
	end
	local var6 = instances[1]
	local var7, var8 = validateMeshPartBodyPartModule(var6, createDynamicHeadMeshPartSchemaModule(p0), p0)
	
	if var7 then
		return validateDynamicHeadDataModule(var6, p0)
	end
	return false, var8
end