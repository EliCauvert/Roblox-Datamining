local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ConversationOverlay = require(Parent.AppChatNetworking).Constants.ConversationOverlay
local LoggerModule = require(AppChat.Logger)
local GetDeepValue2Module = require(AppChat.Utils.getDeepValue2)
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local FFlagAppChatEnableDoubleOptIn = require(Parent.SharedFlags).FFlagAppChatEnableDoubleOptIn
local config = {
	[ConversationOverlay.TrustedConnectionCreated] = true,
	[ConversationOverlay.AddTrustedConnectionU18] = FFlagAppChatEnableDoubleOptIn,
	[ConversationOverlay.TrustedConnectionRequestU18] = FFlagAppChatEnableDoubleOptIn
}

return function(p1): boolean
	-- upvalues: UseSelectorFunction (copy), GetDeepValue2Module (copy), config (copy), ConversationOverlay (copy), LoggerModule (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: GetDeepValue2Module (upval), p1 (copy)
		return GetDeepValue2Module(p2, `ChatAppReducer.Modals.conversationOverlays.{p1}.modal_variant`) or ""
	end)
	local Entry = config[UseSelectorResult]
	
	if not Entry and UseSelectorResult ~= ConversationOverlay.None and UseSelectorResult ~= "" then
		LoggerModule:warning(`Unsupported ConversationOverlay modal variant: {UseSelectorResult} for conversationId: {p1}`)
	end
	return not not Entry
end