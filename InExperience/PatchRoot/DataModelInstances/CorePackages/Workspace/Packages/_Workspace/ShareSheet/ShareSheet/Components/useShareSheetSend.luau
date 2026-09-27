local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local appChatModule = require(parent.AppChat)
local reactModule = require(parent.React)
local _ = require(parent.AppChat.GetExternalChatMessageSenderStore)
local fFlagShareSheetHoldRecipientsWhileSendingModule = require(shareSheet.Flags.FFlagShareSheetHoldRecipientsWhileSending)
local fFlagShareSheetMessageSendTelemetryModule = require(shareSheet.Flags.FFlagShareSheetMessageSendTelemetry)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)
local useConversationList = appChatModule.Hooks.useConversationList

local function _(p1)
	local titleForViewer = p1.titleForViewer
	
	return if titleForViewer and titleForViewer ~= "" then titleForViewer else p1.title or ""
end

local _ = function(vectorA, vectorB)
	local var1 = vectorB - 1
	
	return if var1 <= 0 then vectorA elseif var1 == 1 then `{vectorA} + 1 other` else `{vectorA} + {var1} others`
end

return function(p1)
	-- upvalues: fFlagShareSheetHoldRecipientsWhileSendingModule (ref), useConversationList (ref), reactModule (ref), shareSheetTelemetryModule (ref), fFlagShareSheetMessageSendTelemetryModule (ref)
	local var1 = if fFlagShareSheetHoldRecipientsWhileSendingModule then useConversationList(p1.chatShare ~= nil).items else p1.conversations
	local var2, var3 = reactModule.useState(false)
	local var4 = reactModule.useRef(false)
	
	return {
		isSending = var2,
		onSendActivated = reactModule.useCallback(function(p2)
			-- upvalues: var4 (ref), shareSheetTelemetryModule (copy), p1 (ref), var1 (ref), fFlagShareSheetHoldRecipientsWhileSendingModule (copy), var3 (ref), fFlagShareSheetMessageSendTelemetryModule (copy)
			if var4.current then return end
			local var5 = string.find(p2, "%S") ~= nil
			
			if var5 then
				shareSheetTelemetryModule.logInteraction({
					context = p1.context,
					telemetryId = p1.telemetryId or "",
					interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageSubmitted
				})
			end
			local t = {}
			
			if p1.chatShare ~= nil then
				for i, v in var1 do
					if p1.selectedConversationIds[v.id] and p1.chatShare.canSendToConversation(v) then
						table.insert(t, v)
					end
				end
			end
			if not fFlagShareSheetHoldRecipientsWhileSendingModule then
				p1.onSendActivated()
			end
			local chatShare = p1.chatShare
			
			if chatShare == nil or #t == 0 then
				if fFlagShareSheetHoldRecipientsWhileSendingModule then
					p1.onSendActivated()
				end
				return
			else
				var4.current = true
				var3(true)
				local var6 = false
				local var7 = false
				local var8 = false
				local t_1 = {}
				local var9 = if p2 == "" then p1.url else `{p1.url} {p2}`
				
				local function finishSending()
					-- upvalues: var4 (copy), var3 (copy), var7 (write), var8 (write), p1 (copy), chatShare (ref), t (ref), t_1 (ref), fFlagShareSheetMessageSendTelemetryModule (copy), shareSheetTelemetryModule (copy), fFlagShareSheetHoldRecipientsWhileSendingModule (copy)
					var4.current = false
					var3(false)
					
					if not var7 and not var8 then return end
					if p1.onShareSendResultSnackbar then
						local var10
						local navigateToChat = chatShare.navigateToChat
						local var11 = if #t == 1 and #t_1 == 1 then t_1[1].conversationId else nil
						local onShareSendResultSnackbar = p1.onShareSendResultSnackbar
						local t_2 = {
							action = if var8 and navigateToChat then {
								text = "View",
								onActivated = function()
									-- upvalues: fFlagShareSheetMessageSendTelemetryModule (copy), shareSheetTelemetryModule (copy), p1 (copy), t (copy), var11 (ref), navigateToChat (ref)
									if fFlagShareSheetMessageSendTelemetryModule then
										shareSheetTelemetryModule.logInteraction({
											context = p1.context,
											telemetryId = p1.telemetryId or "",
											interactionType = shareSheetTelemetryModule.InteractionType.ViewMessage,
											requestedConversationId = if #t == 1 then t[1].id else nil,
											resolvedConversationId = var11,
											viewDestination = if var11 then shareSheetTelemetryModule.ViewDestination.Conversation else shareSheetTelemetryModule.ViewDestination.ChatLanding
										})
									end
									navigateToChat(var11)
								end
							} else nil
						}
						
						if not var8 then
							var10 = if #t == 1 then "Message can't be sent" else "Messages can't be sent"
						elseif p1.formatSuccessSnackbarText then
							local var12 = p1.formatSuccessSnackbarText(t_1)
							local var13 = #t_1 - 1
							var10 = if var13 <= 0 then var12 elseif var13 == 1 then `{var12} + 1 other` else `{var12} + {var13} others`
						else
							var10 = if #t == 1 then "Message was sent" else "Messages were sent"
						end
						t_2.title = var10
						onShareSendResultSnackbar(t_2)
					end
					if var8 then
						if fFlagShareSheetHoldRecipientsWhileSendingModule then
							p1.onSendActivated()
						end
						p1.onCloseWithReason(shareSheetTelemetryModule.CloseReason.SendSuccess)
					end
				end
				
				local function send(p3)
					-- upvalues: fFlagShareSheetMessageSendTelemetryModule (copy), shareSheetTelemetryModule (copy), p1 (copy), var5 (ref), chatShare (ref), var9 (ref), var8 (write), t_1 (ref), var7 (write), var6 (write)
					local var10 = if fFlagShareSheetMessageSendTelemetryModule then shareSheetTelemetryModule.startMessageSendResult({
						context = p1.context,
						telemetryId = p1.telemetryId or "",
						requestedConversationId = p3.id,
						hasCustomMessage = var5
					}) else nil
					
					return chatShare.sendToConversation(p3, var9):catch(function()
						return { status = "failure" }
					end):andThen(function(p4)
						-- upvalues: fFlagShareSheetMessageSendTelemetryModule (copy), var10 (ref), var8 (copy), t_1 (copy), p3 (ref), var7 (copy), var6 (copy)
						if fFlagShareSheetMessageSendTelemetryModule then
							var10(p4)
						end
						if p4.status == "success" and p4.conversationId then
							var8 = true
							local var11 = t_1
							local t = { conversationId = p4.conversationId }
							local var12 = p3
							local titleForViewer = var12.titleForViewer
							t.displayName = if titleForViewer and titleForViewer ~= "" then titleForViewer else var12.title or ""
							table.insert(var11, t)
							
							return
						elseif p4.status == "failure" then
							var7 = true
							
							return
						elseif p4.status == "declined" then
							var6 = true
						end
					end)
				end
				
				local var10 = send(t[1])
				
				for i = 2, #t do
					local var11 = t[i]
					var10 = var10:andThen(function()
						-- upvalues: var6 (write), send (ref), var11 (ref)
						if var6 then
							return
						end
						return send(var11)
					end)
				end
				var10:andThen(finishSending)
			end
		end, {
			p1.chatShare, p1.context, var1, p1.formatSuccessSnackbarText,
			p1.onCloseWithReason, p1.onSendActivated, p1.onShareSendResultSnackbar,
			p1.selectedConversationIds, p1.telemetryId, p1.url
		})
	}
end