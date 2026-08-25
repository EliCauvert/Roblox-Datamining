local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	fflag = require(parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning),
	categories = { validationEnumsModule.UploadCategory.RIGID_ACCESSORY },
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	run = function(p0, p1)
		-- upvalues: errorSourceStringsModule (ref)
		local handle = p1.renderMeshesData.Handle
		
		if handle == nil then
			error("Schema should have ensured data exists for handle")
		end
		if #handle.editable:GetBones() > 0 then
			p0:fail(errorSourceStringsModule.Keys.AccessorySkinning_RigidIsSkinned, nil, p1.rootInstance:FindFirstChild("Handle"))
		end
	end
}