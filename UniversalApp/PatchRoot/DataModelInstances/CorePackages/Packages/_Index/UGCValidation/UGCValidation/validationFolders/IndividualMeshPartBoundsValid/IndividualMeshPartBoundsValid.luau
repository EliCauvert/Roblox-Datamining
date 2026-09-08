local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local validationRulesUtilModule = require(parent.util.ValidationRulesUtil)
local getEngineFeatureEngineUGCValidateMeshPartBoundsFromRulesModule = require(parent.flags.getEngineFeatureEngineUGCValidateMeshPartBoundsFromRules)

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
	fflag = require(parent.flags.getFFlagUGCValidateIndividualMeshPartBounds),
	expectedFailures = {},
	prereqTests = {},
	run = function(p1, p2)
		-- upvalues: getEngineFeatureEngineUGCValidateMeshPartBoundsFromRulesModule (ref), validationRulesUtilModule (ref), errorSourceStringsModule (ref)
		local meshPartBoundsMin, meshPartBoundsMax
		local rootInstance = p2.rootInstance
		local renderMeshesData = p2.renderMeshesData
		local _ = nil
		local _ = nil
		
		if getEngineFeatureEngineUGCValidateMeshPartBoundsFromRulesModule() then
			local meshRules = validationRulesUtilModule:getRules().MeshRules
			meshPartBoundsMin = meshRules.MeshPartBoundsMin
			meshPartBoundsMax = meshRules.MeshPartBoundsMax
		else
			meshPartBoundsMin = 0.05
			meshPartBoundsMax = 4
		end
		for i, v in renderMeshesData do
			local var1 = v.originalSize * v.scale
			
			local function checkAxis(p3, p4)
				-- upvalues: meshPartBoundsMin (write), p1 (ref), errorSourceStringsModule (copy), i (ref), rootInstance (ref), meshPartBoundsMax (write)
				if p4 < meshPartBoundsMin then
					p1:fail(errorSourceStringsModule.Keys.MeshPartBounds_TooSmall, {
						partName = i,
						axis = p3,
						currentSize = string.format("%.2f", p4),
						minSize = string.format("%.2f", meshPartBoundsMin)
					}, rootInstance)
					
					return
				elseif meshPartBoundsMax < p4 then
					p1:fail(errorSourceStringsModule.Keys.MeshPartBounds_TooLarge, {
						partName = i,
						axis = p3,
						currentSize = string.format("%.2f", p4),
						maxSize = string.format("%.2f", meshPartBoundsMax)
					}, rootInstance)
				end
			end
			
			checkAxis("X", var1.X)
			checkAxis("Y", var1.Y)
			checkAxis("Z", var1.Z)
		end
	end
}