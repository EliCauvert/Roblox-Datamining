local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local BuildStaticCurveAnimationSchemaModule = require(Parent.util.buildStaticCurveAnimationSchema)
local ValidateInstanceTreeAgainstSchemaModule = require(Parent.util.validateInstanceTreeAgainstSchema)
local CurveAnimationHierarchyUtilsModule = require(Parent.util.CurveAnimationHierarchyUtils)

local function validateNoBodyPartDuplicates(Object, p1) --[[ Line: 27 ]]
	-- upvalues: CurveAnimationHierarchyUtilsModule (copy), ErrorSourceStringsModule (copy)
	local t = {}
	
	for _, Folder in Object:GetDescendants() do
		if Folder:IsA("Folder") and CurveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(Folder.Name) then
			if t[Folder.Name] then
				p1:fail(ErrorSourceStringsModule.Keys.CurveAnim_DuplicateBodyPartFolder, {
					bodyPartName = Folder.Name,
					instancePath = Folder:GetFullName()
				})
			end
			t[Folder.Name] = true
		end
	end
end

return {
	categories = {
		ValidationEnumsModule.UploadCategory.EMOTE_ANIMATION,
		ValidationEnumsModule.UploadCategory.ANIMATION
	},
	requiredData = { ValidationEnumsModule.SharedDataMember.curveAnimations },
	fflag = require(Parent.flags.getFFlagUGCValidateCurveAnimStrictSchema),
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.CurveAnimDataAvailable
	},
	run = function(p2, p3) --[[ Line: 42 ]]
		-- upvalues: BuildStaticCurveAnimationSchemaModule (copy), ValidateInstanceTreeAgainstSchemaModule (copy), ErrorSourceStringsModule (copy), validateNoBodyPartDuplicates (copy)
		for _, curveAnimation in p3.curveAnimations do
			ValidateInstanceTreeAgainstSchemaModule(curveAnimation, BuildStaticCurveAnimationSchemaModule, p2, {
				skipRootClassCheck = true,
				skipInstanceContext = true,
				missingErrorKey = ErrorSourceStringsModule.Keys.CurveAnim_StrictSchemaViolation,
				unauthorizedErrorKey = ErrorSourceStringsModule.Keys.CurveAnim_StrictSchemaViolation
			})
			validateNoBodyPartDuplicates(curveAnimation, p2)
		end
	end
}