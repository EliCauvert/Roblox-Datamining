local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local _ = require(MomentsCreation.Parent.MomentsTypes)
local FFlagMomentsTTSDraftRestoreModule = require(MomentsCreation.Flags.FFlagMomentsTTSDraftRestore)

local function _(Vector) --[[ Line: 91 | Named "encodeUDim2" ]]
	return {
		xScale = Vector.X.Scale,
		xOffset = Vector.X.Offset,
		yScale = Vector.Y.Scale,
		yOffset = Vector.Y.Offset
	}
end

local _ = function(p1) --[[ Line: 100 | Named "encodeColor3" ]]
	return { r = p1.R, g = p1.G, b = p1.B }
end

local function encodeTextOverlay(p1) --[[ Line: 104 ]]
	local TextOverlayStyle = p1.textOverlayStyle
	local Position = p1.position
	local FontColor = TextOverlayStyle.fontColor
	
	return {
		position = {
			xScale = Position.X.Scale,
			xOffset = Position.X.Offset,
			yScale = Position.Y.Scale,
			yOffset = Position.Y.Offset
		},
		rotation = p1.rotation,
		scale = p1.scale,
		text = p1.text,
		zIndex = p1.zIndex,
		textOverlayStyle = {
			font = TextOverlayStyle.font.Name,
			fontColor = { r = FontColor.R, g = FontColor.G, b = FontColor.B },
			fontSize = TextOverlayStyle.fontSize,
			textXAlignment = TextOverlayStyle.textXAlignment.Name
		}
	}
end

local _ = function(p1) --[[ Line: 121 | Named "encodeStickerOverlay" ]]
	local Position = p1.position
	
	return {
		stickerURI = p1.stickerURI,
		position = {
			xScale = Position.X.Scale,
			xOffset = Position.X.Offset,
			yScale = Position.Y.Scale,
			yOffset = Position.Y.Offset
		},
		stickerSize = p1.stickerSize,
		rotation = p1.rotation,
		scale = p1.scale,
		zIndex = p1.zIndex
	}
end

local _ = function(Voice) --[[ Line: 132 | Named "encodeVoice" ]]
	return {
		text = Voice.text,
		voiceId = Voice.voiceId,
		startTime = Voice.startTime
	}
end

local function decodeUDim2(Position) --[[ Line: 186 ]]
	return if type(Position) == "table" and (type(Position.xScale) == "number" and type(Position.xOffset) == "number" and type(Position.yScale) == "number" and type(Position.yOffset) == "number") then UDim2.new(Position.xScale, Position.xOffset, Position.yScale, Position.yOffset) else nil
end

local _ = function(p1) --[[ Line: 202 | Named "decodeColor3" ]]
	return if type(p1) == "table" and (type(p1.r) == "number" and type(p1.g) == "number" and type(p1.b) == "number") then Color3.new(p1.r, p1.g, p1.b) else nil
end

local _ = function(p1, p2) --[[ Line: 213 | Named "safeDecodeEnum" ]]
	if type(p2) == "string" then
		local Success, Result = pcall(function() --[[ Line: 217 ]]
			-- upvalues: p1 (copy), p2 (copy)
			return p1[p2]
		end)
		
		return if Success then Result else nil
	else
		return nil
	end
end

