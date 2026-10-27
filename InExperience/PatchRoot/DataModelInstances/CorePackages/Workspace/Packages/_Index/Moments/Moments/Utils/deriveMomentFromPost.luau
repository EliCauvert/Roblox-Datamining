local Parent = script:FindFirstAncestor("Moments").Parent
local _ = require(Parent.MomentsTypes)
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagMomentsAvatarLookTryOn = SharedFlagsModule.FFlagMomentsAvatarLookTryOn
local FFlagMomentsRenderAvatarPostsInFeed = SharedFlagsModule.FFlagMomentsRenderAvatarPostsInFeed
local config = {
	TEXT_X_ALIGNMENT_LEFT = Enum.TextXAlignment.Left,
	TEXT_X_ALIGNMENT_CENTER = Enum.TextXAlignment.Center,
	TEXT_X_ALIGNMENT_RIGHT = Enum.TextXAlignment.Right
}

local function toEnumFont(Text: string)
	if type(Text) ~= "string" then
		return nil
	end
	local Match: string? = string.match(Text, "^ENUMERATED_FONT_(.+)$")
	
	if Match == nil or Match == "INVALID" then
		return nil
	end
	local List = {}
	
	for Text1 in string.gmatch(Match, "[^_]+") do
		table.insert(List, string.upper((string.sub(Text1, 1, 1))) .. string.lower((string.sub(Text1, 2))))
	end
	local Success, Result = pcall(function()
		-- upvalues: List (copy)
		return Enum.Font[table.concat(List)]
	end)
	
	return if Success then Result else nil
end

local function _(p1)
	return if p1 == nil then 0 else (p1.seconds or 0) + (p1.nanos or 0) / 1000000000
end

local _ = function(p1)
	if p1 == nil then
		return nil
	else
		local OffsetDuration = p1.offset_duration
		local StartTime = if OffsetDuration == nil then 0 else (OffsetDuration.seconds or 0) + (OffsetDuration.nanos or 0) / 1000000000
		local Duration = p1.duration
		local v1 = if Duration == nil then 0 else (Duration.seconds or 0) + (Duration.nanos or 0) / 1000000000
		
		return if v1 <= 0 then nil else { startTime = StartTime, endTime = StartTime + v1 }
	end
end

local function toTextOverlay(p1, p2, TextOverlayStyleFont)
	-- upvalues: toEnumFont (copy), config (copy)
	local Transform = p1.transform
	local FontSource = if p2.font == nil then nil else p2.font.font_source
	local FontColor = p2.font_color
	
	return {
		position = if Transform == nil or Transform.position == nil then UDim2.fromScale(0.5, 0.5) else UDim2.fromScale(Transform.position.x, Transform.position.y),
		rotation = if Transform == nil then 0 else Transform.rotation,
		scale = if Transform == nil or Transform.scale == 0 then 1 else Transform.scale,
		text = p2.text,
		textOverlayStyle = {
			font = (if FontSource == nil or FontSource.type ~= "enumerated_font" then nil else toEnumFont(FontSource.value)) or (TextOverlayStyleFont or Enum.Font.BuilderSansMedium),
			fontColor = if FontColor == nil then Color3.new(0, 0, 0) else Color3.new(FontColor.r, FontColor.g, FontColor.b),
			fontSize = if p2.font_size > 0 then p2.font_size else 16,
			textXAlignment = config[p2.text_x_alignment] or Enum.TextXAlignment.Center
		},
		zIndex = if type(p1.z_index) == "number" and p1.z_index > 0 then p1.z_index else 1
	}
end

local _ = function(p1, p2)
	local TimeRange = if p2.source_trim == nil then p1.time_range else p2.source_trim
	
	if TimeRange == nil then
		return 0
	else
		local OffsetDuration = TimeRange.offset_duration
		
		return if OffsetDuration == nil then 0 else (OffsetDuration.seconds or 0) + (OffsetDuration.nanos or 0) / 1000000000
	end
end

local _ = function(p1, AssetId)
	if p1 == nil or p1.ttsAudios == nil then
		return nil
	end
	for _, ttsAudio in p1.ttsAudios do
		if ttsAudio.assetId == AssetId then
			return ttsAudio.assetAccessContext
		end
	end
	return nil
end

local function applyPostMetadata(Metadata, Metadata1)
	if Metadata1 == nil then return end
	if Metadata1.caption ~= nil and Metadata1.caption ~= "" then
		Metadata.description = Metadata1.caption
	end
	if Metadata1.total_duration ~= nil then
		local TotalDuration = Metadata1.total_duration
		Metadata.assetTotalDuration = if TotalDuration == nil then 0 else (TotalDuration.seconds or 0) + (TotalDuration.nanos or 0) / 1000000000
	end
	if Metadata1.origin ~= nil and Metadata1.origin ~= 0 and Metadata1.origin ~= "POST_ORIGIN_INVALID" then
		Metadata.hasAuthoritativePartnerUploadType = true
		Metadata.partnerUploadType = if Metadata1.origin == "POST_ORIGIN_INFLUENCER_UPLOAD" then "influencer" else nil
	end
end

