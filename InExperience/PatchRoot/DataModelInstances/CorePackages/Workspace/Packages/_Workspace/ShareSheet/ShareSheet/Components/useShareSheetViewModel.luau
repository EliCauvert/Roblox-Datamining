local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local appChatModule = require(parent.AppChat)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local getExternalChatMessageSenderStoreModule = require(parent.AppChat.GetExternalChatMessageSenderStore)
local useConversationList = appChatModule.Hooks.useConversationList
local fetchConversationListPageToSignalsModule = require(parent.AppChat.fetchConversationListPageToSignals)
local useExternalChatConversationEligibilityModule = require(parent.AppChat.useExternalChatConversationEligibility)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local fFlagShareSheetTelemetryRefactorModule = require(shareSheet.Flags.FFlagShareSheetTelemetryRefactor)
local shareSheetConstantsModule = require(shareSheet.ShareSheetConstants)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)
local _ = require(script.Parent.ShareSheetView)
local useShareSheetSelectionModule = require(script.Parent.useShareSheetSelection)

local function _(p1)
	local titleForViewer = p1.titleForViewer
	
	return if titleForViewer and titleForViewer ~= "" then titleForViewer else p1.title or ""
end

local _ = function(vectorA, vectorB)
	local var1 = vectorB - 1
	
	return if var1 <= 0 then vectorA elseif var1 == 1 then `{vectorA} + 1 other` else `{vectorA} + {var1} others`
end

