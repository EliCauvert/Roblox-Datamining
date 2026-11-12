local HttpService = game:GetService("HttpService")
local AppChatNetworking = script:FindFirstAncestor("AppChatNetworking")
local CHATPLATFORMBASEURLModule = require(AppChatNetworking.url.CHAT_PLATFORM_BASE_URL)
local Default = require(AppChatNetworking.url.HttpRequest).default
local GetFFlagEnableSocialCardsFunction = require(AppChatNetworking.Parent.SharedFlags).GetFFlagEnableSocialCards

return function(p1, Conversation_id, List, p2)
	-- upvalues: Default (copy), HttpService (copy), GetFFlagEnableSocialCardsFunction (copy), CHATPLATFORMBASEURLModule (copy)
	local Callback = p1 or Default
	local Messages = {}
	
	for _, Message_id in List do
		table.insert(Messages, {
			conversation_id = Conversation_id,
			message_id = Message_id
		})
	end
	return Callback(`{CHATPLATFORMBASEURLModule}/v1/get-messages`, "POST", {
		postBody = HttpService:JSONEncode({
			messages = Messages,
			include_reactions = if p2 and p2.include_reactions then true else false,
			include_cards = if GetFFlagEnableSocialCardsFunction() then true else false
		})
	})
end