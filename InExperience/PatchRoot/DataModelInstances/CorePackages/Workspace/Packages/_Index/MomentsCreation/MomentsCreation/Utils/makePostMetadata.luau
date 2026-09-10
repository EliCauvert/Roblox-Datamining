local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(momentsCreation.Parent.MomentsTypes)
local getFFlagMomentsTTSAudioOverlayModule = require(momentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local fFlagMomentsFixPostUploadEnumNormalizationModule = require(momentsCreation.Flags.FFlagMomentsFixPostUploadEnumNormalization)
local momentsPostCtaUseCaptureUniverse = game:DefineFastFlag("MomentsPostCtaUseCaptureUniverse", false)

local function _(p1)
	return if typeof(p1) == "EnumItem" then p1.Name else p1
end

local function convertTextOverlayStyle(p1)
	-- upvalues: fFlagMomentsFixPostUploadEnumNormalizationModule (ref)
	local var1
	local t = {}
	
	if fFlagMomentsFixPostUploadEnumNormalizationModule then
		local font = p1.font
		var1 = if typeof(font) == "EnumItem" then font.Name else font
	else
		var1 = p1.font.Name
	end
	local var2
	t.font = var1
	t.fontColor = { p1.fontColor.R, p1.fontColor.G, p1.fontColor.B }
	t.fontSize = p1.fontSize
	
	if fFlagMomentsFixPostUploadEnumNormalizationModule then
		local textXAlignment = p1.textXAlignment
		var2 = if typeof(textXAlignment) == "EnumItem" then textXAlignment.Name else textXAlignment
	else
		var2 = p1.textXAlignment.Name
	end
	t.textXAlignment = var2
	
	return t
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
	-- upvalues: convertTextOverlay (ref), getFFlagMomentsTTSAudioOverlayModule (ref), momentsPostCtaUseCaptureUniverse (ref), fFlagMomentsFixPostUploadEnumNormalizationModule (ref)
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
	local universeId
	local var1 = p1.universeIdOverride or p1.universeId
	
	if momentsPostCtaUseCaptureUniverse then
		universeId = p1.universeId
		var1 = if universeId == nil or universeId <= 0 then p1.universeIdOverride else universeId
	end
	if var1 and p1.placeId then
		t.primaryCta = { experienceId = var1, placeId = p1.placeId }
	end
	if fFlagMomentsFixPostUploadEnumNormalizationModule then
		local captureType = p1.captureType
		universeId = (if typeof(captureType) == "EnumItem" then captureType.Name else captureType) == Enum.CaptureType.Video.Name
		universeId = nil
	else
		universeId = p1.captureType == Enum.CaptureType.Video
	end
	if universeId then
		t.durationSeconds = p1.assetTotalDuration
	end
	return t
end