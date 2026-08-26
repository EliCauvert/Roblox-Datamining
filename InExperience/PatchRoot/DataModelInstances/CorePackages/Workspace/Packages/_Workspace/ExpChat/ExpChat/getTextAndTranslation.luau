local expChat = script:FindFirstAncestor("ExpChat")
local isWhiteSpaceOnlyModule = require(expChat.isWhiteSpaceOnly)
local getFFlagExpChatProtectedChatInternalAPIs = require(expChat.Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs

return function(p1)
	-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref), isWhiteSpaceOnlyModule (ref)
	local var1 = ""
	local var2 = ""
	local var3 = if p1 then if getFFlagExpChatProtectedChatInternalAPIs() then p1.TextInternal else p1.Text else nil
	
	if var3 and not isWhiteSpaceOnlyModule(var3) then
		var1 = var3
		var2 = if getFFlagExpChatProtectedChatInternalAPIs() then p1.TranslationInternal else p1.Translation
	end
	if (if p1 then p1.WasRewritten else false) and p1.RewrittenText and not isWhiteSpaceOnlyModule(p1.RewrittenText) then
		var1 = p1.RewrittenText
		var2 = p1.RewrittenTranslation
	end
	return var1, var2
end