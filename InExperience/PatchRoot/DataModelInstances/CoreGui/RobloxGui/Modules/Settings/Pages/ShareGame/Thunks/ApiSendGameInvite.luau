local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local requests = require(corePackagesService.Workspace.Packages.Http).Requests
local DEPRECATED_ChatSendMessage = requests.DEPRECATED_ChatSendMessage
local DEPRECATED_ChatStartOneToOneConversation = requests.DEPRECATED_ChatStartOneToOneConversation
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local DEPRECATED_ChatSendGameLinkMessage = requests.DEPRECATED_ChatSendGameLinkMessage

return function(p0, p1, p2)
	-- upvalues: playersService (ref), robloxTranslatorModule (ref), DEPRECATED_ChatStartOneToOneConversation (ref), DEPRECATED_ChatSendMessage (ref), DEPRECATED_ChatSendGameLinkMessage (ref)
	local userId = playersService.LocalPlayer.UserId
	local _ = nil
	local var3 = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.Message.InviteToGameTitle", { PLACENAME = p2.name })
	
	return function(_)
		-- upvalues: DEPRECATED_ChatStartOneToOneConversation (copy), p0 (ref), p1 (ref), userId (ref), DEPRECATED_ChatSendMessage (copy), var3 (write), p2 (ref), DEPRECATED_ChatSendGameLinkMessage (copy)
		return DEPRECATED_ChatStartOneToOneConversation(p0, p1, userId):andThen(function(p3)
			-- upvalues: DEPRECATED_ChatSendMessage (copy), p0 (copy), var3 (copy), p1 (copy), p2 (copy), DEPRECATED_ChatSendGameLinkMessage (copy)
			local conversation = p3.responseBody.conversation
			
			return DEPRECATED_ChatSendMessage(p0, conversation.id, var3, nil, true, p1):andThen(function()
				-- upvalues: conversation (ref), p2 (copy), DEPRECATED_ChatSendGameLinkMessage (copy), p0 (copy), p1 (copy)
				return DEPRECATED_ChatSendGameLinkMessage(p0, conversation.id, p2.universeId, nil, true, p1, p2.universeRootPlaceId):andThen(function(p4)
					-- upvalues: conversation (copy), p2 (copy)
					return {
						resultType = p4.responseBody.resultType,
						conversationId = conversation.id,
						placeId = p2.universeRootPlaceId
					}
				end)
			end)
		end)
	end
end