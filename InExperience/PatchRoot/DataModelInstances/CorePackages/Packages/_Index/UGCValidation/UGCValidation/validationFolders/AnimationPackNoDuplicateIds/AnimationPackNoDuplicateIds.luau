local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateAnimationPackNoDuplicateIdsModule = require(Parent.flags.getFFlagUGCValidateAnimationPackNoDuplicateIds)

return {
	categories = { ValidationEnumsModule.UploadCategory.ANIMATION_PACK },
	requiredData = { ValidationEnumsModule.SharedDataMember.contentIds },
	fflag = function() --[[ Line: 16 ]]
		-- upvalues: GetFFlagUGCValidateAnimationPackNoDuplicateIdsModule (copy)
		return GetFFlagUGCValidateAnimationPackNoDuplicateIdsModule()
	end,
	expectedFailures = {},
	prereqTests = {
		ValidationEnumsModule.ValidationModule.ExpectedRootSchema
	},
	run = function(p1, p2) --[[ Line: 22 ]]
		-- upvalues: ErrorSourceStringsModule (copy)
		for AnimationId, contentId in p2.contentIds do
			if #contentId > 1 then
				local List = {}
				
				for _, value in contentId do
					table.insert(List, value.instance:GetFullName())
				end
				p1:fail(ErrorSourceStringsModule.Keys.AnimationPack_DuplicateAnimationId, {
					animationId = AnimationId,
					instancePaths = table.concat(List, ", ")
				})
			end
		end
	end
}