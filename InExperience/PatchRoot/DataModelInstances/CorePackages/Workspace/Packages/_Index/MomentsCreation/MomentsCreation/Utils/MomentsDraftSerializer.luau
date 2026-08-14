local _ = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsTypes)

local function _(p0) --[[ line: 78 | named "encodeUDim2" ]]
	return {
		xScale = p0.X.Scale,
		xOffset = p0.X.Offset,
		yScale = p0.Y.Scale,
		yOffset = p0.Y.Offset
	}
end

local _ = function(p1) --[[ line: 87 | named "encodeColor3" ]]
	return { r = p1.R, g = p1.G, b = p1.B }
end

local function encodeTextOverlay(p2) --[[ line: 91 ]]
	local textOverlayStyle = p2.textOverlayStyle
	local t = {}
	local position = p2.position
	t.position = {
		xScale = position.X.Scale,
		xOffset = position.X.Offset,
		yScale = position.Y.Scale,
		yOffset = position.Y.Offset
	}
	t.rotation = p2.rotation
	t.scale = p2.scale
	t.text = p2.text
	t.zIndex = p2.zIndex
	local t_1 = { font = textOverlayStyle.font.Name }
	local fontColor = textOverlayStyle.fontColor
	t_1.fontColor = { r = fontColor.R, g = fontColor.G, b = fontColor.B }
	t_1.fontSize = textOverlayStyle.fontSize
	t_1.textXAlignment = textOverlayStyle.textXAlignment.Name
	t.textOverlayStyle = t_1
	
	return t
end

local _ = function(p3) --[[ line: 108 | named "encodeStickerOverlay" ]]
	local t = { stickerURI = p3.stickerURI }
	local position = p3.position
	t.position = {
		xScale = position.X.Scale,
		xOffset = position.X.Offset,
		yScale = position.Y.Scale,
		yOffset = position.Y.Offset
	}
	t.stickerSize = p3.stickerSize
	t.rotation = p3.rotation
	t.scale = p3.scale
	t.zIndex = p3.zIndex
	
	return t
end

local function serialize(p4) --[[ line: 119 ]]
	-- upvalues: encodeTextOverlay (ref)
	local edits = p4.edits
	local t = { trim = edits.trim, music = edits.music }
	
	if edits.text then
		local t_1 = {}
		
		for i, v in edits.text do
			table.insert(t_1, encodeTextOverlay(v))
		end
		t.text = t_1
	end
	if edits.sticker then
		local t_1 = {}
		
		for i, v in edits.sticker do
			local t_2 = { stickerURI = v.stickerURI }
			local position = v.position
			t_2.position = {
				xScale = position.X.Scale,
				xOffset = position.X.Offset,
				yScale = position.Y.Scale,
				yOffset = position.Y.Offset
			}
			t_2.stickerSize = v.stickerSize
			t_2.rotation = v.rotation
			t_2.scale = v.scale
			t_2.zIndex = v.zIndex
			table.insert(t_1, t_2)
		end
		t.sticker = t_1
	end
	return {
		userId = p4.userId,
		captureRef = {
			localId = p4.captureRef.localId,
			captureType = p4.captureRef.captureType.Name
		},
		description = p4.description,
		edits = t,
		lastSaveTime = p4.lastSaveTime
	}
end

local function decodeUDim2(p5) --[[ line: 160 ]]
	return if type(p5) == "table" then if type(p5.xScale) == "number" and type(p5.xOffset) == "number" and (type(p5.yScale) == "number" and type(p5.yOffset) == "number") then UDim2.new(p5.xScale, p5.xOffset, p5.yScale, p5.yOffset) else nil else nil
end

local _ = function(p6) --[[ line: 176 | named "decodeColor3" ]]
	return if type(p6) == "table" then if type(p6.r) == "number" and type(p6.g) == "number" and type(p6.b) == "number" then Color3.new(p6.r, p6.g, p6.b) else nil else nil
end

local _ = function(p7, p8) --[[ line: 187 | named "safeDecodeEnum" ]]
	if type(p8) ~= "string" then
		return nil
	end
	local ok, status = pcall(function() --[[ line: 191 ]]
		-- upvalues: p7 (ref), p8 (ref)
		return p7[p8]
	end)
	
	return if ok then status else nil
end

