local Parent = script:FindFirstAncestor("TextChannelWindow").Parent
local SharedFlagsModule = require(Parent.SharedFlags)
local MessageModule = require(script.Parent.Message)
local TextChannelWindowAnalyticsModule = require(script.Parent.TextChannelWindowAnalytics)
local TextChannelWindowPerfTracker = require(Parent.ChatUIPrimitives).Telemetry.TextChannelWindowPerfTracker
local TextChatServiceIntegrationModule = require(script.Parent.TextChatServiceIntegration)
local _ = require(script.Parent.createChannelMessagesStore)
local IsTextSourceMutedModule = require(script.Parent.isTextSourceMuted)
local ConnectHistoryReplayModule = require(script.Parent.connectHistoryReplay)
local FFlagExpChatTextChannelWindowHistoryReplayModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowHistoryReplay)
local GetFFlagExpChatProtectedChatInternalAPIsFunction = SharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local GetFFlagExpChatUseChatMuteStoreModule = require(script.Parent.getFFlagExpChatUseChatMuteStore)

local function getMessageStatus(p1): string
	local Status = p1.Status
	
	return if Status == Enum.TextChatMessageStatus.Success then "success" elseif Status == Enum.TextChatMessageStatus.TextFilterFailed then "filter_failed" elseif Status == Enum.TextChatMessageStatus.Floodchecked then "floodchecked" elseif Status == Enum.TextChatMessageStatus.InvalidPrivacySettings then "invalid_privacy_settings" elseif Status == Enum.TextChatMessageStatus.InvalidTextChannelPermissions then "invalid_permissions" elseif Status == Enum.TextChatMessageStatus.MessageTooLong then "message_too_long" elseif Status == Enum.TextChatMessageStatus.ModerationTimeout then "moderation_timeout" else "unknown"
end

return function(Service, p1, p2, p3)
	-- upvalues: GetFFlagExpChatUseChatMuteStoreModule (copy), IsTextSourceMutedModule (copy), TextChatServiceIntegrationModule (copy), TextChannelWindowPerfTracker (copy), TextChannelWindowAnalyticsModule (copy), getMessageStatus (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), FFlagExpChatTextChannelWindowHistoryReplayModule (copy), ConnectHistoryReplayModule (copy), MessageModule (copy)
	local t = {}
	
	local function connectChannel(TextChannel)
		-- upvalues: t (copy), GetFFlagExpChatUseChatMuteStoreModule (upval), IsTextSourceMutedModule (upval), TextChatServiceIntegrationModule (upval), p1 (copy), p2 (copy), TextChannelWindowPerfTracker (upval), TextChannelWindowAnalyticsModule (upval), getMessageStatus (upval)
		if not t[TextChannel] then
			local IsRBXSystem = TextChannel.Name == "RBXSystem"
			local DestroyingConnections = {
				(TextChannel.MessageReceived:Connect(function(p4)
					-- upvalues: IsRBXSystem (copy), GetFFlagExpChatUseChatMuteStoreModule (upval), IsTextSourceMutedModule (upval), TextChatServiceIntegrationModule (upval), p1 (upval), p2 (upval), TextChannel (copy), TextChannelWindowPerfTracker (upval), TextChannelWindowAnalyticsModule (upval), getMessageStatus (upval)
					if not p4.TextSource and not IsRBXSystem then return end
					if GetFFlagExpChatUseChatMuteStoreModule() and p4.TextSource and IsTextSourceMutedModule(p4.TextSource) then return end
					local MapTextChatMessageResult = TextChatServiceIntegrationModule.mapTextChatMessage(p4, p1)
					
					if MapTextChatMessageResult.content == "" then
						p2.removeMessage(TextChannel, MapTextChatMessageResult.messageId)
					else
						p2.upsertMessage(TextChannel, MapTextChatMessageResult)
					end
					if p4.TextSource and tostring(p4.TextSource.UserId) ~= p1 then
						TextChannelWindowPerfTracker.startReceiveInterval(p4.MessageId, TextChannel.Name)
					end
					TextChannelWindowAnalyticsModule.emit(TextChannelWindowAnalyticsModule.Counters.MessageReceived, {
						status = getMessageStatus(p4),
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
	
	Service.SendingMessage:Connect(function(TextChatMessage)
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
	
	for _, TextChannel in Service:GetDescendants() do
		if TextChannel:IsA("TextChannel") then
			connectChannel(TextChannel)
		end
	end
	Service.DescendantAdded:Connect(function(Descendant)
		-- upvalues: connectChannel (copy)
		if Descendant:IsA("TextChannel") then
			connectChannel(Descendant)
		end
	end)
	Service.DescendantRemoving:Connect(function(Descendant)
		-- upvalues: p2 (copy)
		if Descendant:IsA("TextChannel") then
			p2.removeChannelEntry(Descendant)
		end
	end)
	
	if FFlagExpChatTextChannelWindowHistoryReplayModule then
		local function startHistoryReplay()
			-- upvalues: ConnectHistoryReplayModule (upval), GetFFlagExpChatUseChatMuteStoreModule (upval), IsTextSourceMutedModule (upval), TextChatServiceIntegrationModule (upval), p1 (copy), MessageModule (upval), p2 (copy), Service (copy), p3 (copy)
			ConnectHistoryReplayModule(function(List1)
				-- upvalues: GetFFlagExpChatUseChatMuteStoreModule (upval), IsTextSourceMutedModule (upval), TextChatServiceIntegrationModule (upval), p1 (upval), MessageModule (upval), p2 (upval)
				local t = {}
				
				for _, value in List1 do
					local TextChannel = value.TextChannel
					local TextSource = value.TextSource
					
					if TextChannel and TextSource and (not GetFFlagExpChatUseChatMuteStoreModule() or not IsTextSourceMutedModule(TextSource)) then
						local MapTextChatMessageResult = TextChatServiceIntegrationModule.mapTextChatMessage(value, p1)
						
						if MapTextChatMessageResult.content ~= "" then
							local List = t[TextChannel] or {}
							t[TextChannel] = List
							table.insert(List, MessageModule.markHistorical(MapTextChatMessageResult))
						end
					end
				end
				for i, value1 in t do
					p2.insertHistorical(i, value1)
				end
			end, { service = Service, defer = if p3 then p3.defer else nil })
		end
		
		if p3 and p3.whenCanChat then
			p3.whenCanChat(startHistoryReplay)
			
			return
		end
		startHistoryReplay()
	end
end