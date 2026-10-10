local parent = script:FindFirstAncestor("Moments").Parent
local _ = require(parent.MomentsTypes)
local fFlagMomentsAvatarLookTryOn = require(parent.SharedFlags).FFlagMomentsAvatarLookTryOn
local t = {
	TEXT_X_ALIGNMENT_LEFT = Enum.TextXAlignment.Left,
	TEXT_X_ALIGNMENT_CENTER = Enum.TextXAlignment.Center,
	TEXT_X_ALIGNMENT_RIGHT = Enum.TextXAlignment.Right
}

local function toEnumFont(p1)
	if type(p1) ~= "string" then
		return nil
	end
	local match = string.match(p1, "^ENUMERATED_FONT_(.+)$")
	
	if match == nil or match == "INVALID" then
		return nil
	end
	local t = {}
	
	for i in string.gmatch(match, "[^_]+") do
		table.insert(t, string.upper(string.sub(i, 1, 1)) .. string.lower(string.sub(i, 2)))
	end
	local ok, status = pcall(function()
		-- upvalues: t (ref)
		return Enum.Font[table.concat(t)]
	end)
	
	return if ok then status else nil
end

local function _(p2)
	return if p2 == nil then 0 else (p2.seconds or 0) + (p2.nanos or 0) / 1000000000
end

local _ = function(p2)
	if p2 == nil then
		return nil
	end
	local offsetDuration = p2.offset_duration
	local var1 = if offsetDuration == nil then 0 else (offsetDuration.seconds or 0) + (offsetDuration.nanos or 0) / 1000000000
	local duration = p2.duration
	local var2 = if duration == nil then 0 else (duration.seconds or 0) + (duration.nanos or 0) / 1000000000
	
	return if var2 <= 0 then nil else { startTime = var1, endTime = var1 + var2 }
end

local function toTextOverlay(p2, p3, p4)
	-- upvalues: toEnumFont (ref), t (ref)
	local transform = p2.transform
	local var1 = if transform == nil or transform.position == nil then UDim2.fromScale(0.5, 0.5) else UDim2.fromScale(transform.position.x, transform.position.y)
	local var2 = if p3.font ~= nil then nil else p3.font.font_source
	local fontColor = p3.font_color
	
	return {
		position = var1,
		rotation = if transform ~= nil then 0 else transform.rotation,
		scale = if transform == nil or transform.scale == 0 then 1 else transform.scale,
		text = p3.text,
		textOverlayStyle = {
			font = (if var2 == nil or var2.type ~= "enumerated_font" then nil else toEnumFont(var2.value)) or (p4 or Enum.Font.BuilderSansMedium),
			fontColor = if fontColor ~= nil then Color3.new(0, 0, 0) else Color3.new(fontColor.r, fontColor.g, fontColor.b),
			fontSize = if p3.font_size > 0 then p3.font_size else 16,
			textXAlignment = t[p3.text_x_alignment] or Enum.TextXAlignment.Center
		},
		zIndex = if type(p2.z_index) == "number" and p2.z_index > 0 then p2.z_index else 1
	}
end

local _ = function(value, p2)
	if value == nil or value.ttsAudios == nil then
		return nil
	end
	for i, v in value.ttsAudios do
		if v.assetId == p2 then
			return v.assetAccessContext
		end
	end
	return nil
end

