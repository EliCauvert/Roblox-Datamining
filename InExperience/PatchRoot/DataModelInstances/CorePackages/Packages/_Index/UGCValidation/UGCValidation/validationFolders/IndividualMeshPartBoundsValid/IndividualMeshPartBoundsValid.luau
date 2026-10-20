local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local ValidationRulesUtilModule = require(Parent.util.ValidationRulesUtil)
local GetEngineFeatureEngineUGCValidateMeshPartBoundsFromRulesModule = require(Parent.flags.getEngineFeatureEngineUGCValidateMeshPartBoundsFromRules)

return {
	categories = {
		ValidationEnumsModule.UploadCategory.TORSO_AND_LIMBS,
		ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD
	},
	requiredData = {
		ValidationEnumsModule.SharedDataMember.rootInstance,
		ValidationEnumsModule.SharedDataMember.uploadEnum,
		ValidationEnumsModule.SharedDataMember.renderMeshesData
	},
	conditionalData = {},
	fflag = require(Parent.flags.getFFlagUGCValidateIndividualMeshPartBounds),
	expectedFailures = {},
	prereqTests = {},
	run = function(p1, p2)
		-- upvalues: GetEngineFeatureEngineUGCValidateMeshPartBoundsFromRulesModule (copy), ValidationRulesUtilModule (copy), ErrorSourceStringsModule (copy)
		local RootInstance = p2.rootInstance
		local RenderMeshesData = p2.renderMeshesData
		local MeshPartBoundsMin = nil
		local MeshPartBoundsMax = nil
		
		if GetEngineFeatureEngineUGCValidateMeshPartBoundsFromRulesModule() then
			local MeshRules = ValidationRulesUtilModule:getRules().MeshRules
			MeshPartBoundsMin = MeshRules.MeshPartBoundsMin
			MeshPartBoundsMax = MeshRules.MeshPartBoundsMax
		else
			MeshPartBoundsMin = 0.05
			MeshPartBoundsMax = 4
		end
		for PartName, value in RenderMeshesData do
			local ScaledOriginalSize = value.originalSize * value.scale
			
			local function checkAxis(Axis, X)
				-- upvalues: MeshPartBoundsMin (ref), p1 (copy), ErrorSourceStringsModule (upval), PartName (copy), RootInstance (copy), MeshPartBoundsMax (ref)
				if X < MeshPartBoundsMin then
					p1:fail(ErrorSourceStringsModule.Keys.MeshPartBounds_TooSmall, {
						partName = PartName,
						axis = Axis,
						currentSize = string.format("%.2f", X),
						minSize = string.format("%.2f", MeshPartBoundsMin)
					}, RootInstance)
					
					return
				end
				if MeshPartBoundsMax < X then
					p1:fail(ErrorSourceStringsModule.Keys.MeshPartBounds_TooLarge, {
						partName = PartName,
						axis = Axis,
						currentSize = string.format("%.2f", X),
						maxSize = string.format("%.2f", MeshPartBoundsMax)
					}, RootInstance)
				end
			end
			
			checkAxis("X", ScaledOriginalSize.X)
			checkAxis("Y", ScaledOriginalSize.Y)
			checkAxis("Z", ScaledOriginalSize.Z)
		end
	end
}