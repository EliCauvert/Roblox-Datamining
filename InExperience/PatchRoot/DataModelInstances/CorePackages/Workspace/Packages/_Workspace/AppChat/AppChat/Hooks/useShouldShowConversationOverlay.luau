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

return function(p1)
	-- upvalues: useSelector (ref), getDeepValue2Module (ref), t (ref), conversationOverlay (ref), loggerModule (ref)
	local var1 = useSelector(function(p2)
		-- upvalues: getDeepValue2Module (copy), p1 (ref)
		return getDeepValue2Module(p2, `ChatAppReducer.Modals.conversationOverlays.{p1}.modal_variant`) or ""
	end)
	local var2 = t[var1]
	
	if not var2 and var1 ~= conversationOverlay.None and var1 ~= "" then
		loggerModule:warning(`Unsupported ConversationOverlay modal variant: {var1} for conversationId: {p1}`)
	end
	return not not var2
end