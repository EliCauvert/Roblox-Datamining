-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:49 2026 Pacific Standard Time.

local momentsCommon = script:FindFirstAncestor("MomentsCommon")
local _ = require(momentsCommon.Types)
local constantsModule = require(momentsCommon.Constants)

return function(p0) --[[ line: 8 | named "getTagsForMoment" ]]
	-- upvalues: constantsModule (ref)
	local t = {}
	
	if p0.captureType == Enum.CaptureType.Screenshot then
		table.insert(t, "screenshot")
	elseif p0.captureType == Enum.CaptureType.Video then
		table.insert(t, "video")
	end
	if p0.universeId then
		table.insert(t, constantsModule.TagPrefix.Universe .. tostring(p0.universeId))
	end
	if p0.edits then
		if p0.edits.trim then
			table.insert(t, "trim")
		end
		if p0.edits.music then
			table.insert(t, "music")
			
			if p0.edits.music.assetId then
				table.insert(t, constantsModule.TagPrefix.Music .. tostring(p0.edits.music.assetId))
			end
		end
		if p0.edits.textOverlays then
			table.insert(t, "text_overlay")
		end
	end
	return t
end