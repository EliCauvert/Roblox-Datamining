local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local appChatModule = require(parent.AppChat)
local reactModule = require(parent.React)
local _ = require(parent.AppChat.GetExternalChatMessageSenderStore)
local fFlagShareSheetHoldRecipientsWhileSendingModule = require(shareSheet.Flags.FFlagShareSheetHoldRecipientsWhileSending)
local fFlagShareSheetLocalizeStringsModule = require(shareSheet.Flags.FFlagShareSheetLocalizeStrings)
local fFlagShareSheetMessageSendTelemetryModule = require(shareSheet.Flags.FFlagShareSheetMessageSendTelemetry)
local _ = require(parent.InExperienceLocales)
local localizationRoactContext = require(parent.Localization).LocalizationRoactContext
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

local function formatLocalizedSnackbarTitle(p1, p2, p3, p4, p5)
	if not p2 then
		return p1:Format(if p3 == 1 then "Feature.UniversalShareSheet.Response.NotSharedMessage" else "Feature.UniversalShareSheet.Response.NotSharedMultipleMessages")
	elseif p5 == nil then
		return p1:Format(if p3 == 1 then "Feature.UniversalShareSheet.Response.SharedMessage" else "Feature.UniversalShareSheet.Response.SharedMultipleMessages")
	end
	local var1 = p5(p4)
	local var2 = #p4 - 1
	
	return if var2 <= 0 then var1 else p1:Format(if var2 == 1 then "Feature.UniversalShareSheet.Response.SharedCustomMessage" else "Feature.UniversalShareSheet.SharedCustomMultipleMessages", { CUSTOM_MESSAGE = var1, N = var2 })
end

