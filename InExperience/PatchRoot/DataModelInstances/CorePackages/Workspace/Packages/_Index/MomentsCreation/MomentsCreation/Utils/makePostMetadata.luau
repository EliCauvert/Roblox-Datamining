local _ = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsTypes)
local momentsPostCtaUseCaptureUniverse = game:DefineFastFlag("MomentsPostCtaUseCaptureUniverse", false)

local function convertTextOverlayStyle(p0) --[[ line: 14 ]]
	return {
		font = p0.font.Name,
		fontColor = { p0.fontColor.R, p0.fontColor.G, p0.fontColor.B },
		fontSize = p0.fontSize,
		textXAlignment = p0.textXAlignment.Name
	}
end

local function convertTextOverlay(p1) --[[ line: 23 ]]
	-- upvalues: convertTextOverlayStyle (ref)
	return {
		text = p1.text,
		rotation = p1.rotation,
		scale = p1.scale,
		zIndex = p1.zIndex,
		position = { p1.position.X.Scale, p1.position.Y.Scale },
		textOverlayStyle = convertTextOverlayStyle(p1.textOverlayStyle)
	}
end

return function(p2) --[[ line: 34 | named "makePostMetadata" ]]
	-- upvalues: convertTextOverlay (ref), momentsPostCtaUseCaptureUniverse (ref)
	local t = { caption = p2.description }
	
	if p2.edits then
		if p2.edits.music then
			t.music = {
				assetId = p2.edits.music.assetId,
				startTime = p2.edits.music.startTime
			}
		end
		if p2.edits.trim then
			t.trim = {
				startTime = p2.edits.trim.startTime,
				endTime = p2.edits.trim.endTime
			}
		end
		if p2.edits.textOverlays then
			local t_1 = {}
			
			for i, v in p2.edits.textOverlays do
				table.insert(t_1, convertTextOverlay(v))
			end
			t.textOverlays = t_1
		end
	end
	local var5 = p2.universeIdOverride or p2.universeId
	
	if momentsPostCtaUseCaptureUniverse then
		local universeId = p2.universeId
		var5 = if universeId == nil or universeId <= 0 then p2.universeIdOverride else universeId
	end
	if var5 and p2.placeId then
		t.primaryCta = { experienceId = var5, placeId = p2.placeId }
	end
	if p2.captureType == Enum.CaptureType.Video then
		t.durationSeconds = p2.assetTotalDuration
	end
	return t
end