local ExpChat = script:FindFirstAncestor("ExpChat")
local IsWhiteSpaceOnlyModule = require(ExpChat.isWhiteSpaceOnly)
local GetFFlagExpChatProtectedChatInternalAPIsFunction = require(ExpChat.Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs

return function(TextChatMessage)
	-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), IsWhiteSpaceOnlyModule (copy)
	local RewrittenText = ""
	local RewrittenTranslation = ""
	local TextInternal = if TextChatMessage then if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TextInternal else TextChatMessage.Text else nil
	
	if TextInternal and not IsWhiteSpaceOnlyModule(TextInternal) then
		RewrittenText = TextInternal
		RewrittenTranslation = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TranslationInternal else TextChatMessage.Translation
	end
	if (if TextChatMessage then TextChatMessage.WasRewritten else false) and TextChatMessage.RewrittenText and not IsWhiteSpaceOnlyModule(TextChatMessage.RewrittenText) then
		RewrittenText = TextChatMessage.RewrittenText
		RewrittenTranslation = TextChatMessage.RewrittenTranslation
	end
	return RewrittenText, RewrittenTranslation
end