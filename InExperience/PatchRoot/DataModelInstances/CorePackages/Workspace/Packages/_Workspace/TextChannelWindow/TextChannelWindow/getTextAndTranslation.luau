local getFFlagExpChatProtectedChatInternalAPIs = require(script.Parent.Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local isWhitespaceOnlyModule = require(script.Parent.isWhitespaceOnly)

return function(p1)
	-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref), isWhitespaceOnlyModule (ref)
	local var1 = if getFFlagExpChatProtectedChatInternalAPIs() then p1.TextInternal else p1.Text
	local var2 = if getFFlagExpChatProtectedChatInternalAPIs() then p1.TranslationInternal else p1.Translation
	
	if not var1 or isWhitespaceOnlyModule(var1) then
		var1 = ""
	end
	if p1.WasRewritten and p1.RewrittenText and not isWhitespaceOnlyModule(p1.RewrittenText) then
		local rewrittenTranslation = p1.RewrittenTranslation
		local rewrittenText = p1.RewrittenText
		
		if rewrittenTranslation and rewrittenTranslation ~= "" then
			return rewrittenText, rewrittenTranslation
		end
		return rewrittenText, nil
	elseif var2 and var2 ~= "" then
		return var1, var2
	end
	return var1, nil
end