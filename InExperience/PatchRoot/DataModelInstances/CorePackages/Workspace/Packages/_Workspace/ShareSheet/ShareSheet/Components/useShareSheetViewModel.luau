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

local function _(p0) --[[ line: 59 | named "getConversationDisplayName" ]]
	local titleForViewer = p0.titleForViewer
	
	return if titleForViewer and titleForViewer ~= "" then titleForViewer else p0.title or ""
end

local _ = function(vectorA, vectorB) --[[ line: 64 | named "appendOtherTargets" ]]
	local var11 = vectorB - 1
	
	return if var11 <= 0 then vectorA elseif var11 == 1 then `{vectorA} + 1 other` else `{vectorA} + {var11} others`
end

return function(p1) --[[ line: 71 | named "useShareSheetViewModel" ]]
	-- upvalues: signalsReactModule (ref), getExternalChatMessageSenderStoreModule (ref), useConversationList (ref), useShareSheetSelectionModule (ref), useExternalChatConversationEligibilityModule (ref), shareSheetConstantsModule (ref), reactModule (ref), useLocalization (ref), fetchConversationListPageToSignalsModule (ref), fFlagShareSheetTelemetryRefactorModule (ref), shareSheetTelemetryModule (ref), getAppFeaturePolicies (ref)
	local var24
	local var12 = signalsReactModule.useSignalState(getExternalChatMessageSenderStoreModule().getSender)
	local var13 = var12 ~= nil
	local var14 = useConversationList(var13)
	local var15 = useShareSheetSelectionModule()
	local listStatus = var14.listStatus
	local var16 = #var14.items > 0
	local var17 = var13 and (not var16 and (listStatus.error == nil and (if listStatus.isFetchingConversations ~= true then listStatus.hasFetchedInitialPage ~= true else true)))
	local var18 = useExternalChatConversationEligibilityModule({
		conversations = var14.items,
		isActive = p1.isOpen == true and ((var12 ~= nil and var12.isAvailable) and var16),
		isGroupChatEnabled = if var12 then var12.isGroupChatEnabled else false,
		maxConversationCount = shareSheetConstantsModule.FIntShareSheetMaxConversations
	})
	local var19, var20 = reactModule.useState(false)
	local var21 = reactModule.useRef(false)
	local var22 = useLocalization({
		send = "CommonUI.Features.Action.Send",
		share = "Feature.SocialShare.Action.Share"
	})
	reactModule.useEffect(function() --[[ line: 97 ]]
		-- upvalues: var13 (ref), fetchConversationListPageToSignalsModule (copy)
		if var13 then
			fetchConversationListPageToSignalsModule()
		end
	end, { var13 })
	local var23 = if fFlagShareSheetTelemetryRefactorModule then reactModule.useCallback(function() --[[ line: 104 ]]
		-- upvalues: p1 (ref), shareSheetTelemetryModule (copy)
		p1.onCloseWithReason(shareSheetTelemetryModule.CloseReason.UserDismissed)
	end, { p1.onCloseWithReason }) else p1.onClose
	local _ = nil
	local onConversationActivated = var15.onConversationActivated
	
	if fFlagShareSheetTelemetryRefactorModule then
		var24 = reactModule.useCallback(function() --[[ line: 111 ]]
			-- upvalues: shareSheetTelemetryModule (copy), p1 (ref)
			shareSheetTelemetryModule.logInteraction({
				context = p1.context,
				telemetryId = p1.telemetryId or "",
				interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageComposerFocused
			})
		end, { p1.context, p1.telemetryId })
		onConversationActivated = reactModule.useCallback(function(p2) --[[ line: 119 ]]
			-- upvalues: var15 (ref), shareSheetTelemetryModule (copy), p1 (ref)
			shareSheetTelemetryModule.logInteraction({
				context = p1.context,
				telemetryId = p1.telemetryId or "",
				interactionType = if var15.selectedConversationIds[p2] then "conversationDeselected" else "conversationSelected",
				requestedConversationId = p2
			})
			var15.onConversationActivated(p2)
		end, {
			p1.context,
			p1.telemetryId,
			var15.onConversationActivated,
			var15.selectedConversationIds
		})
	else
		var24 = nil
	end
	return {
		canShareLink = getAppFeaturePolicies().getEligibleForExternalContentSharing(),
		conversationEligibility = var18,
		context = p1.context,
		isOpen = p1.isOpen == true,
		isSending = var19,
		isSocialRowLoading = var12 ~= nil and (var12.isAvailable and var17),
		messagePlaceholder = p1.messagePlaceholder or "Share a message",
		onComposerFocused = var24,
		onConversationActivated = onConversationActivated,
		onClose = var23,
		onSendActivated = reactModule.useCallback(function(p3) --[[ line: 142 ]]
			-- upvalues: var21 (ref), fFlagShareSheetTelemetryRefactorModule (copy), shareSheetTelemetryModule (copy), p1 (ref), var12 (ref), var14 (ref), var15 (ref), var20 (ref)
			if var21.current then return end
			if fFlagShareSheetTelemetryRefactorModule and string.find(p3, "%S") ~= nil then
				shareSheetTelemetryModule.logInteraction({
					context = p1.context,
					telemetryId = p1.telemetryId or "",
					interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageSubmitted
				})
			end
			local t = {}
			
			if var12 ~= nil then
				for i, v in var14.items do
					if var15.selectedConversationIds[v.id] and var12.canSendToConversation(v) then
						table.insert(t, v)
					end
				end
			end
			var15.onSendActivated()
			
			if var12 == nil or #t == 0 then return end
			var21.current = true
			var20(true)
			local var26 = false
			local var27 = false
			local var28 = false
			local t_1 = {}
			local var30 = if p3 == "" then p1.url else `{p1.url} {p3}`
			
			local function finishSending() --[[ line: 180 ]]
				-- upvalues: var21 (copy), var20 (copy), var27 (write), var28 (write), p1 (copy), var12 (copy), t (ref), t_1 (ref), fFlagShareSheetTelemetryRefactorModule (copy), shareSheetTelemetryModule (copy)
				var21.current = false
				var20(false)
				
				if not var27 and not var28 then return end
				if p1.onShareSendResultSnackbar then
					local var37
					local navigateToChat = var12.navigateToChat
					local var35 = if #t == 1 and #t_1 == 1 then t_1[1].conversationId else nil
					local onShareSendResultSnackbar = p1.onShareSendResultSnackbar
					local t_2 = {
						action = if var28 and navigateToChat then {
							text = "View",
							onActivated = function() --[[ line: 196 ]]
								-- upvalues: navigateToChat (ref), var35 (ref)
								navigateToChat(var35)
							end
						} else nil
					}
					
					if not var28 then
						var37 = if #t == 1 then "Message can't be sent" else "Messages can't be sent"
					elseif p1.formatSuccessSnackbarText then
						local var38 = p1.formatSuccessSnackbarText(t_1)
						local var39 = #t_1 - 1
						var37 = if var39 <= 0 then var38 elseif var39 == 1 then `{var38} + 1 other` else `{var38} + {var39} others`
					else
						var37 = if #t == 1 then "Message was sent" else "Messages were sent"
					end
					t_2.title = var37
					onShareSendResultSnackbar(t_2)
				end
				if var28 then
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
			
			local function send(p4) --[[ line: 225 ]]
				-- upvalues: var12 (copy), var30 (ref), var28 (write), t_1 (ref), var27 (write), var26 (write)
				return var12.sendToConversation(p4, var30):catch(function() --[[ line: 228 ]]
					return { status = "failure" }
				end):andThen(function(p5) --[[ line: 233 ]]
					-- upvalues: var28 (copy), t_1 (copy), p4 (ref), var27 (copy), var26 (copy)
					if p5.status == "success" and p5.conversationId then
						var28 = true
						local var40 = t_1
						local t = { conversationId = p5.conversationId }
						local var42 = p4
						local titleForViewer = var42.titleForViewer
						t.displayName = if titleForViewer and titleForViewer ~= "" then titleForViewer else var42.title or ""
						table.insert(var40, t)
						
						return
					elseif p5.status == "failure" then
						var27 = true
						
						return
					elseif p5.status == "declined" then
						var26 = true
					end
				end)
			end
			
			local var33 = send(t[1])
			
			for i = 2, #t do
				local var34 = t[i]
				var33 = var33:andThen(function() --[[ line: 251 ]]
					-- upvalues: var26 (write), send (ref), var34 (ref)
					if var26 then
						return
					end
					return send(var34)
				end)
			end
			var33:andThen(finishSending)
		end, {
			var14.items, var12, p1.context, p1.formatSuccessSnackbarText, p1.onClose,
			p1.onCloseWithReason, p1.onShareSendResultSnackbar, p1.telemetryId, p1.url,
			var15.onSendActivated, var15.selectedConversationIds
		}),
		selectedConversationIds = var15.selectedConversationIds,
		sendLabel = var22.send,
		shareLabel = var22.share,
		telemetryId = p1.telemetryId,
		shouldShowSocialRow = var12 ~= nil and (var12.isAvailable and (var16 or var17)),
		url = p1.url
	}
end