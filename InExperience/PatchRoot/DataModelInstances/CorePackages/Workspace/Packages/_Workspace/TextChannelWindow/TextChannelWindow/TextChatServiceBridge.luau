local parent = script:FindFirstAncestor("TextChannelWindow").Parent
local sharedFlagsModule = require(parent.SharedFlags)
local textChannelWindowAnalyticsModule = require(script.Parent.TextChannelWindowAnalytics)
local textChannelWindowPerfTracker = require(parent.ChatUIPrimitives).Telemetry.TextChannelWindowPerfTracker
local textChatServiceIntegrationModule = require(script.Parent.TextChatServiceIntegration)
local _ = require(script.Parent.createChannelMessagesStore)
local isTextSourceMutedModule = require(script.Parent.isTextSourceMuted)
local getFFlagExpChatProtectedChatInternalAPIs = sharedFlagsModule.getFFlagExpChatProtectedChatInternalAPIs
local getFFlagExpChatUseChatMuteStoreModule = require(script.Parent.getFFlagExpChatUseChatMuteStore)

local function getMessageStatus(p0) --[[ line: 26 ]]
	local status = p0.Status
	
	return if status == Enum.TextChatMessageStatus.Success then "success" elseif status == Enum.TextChatMessageStatus.TextFilterFailed then "filter_failed" elseif status == Enum.TextChatMessageStatus.Floodchecked then "floodchecked" elseif status == Enum.TextChatMessageStatus.InvalidPrivacySettings then "invalid_privacy_settings" elseif status == Enum.TextChatMessageStatus.InvalidTextChannelPermissions then "invalid_permissions" elseif status == Enum.TextChatMessageStatus.MessageTooLong then "message_too_long" elseif status == Enum.TextChatMessageStatus.ModerationTimeout then "moderation_timeout" else "unknown"
end

