-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:51 2026 Pacific Standard Time.

local momentsCommonModule = require(script:FindFirstAncestor("MomentsCreationFlow").Parent.MomentsCommon)
local attributeType = momentsCommonModule.Enums.AttributeType
local getTagsForMoment = momentsCommonModule.Utils.getTagsForMoment

return function(p0, p1) --[[ line: 12 | named "makeRegistrationInfo" ]]
	-- upvalues: attributeType (ref), getTagsForMoment (ref)
	local assetTotalDuration
	local edits = p1.edits
	local t = {}
	local _ = 0
	
	if edits and edits.trim then
		table.insert(t, {
			AssetId = 0,
			Description = attributeType.PrimaryAsset,
			TrimStartTime = edits.trim.startTime
		})
		assetTotalDuration = edits.trim.endTime - edits.trim.startTime
	else
		table.insert(t, {
			AssetId = 0,
			TrimStartTime = 0,
			Description = attributeType.PrimaryAsset
		})
		assetTotalDuration = p1.assetTotalDuration
	end
	if edits and edits.music then
		table.insert(t, {
			AssetId = edits.music.assetId,
			Description = attributeType.Music,
			TrimStartTime = edits.music.startTime
		})
	end
	return {
		attributes = t,
		contentType = if p0.CaptureType == Enum.CaptureType.Screenshot then Enum.RecommendationItemContentType.Static else Enum.RecommendationItemContentType.Dynamic,
		customTags = getTagsForMoment(p1),
		duration = assetTotalDuration
	}
end