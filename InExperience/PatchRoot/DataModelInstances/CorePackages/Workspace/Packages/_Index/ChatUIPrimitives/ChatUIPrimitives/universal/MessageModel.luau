local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.Types)
local PlainTextContentModelModule = require(script.Parent.ContentKinds.PlainText.PlainTextContentModel)
local PresetContentModelModule = require(script.Parent.ContentKinds.Preset.PresetContentModel)
local EmojiContentModelModule = require(script.Parent.ContentKinds.Emoji.EmojiContentModel)

local function _(p1)
	-- upvalues: HttpService (copy)
	return p1 and p1.id or HttpService:GenerateGUID(false)
end

local function previewText(p1)
	-- upvalues: PlainTextContentModelModule (copy), PresetContentModelModule (copy), EmojiContentModelModule (copy)
	local Content = p1.contents[1]
	
	if Content == nil then
		return ""
	end
	local Detail = PlainTextContentModelModule.getDetail(Content)
	
	if Detail ~= nil then
		return Detail.fallbackText
	end
	local Detail1 = PresetContentModelModule.getDetail(Content)
	
	if Detail1 == nil then
		local Detail2 = EmojiContentModelModule.getDetail(Content)
		
		return if Detail2 == nil then "" else EmojiContentModelModule.getDisplayText(Detail2)
	else
		return Detail1.fallbackText
	end
end

return {
	fromPlainText = function(p1, p2)
		-- upvalues: HttpService (copy), PlainTextContentModelModule (copy)
		return {
			id = p2 and p2.id or HttpService:GenerateGUID(false),
			sentAtUnixMilliseconds = p2 and p2.sentAtUnixMilliseconds or DateTime.now().UnixTimestampMillis,
			author = if p2 then p2.author else nil,
			contents = { PlainTextContentModelModule.fromText(p1) }
		}
	end,
	fromPreset = function(p1, p2, PresetVersion)
		-- upvalues: HttpService (copy), PresetContentModelModule (copy)
		return {
			id = PresetVersion and PresetVersion.id or HttpService:GenerateGUID(false),
			sentAtUnixMilliseconds = PresetVersion and PresetVersion.sentAtUnixMilliseconds or DateTime.now().UnixTimestampMillis,
			author = if PresetVersion then PresetVersion.author else nil,
			contents = {
				PresetContentModelModule.fromPreset(p1, p2, if PresetVersion then PresetVersion.presetVersion else nil)
			}
		}
	end,
	fromEmoji = function(p1, p2, Name)
		-- upvalues: HttpService (copy), EmojiContentModelModule (copy)
		return {
			id = Name and Name.id or HttpService:GenerateGUID(false),
			sentAtUnixMilliseconds = Name and Name.sentAtUnixMilliseconds or DateTime.now().UnixTimestampMillis,
			author = if Name then Name.author else nil,
			contents = {
				EmojiContentModelModule.fromEmoji(p1, p2, if Name then Name.name else nil)
			}
		}
	end,
	replyReference = function(p1, Label)
		-- upvalues: previewText (copy)
		return {
			id = p1.id,
			preview = { author = p1.author, fallbackText = previewText(p1) },
			label = Label
		}
	end
}