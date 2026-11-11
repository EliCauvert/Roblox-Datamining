local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local Requests = require(CorePackages.Workspace.Packages.Http).Requests
local DEPRECATEDChatSendMessageFunction = Requests.DEPRECATED_ChatSendMessage
local DEPRECATEDChatStartOneToOneConversationFunction = Requests.DEPRECATED_ChatStartOneToOneConversation
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local DEPRECATEDChatSendGameLinkMessageFunction = Requests.DEPRECATED_ChatSendGameLinkMessage

return function(p1, p2, p3)
	-- upvalues: Players (copy), RobloxTranslatorModule (copy), DEPRECATEDChatStartOneToOneConversationFunction (copy), DEPRECATEDChatSendMessageFunction (copy), DEPRECATEDChatSendGameLinkMessageFunction (copy)
	local UserId = Players.LocalPlayer.UserId
	local FeatureSettingsHubMessageInviteToGameTitle = nil
	FeatureSettingsHubMessageInviteToGameTitle = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.Message.InviteToGameTitle", { PLACENAME = p3.name })
	
	return function(_)
		-- upvalues: DEPRECATEDChatStartOneToOneConversationFunction (upval), p1 (copy), p2 (copy), UserId (copy), DEPRECATEDChatSendMessageFunction (upval), FeatureSettingsHubMessageInviteToGameTitle (ref), p3 (copy), DEPRECATEDChatSendGameLinkMessageFunction (upval)
		return DEPRECATEDChatStartOneToOneConversationFunction(p1, p2, UserId):andThen(function(Result)
			-- upvalues: DEPRECATEDChatSendMessageFunction (upval), p1 (upval), FeatureSettingsHubMessageInviteToGameTitle (upval), p2 (upval), p3 (upval), DEPRECATEDChatSendGameLinkMessageFunction (upval)
			local Conversation = Result.responseBody.conversation
			
			return DEPRECATEDChatSendMessageFunction(p1, Conversation.id, FeatureSettingsHubMessageInviteToGameTitle, nil, true, p2):andThen(function()
				-- upvalues: Conversation (copy), p3 (upval), DEPRECATEDChatSendGameLinkMessageFunction (upval), p1 (upval), p2 (upval)
				return DEPRECATEDChatSendGameLinkMessageFunction(p1, Conversation.id, p3.universeId, nil, true, p2, p3.universeRootPlaceId):andThen(function(Result)
					-- upvalues: Conversation (upval), p3 (upval)
					return {
						resultType = Result.responseBody.resultType,
						conversationId = Conversation.id,
						placeId = p3.universeRootPlaceId
					}
				end)
			end)
		end)
	end
end