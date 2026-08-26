local parent = script:FindFirstAncestor("TextChannelWindow").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local textChannelWindowAnalyticsModule = require(script.Parent.TextChannelWindowAnalytics)
local textChannelWindowPerfTracker = require(parent.ChatUIPrimitives).Telemetry.TextChannelWindowPerfTracker
local textChatServiceIntegrationModule = require(script.Parent.TextChatServiceIntegration)
local _ = require(script.Parent.createChannelMessagesStore)
local isTextSourceMutedModule = require(script.Parent.isTextSourceMuted)
local getFFlagExpChatProtectedChatInternalAPIs = sharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local getFFlagExpChatUseChatMuteStoreModule = require(script.Parent.getFFlagExpChatUseChatMuteStore)
local fFlagExpChatRemoveOrphanedChannelsModule = require(script.Parent.Flags.FFlagExpChatRemoveOrphanedChannels)
local fFlagExpChatDedupChannelConnectionsModule = require(script.Parent.Flags.FFlagExpChatDedupChannelConnections)
local fFlagExpChatClearMessagesOnLeaveModule = require(script.Parent.Flags.FFlagExpChatClearMessagesOnLeave)

local function getMessageStatus(p1)
	local status = p1.Status
	
	return if status == Enum.TextChatMessageStatus.Success then "success" elseif status == Enum.TextChatMessageStatus.TextFilterFailed then "filter_failed" elseif status == Enum.TextChatMessageStatus.Floodchecked then "floodchecked" elseif status == Enum.TextChatMessageStatus.InvalidPrivacySettings then "invalid_privacy_settings" elseif status == Enum.TextChatMessageStatus.InvalidTextChannelPermissions then "invalid_permissions" elseif status == Enum.TextChatMessageStatus.MessageTooLong then "message_too_long" elseif status == Enum.TextChatMessageStatus.ModerationTimeout then "moderation_timeout" else "unknown"
end

return function(p1, p2, p3)
	-- upvalues: fFlagExpChatDedupChannelConnectionsModule (ref), getFFlagExpChatUseChatMuteStoreModule (ref), isTextSourceMutedModule (ref), textChatServiceIntegrationModule (ref), textChannelWindowPerfTracker (ref), textChannelWindowAnalyticsModule (ref), getMessageStatus (ref), fFlagExpChatClearMessagesOnLeaveModule (ref), getFFlagExpChatProtectedChatInternalAPIs (ref), fFlagExpChatRemoveOrphanedChannelsModule (ref)
	local t = {}
	
	local function connectChannel(p4)
		-- upvalues: fFlagExpChatDedupChannelConnectionsModule (copy), t (ref), getFFlagExpChatUseChatMuteStoreModule (copy), isTextSourceMutedModule (copy), textChatServiceIntegrationModule (copy), p2 (ref), p3 (ref), textChannelWindowPerfTracker (copy), textChannelWindowAnalyticsModule (copy), getMessageStatus (copy), fFlagExpChatClearMessagesOnLeaveModule (copy)
		if fFlagExpChatDedupChannelConnectionsModule and t[p4] then return end
		local isRBXSystem = p4.Name == "RBXSystem"
		local messageReceivedConnection = p4.MessageReceived:Connect(function(p5)
			-- upvalues: isRBXSystem (ref), getFFlagExpChatUseChatMuteStoreModule (copy), isTextSourceMutedModule (copy), textChatServiceIntegrationModule (copy), p2 (copy), p3 (copy), p4 (ref), textChannelWindowPerfTracker (copy), textChannelWindowAnalyticsModule (copy), getMessageStatus (copy)
			if not p5.TextSource and not isRBXSystem then return end
			if getFFlagExpChatUseChatMuteStoreModule() and p5.TextSource and isTextSourceMutedModule(p5.TextSource) then return end
			local var1 = textChatServiceIntegrationModule.mapTextChatMessage(p5, p2)
			
			if var1.content == "" then
				p3.removeMessage(p4, var1.messageId)
			else
				p3.upsertMessage(p4, var1)
			end
			if p5.TextSource and tostring(p5.TextSource.UserId) ~= p2 then
				textChannelWindowPerfTracker.startReceiveInterval(p5.MessageId, p4.Name)
			end
			textChannelWindowAnalyticsModule.emit(textChannelWindowAnalyticsModule.Counters.MessageReceived, {
				status = getMessageStatus(p5),
				target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(p4.Name)
			})
		end)
		
		if fFlagExpChatDedupChannelConnectionsModule then
			local list = { messageReceivedConnection }
			t[p4] = list
			table.insert(list, p4.Destroying:Connect(function()
				-- upvalues: list (ref), t (copy), p4 (ref)
				for i, v in list do
					v:Disconnect()
				end
				t[p4] = nil
			end))
		end
		if fFlagExpChatClearMessagesOnLeaveModule then
			p4.ChildRemoved:Connect(function(p5)
				-- upvalues: p2 (copy), p3 (copy), p4 (ref)
				if p5:IsA("TextSource") and tostring(p5.UserId) == p2 then
					p3.clearChannel(p4)
				end
			end)
		end
	end
	
	p1.SendingMessage:Connect(function(p5)
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), textChannelWindowPerfTracker (copy), textChatServiceIntegrationModule (copy), p2 (ref), p3 (ref)
		if not p5.TextSource then return end
		if (if getFFlagExpChatProtectedChatInternalAPIs() then p5.TextInternal else p5.Text) == "" then return end
		local textChannel = p5.TextChannel
		
		if textChannel then
			textChannelWindowPerfTracker.startSendInterval(p5.MessageId, textChannel.Name)
			p3.insertIfAbsent(textChannel, textChatServiceIntegrationModule.mapSendingMessage(p5, p2))
			
			return
		end
	end)
	
	for i, v in p1:GetDescendants() do
		if v:IsA("TextChannel") then
			connectChannel(v)
		end
	end
	p1.DescendantAdded:Connect(function(p5)
		-- upvalues: connectChannel (ref)
		if p5:IsA("TextChannel") then
			connectChannel(p5)
		end
	end)
	
	if fFlagExpChatRemoveOrphanedChannelsModule then
		p1.DescendantRemoving:Connect(function(p5)
			-- upvalues: p3 (ref)
			if p5:IsA("TextChannel") then
				p3.removeChannelEntry(p5)
			end
		end)
	end
end