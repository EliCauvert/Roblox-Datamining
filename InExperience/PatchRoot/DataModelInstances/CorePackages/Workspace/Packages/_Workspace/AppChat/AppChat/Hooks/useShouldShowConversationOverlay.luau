local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local conversationOverlay = require(parent.AppChatNetworking).Constants.ConversationOverlay
local loggerModule = require(appChat.Logger)
local getDeepValue2Module = require(appChat.Utils.getDeepValue2)
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local fFlagAppChatEnableDoubleOptIn = require(parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local t = {
	[conversationOverlay.TrustedConnectionCreated] = true,
	[conversationOverlay.AddTrustedConnectionU18] = fFlagAppChatEnableDoubleOptIn,
	[conversationOverlay.TrustedConnectionRequestU18] = fFlagAppChatEnableDoubleOptIn
}

return function(p0) --[[ line: 20 ]]
	-- upvalues: useSelector (ref), getDeepValue2Module (ref), t (ref), conversationOverlay (ref), loggerModule (ref)
	local var4 = useSelector(function(p1) --[[ line: 21 ]]
		-- upvalues: getDeepValue2Module (copy), p0 (ref)
		return getDeepValue2Module(p1, `ChatAppReducer.Modals.conversationOverlays.{p0}.modal_variant`) or ""
	end)
	local var5 = t[var4]
	
	if not var5 and var4 ~= conversationOverlay.None and var4 ~= "" then
		loggerModule:warning(`Unsupported ConversationOverlay modal variant: {var4} for conversationId: {p0}`)
	end
	return not not var5
end