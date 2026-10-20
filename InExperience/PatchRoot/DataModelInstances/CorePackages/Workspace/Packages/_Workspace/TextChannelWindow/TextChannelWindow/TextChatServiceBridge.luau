local Parent = script:FindFirstAncestor("TextChannelWindow").Parent
local TextChannelWindowAnalyticsModule = require(script.Parent.TextChannelWindowAnalytics)
local TextChannelWindowPerfTracker = require(Parent.ChatUIPrimitives).Telemetry.TextChannelWindowPerfTracker
local TextChatServiceIntegrationModule = require(script.Parent.TextChatServiceIntegration)
local _ = require(script.Parent.createChannelMessagesStore)
local IsTextSourceMutedModule = require(script.Parent.isTextSourceMuted)
local GetFFlagExpChatProtectedChatInternalAPIsFunction = require(Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs
local GetFFlagExpChatUseChatMuteStoreModule = require(script.Parent.getFFlagExpChatUseChatMuteStore)

local function getMessageStatus(p1): string
	local Status = p1.Status
	
	return if Status == Enum.TextChatMessageStatus.Success then "success" elseif Status == Enum.TextChatMessageStatus.TextFilterFailed then "filter_failed" elseif Status == Enum.TextChatMessageStatus.Floodchecked then "floodchecked" elseif Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then "invalid_privacy_settings" elseif Status == Enum.TextChatMessageStatus.InvalidTextChannelPermissions then "invalid_permissions" elseif Status == Enum.TextChatMessageStatus.MessageTooLong then "message_too_long" elseif Status == Enum.TextChatMessageStatus.ModerationTimeout then "moderation_timeout" else "unknown"
end

return function(Object, p1, p2)
	-- upvalues: GetFFlagExpChatUseChatMuteStoreModule (copy), IsTextSourceMutedModule (copy), TextChatServiceIntegrationModule (copy), TextChannelWindowPerfTracker (copy), TextChannelWindowAnalyticsModule (copy), getMessageStatus (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy)
	local t = {}
	
	local function connectChannel(TextChannel)
		-- upvalues: t (copy), GetFFlagExpChatUseChatMuteStoreModule (upval), IsTextSourceMutedModule (upval), TextChatServiceIntegrationModule (upval), p1 (copy), p2 (copy), TextChannelWindowPerfTracker (upval), TextChannelWindowAnalyticsModule (upval), getMessageStatus (upval)
		if not t[TextChannel] then
			local IsRBXSystem = TextChannel.Name == "RBXSystem"
			local DestroyingConnections = {
				(TextChannel.MessageReceived:Connect(function(p3)
					-- upvalues: IsRBXSystem (copy), GetFFlagExpChatUseChatMuteStoreModule (upval), IsTextSourceMutedModule (upval), TextChatServiceIntegrationModule (upval), p1 (upval), p2 (upval), TextChannel (copy), TextChannelWindowPerfTracker (upval), TextChannelWindowAnalyticsModule (upval), getMessageStatus (upval)
					if not p3.TextSource and not IsRBXSystem then return end
					if GetFFlagExpChatUseChatMuteStoreModule() and p3.TextSource and IsTextSourceMutedModule(p3.TextSource) then return end
					local MapTextChatMessageResult = TextChatServiceIntegrationModule.mapTextChatMessage(p3, p1)
					
					if MapTextChatMessageResult.content == "" then
						p2.removeMessage(TextChannel, MapTextChatMessageResult.messageId)
					else
						p2.upsertMessage(TextChannel, MapTextChatMessageResult)
					end
					if p3.TextSource and tostring(p3.TextSource.UserId) ~= p1 then
						TextChannelWindowPerfTracker.startReceiveInterval(p3.MessageId, TextChannel.Name)
					end
					TextChannelWindowAnalyticsModule.emit(TextChannelWindowAnalyticsModule.Counters.MessageReceived, {
						status = getMessageStatus(p3),
						target_text_channel_category = TextChannelWindowAnalyticsModule.getChannelCategory(TextChannel.Name)
					})
				end))
			}
			t[TextChannel] = DestroyingConnections
			table.insert(DestroyingConnections, TextChannel.Destroying:Connect(function()
				-- upvalues: DestroyingConnections (copy), t (upval), TextChannel (copy)
				for _, destroyingConnection in DestroyingConnections do
					destroyingConnection:Disconnect()
				end
				t[TextChannel] = nil
			end))
			TextChannel.ChildRemoved:Connect(function(Child)
				-- upvalues: p1 (upval), p2 (upval), TextChannel (copy)
				if Child:IsA("TextSource") and tostring(Child.UserId) == p1 then
					p2.clearChannel(TextChannel)
				end
			end)
			
			return
		end
	end
	
	Object.SendingMessage:Connect(function(TextChatMessage)
		-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), TextChannelWindowPerfTracker (upval), TextChatServiceIntegrationModule (upval), p1 (copy), p2 (copy)
		if not TextChatMessage.TextSource then return end
		if (if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TextInternal else TextChatMessage.Text) == "" then return end
		local TextChannel = TextChatMessage.TextChannel
		
		if TextChannel then
			TextChannelWindowPerfTracker.startSendInterval(TextChatMessage.MessageId, TextChannel.Name)
			p2.insertIfAbsent(TextChannel, (TextChatServiceIntegrationModule.mapSendingMessage(TextChatMessage, p1)))
			
			return
		end
	end)
	
	for _, TextChannel in Object:GetDescendants() do
		if TextChannel:IsA("TextChannel") then
			connectChannel(TextChannel)
		end
	end
	Object.DescendantAdded:Connect(function(Descendant)
		-- upvalues: connectChannel (copy)
		if Descendant:IsA("TextChannel") then
			connectChannel(Descendant)
		end
	end)
	Object.DescendantRemoving:Connect(function(Descendant)
		-- upvalues: p2 (copy)
		if Descendant:IsA("TextChannel") then
			p2.removeChannelEntry(Descendant)
		end
	end)
end