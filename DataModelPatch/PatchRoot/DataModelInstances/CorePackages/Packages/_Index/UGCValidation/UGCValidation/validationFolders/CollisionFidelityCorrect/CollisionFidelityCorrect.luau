local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local UGCValidationBodyPartCollisionFidelity = game:DefineFastString("UGCValidationBodyPartCollisionFidelity", "Default")

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.rootInstance },
	fflag = require(Parent.flags.getFFlagUGCValidateMigrateSchemaProperties),
	expectedFailures = {},
	run = function(p1, p2)
		-- upvalues: UGCValidationBodyPartCollisionFidelity (copy), ErrorSourceStringsModule (copy)
		local RootInstance = p2.rootInstance
		local Default = Enum.CollisionFidelity.Default
		pcall(function()
			-- upvalues: Default (ref), UGCValidationBodyPartCollisionFidelity (upval)
			Default = Enum.CollisionFidelity[UGCValidationBodyPartCollisionFidelity]
		end)
		local Descendants = RootInstance:GetDescendants()
		table.insert(Descendants, 1, RootInstance)
		
		for _, Part in Descendants do
			if Part:IsA("MeshPart") and Part.CollisionFidelity ~= Default then
				p1:fail(ErrorSourceStringsModule.Keys.CollisionFidelityWrong, {
					InstancePath = Part:GetFullName(),
					ExpectedFidelity = Default.Name
				})
			end
		end
	end
}