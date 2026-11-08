local TextChannelWindow = script:FindFirstAncestor("TextChannelWindow")
local Parent = TextChannelWindow.Parent
local MessageDraftModelModule = require(Parent.ChatUIPrimitives.MessageDraftModel)
local _ = require(Parent.ChatUIPrimitives.MessageComposer)
local LoggerModule = require(TextChannelWindow.Logger)
local SendEmojiExpressionModule = require(script.Parent.sendEmojiExpression)
local SendPresetExpressionModule = require(script.Parent.sendPresetExpression)

return function(p1, p2, p3, Callback: (any) -> ())
	-- upvalues: MessageDraftModelModule (copy), SendPresetExpressionModule (copy), SendEmojiExpressionModule (copy), LoggerModule (copy)
	local Preset = MessageDraftModelModule.toPreset(p1)
	
	if Preset ~= nil then
		SendPresetExpressionModule(Preset.presetId, p2)
		
		return
	end
	local Emoji = MessageDraftModelModule.toEmoji(p1)
	
	if Emoji ~= nil then
		SendEmojiExpressionModule(Emoji.unicode, p2, p3)
		
		return
	end
	local PlainText = MessageDraftModelModule.toPlainText(p1)
	
	if PlainText == nil then
		LoggerModule:warning("Draft not sent: unsupported content kind")
		
		return
	else
		Callback(PlainText)
	end
end