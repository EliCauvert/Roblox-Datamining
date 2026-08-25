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
	run = function(p0, p1)
		-- upvalues: getEngineFeatureEngineUGCValidateMeshPartBoundsFromRulesModule (ref), validationRulesUtilModule (ref), errorSourceStringsModule (ref)
		local meshPartBoundsMin, meshPartBoundsMax
		local rootInstance = p1.rootInstance
		local renderMeshesData = p1.renderMeshesData
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
			local var4 = v.originalSize * v.scale
			
			local function checkAxis(p2, p3)
				-- upvalues: meshPartBoundsMin (write), p0 (ref), errorSourceStringsModule (copy), i (ref), rootInstance (ref), meshPartBoundsMax (write)
				if p3 < meshPartBoundsMin then
					p0:fail(errorSourceStringsModule.Keys.MeshPartBounds_TooSmall, {
						partName = i,
						axis = p2,
						currentSize = string.format("%.2f", p3),
						minSize = string.format("%.2f", meshPartBoundsMin)
					}, rootInstance)
					
					return
				elseif meshPartBoundsMax < p3 then
					p0:fail(errorSourceStringsModule.Keys.MeshPartBounds_TooLarge, {
						partName = i,
						axis = p2,
						currentSize = string.format("%.2f", p3),
						maxSize = string.format("%.2f", meshPartBoundsMax)
					}, rootInstance)
				end
			end
			
			checkAxis("X", var4.X)
			checkAxis("Y", var4.Y)
			checkAxis("Z", var4.Z)
		end
	end
}