return function(Tbl, p2)
	-- upvalues: FFlagMomentsRenderAvatarPostsInFeed (copy), toTextOverlay (copy), FFlagMomentsAvatarLookTryOn (copy), applyPostMetadata (copy)
	local Copy = table.clone(Tbl.metadata)
	local Edits = Copy.edits
	local Edits1 = {
		stickerOverlays = if Edits == nil then nil else Edits.stickerOverlays
	}
	local TextOverlays = {}
	local TtsAudios = {}
	local AssetId = nil
	local Screenshot = nil
	local Flag = false
	local Tracks = p2.tracks or {}
	local AssetAccessContext = nil
	for _, track in Tracks do
		local Slots = track.slots or {}
		for _, slot in Slots do
			local Content = slot.content
			
			if Content ~= nil then
				if Content.type == "visual" then
					local Value = Content.value
					local Content1 = Value.content
					
					if Content1 ~= nil then
						if Content1.type == "video" and AssetId == nil and Content1.value.asset_id > 0 then
							AssetId = Content1.value.asset_id
							Screenshot = Enum.CaptureType.Video
							local Trim = Content1.value.trim
							local Trim1 = nil
							
							if Trim == nil then
								Trim1 = nil
							else
								local OffsetDuration = Trim.offset_duration
								local StartTime = if OffsetDuration == nil then 0 else (OffsetDuration.seconds or 0) + (OffsetDuration.nanos or 0) / 1000000000
								local Duration = Trim.duration
								local v1 = if Duration == nil then 0 else (Duration.seconds or 0) + (Duration.nanos or 0) / 1000000000
								Trim1 = if v1 <= 0 then nil else { startTime = StartTime, endTime = StartTime + v1 }
							end
							Edits1.trim = Trim1
						elseif Content1.type == "image" and AssetId == nil and Content1.value.asset_id > 0 then
							AssetId = Content1.value.asset_id
							Screenshot = Enum.CaptureType.Screenshot
						elseif FFlagMomentsRenderAvatarPostsInFeed and Content1.type == "scene" then
							Flag = true
						elseif Content1.type == "text_label" then
							local v2 = #TextOverlays + 1
							local TextOverlay = if Edits == nil or Edits.textOverlays == nil then nil else Edits.textOverlays[v2]
							table.insert(TextOverlays, (toTextOverlay(Value, Content1.value, if TextOverlay == nil then nil else TextOverlay.textOverlayStyle.font)))
						end
					end
				elseif Content.type == "audio" then
					local Value = Content.value
					
					if Value.audio_type == "AUDIO_TYPE_MUSIC" and Edits1.music == nil and Value.asset_id > 0 then
						local Music = { assetId = Value.asset_id }
						local TimeRange = if Value.source_trim == nil then slot.time_range else Value.source_trim
						local StartTime = nil
						
						if TimeRange == nil then
							StartTime = 0
						else
							local OffsetDuration = TimeRange.offset_duration
							StartTime = if OffsetDuration == nil then 0 else (OffsetDuration.seconds or 0) + (OffsetDuration.nanos or 0) / 1000000000
						end
						Music.startTime = StartTime
						Edits1.music = Music
					elseif Value.audio_type == "AUDIO_TYPE_TTS" and Value.context ~= nil and Value.context.type == "tts" and Value.asset_id > 0 then
						local Value1 = Value.context.value
						local config = { text = Value1.text, voiceId = Value1.voice_id }
						local StartTime = nil
						
						if slot.time_range == nil then
							StartTime = 0
						else
							local OffsetDuration = slot.time_range.offset_duration
							StartTime = if OffsetDuration == nil then 0 else (OffsetDuration.seconds or 0) + (OffsetDuration.nanos or 0) / 1000000000
						end
						config.startTime = StartTime
						config.assetId = Value.asset_id
						local AssetId1 = Value.asset_id
						
						if Edits == nil or Edits.ttsAudios == nil then
							AssetAccessContext = nil
						else
							AssetAccessContext = nil
							
							for _, ttsAudio in Edits.ttsAudios do
								if ttsAudio.assetId == AssetId1 then
									AssetAccessContext = ttsAudio.assetAccessContext
									break
								end
							end
						end
						config.assetAccessContext = AssetAccessContext
						table.insert(TtsAudios, config)
					end
				elseif Content.type == "experience_annotation" then
					if Content.value.universe_id > 0 then
						Copy.universeId = Content.value.universe_id
					end
					if Content.value.place_id > 0 then
						Copy.placeId = Content.value.place_id
					end
				elseif FFlagMomentsAvatarLookTryOn and Content.type == "avatar_annotation" and Content.value.outfit_id > 0 then
					Copy.outfitId = Content.value.outfit_id
				end
			end
		end
	end
	if (AssetId == nil or Screenshot == nil) and (not FFlagMomentsRenderAvatarPostsInFeed or not Flag) then
		return nil
	end
	if #TextOverlays > 0 then
		Edits1.textOverlays = TextOverlays
	end
	if #TtsAudios > 0 then
		Edits1.ttsAudios = TtsAudios
	end
	applyPostMetadata(Copy, p2.metadata)
	Copy.captureType = if FFlagMomentsRenderAvatarPostsInFeed and Screenshot == nil then Copy.captureType else Screenshot
	Copy.edits = Edits1
	local Copy1 = table.clone(Tbl)
	Copy1.assetId = if FFlagMomentsRenderAvatarPostsInFeed and AssetId == nil then Tbl.assetId else AssetId
	Copy1.metadata = Copy
	
	return Copy1
end