local function decodeTextOverlay(p9) --[[ line: 197 ]]
	-- upvalues: decodeUDim2 (ref)
	if type(p9) ~= "table" or type(p9.textOverlayStyle) ~= "table" then
		return nil
	end
	local var15
	local textOverlayStyle = p9.textOverlayStyle
	local var14 = decodeUDim2(p9.position)
	local font = Enum.Font
	local font_1 = textOverlayStyle.font
	
	if type(font_1) == "string" then
		local ok, status = pcall(function() --[[ line: 191 ]]
			-- upvalues: font (ref), font_1 (ref)
			return font[font_1]
		end)
		var15 = if ok then status else nil
	else
		var15 = nil
	end
	local fontColor = textOverlayStyle.fontColor
	local var16 = if type(fontColor) ~= "table" then if type(fontColor.r) == "number" and type(fontColor.g) == "number" and type(fontColor.b) == "number" then Color3.new(fontColor.r, fontColor.g, fontColor.b) else nil else nil
	local textXAlignment = Enum.TextXAlignment
	local textXAlignment_1 = textOverlayStyle.textXAlignment
	
	if type(textXAlignment_1) == "string" then
		local ok, status = pcall(function() --[[ line: 191 ]]
			-- upvalues: textXAlignment (ref), textXAlignment_1 (ref)
			return textXAlignment[textXAlignment_1]
		end)
		fontColor = if ok then status else nil
	else
		fontColor = nil
	end
	return if var14 == nil or var15 == nil or (var16 == nil or fontColor == nil) then nil elseif type(p9.rotation) == "number" and type(p9.scale) == "number" and (type(p9.text) == "string" and type(p9.zIndex) == "number") and type(textOverlayStyle.fontSize) == "number" then {
		position = var14,
		rotation = p9.rotation,
		scale = p9.scale,
		text = p9.text,
		zIndex = p9.zIndex,
		textOverlayStyle = {
			font = var15,
			fontColor = var16,
			fontSize = textOverlayStyle.fontSize,
			textXAlignment = fontColor
		}
	} else nil
end

local function decodeStickerOverlay(p10) --[[ line: 239 ]]
	-- upvalues: decodeUDim2 (ref)
	if type(p10) ~= "table" then
		return nil
	end
	local var17 = decodeUDim2(p10.position)
	
	return if var17 == nil then nil elseif not (p10.stickerURI ~= nil and type(p10.stickerURI) ~= "string") then if type(p10.stickerSize) == "number" and type(p10.rotation) == "number" and (type(p10.scale) == "number" and type(p10.zIndex) == "number") then {
		stickerURI = p10.stickerURI,
		position = var17,
		stickerSize = p10.stickerSize,
		rotation = p10.rotation,
		scale = p10.scale,
		zIndex = p10.zIndex
	} else nil else nil
end

local function decodeTrim(p11) --[[ line: 273 ]]
	return if type(p11) == "table" then if type(p11.startTime) == "number" and type(p11.endTime) == "number" then { startTime = p11.startTime, endTime = p11.endTime } else nil else nil
end

local function decodeMusic(p12) --[[ line: 288 ]]
	return if type(p12) == "table" then if type(p12.assetId) == "number" and type(p12.startTime) == "number" then { assetId = p12.assetId, startTime = p12.startTime } else nil else nil
end

return {
	serialize = serialize,
	deserialize = function(p13) --[[ line: 303 ]]
		-- upvalues: decodeTrim (ref), decodeMusic (ref), decodeTextOverlay (ref), decodeStickerOverlay (ref)
		if type(p13) ~= "table" then
			return nil
		end
		local captureRef = p13.captureRef
		
		if type(captureRef) ~= "table" or type(captureRef.localId) ~= "string" or captureRef.localId == "" then
			return nil
		end
		local var18
		local captureType = Enum.CaptureType
		local captureType_1 = captureRef.captureType
		
		if type(captureType_1) == "string" then
			local ok, status = pcall(function() --[[ line: 191 ]]
				-- upvalues: captureType (ref), captureType_1 (ref)
				return captureType[captureType_1]
			end)
			var18 = if ok then status else nil
		else
			var18 = nil
		end
		if var18 == nil then
			return nil
		end
		local edits = p13.edits
		
		if type(edits) ~= "table" then
			return nil
		end
		local var23
		local t = {}
		
		if edits.trim ~= nil then
			local var20 = decodeTrim(edits.trim)
			
			if var20 == nil then
				return nil
			end
			t.trim = var20
		end
		if edits.music ~= nil then
			local var21 = decodeMusic(edits.music)
			
			if var21 == nil then
				return nil
			end
			t.music = var21
		end
		if edits.text ~= nil then
			if type(edits.text) ~= "table" then
				return nil
			end
			local t_1 = {}
			
			for i, v in edits.text do
				var23 = decodeTextOverlay(v)
				
				if var23 ~= nil then
					table.insert(t_1, var23)
					continue
				end
				return nil
			end
			t.text = t_1
		end
		if edits.sticker ~= nil then
			if type(edits.sticker) ~= "table" then
				return nil
			end
			local t_1 = {}
			
			for i, v in edits.sticker do
				var23 = decodeStickerOverlay(v)
				
				if var23 ~= nil then
					table.insert(t_1, var23)
					continue
				end
				return nil
			end
			t.sticker = t_1
		end
		return if type(p13.userId) == "string" then if not (p13.description ~= nil and type(p13.description) ~= "string") then if type(p13.lastSaveTime) == "number" then {
			userId = p13.userId,
			captureRef = { localId = captureRef.localId, captureType = var18 },
			description = p13.description,
			edits = t,
			lastSaveTime = p13.lastSaveTime
		} else nil else nil else nil
	end
}