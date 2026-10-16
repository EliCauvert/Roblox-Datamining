local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)

return {
	fflag = require(Parent.flags.getEngineFeatureEngineUGCValidationConsolidateAccessorySkinning),
	categories = { ValidationEnumsModule.UploadCategory.RIGID_ACCESSORY },
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	run = function(p1, p2) --[[ Line: 11 ]]
		-- upvalues: ErrorSourceStringsModule (copy)
		local Handle = p2.renderMeshesData.Handle
		
		if Handle == nil then
			error("Schema should have ensured data exists for handle")
		end
		if #Handle.editable:GetBones() > 0 then
			p1:fail(ErrorSourceStringsModule.Keys.AccessorySkinning_RigidIsSkinned, nil, p2.rootInstance:FindFirstChild("Handle"))
		end
	end
}