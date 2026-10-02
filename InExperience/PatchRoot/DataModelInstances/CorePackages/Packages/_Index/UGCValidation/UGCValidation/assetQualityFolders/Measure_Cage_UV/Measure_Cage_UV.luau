local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local getFFlagUGCValidateAQScoreWarningsModule = require(parent.flags.getFFlagUGCValidateAQScoreWarnings)
local getFFlagUGCValidateLCCageUVScoreCheckModule = require(parent.flags.getFFlagUGCValidateLCCageUVScoreCheck)
local UGCValidateLCCagingIncorrectUVThreshold = game:DefineFastInt("UGCValidateLCCagingIncorrectUVThreshold", 100)
local UGCValidateLCCageUVMinScore = game:DefineFastInt("UGCValidateLCCageUVMinScore", 90)
local t = {
	categories = {
		validationEnumsModule.UploadCategory.LAYERED_CLOTHING,
		validationEnumsModule.UploadCategory.EYEBROW_EYELASH
	},
	fflag = require(parent.flags.getFFlagUGCValidateAQCageQualityLC)
}
local list = { "Handle_InnerCage", "Handle_OuterCage" }

function t.run(p1, p2)
	-- upvalues: validationEnumsModule (ref), getFFlagUGCValidateLCCageUVScoreCheckModule (ref), list (ref), UGCValidateLCCageUVMinScore (ref), errorSourceStringsModule (ref), getFFlagUGCValidateAQScoreWarningsModule (ref), UGCValidateLCCagingIncorrectUVThreshold (ref)
	local measureCageUV = p2.aqsSummaryData.Measure_Cage_UV
	
	if measureCageUV == nil then
		error("Measure_Cage_UV: AQS summary data is nil")
	end
	local var1 = p2.uploadCategory == validationEnumsModule.UploadCategory.EYEBROW_EYELASH
	local var2 = getFFlagUGCValidateLCCageUVScoreCheckModule() and not var1
	
	for i, v in list do
		if measureCageUV[v] == nil or measureCageUV[v].incorrect_uv_count == nil then
			error("Measure_Cage_UV: AQS summary missing required fields for cage " .. v)
			continue
		end
		local score = measureCageUV[v].score
		local var3 = if score ~= nil then nil else tonumber(score)
		local incorrectUvCount = tonumber(measureCageUV[v].incorrect_uv_count) or 0
		local unreferencedVertexCount = measureCageUV[v].unreferenced_vertex_count or "0"
		local nonTemplateUvCount = measureCageUV[v].non_template_uv_count or "0"
		local unmatchedTemplateCount = measureCageUV[v].unmatched_template_count or "0"
		local duplicateMappingCount = measureCageUV[v].duplicate_mapping_count or "0"
		
		if not var2 then
			if UGCValidateLCCagingIncorrectUVThreshold < incorrectUvCount then
				p1:fail(errorSourceStringsModule.Keys.MeasureCageUV, { cage_name = v, incorrect_uv_count = incorrectUvCount })
			end
			if getFFlagUGCValidateAQScoreWarningsModule() and not var1 and (var3 ~= nil and var3 ~= 100) then
				p1:warn(errorSourceStringsModule.Keys.AQSWarn_CageUV, {
					cage_name = v,
					incorrect_uv_count = tostring(incorrectUvCount),
					unreferenced_vertex_count = unreferencedVertexCount,
					non_template_uv_count = nonTemplateUvCount,
					unmatched_template_count = unmatchedTemplateCount,
					duplicate_mapping_count = duplicateMappingCount
				})
			end
		elseif var3 == nil then
			error("Measure_Cage_UV: AQS summary missing score for cage " .. v)
		elseif var3 < UGCValidateLCCageUVMinScore then
			p1:fail(errorSourceStringsModule.Keys.AQSFail_CageUV, {
				cage_name = v,
				incorrect_uv_count = tostring(incorrectUvCount),
				unreferenced_vertex_count = unreferencedVertexCount,
				non_template_uv_count = nonTemplateUvCount,
				unmatched_template_count = unmatchedTemplateCount,
				duplicate_mapping_count = duplicateMappingCount
			})
		elseif getFFlagUGCValidateAQScoreWarningsModule() and var3 ~= 100 then
			p1:warn(errorSourceStringsModule.Keys.AQSWarn_CageUV, {
				cage_name = v,
				incorrect_uv_count = tostring(incorrectUvCount),
				unreferenced_vertex_count = unreferencedVertexCount,
				non_template_uv_count = nonTemplateUvCount,
				unmatched_template_count = unmatchedTemplateCount,
				duplicate_mapping_count = duplicateMappingCount
			})
		end
	end
end

return t