local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local UGCValidationService = game:GetService("UGCValidationService")
local UGCValidationMinimumHeadSizePercentAcrossFacs = game:DefineFastInt("UGCValidationMinimumHeadSizePercentAcrossFacs", 95)
local UGCValidationMaximumHeadSizePercentAcrossFacs = game:DefineFastInt("UGCValidationMaximumHeadSizePercentAcrossFacs", 120)

return {
	fflag = require(Parent.flags.getEngineFeatureEngineUGCValidateMinMaxMeshSizeAcrossAllFacs),
	categories = { ValidationEnumsModule.UploadCategory.DYNAMIC_HEAD },
	requiredData = { ValidationEnumsModule.SharedDataMember.renderMeshesData },
	expectedFailures = {
		"Asset_EF_HeadWithExpandingFacs",
		"Asset_EF_HeadWithShrinkingFacs"
	},
	run = function(p1, p2)
		-- upvalues: UGCValidationService (copy), UGCValidationMinimumHeadSizePercentAcrossFacs (copy), ErrorSourceStringsModule (copy), UGCValidationMaximumHeadSizePercentAcrossFacs (copy)
		local Head = p2.renderMeshesData.Head
		local Unpacked, Unpacked2 = unpack(UGCValidationService:GetMinAndMaxMeshSizeAcrossAllFacs(Head.editable))
		local UnpackedRatio = 100 * Unpacked / Head.originalSize
		local Floored = math.floor((math.min(UnpackedRatio.X, UnpackedRatio.Y, UnpackedRatio.Z)))
		
		if Floored < UGCValidationMinimumHeadSizePercentAcrossFacs then
			p1:fail(ErrorSourceStringsModule.Keys.FacsShrinksHead, { modPercent = Floored })
		end
		local UnpackedRatio1 = 100 * Unpacked2 / Head.originalSize
		local Ceiled = math.ceil((math.max(UnpackedRatio1.X, UnpackedRatio1.Y, UnpackedRatio1.Z)))
		
		if UGCValidationMaximumHeadSizePercentAcrossFacs < Ceiled then
			p1:fail(ErrorSourceStringsModule.Keys.FacsExpandsHead, { modPercent = Ceiled })
		end
	end
}