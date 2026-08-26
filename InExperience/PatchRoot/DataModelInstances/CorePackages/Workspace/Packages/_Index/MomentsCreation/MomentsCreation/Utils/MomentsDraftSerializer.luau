local _ = require(script:FindFirstAncestor("MomentsCreation").Parent.MomentsTypes)

local function _(p1)
	return {
		xScale = p1.X.Scale,
		xOffset = p1.X.Offset,
		yScale = p1.Y.Scale,
		yOffset = p1.Y.Offset
	}
end

local _ = function(p1)
	return { r = p1.R, g = p1.G, b = p1.B }
end

local function encodeTextOverlay(p1)
	local textOverlayStyle = p1.textOverlayStyle
	local t = {}
	local position = p1.position
	t.position = {
		xScale = position.X.Scale,
		xOffset = position.X.Offset,
		yScale = position.Y.Scale,
		yOffset = position.Y.Offset
	}
	t.rotation = p1.rotation
	t.scale = p1.scale
	t.text = p1.text
	t.zIndex = p1.zIndex
	local t_1 = { font = textOverlayStyle.font.Name }
	local fontColor = textOverlayStyle.fontColor
	t_1.fontColor = { r = fontColor.R, g = fontColor.G, b = fontColor.B }
	t_1.fontSize = textOverlayStyle.fontSize
	t_1.textXAlignment = textOverlayStyle.textXAlignment.Name
	t.textOverlayStyle = t_1
	
	return t
end

local _ = function(p1)
	local t = { stickerURI = p1.stickerURI }
	local position = p1.position
	t.position = {
		xScale = position.X.Scale,
		xOffset = position.X.Offset,
		yScale = position.Y.Scale,
		yOffset = position.Y.Offset
	}
	t.stickerSize = p1.stickerSize
	t.rotation = p1.rotation
	t.scale = p1.scale
	t.zIndex = p1.zIndex
	
	return t
end

local function serialize(p1)
	-- upvalues: encodeTextOverlay (ref)
	local edits = p1.edits
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
		userId = p1.userId,
		captureRef = {
			localId = p1.captureRef.localId,
			captureType = p1.captureRef.captureType.Name
		},
		description = p1.description,
		edits = t,
		lastSaveTime = p1.lastSaveTime
	}
end

local function decodeUDim2(p2)
	return if type(p2) == "table" then if type(p2.xScale) == "number" and type(p2.xOffset) == "number" and (type(p2.yScale) == "number" and type(p2.yOffset) == "number") then UDim2.new(p2.xScale, p2.xOffset, p2.yScale, p2.yOffset) else nil else nil
end

local _ = function(p2)
	return if type(p2) == "table" then if type(p2.r) == "number" and type(p2.g) == "number" and type(p2.b) == "number" then Color3.new(p2.r, p2.g, p2.b) else nil else nil
end

local _ = function(p2, p3)
	if type(p3) ~= "string" then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: p2 (ref), p3 (ref)
		return p2[p3]
	end)
	
	return if ok then status else nil
end

local function decodeTextOverlay(p2)
	-- upvalues: decodeUDim2 (ref)
	if type(p2) ~= "table" or type(p2.textOverlayStyle) ~= "table" then
		return nil
	end
	local var1
	local textOverlayStyle = p2.textOverlayStyle
	local var2 = decodeUDim2(p2.position)
	local font = Enum.Font
	local font_1 = textOverlayStyle.font
	
	if type(font_1) == "string" then
		local ok, status = pcall(function()
			-- upvalues: font (ref), font_1 (ref)
			return font[font_1]
		end)
		var1 = if ok then status else nil
	else
		var1 = nil
	end
	local fontColor = textOverlayStyle.fontColor
	local var3 = if type(fontColor) ~= "table" then if type(fontColor.r) == "number" and type(fontColor.g) == "number" and type(fontColor.b) == "number" then Color3.new(fontColor.r, fontColor.g, fontColor.b) else nil else nil
	local textXAlignment = Enum.TextXAlignment
	local textXAlignment_1 = textOverlayStyle.textXAlignment
	
	if type(textXAlignment_1) == "string" then
		local ok, status = pcall(function()
			-- upvalues: textXAlignment (ref), textXAlignment_1 (ref)
			return textXAlignment[textXAlignment_1]
		end)
		fontColor = if ok then status else nil
	else
		fontColor = nil
	end
	return if var2 == nil or var1 == nil or (var3 == nil or fontColor == nil) then nil elseif type(p2.rotation) == "number" and type(p2.scale) == "number" and (type(p2.text) == "string" and type(p2.zIndex) == "number") and type(textOverlayStyle.fontSize) == "number" then {
		position = var2,
		rotation = p2.rotation,
		scale = p2.scale,
		text = p2.text,
		zIndex = p2.zIndex,
		textOverlayStyle = {
			font = var1,
			fontColor = var3,
			fontSize = textOverlayStyle.fontSize,
			textXAlignment = fontColor
		}
	} else nil
