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
			local var1 = v.originalSize * v.scale
			
			local function checkAxis(p1, p2)
				-- upvalues: var1 (copy), p1 (ref), errorSourceStringsModule (copy), i (ref), rootInstance (ref), var2 (copy)
				if p2 < var1 then
					p1:fail(errorSourceStringsModule.Keys.MeshPartBounds_TooSmall, {
						partName = i,
						axis = p1,
						currentSize = string.format("%.2f", p2),
						minSize = string.format("%.2f", var1)
					}, rootInstance)
					
					return
				elseif var2 < p2 then
					p1:fail(errorSourceStringsModule.Keys.MeshPartBounds_TooLarge, {
						partName = i,
						axis = p1,
						currentSize = string.format("%.2f", p2),
						maxSize = string.format("%.2f", var2)
					}, rootInstance)
				end
			end
			
			checkAxis("X", var1.X)
			checkAxis("Y", var1.Y)
			checkAxis("Z", var1.Z)
		end
	end
}