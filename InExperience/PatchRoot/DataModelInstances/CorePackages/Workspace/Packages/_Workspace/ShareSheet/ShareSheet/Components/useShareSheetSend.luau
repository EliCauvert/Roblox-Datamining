local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local reactModule = require(parent.React)
local _ = require(parent.AppChat.GetExternalChatMessageSenderStore)
local _ = require(parent.InExperienceLocales)
local localizationRoactContext = require(parent.Localization).LocalizationRoactContext
local fFlagShareSheetFriendsSort = require(parent.SharedFlags).FFlagShareSheetFriendsSort
local _ = require(shareSheet.Recipients.RecipientSource)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)
local useConversationListModule = require(parent.AppChat.useConversationList)

local function _(p1)
	local titleForViewer = p1.titleForViewer
	
	return if titleForViewer and titleForViewer ~= "" then titleForViewer else p1.title or ""
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
	-- upvalues: useConversationListModule (ref), reactModule (ref), localizationRoactContext (ref), shareSheetTelemetryModule (ref), fFlagShareSheetFriendsSort (ref), formatLocalizedSnackbarTitle (ref)
	local items = useConversationListModule(p1.chatShare ~= nil).items
	local var1, var2 = reactModule.useState(false)
	local var3 = reactModule.useRef(false)
	local var4 = reactModule.useContext(localizationRoactContext)
	
	return {
		isSending = var1,
		onSendActivated = reactModule.useCallback(function(p2)
			-- upvalues: var3 (ref), shareSheetTelemetryModule (copy), p1 (ref), fFlagShareSheetFriendsSort (copy), items (ref), var2 (ref), var4 (ref), formatLocalizedSnackbarTitle (copy)
			if var3.current then return end
			local var5 = string.find(p2, "%S") ~= nil
			
			if var5 then
				shareSheetTelemetryModule.logInteraction({
					context = p1.context,
					recipientSource = if fFlagShareSheetFriendsSort then p1.recipientSource else nil,
					telemetryId = p1.telemetryId or "",
					interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageSubmitted
				})
			end
			local t = {}
			
			if p1.chatShare ~= nil then
				for i, v in items do
					if p1.selectedConversationIds[v.id] and p1.chatShare.canSendToConversation(v) then
						table.insert(t, v)
					end
				end
			end
			local chatShare = p1.chatShare
			
			if chatShare == nil or #t == 0 then
				p1.onSendActivated()
				
				return
			end
			var3.current = true
			var2(true)
			local var6 = false
			local var7 = false
			local var8 = false
			local t_1 = {}
			local var9 = if p2 == "" then p1.url else `{p1.url} {p2}`
			
			local function finishSending()
				-- upvalues: var3 (copy), var2 (copy), var7 (write), var8 (write), p1 (copy), chatShare (ref), t (ref), t_1 (ref), shareSheetTelemetryModule (copy), fFlagShareSheetFriendsSort (copy), var4 (copy), formatLocalizedSnackbarTitle (copy)
				var3.current = false
				var2(false)
				
				if not var7 and not var8 then return end
				if p1.onShareSendResultSnackbar then
					local navigateToChat = chatShare.navigateToChat
					local var10 = if #t == 1 and #t_1 == 1 then t_1[1].conversationId else nil
					p1.onShareSendResultSnackbar({
						action = if var8 and navigateToChat then {
							onActivated = function()
								-- upvalues: shareSheetTelemetryModule (copy), p1 (copy), fFlagShareSheetFriendsSort (copy), t (copy), var10 (ref), navigateToChat (ref)
								shareSheetTelemetryModule.logInteraction({
									context = p1.context,
									recipientSource = if fFlagShareSheetFriendsSort then p1.recipientSource else nil,
									telemetryId = p1.telemetryId or "",
									interactionType = shareSheetTelemetryModule.InteractionType.ViewMessage,
									requestedConversationId = if #t == 1 then t[1].id else nil,
									resolvedConversationId = var10,
									viewDestination = if var10 then shareSheetTelemetryModule.ViewDestination.Conversation else shareSheetTelemetryModule.ViewDestination.ChatLanding
								})
								navigateToChat(var10)
							end,
							text = var4:Format("CommonUI.Messages.Action.View")
						} else nil,
						title = formatLocalizedSnackbarTitle(var4, var8, #t, t_1, p1.formatSuccessSnackbarText)
					})
				end
				if var8 then
					p1.onSendActivated()
					p1.onCloseWithReason(shareSheetTelemetryModule.CloseReason.SendSuccess)
				end
			end
			
			local function send(p3)
				-- upvalues: shareSheetTelemetryModule (copy), p1 (copy), fFlagShareSheetFriendsSort (copy), var5 (ref), chatShare (ref), var9 (ref), var8 (write), t_1 (ref), var7 (write), var6 (write)
				local var10 = shareSheetTelemetryModule.startMessageSendResult({
					context = p1.context,
					recipientSource = if fFlagShareSheetFriendsSort then p1.recipientSource else nil,
					telemetryId = p1.telemetryId or "",
					requestedConversationId = p3.id,
					hasCustomMessage = var5
				})
				
				return chatShare.sendToConversation(p3, var9):catch(function()
					return { status = "failure" }
				end):andThen(function(p4)
					-- upvalues: var10 (ref), var8 (copy), t_1 (copy), p3 (ref), var7 (copy), var6 (copy)
					var10(p4)
					
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
		end, {
			p1.chatShare, p1.context, items, p1.formatSuccessSnackbarText,
			p1.onCloseWithReason, p1.onSendActivated, p1.onShareSendResultSnackbar,
			p1.recipientSource, p1.selectedConversationIds, p1.telemetryId, p1.url, var4
		})
	}
end