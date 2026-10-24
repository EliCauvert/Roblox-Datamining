local TextChatService = game:GetService("TextChatService")
local ExpChat = script:FindFirstAncestor("ExpChat")
local ConfigModule = require(ExpChat.Config)
local GetPresetIconRichTextFunction = require(ExpChat.Parent.ExpChatShared).getPresetIconRichText

local function _()
	-- upvalues: TextChatService (copy), ConfigModule (copy)
	local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
	
	return if ChatWindowConfiguration then ChatWindowConfiguration.TextSize else ConfigModule.ChatWindowTextSize
end

return function(p1, TextSize): string
	-- upvalues: GetPresetIconRichTextFunction (copy), TextChatService (copy), ConfigModule (copy)
	local v1 = "%* %*"
	local TextSize1 = TextSize
	
	if not TextSize1 then
		local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		TextSize1 = if ChatWindowConfiguration then ChatWindowConfiguration.TextSize else ConfigModule.ChatWindowTextSize
	end
	return (v1:format(GetPresetIconRichTextFunction(TextSize1), p1))
end