return function(p3, p4)
	-- upvalues: toTextOverlay (ref), fFlagMomentsAvatarLookTryOn (ref)
	local cloned = table.clone(p3.metadata)
	local edits = cloned.edits
	local t = {
		stickerOverlays = if edits ~= nil then nil else edits.stickerOverlays
	}
	local t_1 = {}
	local t_2 = {}
	local assetId = nil
	local screenshot = nil
	
	for i, v in p4.tracks or {} do
		for i_1, v_1 in v.slots or {} do
			local content = v_1.content
			
			if content ~= nil then
				local value, content_1, duration
				if content.type == "visual" then
					value = content.value
					content_1 = value.content
					
					if content_1 ~= nil then
						if content_1.type == "video" and assetId == nil and content_1.value.asset_id > 0 then
							local var1
							assetId = content_1.value.asset_id
							screenshot = Enum.CaptureType.Video
							local trim = content_1.value.trim
							
							if trim == nil then
								var1 = nil
							else
								local offsetDuration = trim.offset_duration
								local var2 = if offsetDuration == nil then 0 else (offsetDuration.seconds or 0) + (offsetDuration.nanos or 0) / 1000000000
								duration = trim.duration
								local var3 = if duration == nil then 0 else (duration.seconds or 0) + (duration.nanos or 0) / 1000000000
								var1 = if var3 <= 0 then nil else { startTime = var2, endTime = var2 + var3 }
							end
							t.trim = var1
						elseif content_1.type == "image" and assetId == nil and content_1.value.asset_id > 0 then
							assetId = content_1.value.asset_id
							screenshot = Enum.CaptureType.Screenshot
						elseif content_1.type == "text_label" then
							local var4 = if edits == nil or edits.textOverlays == nil then nil else edits.textOverlays[#t_1 + 1]
							table.insert(t_1, toTextOverlay(value, content_1.value, if var4 ~= nil then nil else var4.textOverlayStyle.font))
						end
					end
				elseif content.type == "audio" then
					value = content.value
					
					if value.audio_type == "AUDIO_TYPE_MUSIC" and t.music == nil and value.asset_id > 0 then
						local var5
						content_1 = { assetId = value.asset_id }
						
						if v_1.time_range == nil then
							var5 = 0
						else
							local offsetDuration = v_1.time_range.offset_duration
							var5 = if offsetDuration == nil then 0 else (offsetDuration.seconds or 0) + (offsetDuration.nanos or 0) / 1000000000
						end
						content_1.startTime = var5
						t.music = content_1
					elseif value.audio_type == "AUDIO_TYPE_TTS" and value.context ~= nil and (value.context.type == "tts" and value.asset_id > 0) then
						local var6
						content_1 = value.context.value
						local t_3 = { text = content_1.text, voiceId = content_1.voice_id }
						
						if v_1.time_range == nil then
							var6 = 0
						else
							duration = v_1.time_range.offset_duration
							var6 = if duration == nil then 0 else (duration.seconds or 0) + (duration.nanos or 0) / 1000000000
						end
						local assetAccessContext
						t_3.startTime = var6
						t_3.assetId = value.asset_id
						duration = value.asset_id
						
						if edits == nil or edits.ttsAudios == nil then
							assetAccessContext = nil
						else
							for i_2, v_2 in edits.ttsAudios do
								if v_2.assetId == duration then
									assetAccessContext = v_2.assetAccessContext
								end
							end
							assetAccessContext = nil
						end
						t_3.assetAccessContext = assetAccessContext
						table.insert(t_2, t_3)
					end
				elseif content.type == "experience_annotation" then
					if content.value.universe_id > 0 then
						cloned.universeId = content.value.universe_id
					end
					if content.value.place_id > 0 then
						cloned.placeId = content.value.place_id
					end
				elseif fFlagMomentsAvatarLookTryOn and content.type == "avatar_annotation" and content.value.outfit_id > 0 then
					cloned.outfitId = content.value.outfit_id
				end
			end
		end
	end
	if assetId == nil or screenshot == nil then
		return nil
	elseif #t_1 > 0 then
		t.textOverlays = t_1
	end
	if #t_2 > 0 then
		t.ttsAudios = t_2
	end
	local metadata = p4.metadata
	
	if metadata ~= nil then
		if metadata.caption ~= nil and metadata.caption ~= "" then
			cloned.description = metadata.caption
		end
		if metadata.total_duration ~= nil then
			local totalDuration = metadata.total_duration
			cloned.assetTotalDuration = if totalDuration == nil then 0 else (totalDuration.seconds or 0) + (totalDuration.nanos or 0) / 1000000000
		end
		if metadata.origin ~= nil and metadata.origin ~= 0 and metadata.origin ~= "POST_ORIGIN_INVALID" then
			cloned.hasAuthoritativePartnerUploadType = true
			cloned.partnerUploadType = if metadata.origin == "POST_ORIGIN_INFLUENCER_UPLOAD" then "influencer" else nil
		end
	end
	cloned.captureType = screenshot
	cloned.edits = t
	local cloned_1 = table.clone(p3)
	cloned_1.assetId = assetId
	cloned_1.metadata = cloned
	
	return cloned_1
end