local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Parent.MomentsTypes)
local getFFlagMomentsTTSAudioOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local momentsPostCtaUseCaptureUniverse = game:DefineFastFlag("MomentsPostCtaUseCaptureUniverse", false)

local function convertTextOverlayStyle(p1)
	return {
		font = p1.font.Name,
		fontColor = { p1.fontColor.R, p1.fontColor.G, p1.fontColor.B },
		fontSize = p1.fontSize,
		textXAlignment = p1.textXAlignment.Name
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

return function(p1)
	-- upvalues: convertTextOverlay (ref), getFFlagMomentsTTSAudioOverlayModule (ref), momentsPostCtaUseCaptureUniverse (ref)
	local t = { caption = p1.description }
	
	if p1.edits then
		if p1.edits.music then
			t.music = {
				assetId = p1.edits.music.assetId,
				startTime = p1.edits.music.startTime
			}
		end
		if p1.edits.trim then
			t.trim = {
				startTime = p1.edits.trim.startTime,
				endTime = p1.edits.trim.endTime
			}
		end
		if p1.edits.textOverlays then
			local t_1 = {}
			
			for i, v in p1.edits.textOverlays do
				table.insert(t_1, convertTextOverlay(v))
			end
			t.textOverlays = t_1
		end
		if getFFlagMomentsTTSAudioOverlayModule and p1.edits.tts and (p1.edits.tts.text ~= nil and p1.edits.tts.text ~= "") then
			local tts = p1.edits.tts
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
	local var1 = p1.universeIdOverride or p1.universeId
	
	if momentsPostCtaUseCaptureUniverse then
		local universeId = p1.universeId
		var1 = if universeId == nil or universeId <= 0 then p1.universeIdOverride else universeId
	end
	if var1 and p1.placeId then
		t.primaryCta = { experienceId = var1, placeId = p1.placeId }
	end
	if p1.captureType == Enum.CaptureType.Video then
		t.durationSeconds = p1.assetTotalDuration
	end
	return t
end