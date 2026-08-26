local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)

return {
	fflag = require(parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning),
	categories = { validationEnumsModule.UploadCategory.RIGID_ACCESSORY },
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	run = function(p1, p2)
		-- upvalues: errorSourceStringsModule (ref)
		local handle = p2.renderMeshesData.Handle
		
		if handle == nil then
			error("Schema should have ensured data exists for handle")
		end
		if #handle.editable:GetBones() > 0 then
			p1:fail(errorSourceStringsModule.Keys.AccessorySkinning_RigidIsSkinned, nil, p2.rootInstance:FindFirstChild("Handle"))
		end
	end
}