local function decodeTextOverlay(p1) --[[ Line: 223 ]]
	-- upvalues: decodeUDim2 (copy)
	if type(p1) ~= "table" or type(p1.textOverlayStyle) ~= "table" then
		return nil
	end
	local TextOverlayStyle = p1.textOverlayStyle
	local DecodeUDimResult = decodeUDim2(p1.position)
	local _Font = Enum.Font
	local TextOverlayStyleFont = TextOverlayStyle.font
	local v1 = nil
	
	if type(TextOverlayStyleFont) == "string" then
		local Success, Result = pcall(function() --[[ Line: 217 ]]
			-- upvalues: _Font (copy), TextOverlayStyleFont (copy)
			return _Font[TextOverlayStyleFont]
		end)
		v1 = if Success then Result else nil
	else
		v1 = nil
	end
	local FontColor = TextOverlayStyle.fontColor
	local _Color3 = if type(FontColor) == "table" and (type(FontColor.r) == "number" and type(FontColor.g) == "number" and type(FontColor.b) == "number") then Color3.new(FontColor.r, FontColor.g, FontColor.b) else nil
	local TextXAlignment = Enum.TextXAlignment
	local TextXAlignment1 = TextOverlayStyle.textXAlignment
	local TextXAlignment2 = nil
	
	if type(TextXAlignment1) == "string" then
		local Success1, Result1 = pcall(function() --[[ Line: 217 ]]
			-- upvalues: TextXAlignment (copy), TextXAlignment1 (copy)
			return TextXAlignment[TextXAlignment1]
		end)
		TextXAlignment2 = if Success1 then Result1 else nil
	else
		TextXAlignment2 = nil
	end
	return if DecodeUDimResult == nil or v1 == nil or _Color3 == nil or TextXAlignment2 == nil then nil elseif type(p1.rotation) == "number" and type(p1.scale) == "number" and type(p1.text) == "string" and type(p1.zIndex) == "number" and type(TextOverlayStyle.fontSize) == "number" then {
		position = DecodeUDimResult,
		rotation = p1.rotation,
		scale = p1.scale,
		text = p1.text,
		zIndex = p1.zIndex,
		textOverlayStyle = {
			font = v1,
			fontColor = _Color3,
			fontSize = TextOverlayStyle.fontSize,
			textXAlignment = TextXAlignment2
		}
	} else nil
end

local function decodeStickerOverlay(p1) --[[ Line: 265 ]]
	-- upvalues: decodeUDim2 (copy)
	if type(p1) == "table" then
		local DecodeUDimResult = decodeUDim2(p1.position)
		
		return if DecodeUDimResult == nil then nil elseif (p1.stickerURI == nil or type(p1.stickerURI) == "string") and (type(p1.stickerSize) == "number" and type(p1.rotation) == "number" and type(p1.scale) == "number" and type(p1.zIndex) == "number") then {
			stickerURI = p1.stickerURI,
			position = DecodeUDimResult,
			stickerSize = p1.stickerSize,
			rotation = p1.rotation,
			scale = p1.scale,
			zIndex = p1.zIndex
		} else nil
	else
		return nil
	end
end

local function decodeTrim(Trim) --[[ Line: 299 ]]
	return if type(Trim) == "table" and (type(Trim.startTime) == "number" and type(Trim.endTime) == "number") then { startTime = Trim.startTime, endTime = Trim.endTime } else nil
end

local function decodeMusic(Music) --[[ Line: 314 ]]
	return if type(Music) == "table" and (type(Music.assetId) == "number" and type(Music.startTime) == "number") then { assetId = Music.assetId, startTime = Music.startTime } else nil
end

local function decodeVoice(Voice) --[[ Line: 329 ]]
	return if type(Voice) == "table" and (type(Voice.text) == "string" and Voice.text ~= "" and type(Voice.voiceId) == "number" and type(Voice.startTime) == "number") then {
		text = Voice.text,
		voiceId = Voice.voiceId,
		startTime = Voice.startTime
	} else nil
end

