local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local UGCValidationService = game:GetService("UGCValidationService")
local UGCValidationMinimumHeadSizePercentAcrossFacs = game:DefineFastInt("UGCValidationMinimumHeadSizePercentAcrossFacs", 95)
local UGCValidationMaximumHeadSizePercentAcrossFacs = game:DefineFastInt("UGCValidationMaximumHeadSizePercentAcrossFacs", 120)

return {
	fflag = require(parent.flags.getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacs),
	categories = { validationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	requiredData = { validationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {
		"Asset_EF_HeadWithExpandingFacs",
		"Asset_EF_HeadWithShrinkingFacs"
	},
	run = function(p0, p1)
		-- upvalues: UGCValidationService (ref), UGCValidationMinimumHeadSizePercentAcrossFacs (ref), errorSourceStringsModule (ref), UGCValidationMaximumHeadSizePercentAcrossFacs (ref)
		local head = p1.renderMeshesData.Head
		local var5, var6 = unpack(UGCValidationService:GetMinAndMaxMeshSizeAcrossAllFacs(head.editable))
		local var7 = 100 * var5 / head.originalSize
		local floored = math.floor(math.min(var7.X, var7.Y, var7.Z))
		
		if floored < UGCValidationMinimumHeadSizePercentAcrossFacs then
			p0:fail(errorSourceStringsModule.Keys.FacsShrinksHead, { modPercent = floored })
		end
		local var9 = 100 * var6 / head.originalSize
		local ceiled = math.ceil(math.max(var9.X, var9.Y, var9.Z))
		
		if UGCValidationMaximumHeadSizePercentAcrossFacs < ceiled then
			p0:fail(errorSourceStringsModule.Keys.FacsExpandsHead, { modPercent = ceiled })
		end
	end
}