end

local function decodeStickerOverlay(p2)
	-- upvalues: decodeUDim2 (ref)
	if type(p2) ~= "table" then
		return nil
	end
	local var1 = decodeUDim2(p2.position)
	
	return if var1 == nil then nil elseif not (p2.stickerURI ~= nil and type(p2.stickerURI) ~= "string") then if type(p2.stickerSize) == "number" and type(p2.rotation) == "number" and (type(p2.scale) == "number" and type(p2.zIndex) == "number") then {
		stickerURI = p2.stickerURI,
		position = var1,
		stickerSize = p2.stickerSize,
		rotation = p2.rotation,
		scale = p2.scale,
		zIndex = p2.zIndex
	} else nil else nil
end

local function decodeTrim(p2)
	return if type(p2) == "table" then if type(p2.startTime) == "number" and type(p2.endTime) == "number" then { startTime = p2.startTime, endTime = p2.endTime } else nil else nil
end

local function decodeMusic(p2)
	return if type(p2) == "table" then if type(p2.assetId) == "number" and type(p2.startTime) == "number" then { assetId = p2.assetId, startTime = p2.startTime } else nil else nil
end

return {
	serialize = serialize,
	deserialize = function(p2)
		-- upvalues: decodeTrim (ref), decodeMusic (ref), decodeTextOverlay (ref), decodeStickerOverlay (ref)
		if type(p2) ~= "table" then
			return nil
		end
		local captureRef = p2.captureRef
		
		if type(captureRef) ~= "table" or type(captureRef.localId) ~= "string" or captureRef.localId == "" then
			return nil
		end
		local var1
		local captureType = Enum.CaptureType
		local captureType_1 = captureRef.captureType
		
		if type(captureType_1) == "string" then
			local ok, status = pcall(function()
				-- upvalues: captureType (ref), captureType_1 (ref)
				return captureType[captureType_1]
			end)
			var1 = if ok then status else nil
		else
			var1 = nil
		end
		if var1 == nil then
			return nil
		end
		local edits = p2.edits
		
		if type(edits) ~= "table" then
			return nil
		end
		local var2
		local t = {}
		
		if edits.trim ~= nil then
			local var3 = decodeTrim(edits.trim)
			
			if var3 == nil then
				return nil
			end
			t.trim = var3
		end
		if edits.music ~= nil then
			local var4 = decodeMusic(edits.music)
			
			if var4 == nil then
				return nil
			end
			t.music = var4
		end
		if edits.text ~= nil then
			if type(edits.text) ~= "table" then
				return nil
			end
			local t_1 = {}
			
			for i, v in edits.text do
				var2 = decodeTextOverlay(v)
				
				if var2 ~= nil then
					table.insert(t_1, var2)
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
				var2 = decodeStickerOverlay(v)
				
				if var2 ~= nil then
					table.insert(t_1, var2)
					continue
				end
				return nil
			end
			t.sticker = t_1
		end
		return if type(p2.userId) == "string" then if not (p2.description ~= nil and type(p2.description) ~= "string") then if type(p2.lastSaveTime) == "number" then {
			userId = p2.userId,
			captureRef = { localId = captureRef.localId, captureType = var1 },
			description = p2.description,
			edits = t,
			lastSaveTime = p2.lastSaveTime
		} else nil else nil else nil
	end
}