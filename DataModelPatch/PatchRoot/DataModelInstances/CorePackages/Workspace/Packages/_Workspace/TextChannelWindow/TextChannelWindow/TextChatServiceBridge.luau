local TextChatServiceIntegrationModule = require(script.Parent.TextChatServiceIntegration)
local _ = require(script.Parent.createChannelMessagesStore)
local IsTextSourceMutedModule = require(script.Parent.isTextSourceMuted)
local GetFFlagExpChatProtectedChatInternalAPIsFunction = require(script:FindFirstAncestor("TextChannelWindow").Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local GetFFlagExpChatUseChatMuteStoreModule = require(script.Parent.getFFlagExpChatUseChatMuteStore)

return function(Object, p1, p2)
	-- upvalues: GetFFlagExpChatUseChatMuteStoreModule (copy), IsTextSourceMutedModule (copy), TextChatServiceIntegrationModule (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy)
	local function _(TextChannel)
		-- upvalues: GetFFlagExpChatUseChatMuteStoreModule (upval), IsTextSourceMutedModule (upval), TextChatServiceIntegrationModule (upval), p1 (copy), p2 (copy)
		local IsRBXSystem = TextChannel.Name == "RBXSystem"
		TextChannel.MessageReceived:Connect(function(IncomingMessage)
			-- upvalues: IsRBXSystem (copy), GetFFlagExpChatUseChatMuteStoreModule (upval), IsTextSourceMutedModule (upval), TextChatServiceIntegrationModule (upval), p1 (upval), p2 (upval), TextChannel (copy)
			if not IncomingMessage.TextSource and not IsRBXSystem then return end
			if GetFFlagExpChatUseChatMuteStoreModule() and IncomingMessage.TextSource and IsTextSourceMutedModule(IncomingMessage.TextSource) then return end
			local MapTextChatMessageResult = TextChatServiceIntegrationModule.mapTextChatMessage(IncomingMessage, p1)
			
			if MapTextChatMessageResult.content == "" then
				p2.removeMessage(TextChannel, MapTextChatMessageResult.messageId)
				
				return
			else
				p2.upsertMessage(TextChannel, MapTextChatMessageResult)
			end
		end)
	end
	
	Object.SendingMessage:Connect(function(TextChatMessage)
		-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), TextChatServiceIntegrationModule (upval), p1 (copy), p2 (copy)
		if not TextChatMessage.TextSource then return end
		if (if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TextInternal else TextChatMessage.Text) == "" then return end
		local TextChannel = TextChatMessage.TextChannel
		
		if TextChannel then
			p2.insertIfAbsent(TextChannel, (TextChatServiceIntegrationModule.mapSendingMessage(TextChatMessage, p1)))
			
			return
		end
	end)
	
	for _, TextChannel in Object:GetDescendants() do
		if TextChannel:IsA("TextChannel") then
			local IsRBXSystem = TextChannel.Name == "RBXSystem"
			TextChannel.MessageReceived:Connect(function(IncomingMessage)
				-- upvalues: IsRBXSystem (copy), GetFFlagExpChatUseChatMuteStoreModule (upval), IsTextSourceMutedModule (upval), TextChatServiceIntegrationModule (upval), p1 (copy), p2 (copy), TextChannel (copy)
				if not IncomingMessage.TextSource and not IsRBXSystem then return end
				if GetFFlagExpChatUseChatMuteStoreModule() and IncomingMessage.TextSource and IsTextSourceMutedModule(IncomingMessage.TextSource) then return end
				local MapTextChatMessageResult = TextChatServiceIntegrationModule.mapTextChatMessage(IncomingMessage, p1)
				
				if MapTextChatMessageResult.content == "" then
					p2.removeMessage(TextChannel, MapTextChatMessageResult.messageId)
					
					return
				else
					p2.upsertMessage(TextChannel, MapTextChatMessageResult)
				end
			end)
		end
	end
	Object.DescendantAdded:Connect(function(Descendant)
		-- upvalues: GetFFlagExpChatUseChatMuteStoreModule (upval), IsTextSourceMutedModule (upval), TextChatServiceIntegrationModule (upval), p1 (copy), p2 (copy)
		if Descendant:IsA("TextChannel") then
			local IsRBXSystem = Descendant.Name == "RBXSystem"
			Descendant.MessageReceived:Connect(function(IncomingMessage)
				-- upvalues: IsRBXSystem (copy), GetFFlagExpChatUseChatMuteStoreModule (upval), IsTextSourceMutedModule (upval), TextChatServiceIntegrationModule (upval), p1 (upval), p2 (upval), Descendant (copy)
				if not IncomingMessage.TextSource and not IsRBXSystem then return end
				if GetFFlagExpChatUseChatMuteStoreModule() and IncomingMessage.TextSource and IsTextSourceMutedModule(IncomingMessage.TextSource) then return end
				local MapTextChatMessageResult = TextChatServiceIntegrationModule.mapTextChatMessage(IncomingMessage, p1)
				
				if MapTextChatMessageResult.content == "" then
					p2.removeMessage(Descendant, MapTextChatMessageResult.messageId)
					
					return
				else
					p2.upsertMessage(Descendant, MapTextChatMessageResult)
				end
			end)
		end
	end)
end