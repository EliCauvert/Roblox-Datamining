local HttpService = game:GetService("HttpService")
local _ = require(script.Parent.Types)
local PlainTextContentModelModule = require(script.Parent.ContentKinds.PlainText.PlainTextContentModel)
local PresetContentModelModule = require(script.Parent.ContentKinds.Preset.PresetContentModel)
local EmojiContentModelModule = require(script.Parent.ContentKinds.Emoji.EmojiContentModel)

return {
	fromPlainText = function(p1, p2)
		-- upvalues: HttpService (copy), PlainTextContentModelModule (copy)
		return {
			id = HttpService:GenerateGUID(false),
			sentAtUnixMilliseconds = p2 and p2.sentAtUnixMilliseconds or DateTime.now().UnixTimestampMillis,
			author = if p2 then p2.author else nil,
			contents = { PlainTextContentModelModule.fromText(p1) }
		}
	end,
	fromPreset = function(p1, p2, PresetVersion)
		-- upvalues: HttpService (copy), PresetContentModelModule (copy)
		return {
			id = HttpService:GenerateGUID(false),
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
			id = HttpService:GenerateGUID(false),
			sentAtUnixMilliseconds = Name and Name.sentAtUnixMilliseconds or DateTime.now().UnixTimestampMillis,
			author = if Name then Name.author else nil,
			contents = {
				EmojiContentModelModule.fromEmoji(p1, p2, if Name then Name.name else nil)
			}
		}
	end
}