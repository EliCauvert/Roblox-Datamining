local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppChat.GetExternalChatMessageSenderStore)
local fFlagShareSheetMessageSendTelemetryModule = require(shareSheet.Flags.FFlagShareSheetMessageSendTelemetry)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)

local function _(p1)
	local titleForViewer = p1.titleForViewer
	
	return if titleForViewer and titleForViewer ~= "" then titleForViewer else p1.title or ""
end

local _ = function(vectorA, vectorB)
	local var1 = vectorB - 1
	
	return if var1 <= 0 then vectorA elseif var1 == 1 then `{vectorA} + 1 other` else `{vectorA} + {var1} others`
end

return function(p1)
	-- upvalues: reactModule (ref), shareSheetTelemetryModule (ref), fFlagShareSheetMessageSendTelemetryModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useRef(false)
	
	return {
		isSending = var1,
		onSendActivated = reactModule.useCallback(function(p2)
			-- upvalues: var3 (ref), shareSheetTelemetryModule (copy), p1 (ref), var2 (ref), fFlagShareSheetMessageSendTelemetryModule (copy)
			if var3.current then return end
			local var4 = string.find(p2, "%S") ~= nil
			
			if var4 then
				shareSheetTelemetryModule.logInteraction({
					context = p1.context,
					telemetryId = p1.telemetryId or "",
					interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageSubmitted
				})
			end
			local t = {}
			
			if p1.chatShare ~= nil then
				for i, v in p1.conversations do
					if p1.selectedConversationIds[v.id] and p1.chatShare.canSendToConversation(v) then
						table.insert(t, v)
					end
				end
			end
			p1.onSendActivated()
			local chatShare = p1.chatShare
			
			if chatShare == nil or #t == 0 then return end
			var3.current = true
			var2(true)
			local var5 = false
			local var6 = false
			local var7 = false
			local t_1 = {}
			local var8 = if p2 == "" then p1.url else `{p1.url} {p2}`
			
			local function finishSending()
				-- upvalues: var3 (copy), var2 (copy), var6 (write), var7 (write), p1 (copy), chatShare (ref), t (ref), t_1 (ref), fFlagShareSheetMessageSendTelemetryModule (copy), shareSheetTelemetryModule (copy)
				var3.current = false
				var2(false)
				
				if not var6 and not var7 then return end
				if p1.onShareSendResultSnackbar then
					local var9
					local navigateToChat = chatShare.navigateToChat
					local var10 = if #t == 1 and #t_1 == 1 then t_1[1].conversationId else nil
					local onShareSendResultSnackbar = p1.onShareSendResultSnackbar
					local t_2 = {
						action = if var7 and navigateToChat then {
							text = "View",
							onActivated = function()
								-- upvalues: fFlagShareSheetMessageSendTelemetryModule (copy), shareSheetTelemetryModule (copy), p1 (copy), t (copy), var10 (ref), navigateToChat (ref)
								if fFlagShareSheetMessageSendTelemetryModule then
									shareSheetTelemetryModule.logInteraction({
										context = p1.context,
										telemetryId = p1.telemetryId or "",
										interactionType = shareSheetTelemetryModule.InteractionType.ViewMessage,
										requestedConversationId = if #t == 1 then t[1].id else nil,
										resolvedConversationId = var10,
										viewDestination = if var10 then shareSheetTelemetryModule.ViewDestination.Conversation else shareSheetTelemetryModule.ViewDestination.ChatLanding
									})
								end
								navigateToChat(var10)
							end
						} else nil
					}
					
					if not var7 then
						var9 = if #t == 1 then "Message can't be sent" else "Messages can't be sent"
					elseif p1.formatSuccessSnackbarText then
						local var11 = p1.formatSuccessSnackbarText(t_1)
						local var12 = #t_1 - 1
						var9 = if var12 <= 0 then var11 elseif var12 == 1 then `{var11} + 1 other` else `{var11} + {var12} others`
					else
						var9 = if #t == 1 then "Message was sent" else "Messages were sent"
					end
					t_2.title = var9
					onShareSendResultSnackbar(t_2)
				end
				if var7 then
					p1.onCloseWithReason(shareSheetTelemetryModule.CloseReason.SendSuccess)
				end
			end
			
			local function send(p3)
				-- upvalues: fFlagShareSheetMessageSendTelemetryModule (copy), shareSheetTelemetryModule (copy), p1 (copy), var4 (ref), chatShare (ref), var8 (ref), var7 (write), t_1 (ref), var6 (write), var5 (write)
				local var9 = if fFlagShareSheetMessageSendTelemetryModule then shareSheetTelemetryModule.startMessageSendResult({
					context = p1.context,
					telemetryId = p1.telemetryId or "",
					requestedConversationId = p3.id,
					hasCustomMessage = var4
				}) else nil
				
				return chatShare.sendToConversation(p3, var8):catch(function()
					return { status = "failure" }
				end):andThen(function(p4)
					-- upvalues: fFlagShareSheetMessageSendTelemetryModule (copy), var9 (ref), var7 (copy), t_1 (copy), p3 (ref), var6 (copy), var5 (copy)
					if fFlagShareSheetMessageSendTelemetryModule then
						var9(p4)
					end
					if p4.status == "success" and p4.conversationId then
						var7 = true
						local var10 = t_1
						local t = { conversationId = p4.conversationId }
						local var11 = p3
						local titleForViewer = var11.titleForViewer
						t.displayName = if titleForViewer and titleForViewer ~= "" then titleForViewer else var11.title or ""
						table.insert(var10, t)
						
						return
					elseif p4.status == "failure" then
						var6 = true
						
						return
					elseif p4.status == "declined" then
						var5 = true
					end
				end)
			end
			
			local var9 = send(t[1])
			
			for i = 2, #t do
				local var10 = t[i]
				var9 = var9:andThen(function()
					-- upvalues: var5 (write), send (ref), var10 (ref)
					if var5 then
						return
					end
					return send(var10)
				end)
			end
			var9:andThen(finishSending)
		end, {
			p1.chatShare, p1.context, p1.conversations, p1.formatSuccessSnackbarText,
			p1.onCloseWithReason, p1.onSendActivated, p1.onShareSendResultSnackbar,
			p1.selectedConversationIds, p1.telemetryId, p1.url
		})
	}
end