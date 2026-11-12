local Parent = script.Parent.Parent.Parent
local _ = require(Parent.util.Types)
local ErrorSourceStringsModule = require(Parent.validationSystem.ErrorSourceStrings)
local ConstantsModule = require(Parent.Constants)
local GetFFlagUGCValidateAQScoreWarningsModule = require(Parent.flags.getFFlagUGCValidateAQScoreWarnings)
local GetFFlagUGCValidateLCCageUVScoreCheckModule = require(Parent.flags.getFFlagUGCValidateLCCageUVScoreCheck)
local UGCValidateLCCagingIncorrectUVThresholdBodyPart = game:DefineFastInt("UGCValidateLCCagingIncorrectUVThresholdBodyPart", 7)
local UGCValidateLCCageUVAvatarMinScore = game:DefineFastInt("UGCValidateLCCageUVAvatarMinScore", 95)

return {
	categories = {
		require(Parent.validationSystem.ValidationEnums).UploadCategory.FULL_BODY
	},
	fflag = require(Parent.flags.getFFlagUGCValidateAQCageQualityAvatar),
	run = function(p1, p2)
		-- upvalues: GetFFlagUGCValidateLCCageUVScoreCheckModule (copy), ConstantsModule (copy), UGCValidateLCCageUVAvatarMinScore (copy), ErrorSourceStringsModule (copy), GetFFlagUGCValidateAQScoreWarningsModule (copy), UGCValidateLCCagingIncorrectUVThresholdBodyPart (copy)
		local MeasureCageUVAvatar = p2.aqsSummaryData.Measure_Cage_UV_Avatar
		
		if MeasureCageUVAvatar == nil then
			error("Measure_Cage_UV_Avatar: AQS summary data is nil")
		end
		local FFlagUGCValidateLCCageUVScoreCheckModule = GetFFlagUGCValidateLCCageUVScoreCheckModule()
		
		for _, r15CAGEPART in ConstantsModule.R15_CAGE_PARTS do
			if MeasureCageUVAvatar[r15CAGEPART] == nil or MeasureCageUVAvatar[r15CAGEPART].incorrect_uv_count == nil then
				error("Measure_Cage_UV_Avatar: AQS summary missing required fields for cage " .. r15CAGEPART)
				continue
			end
			local Score = MeasureCageUVAvatar[r15CAGEPART].score
			local Number = if Score == nil then nil else tonumber(Score)
			local Number1: number = tonumber(MeasureCageUVAvatar[r15CAGEPART].incorrect_uv_count) or 0
			local UnreferencedVertexCount = MeasureCageUVAvatar[r15CAGEPART].unreferenced_vertex_count or "0"
			local NonTemplateUvCount = MeasureCageUVAvatar[r15CAGEPART].non_template_uv_count or "0"
			local UnmatchedTemplateCount = MeasureCageUVAvatar[r15CAGEPART].unmatched_template_count or "0"
			local DuplicateMappingCount = MeasureCageUVAvatar[r15CAGEPART].duplicate_mapping_count or "0"
			
			if not FFlagUGCValidateLCCageUVScoreCheckModule then
				if UGCValidateLCCagingIncorrectUVThresholdBodyPart < Number1 then
					p1:fail(ErrorSourceStringsModule.Keys.MeasureCageUV, { cage_name = r15CAGEPART, incorrect_uv_count = Number1 })
				end
				if GetFFlagUGCValidateAQScoreWarningsModule() and Number ~= nil and Number ~= 100 then
					p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_CageUV, {
						cage_name = r15CAGEPART,
						incorrect_uv_count = tostring(Number1),
						unreferenced_vertex_count = UnreferencedVertexCount,
						non_template_uv_count = NonTemplateUvCount,
						unmatched_template_count = UnmatchedTemplateCount,
						duplicate_mapping_count = DuplicateMappingCount
					})
				end
			elseif Number == nil then
				error("Measure_Cage_UV_Avatar: AQS summary missing score for cage " .. r15CAGEPART)
			elseif Number < UGCValidateLCCageUVAvatarMinScore then
				p1:fail(ErrorSourceStringsModule.Keys.AQSFail_CageUV, {
					cage_name = r15CAGEPART,
					incorrect_uv_count = tostring(Number1),
					unreferenced_vertex_count = UnreferencedVertexCount,
					non_template_uv_count = NonTemplateUvCount,
					unmatched_template_count = UnmatchedTemplateCount,
					duplicate_mapping_count = DuplicateMappingCount
				})
			elseif GetFFlagUGCValidateAQScoreWarningsModule() and Number ~= 100 then
				p1:warn(ErrorSourceStringsModule.Keys.AQSWarn_CageUV, {
					cage_name = r15CAGEPART,
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