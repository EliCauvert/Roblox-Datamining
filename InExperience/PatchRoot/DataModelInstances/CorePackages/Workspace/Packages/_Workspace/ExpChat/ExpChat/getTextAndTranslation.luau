local expChat = script:FindFirstAncestor("ExpChat")
local isWhiteSpaceOnlyModule = require(expChat.isWhiteSpaceOnly)
local getFFlagExpChatProtectedChatInternalAPIs = require(expChat.Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs

return function(p0)
	-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref), isWhiteSpaceOnlyModule (ref)
	local var2 = ""
	local var3 = ""
	local var4 = if p0 then if getFFlagExpChatProtectedChatInternalAPIs() then p0.TextInternal else p0.Text else nil
	
	if var4 and not isWhiteSpaceOnlyModule(var4) then
		var2 = var4
		var3 = if getFFlagExpChatProtectedChatInternalAPIs() then p0.TranslationInternal else p0.Translation
	end
	if (if p0 then p0.WasRewritten else false) and p0.RewrittenText and not isWhiteSpaceOnlyModule(p0.RewrittenText) then
		var2 = p0.RewrittenText
		var3 = p0.RewrittenTranslation
	end
	return var2, var3
end