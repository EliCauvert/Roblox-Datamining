local getFFlagExpChatProtectedChatInternalAPIs = require(script.Parent.Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local isWhitespaceOnlyModule = require(script.Parent.isWhitespaceOnly)

return function(p0) --[[ line: 5 | named "getTextAndTranslation" ]]
	-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref), isWhitespaceOnlyModule (ref)
	local var1 = if getFFlagExpChatProtectedChatInternalAPIs() then p0.TextInternal else p0.Text
	local var2 = if getFFlagExpChatProtectedChatInternalAPIs() then p0.TranslationInternal else p0.Translation
	
	if not var1 or isWhitespaceOnlyModule(var1) then
		var1 = ""
	end
	if p0.WasRewritten and p0.RewrittenText and not isWhitespaceOnlyModule(p0.RewrittenText) then
		local rewrittenTranslation = p0.RewrittenTranslation
		local rewrittenText = p0.RewrittenText
		
		if rewrittenTranslation and rewrittenTranslation ~= "" then
			return rewrittenText, rewrittenTranslation
		end
		return rewrittenText, nil
	elseif var2 and var2 ~= "" then
		return var1, var2
	end
	return var1, nil
end