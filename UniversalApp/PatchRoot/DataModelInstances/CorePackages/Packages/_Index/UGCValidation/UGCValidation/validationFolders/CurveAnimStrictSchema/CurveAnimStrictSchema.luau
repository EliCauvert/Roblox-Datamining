local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local buildStaticCurveAnimationSchemaModule = require(parent.util.buildStaticCurveAnimationSchema)
local validateInstanceTreeAgainstSchemaModule = require(parent.util.validateInstanceTreeAgainstSchema)
local curveAnimationHierarchyUtilsModule = require(parent.util.CurveAnimationHierarchyUtils)
local getFFlagUGCValidateCurveAnimStrictSchemaModule = require(parent.flags.getFFlagUGCValidateCurveAnimStrictSchema)
local t = {
	categories = { validationEnumsModule.UploadCategory.EMOTE_ANIMATION }
}

if require(parent.flags.getFFlagUGCValidationAnimationPackSupport)() then
	table.insert(t.categories, validationEnumsModule.UploadCategory.ANIMATION)
end
t.requiredData = { validationEnumsModule.SharedDataMember.curveAnimations }
t.fflag = getFFlagUGCValidateCurveAnimStrictSchemaModule
t.expectedFailures = {}
t.prereqTests = {
	validationEnumsModule.ValidationModule.CurveAnimDataAvailable
}

local function validateNoBodyPartDuplicates(p1, p2)
	-- upvalues: curveAnimationHierarchyUtilsModule (ref), errorSourceStringsModule (ref)
	local t = {}
	
	for i, v in p1:GetDescendants() do
		if v:IsA("Folder") and curveAnimationHierarchyUtilsModule.isBodyPartFolderNameValid(v.Name) then
			if t[v.Name] then
				p2:fail(errorSourceStringsModule.Keys.CurveAnim_DuplicateBodyPartFolder, { bodyPartName = v.Name, instancePath = v:GetFullName() })
			end
			t[v.Name] = true
		end
	end
end

function t.run(p3, p4)
	-- upvalues: buildStaticCurveAnimationSchemaModule (ref), validateInstanceTreeAgainstSchemaModule (ref), errorSourceStringsModule (ref), validateNoBodyPartDuplicates (ref)
	for i, v in p4.curveAnimations do
		validateInstanceTreeAgainstSchemaModule(v, buildStaticCurveAnimationSchemaModule, p3, {
			skipRootClassCheck = true,
			skipInstanceContext = true,
			missingErrorKey = errorSourceStringsModule.Keys.CurveAnim_StrictSchemaViolation,
			unauthorizedErrorKey = errorSourceStringsModule.Keys.CurveAnim_StrictSchemaViolation
		})
		validateNoBodyPartDuplicates(v, p3)
	end
end

return t