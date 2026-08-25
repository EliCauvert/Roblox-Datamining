local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Parent.MomentsTypes)
local getFFlagMomentsTTSAudioOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local momentsPostCtaUseCaptureUniverse = game:DefineFastFlag("MomentsPostCtaUseCaptureUniverse", false)

local function convertTextOverlayStyle(p0)
	return {
		font = p0.font.Name,
		fontColor = { p0.fontColor.R, p0.fontColor.G, p0.fontColor.B },
		fontSize = p0.fontSize,
		textXAlignment = p0.textXAlignment.Name
	}
end

local function convertTextOverlay(p1)
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

return function(p2)
	-- upvalues: convertTextOverlay (ref), getFFlagMomentsTTSAudioOverlayModule (ref), momentsPostCtaUseCaptureUniverse (ref)
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
		if getFFlagMomentsTTSAudioOverlayModule and p2.edits.tts and (p2.edits.tts.text ~= nil and p2.edits.tts.text ~= "") then
			local tts = p2.edits.tts
			t.textToSpeech = {
				{
					pitch = 0,
					speed = 1,
					text = tts.text,
					voiceId = tts.voiceId,
					startTime = tts.startTime
				}
			}
		end
	end
	local var7 = p2.universeIdOverride or p2.universeId
	
	if momentsPostCtaUseCaptureUniverse then
		local universeId = p2.universeId
		var7 = if universeId == nil or universeId <= 0 then p2.universeIdOverride else universeId
	end
	if var7 and p2.placeId then
		t.primaryCta = { experienceId = var7, placeId = p2.placeId }
	end
	if p2.captureType == Enum.CaptureType.Video then
		t.durationSeconds = p2.assetTotalDuration
	end
	return t
end