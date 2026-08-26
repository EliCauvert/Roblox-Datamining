local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local requests = require(corePackagesService.Workspace.Packages.Http).Requests
local DEPRECATED_ChatSendMessage = requests.DEPRECATED_ChatSendMessage
local DEPRECATED_ChatStartOneToOneConversation = requests.DEPRECATED_ChatStartOneToOneConversation
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local DEPRECATED_ChatSendGameLinkMessage = requests.DEPRECATED_ChatSendGameLinkMessage

return function(p1, p2, p3)
	-- upvalues: playersService (ref), robloxTranslatorModule (ref), DEPRECATED_ChatStartOneToOneConversation (ref), DEPRECATED_ChatSendMessage (ref), DEPRECATED_ChatSendGameLinkMessage (ref)
	local userId = playersService.LocalPlayer.UserId
	local _ = nil
	local var1 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Message.InviteToGameTitle", { PLACENAME = p3.name })
	
	return function(_)
		-- upvalues: DEPRECATED_ChatStartOneToOneConversation (copy), p1 (ref), p2 (ref), userId (ref), DEPRECATED_ChatSendMessage (copy), var1 (write), p3 (ref), DEPRECATED_ChatSendGameLinkMessage (copy)
		return DEPRECATED_ChatStartOneToOneConversation(p1, p2, userId):andThen(function(p4)
			-- upvalues: DEPRECATED_ChatSendMessage (copy), p1 (copy), var1 (copy), p2 (copy), p3 (copy), DEPRECATED_ChatSendGameLinkMessage (copy)
			local conversation = p4.responseBody.conversation
			
			return DEPRECATED_ChatSendMessage(p1, conversation.id, var1, nil, true, p2):andThen(function()
				-- upvalues: conversation (ref), p3 (copy), DEPRECATED_ChatSendGameLinkMessage (copy), p1 (copy), p2 (copy)
				return DEPRECATED_ChatSendGameLinkMessage(p1, conversation.id, p3.universeId, nil, true, p2, p3.universeRootPlaceId):andThen(function(p5)
					-- upvalues: conversation (copy), p3 (copy)
					return {
						resultType = p5.responseBody.resultType,
						conversationId = conversation.id,
						placeId = p3.universeRootPlaceId
					}
				end)
			end)
		end)
	end
end