local parent = script.Parent.Parent.Parent
local _ = require(parent.util.Types)
local validationEnumsModule = require(parent.validationSystem.ValidationEnums)
local errorSourceStringsModule = require(parent.validationSystem.ErrorSourceStrings)
local constantsModule = require(parent.Constants)
local getFFlagUGCValidateAQScoreWarningsModule = require(parent.flags.getFFlagUGCValidateAQScoreWarnings)
local getFFlagUGCValidateLCCageUVScoreCheckModule = require(parent.flags.getFFlagUGCValidateLCCageUVScoreCheck)
local UGCValidateLCCagingIncorrectUVThresholdBodyPart = game:DefineFastInt("UGCValidateLCCagingIncorrectUVThresholdBodyPart", 7)
local UGCValidateLCCageUVAvatarMinScore = game:DefineFastInt("UGCValidateLCCageUVAvatarMinScore", 95)

return {
	categories = { validationEnumsModule.UploadCategory.FULL_BODY },
	fflag = require(parent.flags.getFFlagUGCValidateAQCageQualityAvatar),
	run = function(p1, p2)
		-- upvalues: getFFlagUGCValidateLCCageUVScoreCheckModule (ref), constantsModule (ref), UGCValidateLCCageUVAvatarMinScore (ref), errorSourceStringsModule (ref), getFFlagUGCValidateAQScoreWarningsModule (ref), UGCValidateLCCagingIncorrectUVThresholdBodyPart (ref)
		local measureCageUVAvatar = p2.aqsSummaryData.Measure_Cage_UV_Avatar
		
		if measureCageUVAvatar == nil then
			error("Measure_Cage_UV_Avatar: AQS summary data is nil")
		end
		local var1 = getFFlagUGCValidateLCCageUVScoreCheckModule()
		
		for i, v in constantsModule.R15_CAGE_PARTS do
			if measureCageUVAvatar[v] == nil or measureCageUVAvatar[v].incorrect_uv_count == nil then
				error("Measure_Cage_UV_Avatar: AQS summary missing required fields for cage " .. v)
				continue
			end
			local score = measureCageUVAvatar[v].score
			local var2 = if score ~= nil then nil else tonumber(score)
			local incorrectUvCount = tonumber(measureCageUVAvatar[v].incorrect_uv_count) or 0
			local unreferencedVertexCount = measureCageUVAvatar[v].unreferenced_vertex_count or "0"
			local nonTemplateUvCount = measureCageUVAvatar[v].non_template_uv_count or "0"
			local unmatchedTemplateCount = measureCageUVAvatar[v].unmatched_template_count or "0"
			local duplicateMappingCount = measureCageUVAvatar[v].duplicate_mapping_count or "0"
			
			if not var1 then
				if UGCValidateLCCagingIncorrectUVThresholdBodyPart < incorrectUvCount then
					p1:fail(errorSourceStringsModule.Keys.MeasureCageUV, { cage_name = v, incorrect_uv_count = incorrectUvCount })
				end
				if getFFlagUGCValidateAQScoreWarningsModule() and var2 ~= nil and var2 ~= 100 then
					p1:warn(errorSourceStringsModule.Keys.AQSWarn_CageUV, {
						score = tostring(var2),
						cage_name = v,
						incorrect_uv_count = tostring(incorrectUvCount),
						unreferenced_vertex_count = unreferencedVertexCount,
						non_template_uv_count = nonTemplateUvCount,
						unmatched_template_count = unmatchedTemplateCount,
						duplicate_mapping_count = duplicateMappingCount
					})
				end
			elseif var2 == nil then
				error("Measure_Cage_UV_Avatar: AQS summary missing score for cage " .. v)
			elseif var2 < UGCValidateLCCageUVAvatarMinScore then
				p1:fail(errorSourceStringsModule.Keys.AQSFail_CageUV, {
					cage_name = v,
					incorrect_uv_count = tostring(incorrectUvCount),
					unreferenced_vertex_count = unreferencedVertexCount,
					non_template_uv_count = nonTemplateUvCount,
					unmatched_template_count = unmatchedTemplateCount,
					duplicate_mapping_count = duplicateMappingCount
				})
			elseif getFFlagUGCValidateAQScoreWarningsModule() and var2 ~= 100 then
				p1:warn(errorSourceStringsModule.Keys.AQSWarn_CageUV, {
					score = tostring(var2),
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
}