return {
	serialize = function(p1) --[[ Line: 140 ]]
		-- upvalues: encodeTextOverlay (copy), FFlagMomentsTTSDraftRestoreModule (copy)
		local Edits = p1.edits
		local Edits1 = { trim = Edits.trim, music = Edits.music }
		
		if Edits.text then
			local Text = {}
			
			for _, value in Edits.text do
				table.insert(Text, (encodeTextOverlay(value)))
			end
			Edits1.text = Text
		end
		if Edits.sticker then
			local Sticker = {}
			
			for _, value1 in Edits.sticker do
				local Position = value1.position
				table.insert(Sticker, {
					stickerURI = value1.stickerURI,
					position = {
						xScale = Position.X.Scale,
						xOffset = Position.X.Offset,
						yScale = Position.Y.Scale,
						yOffset = Position.Y.Offset
					},
					stickerSize = value1.stickerSize,
					rotation = value1.rotation,
					scale = value1.scale,
					zIndex = value1.zIndex
				})
			end
			Edits1.sticker = Sticker
		end
		if FFlagMomentsTTSDraftRestoreModule and Edits.voice then
			local Voice = Edits.voice
			Edits1.voice = {
				text = Voice.text,
				voiceId = Voice.voiceId,
				startTime = Voice.startTime
			}
		end
		return {
			userId = p1.userId,
			captureRef = {
				localId = p1.captureRef.localId,
				captureType = p1.captureRef.captureType.Name
			},
			description = p1.description,
			commentsEnabled = p1.commentsEnabled,
			edits = Edits1,
			lastSaveTime = p1.lastSaveTime
		}
	end,
	deserialize = function(p2) --[[ Line: 350 ]]
		-- upvalues: decodeTrim (copy), decodeMusic (copy), decodeTextOverlay (copy), decodeStickerOverlay (copy), FFlagMomentsTTSDraftRestoreModule (copy), decodeVoice (copy)
		if type(p2) ~= "table" then
			return nil
		end
		local CaptureRef = p2.captureRef
		
		if type(CaptureRef) ~= "table" or type(CaptureRef.localId) ~= "string" or CaptureRef.localId == "" then
			return nil
		end
		local CaptureType = Enum.CaptureType
		local CaptureType1 = CaptureRef.captureType
		local CaptureType2 = nil
		
		if type(CaptureType1) == "string" then
			local Success, Result = pcall(function() --[[ Line: 217 ]]
				-- upvalues: CaptureType (copy), CaptureType1 (copy)
				return CaptureType[CaptureType1]
			end)
			CaptureType2 = if Success then Result else nil
		else
			CaptureType2 = nil
		end
		if CaptureType2 == nil then
			return nil
		end
		local Edits = p2.edits
		
		if type(Edits) ~= "table" then
			return nil
		end
		local Edits1 = {}
		
		if Edits.trim ~= nil then
			local DecodeTrimResult = decodeTrim(Edits.trim)
			
			if DecodeTrimResult == nil then
				return nil
			end
			Edits1.trim = DecodeTrimResult
		end
		if Edits.music ~= nil then
			local DecodeMusicResult = decodeMusic(Edits.music)
			
			if DecodeMusicResult == nil then
				return nil
			end
			Edits1.music = DecodeMusicResult
		end
		if Edits.text ~= nil then
			if type(Edits.text) ~= "table" then
				return nil
			end
			local Text = {}
			
			for _, value in Edits.text do
				local DecodeTextOverlayResult = decodeTextOverlay(value)
				
				if DecodeTextOverlayResult == nil then
					return nil
				end
				table.insert(Text, DecodeTextOverlayResult)
			end
			Edits1.text = Text
		end
		if Edits.sticker ~= nil then
			if type(Edits.sticker) ~= "table" then
				return nil
			end
			local Sticker = {}
			
			for _, value1 in Edits.sticker do
				local DecodeStickerOverlayResult = decodeStickerOverlay(value1)
				
				if DecodeStickerOverlayResult == nil then
					return nil
				end
				table.insert(Sticker, DecodeStickerOverlayResult)
			end
			Edits1.sticker = Sticker
		end
		if FFlagMomentsTTSDraftRestoreModule and Edits.voice ~= nil then
			Edits1.voice = decodeVoice(Edits.voice)
		end
		return if type(p2.userId) == "string" and ((p2.description == nil or type(p2.description) == "string") and ((p2.commentsEnabled == nil or type(p2.commentsEnabled) == "boolean") and type(p2.lastSaveTime) == "number")) then {
			userId = p2.userId,
			captureRef = { localId = CaptureRef.localId, captureType = CaptureType2 },
			description = p2.description,
			commentsEnabled = p2.commentsEnabled,
			edits = Edits1,
			lastSaveTime = p2.lastSaveTime
		} else nil
	end
}