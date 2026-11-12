local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ValidationEnumsModule = require(Parent.validationSystem.ValidationEnums)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local GetFFlagUGCValidateAQScoreWarningsModule = require(Parent.flags.getFFlagUGCValidateAQScoreWarnings)
local GetFFlagUGCValidateLCCageUVScoreCheckModule = require(Parent.flags.getFFlagUGCValidateLCCageUVScoreCheck)
local UGCValidateLCCagingIncorrectUVThreshold = game:DefineFastInt("UGCValidateLCCagingIncorrectUVThreshold", 100)
local UGCValidateLCCageUVMinScore = game:DefineFastInt("UGCValidateLCCageUVMinScore", 90)
local Cage_names = { "Handle_InnerCage", "Handle_OuterCage" }

return {
	categories = {
		ValidationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQCageQualityLC),
	run = function(p1, p2)
		-- upvalues: ValidationEnumsModule (copy), GetFFlagUGCValidateLCCageUVScoreCheckModule (copy), Cage_names (copy), UGCValidateLCCageUVMinScore (copy), ErrorSourceStringsModule (copy), GetFFlagUGCValidateAQScoreWarningsModule (copy), UGCValidateLCCagingIncorrectUVThreshold (copy)
		local MeasureCageUV = p2.aqsSummaryData.Measure_Cage_UV
		
		if MeasureCageUV == nil then
			error("Measure_Cage_UV: AQS summary data is nil")
		end
		local IsUploadCategoryMatch = p2.uploadCategory == ValidationEnumsModule.UploadCategory.EYEBROW_EYELASH
		local NoIsUploadCategoryMatch: boolean = GetFFlagUGCValidateLCCageUVScoreCheckModule() and not IsUploadCategoryMatch
		for _, cageName in Cage_names do
			if MeasureCageUV[cageName] == nil or MeasureCageUV[cageName].incorrect_uv_count == nil then
				error("Measure_Cage_UV: AQS summary missing required fields for cage " .. cageName)
				continue
			end
			local Score = MeasureCageUV[cageName].score
			local Number = if Score == nil then nil else tonumber(Score)
			local Number1: number = tonumber(MeasureCageUV[cageName].incorrect_uv_count) or 0
			local UnreferencedVertexCount = MeasureCageUV[cageName].unreferenced_vertex_count or "0"
			local NonTemplateUvCount = MeasureCageUV[cageName].non_template_uv_count or "0"
			local UnmatchedTemplateCount = MeasureCageUV[cageName].unmatched_template_count or "0"
			local DuplicateMappingCount = MeasureCageUV[cageName].duplicate_mapping_count or "0"
			
			if not NoIsUploadCategoryMatch then
				if UGCValidateLCCagingIncorrectUVThreshold < Number1 then
					p1:fail(ErrorSourceStringsModule.Keys.MeasureCageUV, { cage_name = cageName, incorrect_uv_count = Number1 })
				end
				if GetFFlagUGCValidateAQScoreWarningsModule() and not IsUploadCategoryMatch and Number ~= nil and Number ~= 100 then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_CageUV, {
						cage_name = cageName,
						incorrect_uv_count = tostring(Number1),
						unreferenced_vertex_count = UnreferencedVertexCount,
						non_template_uv_count = NonTemplateUvCount,
						unmatched_template_count = UnmatchedTemplateCount,
						duplicate_mapping_count = DuplicateMappingCount
					})
				end
			elseif Number == nil then
				error("Measure_Cage_UV: AQS summary missing score for cage " .. cageName)
			elseif Number < UGCValidateLCCageUVMinScore then
				p1:fail(ErrorSourceStringsModule.Keys.AQSFail_CageUV, {
					cage_name = cageName,
					incorrect_uv_count = tostring(Number1),
					unreferenced_vertex_count = UnreferencedVertexCount,
					non_template_uv_count = NonTemplateUvCount,
					unmatched_template_count = UnmatchedTemplateCount,
					duplicate_mapping_count = DuplicateMappingCount
				})
			elseif GetFFlagUGCValidateAQScoreWarningsModule() and Number ~= 100 then
				p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_CageUV, {
					cage_name = cageName,
					incorrect_uv_count = tostring(Number1),
					unreferenced_vertex_count = UnreferencedVertexCount,
					non_template_uv_count = NonTemplateUvCount,
					unmatched_template_count = UnmatchedTemplateCount,
					duplicate_mapping_count = DuplicateMappingCount
				})
			end
		end
	end
}