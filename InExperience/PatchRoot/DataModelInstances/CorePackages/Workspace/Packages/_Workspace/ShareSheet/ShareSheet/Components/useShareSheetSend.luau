local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppChat.GetExternalChatMessageSenderStore)
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
	-- upvalues: reactModule (ref), shareSheetTelemetryModule (ref)
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useRef(false)
	
	return {
		isSending = var1,
		onSendActivated = reactModule.useCallback(function(p2)
			-- upvalues: var3 (ref), shareSheetTelemetryModule (copy), p1 (ref), var2 (ref)
			if var3.current then return end
			if string.find(p2, "%S") ~= nil then
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
			local var4 = false
			local var5 = false
			local var6 = false
			local t_1 = {}
			local var7 = if p2 == "" then p1.url else `{p1.url} {p2}`
			
			local function finishSending()
				-- upvalues: var3 (copy), var2 (copy), var5 (write), var6 (write), p1 (copy), chatShare (ref), t (ref), t_1 (ref), shareSheetTelemetryModule (copy)
				var3.current = false
				var2(false)
				
				if not var5 and not var6 then return end
				if p1.onShareSendResultSnackbar then
					local var8
					local navigateToChat = chatShare.navigateToChat
					local var9 = if #t == 1 and #t_1 == 1 then t_1[1].conversationId else nil
					local onShareSendResultSnackbar = p1.onShareSendResultSnackbar
					local t_2 = {
						action = if var6 and navigateToChat then {
							text = "View",
							onActivated = function()
								-- upvalues: navigateToChat (ref), var9 (ref)
								navigateToChat(var9)
							end
						} else nil
					}
					
					if not var6 then
						var8 = if #t == 1 then "Message can't be sent" else "Messages can't be sent"
					elseif p1.formatSuccessSnackbarText then
						local var10 = p1.formatSuccessSnackbarText(t_1)
						local var11 = #t_1 - 1
						var8 = if var11 <= 0 then var10 elseif var11 == 1 then `{var10} + 1 other` else `{var10} + {var11} others`
					else
						var8 = if #t == 1 then "Message was sent" else "Messages were sent"
					end
					t_2.title = var8
					onShareSendResultSnackbar(t_2)
				end
				if var6 then
					p1.onCloseWithReason(shareSheetTelemetryModule.CloseReason.SendSuccess)
				end
			end
			
			local function send(p3)
				-- upvalues: chatShare (ref), var7 (ref), var6 (write), t_1 (ref), var5 (write), var4 (write)
				return chatShare.sendToConversation(p3, var7):catch(function()
					return { status = "failure" }
				end):andThen(function(p4)
					-- upvalues: var6 (copy), t_1 (copy), p3 (ref), var5 (copy), var4 (copy)
					if p4.status == "success" and p4.conversationId then
						var6 = true
						local var8 = t_1
						local t = { conversationId = p4.conversationId }
						local var9 = p3
						local titleForViewer = var9.titleForViewer
						t.displayName = if titleForViewer and titleForViewer ~= "" then titleForViewer else var9.title or ""
						table.insert(var8, t)
						
						return
					elseif p4.status == "failure" then
						var5 = true
						
						return
					elseif p4.status == "declined" then
						var4 = true
					end
				end)
			end
			
			local var8 = send(t[1])
			
			for i = 2, #t do
				local var9 = t[i]
				var8 = var8:andThen(function()
					-- upvalues: var4 (write), send (ref), var9 (ref)
					if var4 then
						return
					end
					return send(var9)
				end)
			end
			var8:andThen(finishSending)
		end, {
			p1.chatShare, p1.context, p1.conversations, p1.formatSuccessSnackbarText,
			p1.onCloseWithReason, p1.onSendActivated, p1.onShareSendResultSnackbar,
			p1.selectedConversationIds, p1.telemetryId, p1.url
		})
	}
end