return function(p1, p2, p3) --[[ line: 47 | named "createTextChatServiceBridge" ]]
	-- upvalues: getFFlagExpChatUseChatMuteStoreModule (ref), isTextSourceMutedModule (ref), textChatServiceIntegrationModule (ref), textChannelWindowPerfTracker (ref), textChannelWindowAnalyticsModule (ref), getMessageStatus (ref), getFFlagExpChatProtectedChatInternalAPIs (ref)
	local function _(p4) --[[ line: 52 | named "connectChannel" ]]
		-- upvalues: getFFlagExpChatUseChatMuteStoreModule (copy), isTextSourceMutedModule (copy), textChatServiceIntegrationModule (copy), p2 (ref), p3 (ref), textChannelWindowPerfTracker (copy), textChannelWindowAnalyticsModule (copy), getMessageStatus (copy)
		local isRBXSystem = p4.Name == "RBXSystem"
		p4.MessageReceived:Connect(function(p5) --[[ line: 54 ]]
			-- upvalues: isRBXSystem (ref), getFFlagExpChatUseChatMuteStoreModule (copy), isTextSourceMutedModule (copy), textChatServiceIntegrationModule (copy), p2 (copy), p3 (copy), p4 (ref), textChannelWindowPerfTracker (copy), textChannelWindowAnalyticsModule (copy), getMessageStatus (copy)
			if not p5.TextSource and not isRBXSystem then return end
			if getFFlagExpChatUseChatMuteStoreModule() and p5.TextSource and isTextSourceMutedModule(p5.TextSource) then return end
			local var8 = textChatServiceIntegrationModule.mapTextChatMessage(p5, p2)
			
			if var8.content == "" then
				p3.removeMessage(p4, var8.messageId)
			else
				p3.upsertMessage(p4, var8)
			end
			if p5.TextSource and tostring(p5.TextSource.UserId) ~= p2 then
				textChannelWindowPerfTracker.startReceiveInterval(p5.MessageId, p4.Name)
			end
			textChannelWindowAnalyticsModule.emit(textChannelWindowAnalyticsModule.Counters.MessageReceived, {
				status = getMessageStatus(p5),
				target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(p4.Name)
			})
		end)
	end
	
	p1.SendingMessage:Connect(function(p6) --[[ line: 81 ]]
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (copy), textChannelWindowPerfTracker (copy), textChatServiceIntegrationModule (copy), p2 (ref), p3 (ref)
		if not p6.TextSource then return end
		if (if getFFlagExpChatProtectedChatInternalAPIs() then p6.TextInternal else p6.Text) == "" then return end
		local textChannel = p6.TextChannel
		
		if textChannel then
			textChannelWindowPerfTracker.startSendInterval(p6.MessageId, textChannel.Name)
			p3.insertIfAbsent(textChannel, textChatServiceIntegrationModule.mapSendingMessage(p6, p2))
			
			return
		end
	end)
	
	for i, v in p1:GetDescendants() do
		if v:IsA("TextChannel") then
			local isRBXSystem = v.Name == "RBXSystem"
			v.MessageReceived:Connect(function(p7) --[[ line: 54 ]]
				-- upvalues: isRBXSystem (ref), getFFlagExpChatUseChatMuteStoreModule (copy), isTextSourceMutedModule (copy), textChatServiceIntegrationModule (copy), p2 (ref), p3 (ref), v (ref), textChannelWindowPerfTracker (copy), textChannelWindowAnalyticsModule (copy), getMessageStatus (copy)
				if not p7.TextSource and not isRBXSystem then return end
				if getFFlagExpChatUseChatMuteStoreModule() and p7.TextSource and isTextSourceMutedModule(p7.TextSource) then return end
				local var8 = textChatServiceIntegrationModule.mapTextChatMessage(p7, p2)
				
				if var8.content == "" then
					p3.removeMessage(v, var8.messageId)
				else
					p3.upsertMessage(v, var8)
				end
				if p7.TextSource and tostring(p7.TextSource.UserId) ~= p2 then
					textChannelWindowPerfTracker.startReceiveInterval(p7.MessageId, v.Name)
				end
				textChannelWindowAnalyticsModule.emit(textChannelWindowAnalyticsModule.Counters.MessageReceived, {
					status = getMessageStatus(p7),
					target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(v.Name)
				})
			end)
		end
	end
	p1.DescendantAdded:Connect(function(p8) --[[ line: 106 ]]
		-- upvalues: getFFlagExpChatUseChatMuteStoreModule (copy), isTextSourceMutedModule (copy), textChatServiceIntegrationModule (copy), p2 (ref), p3 (ref), textChannelWindowPerfTracker (copy), textChannelWindowAnalyticsModule (copy), getMessageStatus (copy)
		if p8:IsA("TextChannel") then
			local isRBXSystem = p8.Name == "RBXSystem"
			p8.MessageReceived:Connect(function(p9) --[[ line: 54 ]]
				-- upvalues: isRBXSystem (ref), getFFlagExpChatUseChatMuteStoreModule (copy), isTextSourceMutedModule (copy), textChatServiceIntegrationModule (copy), p2 (copy), p3 (copy), p8 (ref), textChannelWindowPerfTracker (copy), textChannelWindowAnalyticsModule (copy), getMessageStatus (copy)
				if not p9.TextSource and not isRBXSystem then return end
				if getFFlagExpChatUseChatMuteStoreModule() and p9.TextSource and isTextSourceMutedModule(p9.TextSource) then return end
				local var8 = textChatServiceIntegrationModule.mapTextChatMessage(p9, p2)
				
				if var8.content == "" then
					p3.removeMessage(p8, var8.messageId)
				else
					p3.upsertMessage(p8, var8)
				end
				if p9.TextSource and tostring(p9.TextSource.UserId) ~= p2 then
					textChannelWindowPerfTracker.startReceiveInterval(p9.MessageId, p8.Name)
				end
				textChannelWindowAnalyticsModule.emit(textChannelWindowAnalyticsModule.Counters.MessageReceived, {
					status = getMessageStatus(p9),
					target_text_channel_category = textChannelWindowAnalyticsModule.getChannelCategory(p8.Name)
				})
			end)
		end
	end)
end