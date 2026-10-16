local MomentsCommon = script:FindFirstAncestor("MomentsCommon")
local _ = require(MomentsCommon.Types)
local ConstantsModule = require(MomentsCommon.Constants)

return function(p1) --[[ Line: 8 | Named "getTagsForMoment" ]]
	-- upvalues: ConstantsModule (copy)
	local List = {}
	
	if p1.captureType == Enum.CaptureType.Screenshot then
		table.insert(List, "screenshot")
	elseif p1.captureType == Enum.CaptureType.Video then
		table.insert(List, "video")
	end
	if p1.universeId then
		table.insert(List, ConstantsModule.TagPrefix.Universe .. tostring(p1.universeId))
	end
	if p1.edits then
		if p1.edits.trim then
			table.insert(List, "trim")
		end
		if p1.edits.music then
			table.insert(List, "music")
			
			if p1.edits.music.assetId then
				table.insert(List, ConstantsModule.TagPrefix.Music .. tostring(p1.edits.music.assetId))
			end
		end
		if p1.edits.textOverlays then
			table.insert(List, "text_overlay")
		end
	end
	return List
end