local GetFFlagExpChatProtectedChatInternalAPIsFunction = require(script.Parent.Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local IsWhitespaceOnlyModule = require(script.Parent.isWhitespaceOnly)

return function(TextChatMessage)
	-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), IsWhitespaceOnlyModule (copy)
	local TextInternal = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TextInternal else TextChatMessage.Text
	local TranslationInternal = if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TranslationInternal else TextChatMessage.Translation
	
	if not TextInternal or IsWhitespaceOnlyModule(TextInternal) then
		TextInternal = ""
	end
	if TextChatMessage.WasRewritten and TextChatMessage.RewrittenText and not IsWhitespaceOnlyModule(TextChatMessage.RewrittenText) then
		local RewrittenTranslation = TextChatMessage.RewrittenTranslation
		local RewrittenText = TextChatMessage.RewrittenText
		
		if RewrittenTranslation and RewrittenTranslation ~= "" then
			return RewrittenText, RewrittenTranslation
		else
			return RewrittenText, nil
		end
	else
		local TextInternal1: string = TextInternal
		
		if TranslationInternal and TranslationInternal ~= "" then
			return TextInternal1, TranslationInternal
		else
			return TextInternal1, nil
		end
	end
end