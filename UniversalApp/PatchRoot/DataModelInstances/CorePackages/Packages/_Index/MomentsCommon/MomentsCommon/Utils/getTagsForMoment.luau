local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local _ = require(momentsCommon.Types)
local constantsModule = require(momentsCommon.Constants)

return function(p1)
	-- upvalues: constantsModule (ref)
	local t = {}
	
	if p1.captureType == Enum.CaptureType.Screenshot then
		table.insert(t, "screenshot")
	elseif p1.captureType == Enum.CaptureType.Video then
		table.insert(t, "video")
	end
	if p1.universeId then
		table.insert(t, constantsModule.TagPrefix.Universe .. tostring(p1.universeId))
	end
	if p1.edits then
		if p1.edits.trim then
			table.insert(t, "trim")
		end
		if p1.edits.music then
			table.insert(t, "music")
			
			if p1.edits.music.assetId then
				table.insert(t, constantsModule.TagPrefix.Music .. tostring(p1.edits.music.assetId))
			end
		end
		if p1.edits.textOverlays then
			table.insert(t, "text_overlay")
		end
	end
	return t
end