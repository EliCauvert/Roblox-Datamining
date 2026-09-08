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
	-- upvalues: signalsReactModule (ref), getExternalChatMessageSenderStoreModule (ref), useConversationList (ref), useShareSheetSelectionModule (ref), useExternalChatConversationEligibilityModule (ref), shareSheetConstantsModule (ref), reactModule (ref), useLocalization (ref), fetchConversationListPageToSignalsModule (ref), shareSheetTelemetryModule (ref), getAppFeaturePolicies (ref)
	local var1 = signalsReactModule.useSignalState(getExternalChatMessageSenderStoreModule().getSender)
	local var2 = var1 ~= nil
	local var3 = useConversationList(var2)
	local var4 = useShareSheetSelectionModule()
	local listStatus = var3.listStatus
	local var5 = #var3.items > 0
	local var6 = var2 and (not var5 and (listStatus.error == nil and (if listStatus.isFetchingConversations ~= true then listStatus.hasFetchedInitialPage ~= true else true)))
	local var7 = useExternalChatConversationEligibilityModule({
		conversations = var3.items,
		isActive = p1.isOpen == true and ((var1 ~= nil and var1.isAvailable) and var5),
		isGroupChatEnabled = if var1 then var1.isGroupChatEnabled else false,
		maxConversationCount = shareSheetConstantsModule.FIntShareSheetMaxConversations
	})
	local var8, var9 = reactModule.useState(false)
	local var10 = reactModule.useRef(false)
	local var11 = useLocalization({
		send = "CommonUI.Features.Action.Send",
		share = "Feature.SocialShare.Action.Share"
	})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), fetchConversationListPageToSignalsModule (copy)
		if var2 then
			fetchConversationListPageToSignalsModule()
		end
	end, { var2 })
	local _ = nil
	local _ = var4.onConversationActivated
	
	return {
		canShareLink = getAppFeaturePolicies().getEligibleForExternalContentSharing(),
		conversationEligibility = var7,
		context = p1.context,
		isOpen = p1.isOpen == true,
		isSending = var8,
		isSocialRowLoading = var1 ~= nil and (var1.isAvailable and var6),
		messagePlaceholder = p1.messagePlaceholder or "Share a message",
		onComposerFocused = reactModule.useCallback(function()
			-- upvalues: shareSheetTelemetryModule (copy), p1 (ref)
			shareSheetTelemetryModule.logInteraction({
				context = p1.context,
				telemetryId = p1.telemetryId or "",
				interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageComposerFocused
			})
		end, { p1.context, p1.telemetryId }),
		onCloseWithReason = p1.onCloseWithReason,
		onConversationActivated = reactModule.useCallback(function(p2)
			-- upvalues: var4 (ref), shareSheetTelemetryModule (copy), p1 (ref)
			shareSheetTelemetryModule.logInteraction({
				context = p1.context,
				telemetryId = p1.telemetryId or "",
				interactionType = if var4.selectedConversationIds[p2] then "conversationDeselected" else "conversationSelected",
				requestedConversationId = p2
			})
			var4.onConversationActivated(p2)
		end, {
			p1.context,
			p1.telemetryId,
			var4.onConversationActivated,
			var4.selectedConversationIds
		}),
		onSendActivated = reactModule.useCallback(function(p2)
			-- upvalues: var10 (ref), shareSheetTelemetryModule (copy), p1 (ref), var1 (ref), var3 (ref), var4 (ref), var9 (ref)
			if var10.current then return end
			if string.find(p2, "%S") ~= nil then
				shareSheetTelemetryModule.logInteraction({
					context = p1.context,
					telemetryId = p1.telemetryId or "",
					interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageSubmitted
				})
			end
			local t = {}
			
			if var1 ~= nil then
				for i, v in var3.items do
					if var4.selectedConversationIds[v.id] and var1.canSendToConversation(v) then
						table.insert(t, v)
					end
				end
			end
			var4.onSendActivated()
			
			if var1 == nil or #t == 0 then return end
			var10.current = true
			var9(true)
			local var12 = false
			local var13 = false
			local var14 = false
			local t_1 = {}
			local var15 = if p2 == "" then p1.url else `{p1.url} {p2}`
			
			local function finishSending()
				-- upvalues: var10 (copy), var9 (copy), var13 (write), var14 (write), p1 (copy), var1 (copy), t (ref), t_1 (ref), shareSheetTelemetryModule (copy)
				var10.current = false
				var9(false)
				
				if not var13 and not var14 then return end
				if p1.onShareSendResultSnackbar then
					local var16
					local navigateToChat = var1.navigateToChat
					local var17 = if #t == 1 and #t_1 == 1 then t_1[1].conversationId else nil
					local onShareSendResultSnackbar = p1.onShareSendResultSnackbar
					local t_2 = {
						action = if var14 and navigateToChat then {
							text = "View",
							onActivated = function()
								-- upvalues: navigateToChat (ref), var17 (ref)
								navigateToChat(var17)
							end
						} else nil
					}
					
					if not var14 then
						var16 = if #t == 1 then "Message can't be sent" else "Messages can't be sent"
					elseif p1.formatSuccessSnackbarText then
						local var18 = p1.formatSuccessSnackbarText(t_1)
						local var19 = #t_1 - 1
						var16 = if var19 <= 0 then var18 elseif var19 == 1 then `{var18} + 1 other` else `{var18} + {var19} others`
					else
						var16 = if #t == 1 then "Message was sent" else "Messages were sent"
					end
					t_2.title = var16
					onShareSendResultSnackbar(t_2)
				end
				if var14 then
					p1.onCloseWithReason(shareSheetTelemetryModule.CloseReason.SendSuccess)
				end
			end
			
			local function send(p3)
				-- upvalues: var1 (copy), var15 (ref), var14 (write), t_1 (ref), var13 (write), var12 (write)
				return var1.sendToConversation(p3, var15):catch(function()
					return { status = "failure" }
				end):andThen(function(p4)
					-- upvalues: var14 (copy), t_1 (copy), p3 (ref), var13 (copy), var12 (copy)
					if p4.status == "success" and p4.conversationId then
						var14 = true
						local var16 = t_1
						local t = { conversationId = p4.conversationId }
						local var17 = p3
						local titleForViewer = var17.titleForViewer
						t.displayName = if titleForViewer and titleForViewer ~= "" then titleForViewer else var17.title or ""
						table.insert(var16, t)
						
						return
					elseif p4.status == "failure" then
						var13 = true
						
						return
					elseif p4.status == "declined" then
						var12 = true
					end
				end)
			end
			
			local var16 = send(t[1])
			
			for i = 2, #t do
				local var17 = t[i]
				var16 = var16:andThen(function()
					-- upvalues: var12 (write), send (ref), var17 (ref)
					if var12 then
						return
					end
					return send(var17)
				end)
			end
			var16:andThen(finishSending)
		end, {
			var3.items, var1, p1.context, p1.formatSuccessSnackbarText,
			p1.onCloseWithReason, p1.onShareSendResultSnackbar, p1.telemetryId, p1.url,
			var4.onSendActivated, var4.selectedConversationIds
		}),
		selectedConversationIds = var4.selectedConversationIds,
		sendLabel = var11.send,
		shareLabel = var11.share,
		telemetryId = p1.telemetryId,
		shouldShowSocialRow = var1 ~= nil and (var1.isAvailable and (var5 or var6)),
		url = p1.url
	}
end