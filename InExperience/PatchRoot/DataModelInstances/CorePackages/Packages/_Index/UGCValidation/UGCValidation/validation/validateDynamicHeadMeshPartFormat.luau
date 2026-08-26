local parent = script.Parent.Parent
local validateSingleInstanceModule = require(parent.validation.validateSingleInstance)
local validateMeshPartBodyPartModule = require(parent.validation.validateMeshPartBodyPart)
local validateDynamicHeadDataModule = require(parent.validation.validateDynamicHeadData)
local _ = require(parent.util.Types)
local createDynamicHeadMeshPartSchemaModule = require(parent.util.createDynamicHeadMeshPartSchema)

return function(p1)
	-- upvalues: validateSingleInstanceModule (ref), validateMeshPartBodyPartModule (ref), createDynamicHeadMeshPartSchemaModule (ref), validateDynamicHeadDataModule (ref)
	assert(p1.instances ~= nil, "instances required in validationContext for validateDynamicHeadMeshPartFormat")
	local instances = p1.instances
	local var1, var2 = validateSingleInstanceModule(instances, p1)
	
	if not var1 then
		return var1, var2
	end
	local var3 = instances[1]
	local var4, var5 = validateMeshPartBodyPartModule(var3, createDynamicHeadMeshPartSchemaModule(p1), p1)
	
	if var4 then
		return validateDynamicHeadDataModule(var3, p1)
	end
	return false, var5
end