return function(p1)
	-- upvalues: fFlagShareSheetHoldRecipientsWhileSendingModule (ref), useConversationList (ref), reactModule (ref), fFlagShareSheetLocalizeStringsModule (ref), localizationRoactContext (ref), shareSheetTelemetryModule (ref), fFlagShareSheetMessageSendTelemetryModule (ref), formatLocalizedSnackbarTitle (ref)
	local var1 = if fFlagShareSheetHoldRecipientsWhileSendingModule then useConversationList(p1.chatShare ~= nil).items else p1.conversations
	local var2, var3 = reactModule.useState(false)
	local var4 = reactModule.useRef(false)
	local var5 = if fFlagShareSheetLocalizeStringsModule then reactModule.useContext(localizationRoactContext) else nil
	
	return {
		isSending = var2,
		onSendActivated = reactModule.useCallback(function(p2)
			-- upvalues: var4 (ref), shareSheetTelemetryModule (copy), p1 (ref), var1 (ref), fFlagShareSheetHoldRecipientsWhileSendingModule (copy), var3 (ref), fFlagShareSheetMessageSendTelemetryModule (copy), fFlagShareSheetLocalizeStringsModule (copy), var5 (ref), formatLocalizedSnackbarTitle (copy)
			if var4.current then return end
			local var6 = string.find(p2, "%S") ~= nil
			
			if var6 then
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
				local var7 = false
				local var8 = false
				local var9 = false
				local t_1 = {}
				local var10 = if p2 == "" then p1.url else `{p1.url} {p2}`
				
				local function finishSending()
					-- upvalues: var4 (copy), var3 (copy), var8 (write), var9 (write), p1 (copy), chatShare (ref), t (ref), t_1 (ref), fFlagShareSheetMessageSendTelemetryModule (copy), shareSheetTelemetryModule (copy), fFlagShareSheetLocalizeStringsModule (copy), var5 (copy), formatLocalizedSnackbarTitle (copy), fFlagShareSheetHoldRecipientsWhileSendingModule (copy)
					var4.current = false
					var3(false)
					
					if not var8 and not var9 then return end
					if p1.onShareSendResultSnackbar then
						local var11
						local navigateToChat = chatShare.navigateToChat
						local var12 = if #t == 1 and #t_1 == 1 then t_1[1].conversationId else nil
						local onShareSendResultSnackbar = p1.onShareSendResultSnackbar
						local t_2 = {
							action = if var9 and navigateToChat then {
								onActivated = function()
									-- upvalues: fFlagShareSheetMessageSendTelemetryModule (copy), shareSheetTelemetryModule (copy), p1 (copy), t (copy), var12 (ref), navigateToChat (ref)
									if fFlagShareSheetMessageSendTelemetryModule then
										shareSheetTelemetryModule.logInteraction({
											context = p1.context,
											telemetryId = p1.telemetryId or "",
											interactionType = shareSheetTelemetryModule.InteractionType.ViewMessage,
											requestedConversationId = if #t == 1 then t[1].id else nil,
											resolvedConversationId = var12,
											viewDestination = if var12 then shareSheetTelemetryModule.ViewDestination.Conversation else shareSheetTelemetryModule.ViewDestination.ChatLanding
										})
									end
									navigateToChat(var12)
								end,
								text = if fFlagShareSheetLocalizeStringsModule then var5:Format("CommonUI.Messages.Action.View") else "View"
							} else nil
						}
						
						if fFlagShareSheetLocalizeStringsModule then
							var11 = formatLocalizedSnackbarTitle(var5, var9, #t, t_1, p1.formatSuccessSnackbarText)
						elseif not var9 then
							var11 = if #t == 1 then "Message can't be sent" else "Messages can't be sent"
						elseif p1.formatSuccessSnackbarText then
							local var13 = p1.formatSuccessSnackbarText(t_1)
							local var14 = #t_1 - 1
							var11 = if var14 <= 0 then var13 elseif var14 == 1 then `{var13} + 1 other` else `{var13} + {var14} others`
						else
							var11 = if #t == 1 then "Message was sent" else "Messages were sent"
						end
						t_2.title = var11
						onShareSendResultSnackbar(t_2)
					end
					if var9 then
						if fFlagShareSheetHoldRecipientsWhileSendingModule then
							p1.onSendActivated()
						end
						p1.onCloseWithReason(shareSheetTelemetryModule.CloseReason.SendSuccess)
					end
				end
				
				local function send(p3)
					-- upvalues: fFlagShareSheetMessageSendTelemetryModule (copy), shareSheetTelemetryModule (copy), p1 (copy), var6 (ref), chatShare (ref), var10 (ref), var9 (write), t_1 (ref), var8 (write), var7 (write)
					local var11 = if fFlagShareSheetMessageSendTelemetryModule then shareSheetTelemetryModule.startMessageSendResult({
						context = p1.context,
						telemetryId = p1.telemetryId or "",
						requestedConversationId = p3.id,
						hasCustomMessage = var6
					}) else nil
					
					return chatShare.sendToConversation(p3, var10):catch(function()
						return { status = "failure" }
					end):andThen(function(p4)
						-- upvalues: fFlagShareSheetMessageSendTelemetryModule (copy), var11 (ref), var9 (copy), t_1 (copy), p3 (ref), var8 (copy), var7 (copy)
						if fFlagShareSheetMessageSendTelemetryModule then
							var11(p4)
						end
						if p4.status == "success" and p4.conversationId then
							var9 = true
							local var12 = t_1
							local t = { conversationId = p4.conversationId }
							local var13 = p3
							local titleForViewer = var13.titleForViewer
							t.displayName = if titleForViewer and titleForViewer ~= "" then titleForViewer else var13.title or ""
							table.insert(var12, t)
							
							return
						elseif p4.status == "failure" then
							var8 = true
							
							return
						elseif p4.status == "declined" then
							var7 = true
						end
					end)
				end
				
				local var11 = send(t[1])
				
				for i = 2, #t do
					local var12 = t[i]
					var11 = var11:andThen(function()
						-- upvalues: var7 (write), send (ref), var12 (ref)
						if var7 then
							return
						end
						return send(var12)
					end)
				end
				var11:andThen(finishSending)
			end
		end, {
			p1.chatShare, p1.context, var1, p1.formatSuccessSnackbarText,
			p1.onCloseWithReason, p1.onSendActivated, p1.onShareSendResultSnackbar,
			p1.selectedConversationIds, p1.telemetryId, p1.url,
			if fFlagShareSheetLocalizeStringsModule then var5 else nil
		})
	}
end