local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local UGCValidationBodyPartCollisionFidelity = game:DefineFastString("UGCValidationBodyPartCollisionFidelity", "Default")

return {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { validationEnumsModule.SharedDataMember.rootInstance },
	fflag = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {},
	run = function(p0, p1)
		-- upvalues: UGCValidationBodyPartCollisionFidelity (ref), errorSourceStringsModule (ref)
		local rootInstance = p1.rootInstance
		local default = Enum.CollisionFidelity.Default
		pcall(function()
			-- upvalues: default (write), UGCValidationBodyPartCollisionFidelity (copy)
			default = Enum.CollisionFidelity[UGCValidationBodyPartCollisionFidelity]
		end)
		local descendants = rootInstance:GetDescendants()
		table.insert(descendants, 1, rootInstance)
		
		for i, v in descendants do
			if v:IsA("MeshPart") and v.CollisionFidelity ~= default then
				p0:fail(errorSourceStringsModule.Keys.CollisionFidelityWrong, {
					InstancePath = v:GetFullName(),
					ExpectedFidelity = default.Name
				})
			end
		end
	end
}