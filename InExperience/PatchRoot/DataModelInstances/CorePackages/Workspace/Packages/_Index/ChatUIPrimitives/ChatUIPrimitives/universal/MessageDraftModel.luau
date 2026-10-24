local _ = require(script.Parent.Types)
local PlainTextContentModelModule = require(script.Parent.ContentKinds.PlainText.PlainTextContentModel)
local PlainTextTypesModule = require(script.Parent.ContentKinds.PlainText.PlainTextTypes)
local PresetContentModelModule = require(script.Parent.ContentKinds.Preset.PresetContentModel)
local PresetTypesModule = require(script.Parent.ContentKinds.Preset.PresetTypes)
local EmojiTypesModule = require(script.Parent.ContentKinds.Emoji.EmojiTypes)
local EmojiContentModelModule = require(script.Parent.ContentKinds.Emoji.EmojiContentModel)

local function _(p1)
	if typeof(p1) ~= "table" then
		return nil
	end
	local Contents = p1.contents
	
	if typeof(Contents) == "table" and #Contents == 1 then
		local Content = Contents[1]
		
		return if typeof(Content) == "table" then Content else nil
	else
		return nil
	end
end

local _ = function(List, p1)
	local Entry = List[p1]
	
	if Entry == nil then
		return nil
	end
	for i in List do
		if i ~= p1 then
			return nil
		end
	end
	return Entry
end

local _ = function(p2): boolean
	-- upvalues: PlainTextTypesModule (copy)
	return PlainTextTypesModule.isValidDraft(p2) == true
end

local _ = function(p2): boolean
	-- upvalues: PresetTypesModule (copy)
	return PresetTypesModule.isValidDraft(p2) == true
end

local _ = function(p2): boolean
	-- upvalues: EmojiTypesModule (copy)
	return EmojiTypesModule.isValidDraft(p2) == true
end

return {
	fromPlainText = function(p2)
		-- upvalues: PlainTextContentModelModule (copy)
		return {
			contents = { PlainTextContentModelModule.draftFromText(p2) }
		}
	end,
	fromPreset = function(p2, p3)
		-- upvalues: PresetContentModelModule (copy)
		return {
			contents = { PresetContentModelModule.draftFromPreset(p2, p3) }
		}
	end,
	toPlainText = function(p2)
		-- upvalues: PlainTextTypesModule (copy)
		local v1 = nil
		if typeof(p2) == "table" then
			local Contents = p2.contents
			
			if typeof(Contents) == "table" and #Contents == 1 then
				local Content = Contents[1]
				v1 = if typeof(Content) == "table" then Content else nil
			else
				v1 = nil
			end
		else
			v1 = nil
		end
		if v1 == nil then
			return nil
		end
		local PlainText = v1.plainText
		local v2 = nil
		
		if PlainText == nil then
			v2 = nil
		else
			for i in v1 do
				if i ~= "plainText" then
					v2 = nil
				else
					continue
				end
			end
			v2 = PlainText
		end
		return if PlainTextTypesModule.isValidDraft(v2) == true then v2.text else nil
	end,
	toPreset = function(p3)
		-- upvalues: PresetTypesModule (copy)
		local v3 = nil
		if typeof(p3) == "table" then
			local Contents = p3.contents
			
			if typeof(Contents) == "table" and #Contents == 1 then
				local Content = Contents[1]
				v3 = if typeof(Content) == "table" then Content else nil
			else
				v3 = nil
			end
		else
			v3 = nil
		end
		if v3 == nil then
			return nil
		end
		local Preset = v3.preset
		local v4 = nil
		
		if Preset == nil then
			v4 = nil
		else
			for i in v3 do
				if i ~= "preset" then
					v4 = nil
				else
					continue
				end
			end
			v4 = Preset
		end
		return if PresetTypesModule.isValidDraft(v4) == true then v4 else nil
	end,
	fromEmoji = function(p4, p5)
		-- upvalues: EmojiContentModelModule (copy)
		return {
			contents = { EmojiContentModelModule.draftFromEmoji(p4, p5) }
		}
	end,
	toEmoji = function(p4)
		-- upvalues: EmojiTypesModule (copy)
		local v5 = nil
		if typeof(p4) == "table" then
			local Contents = p4.contents
			
			if typeof(Contents) == "table" and #Contents == 1 then
				local Content = Contents[1]
				v5 = if typeof(Content) == "table" then Content else nil
			else
				v5 = nil
			end
		else
			v5 = nil
		end
		if v5 == nil then
			return nil
		end
		local Emoji = v5.emoji
		local v6 = nil
		
		if Emoji == nil then
			v6 = nil
		else
			for i in v5 do
				if i ~= "emoji" then
					v6 = nil
				else
					continue
				end
			end
			v6 = Emoji
		end
		return if EmojiTypesModule.isValidDraft(v6) == true then v6 else nil
	end
}