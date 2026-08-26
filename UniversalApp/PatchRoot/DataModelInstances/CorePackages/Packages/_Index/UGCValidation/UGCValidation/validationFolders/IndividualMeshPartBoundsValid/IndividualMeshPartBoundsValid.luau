local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateIndividualMeshPartBoundsModule = require(parent.flags.getFFlagUGCValidateIndividualMeshPartBounds)
game:DefineFastInt("UGCValidateMeshPartBoundsMinHundredths", 10)
game:DefineFastInt("UGCValidateMeshPartBoundsMaxHundredths", 200)
local var1 = game:GetFastInt("UGCValidateMeshPartBoundsMinHundredths") / 100
local var2 = game:GetFastInt("UGCValidateMeshPartBoundsMaxHundredths") / 100

return {
	categories = {
		validationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		validationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		validationEnumsModule.SharedDataMember.rootInstance,
		validationEnumsModule.SharedDataMember.uploadEnum,
		validationEnumsModule.SharedDataMember.renderMeshesData
	},
	conditionalData = {},
	fflag = getFFlagUGCValidateIndividualMeshPartBoundsModule,
	expectedFailures = {},
	prereqTests = {},
	run = function(p1, p2)
		-- upvalues: var1 (ref), errorSourceStringsModule (ref), var2 (ref)
		local rootInstance = p2.rootInstance
		
		for i, v in p2.renderMeshesData do
			local var3 = v.originalSize * v.scale
			
			local function checkAxis(p3, p4)
				-- upvalues: var3 (copy), p3 (ref), errorSourceStringsModule (copy), i (ref), rootInstance (ref), var2 (copy)
				if p4 < var3 then
					p3:fail(errorSourceStringsModule.Keys.MeshPartBounds_TooSmall, {
						partName = i,
						axis = p3,
						currentSize = string.format("%.2f", p4),
						minSize = string.format("%.2f", var3)
					}, rootInstance)
					
					return
				elseif var2 < p4 then
					p3:fail(errorSourceStringsModule.Keys.MeshPartBounds_TooLarge, {
						partName = i,
						axis = p3,
						currentSize = string.format("%.2f", p4),
						maxSize = string.format("%.2f", var2)
					}, rootInstance)
				end
			end
			
			checkAxis("X", var3.X)
			checkAxis("Y", var3.Y)
			checkAxis("Z", var3.Z)
		end
	end
}