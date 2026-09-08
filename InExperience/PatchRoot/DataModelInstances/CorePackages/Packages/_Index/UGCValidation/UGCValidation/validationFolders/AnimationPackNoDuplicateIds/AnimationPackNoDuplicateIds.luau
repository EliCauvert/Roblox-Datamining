local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateAnimationPackNoDuplicateIdsModule = require(parent.flags.getFFlagUGCValidateAnimationPackNoDuplicateIds)
local getFFlagUGCValidateMigrateSchemaPropertiesModule = require(parent.flags.getFFlagUGCValidateMigrateSchemaProperties)

return {
	categories = { validationEnumsModule.UploadCategory.ANIMATION_PACK },
	requiredData = { validationEnumsModule.SharedDataMember.contentIds },
	fflag = function()
		-- upvalues: getFFlagUGCValidateAnimationPackNoDuplicateIdsModule (ref), getFFlagUGCValidateMigrateSchemaPropertiesModule (ref)
		return getFFlagUGCValidateAnimationPackNoDuplicateIdsModule() and getFFlagUGCValidateMigrateSchemaPropertiesModule()
	end,
	expectedFailures = {},
	prereqTests = {
		validationEnumsModule.ValidationModule.ExpectedRootSchema
	},
	run = function(p1, p2)
		-- upvalues: errorSourceStringsModule (ref)
		for i, v in p2.contentIds do
			if #v > 1 then
				local t = {}
				
				for i_1, v_1 in v do
					table.insert(t, v_1.instance:GetFullName())
				end
				p1:fail(errorSourceStringsModule.Keys.AnimationPack_DuplicateAnimationId, { animationId = i, instancePaths = table.concat(t, ", ") })
			end
		end
	end
}