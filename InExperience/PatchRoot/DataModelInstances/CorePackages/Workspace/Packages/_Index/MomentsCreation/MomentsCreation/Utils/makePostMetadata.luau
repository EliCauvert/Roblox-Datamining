local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local _ = require(Parent.MomentsTypes)
local GetFFlagMomentsTTSAudioOverlayModule = require(MomentsCreation.Flags.GetFFlagMomentsTTSAudioOverlay)
local FFlagMomentsTextOverlayV2Redesign = require(Parent.MomentsCommon).Flags.FFlagMomentsTextOverlayV2Redesign
local FFlagMomentsCommentsCreatorControlModule = require(MomentsCreation.Flags.FFlagMomentsCommentsCreatorControl)
local MomentsPostCtaUseCaptureUniverse = game:DefineFastFlag("MomentsPostCtaUseCaptureUniverse", false)

local function _(p1)
	return if typeof(p1) == "EnumItem" then p1.Name else p1
end

local function convertTextOverlayStyle(TextOverlayStyle)
	-- upvalues: FFlagMomentsTextOverlayV2Redesign (copy)
	local t = {}
	local Name = nil
	
	if FFlagMomentsTextOverlayV2Redesign then
		local TextOverlayStyleFont = TextOverlayStyle.font
		Name = if typeof(TextOverlayStyleFont) == "EnumItem" then TextOverlayStyleFont.Name else TextOverlayStyleFont
	else
		Name = TextOverlayStyle.font.Name
	end
	t.font = Name
	t.fontColor = {
		TextOverlayStyle.fontColor.R,
		TextOverlayStyle.fontColor.G,
		TextOverlayStyle.fontColor.B
	}
	t.fontSize = TextOverlayStyle.fontSize
	local Name1 = nil
	
	if FFlagMomentsTextOverlayV2Redesign then
		local TextXAlignment = TextOverlayStyle.textXAlignment
		Name1 = if typeof(TextXAlignment) == "EnumItem" then TextXAlignment.Name else TextXAlignment
	else
		Name1 = TextOverlayStyle.textXAlignment.Name
	end
	t.textXAlignment = Name1
	
	return t
end

local function convertTextOverlay(p1)
	-- upvalues: convertTextOverlayStyle (copy)
	return {
		text = p1.text,
		rotation = p1.rotation,
		scale = p1.scale,
		zIndex = p1.zIndex,
		position = { p1.position.X.Scale, p1.position.Y.Scale },
		textOverlayStyle = convertTextOverlayStyle(p1.textOverlayStyle)
	}
end

return function(p1, Capture)
	-- upvalues: FFlagMomentsCommentsCreatorControlModule (copy), convertTextOverlay (copy), GetFFlagMomentsTTSAudioOverlayModule (copy), MomentsPostCtaUseCaptureUniverse (copy), FFlagMomentsTextOverlayV2Redesign (copy)
	local config = { caption = p1.description }
	
	if FFlagMomentsCommentsCreatorControlModule and p1.commentsEnabled == false then
		config.commentsEnabled = false
	end
	local CaptureType = p1.captureType
	
	if (if typeof(CaptureType) == "EnumItem" then CaptureType.Name else CaptureType) == Enum.CaptureType.Screenshot.Name then
		config.widthPixels = p1.widthPixels
		config.heightPixels = p1.heightPixels
	end
	if p1.edits then
		if p1.edits.music then
			config.music = {
				assetId = p1.edits.music.assetId,
				startTime = p1.edits.music.startTime
			}
		end
		if p1.edits.trim then
			config.trim = {
				startTime = p1.edits.trim.startTime,
				endTime = p1.edits.trim.endTime
			}
		end
		if p1.edits.textOverlays then
			local TextOverlays = {}
			
			for _, textOverlay in p1.edits.textOverlays do
				table.insert(TextOverlays, (convertTextOverlay(textOverlay)))
			end
			config.textOverlays = TextOverlays
		end
		if GetFFlagMomentsTTSAudioOverlayModule and p1.edits.tts and p1.edits.tts.text ~= nil and p1.edits.tts.text ~= "" then
			local Tts = p1.edits.tts
			config.textToSpeech = {
				{
					pitch = 0,
					speed = 1,
					text = Tts.text,
					voiceId = Tts.voiceId,
					startTime = Tts.startTime
				}
			}
		end
	end
	local UniverseIdOverride = p1.universeIdOverride or p1.universeId
	
	if MomentsPostCtaUseCaptureUniverse then
		local UniverseId: number = p1.universeId
		UniverseIdOverride = if UniverseId == nil or UniverseId <= 0 then p1.universeIdOverride else UniverseId
	end
	if UniverseIdOverride and p1.placeId then
		config.primaryCta = { experienceId = UniverseIdOverride, placeId = p1.placeId }
	end
	local IsNameMatch = nil
	if FFlagMomentsTextOverlayV2Redesign then
		local CaptureType1 = p1.captureType
		IsNameMatch = (if typeof(CaptureType1) == "EnumItem" then CaptureType1.Name else CaptureType1) == Enum.CaptureType.Video.Name
	else
		IsNameMatch = p1.captureType == Enum.CaptureType.Video
	end
	if IsNameMatch then
		config.durationSeconds = p1.assetTotalDuration
	end
	if Capture ~= nil then
		config.media = {
			{
				capture = Capture,
				widthPixels = config.widthPixels,
				heightPixels = config.heightPixels,
				durationSeconds = config.durationSeconds,
				trim = config.trim
			}
		}
		config.widthPixels = nil
		config.heightPixels = nil
		config.durationSeconds = nil
		config.trim = nil
	end
	return config
end