return function(p1)
	-- upvalues: signalsReactModule (ref), getExternalChatMessageSenderStoreModule (ref), useConversationList (ref), useShareSheetSelectionModule (ref), useExternalChatConversationEligibilityModule (ref), shareSheetConstantsModule (ref), reactModule (ref), useLocalization (ref), fetchConversationListPageToSignalsModule (ref), fFlagShareSheetTelemetryRefactorModule (ref), shareSheetTelemetryModule (ref), getAppFeaturePolicies (ref)
	local var1
	local var2 = signalsReactModule.useSignalState(getExternalChatMessageSenderStoreModule().getSender)
	local var3 = var2 ~= nil
	local var4 = useConversationList(var3)
	local var5 = useShareSheetSelectionModule()
	local listStatus = var4.listStatus
	local var6 = #var4.items > 0
	local var7 = var3 and (not var6 and (listStatus.error == nil and (if listStatus.isFetchingConversations ~= true then listStatus.hasFetchedInitialPage ~= true else true)))
	local var8 = useExternalChatConversationEligibilityModule({
		conversations = var4.items,
		isActive = p1.isOpen == true and ((var2 ~= nil and var2.isAvailable) and var6),
		isGroupChatEnabled = if var2 then var2.isGroupChatEnabled else false,
		maxConversationCount = shareSheetConstantsModule.FIntShareSheetMaxConversations
	})
	local var9, var10 = reactModule.useState(false)
	local var11 = reactModule.useRef(false)
	local var12 = useLocalization({
		send = "CommonUI.Features.Action.Send",
		share = "Feature.SocialShare.Action.Share"
	})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), fetchConversationListPageToSignalsModule (copy)
		if var3 then
			fetchConversationListPageToSignalsModule()
		end
	end, { var3 })
	local var13 = if fFlagShareSheetTelemetryRefactorModule then reactModule.useCallback(function()
		-- upvalues: p1 (ref), shareSheetTelemetryModule (copy)
		p1.onCloseWithReason(shareSheetTelemetryModule.CloseReason.UserDismissed)
	end, { p1.onCloseWithReason }) else p1.onClose
	local _ = nil
	local onConversationActivated = var5.onConversationActivated
	
	if fFlagShareSheetTelemetryRefactorModule then
		var1 = reactModule.useCallback(function()
			-- upvalues: shareSheetTelemetryModule (copy), p1 (ref)
			shareSheetTelemetryModule.logInteraction({
				context = p1.context,
				telemetryId = p1.telemetryId or "",
				interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageComposerFocused
			})
		end, { p1.context, p1.telemetryId })
		onConversationActivated = reactModule.useCallback(function(p2)
			-- upvalues: var5 (ref), shareSheetTelemetryModule (copy), p1 (ref)
			shareSheetTelemetryModule.logInteraction({
				context = p1.context,
				telemetryId = p1.telemetryId or "",
				interactionType = if var5.selectedConversationIds[p2] then "conversationDeselected" else "conversationSelected",
				requestedConversationId = p2
			})
			var5.onConversationActivated(p2)
		end, {
			p1.context,
			p1.telemetryId,
			var5.onConversationActivated,
			var5.selectedConversationIds
		})
	else
		var1 = nil
	end
	return {
		canShareLink = getAppFeaturePolicies().getEligibleForExternalContentSharing(),
		conversationEligibility = var8,
		context = p1.context,
		isOpen = p1.isOpen == true,
		isSending = var9,
		isSocialRowLoading = var2 ~= nil and (var2.isAvailable and var7),
		messagePlaceholder = p1.messagePlaceholder or "Share a message",
		onComposerFocused = var1,
		onConversationActivated = onConversationActivated,
		onClose = var13,
		onSendActivated = reactModule.useCallback(function(p2)
			-- upvalues: var11 (ref), fFlagShareSheetTelemetryRefactorModule (copy), shareSheetTelemetryModule (copy), p1 (ref), var2 (ref), var4 (ref), var5 (ref), var10 (ref)
			if var11.current then return end
			if fFlagShareSheetTelemetryRefactorModule and string.find(p2, "%S") ~= nil then
				shareSheetTelemetryModule.logInteraction({
					context = p1.context,
					telemetryId = p1.telemetryId or "",
					interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageSubmitted
				})
			end
			local t = {}
			
			if var2 ~= nil then
				for i, v in var4.items do
					if var5.selectedConversationIds[v.id] and var2.canSendToConversation(v) then
						table.insert(t, v)
					end
				end
			end
			var5.onSendActivated()
			
			if var2 == nil or #t == 0 then return end
			var11.current = true
			var10(true)
			local var14 = false
			local var15 = false
			local var16 = false
			local t_1 = {}
			local var17 = if p2 == "" then p1.url else `{p1.url} {p2}`
			
			local function finishSending()
				-- upvalues: var11 (copy), var10 (copy), var15 (write), var16 (write), p1 (copy), var2 (copy), t (ref), t_1 (ref), fFlagShareSheetTelemetryRefactorModule (copy), shareSheetTelemetryModule (copy)
				var11.current = false
				var10(false)
				
				if not var15 and not var16 then return end
				if p1.onShareSendResultSnackbar then
					local var18
					local navigateToChat = var2.navigateToChat
					local var19 = if #t == 1 and #t_1 == 1 then t_1[1].conversationId else nil
					local onShareSendResultSnackbar = p1.onShareSendResultSnackbar
					local t_2 = {
						action = if var16 and navigateToChat then {
							text = "View",
							onActivated = function()
								-- upvalues: navigateToChat (ref), var19 (ref)
								navigateToChat(var19)
							end
						} else nil
					}
					
					if not var16 then
						var18 = if #t == 1 then "Message can't be sent" else "Messages can't be sent"
					elseif p1.formatSuccessSnackbarText then
						local var20 = p1.formatSuccessSnackbarText(t_1)
						local var21 = #t_1 - 1
						var18 = if var21 <= 0 then var20 elseif var21 == 1 then `{var20} + 1 other` else `{var20} + {var21} others`
					else
						var18 = if #t == 1 then "Message was sent" else "Messages were sent"
					end
					t_2.title = var18
					onShareSendResultSnackbar(t_2)
				end
				if var16 then
					if fFlagShareSheetTelemetryRefactorModule then
						p1.onCloseWithReason(shareSheetTelemetryModule.CloseReason.SendSuccess)
						
						return
					end
					shareSheetTelemetryModule.logShareSheetMessageSent({
						context = p1.context,
						url = p1.url,
						telemetryId = p1.telemetryId or ""
					})
					p1.onClose()
				end
			end
			
			local function send(p3)
				-- upvalues: var2 (copy), var17 (ref), var16 (write), t_1 (ref), var15 (write), var14 (write)
				return var2.sendToConversation(p3, var17):catch(function()
					return { status = "failure" }
				end):andThen(function(p4)
					-- upvalues: var16 (copy), t_1 (copy), p3 (ref), var15 (copy), var14 (copy)
					if p4.status == "success" and p4.conversationId then
						var16 = true
						local var18 = t_1
						local t = { conversationId = p4.conversationId }
						local var19 = p3
						local titleForViewer = var19.titleForViewer
						t.displayName = if titleForViewer and titleForViewer ~= "" then titleForViewer else var19.title or ""
						table.insert(var18, t)
						
						return
					elseif p4.status == "failure" then
						var15 = true
						
						return
					elseif p4.status == "declined" then
						var14 = true
					end
				end)
			end
			
			local var18 = send(t[1])
			
			for i = 2, #t do
				local var19 = t[i]
				var18 = var18:andThen(function()
					-- upvalues: var14 (write), send (ref), var19 (ref)
					if var14 then
						return
					end
					return send(var19)
				end)
			end
			var18:andThen(finishSending)
		end, {
			var4.items, var2, p1.context, p1.formatSuccessSnackbarText, p1.onClose,
			p1.onCloseWithReason, p1.onShareSendResultSnackbar, p1.telemetryId, p1.url,
			var5.onSendActivated, var5.selectedConversationIds
		}),
		selectedConversationIds = var5.selectedConversationIds,
		sendLabel = var12.send,
		shareLabel = var12.share,
		telemetryId = p1.telemetryId,
		shouldShowSocialRow = var2 ~= nil and (var2.isAvailable and (var6 or var7)),
		url = p1.url
	}
end