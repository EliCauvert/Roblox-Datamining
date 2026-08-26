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
	run = function(p1, p2)
		-- upvalues: UGCValidationService (ref), UGCValidationMinimumHeadSizePercentAcrossFacs (ref), errorSourceStringsModule (ref), UGCValidationMaximumHeadSizePercentAcrossFacs (ref)
		local head = p2.renderMeshesData.Head
		local var1, var2 = unpack(UGCValidationService:GetMinAndMaxMeshSizeAcrossAllFacs(head.editable))
		local var3 = 100 * var1 / head.originalSize
		local floored = math.floor(math.min(var3.X, var3.Y, var3.Z))
		
		if floored < UGCValidationMinimumHeadSizePercentAcrossFacs then
			p1:fail(errorSourceStringsModule.Keys.FacsShrinksHead, { modPercent = floored })
		end
		local var4 = 100 * var2 / head.originalSize
		local ceiled = math.ceil(math.max(var4.X, var4.Y, var4.Z))
		
		if UGCValidationMaximumHeadSizePercentAcrossFacs < ceiled then
			p1:fail(errorSourceStringsModule.Keys.FacsExpandsHead, { modPercent = ceiled })
		end
	end
}