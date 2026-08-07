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

local function _(p0) --[[ line: 56 | named "getConversationDisplayName" ]]
	local titleForViewer = p0.titleForViewer
	
	return if titleForViewer and titleForViewer ~= "" then titleForViewer else p0.title or ""
end

local _ = function(vectorA, vectorB) --[[ line: 61 | named "appendOtherTargets" ]]
	local var10 = vectorB - 1
	
	return if var10 <= 0 then vectorA elseif var10 == 1 then `{vectorA} + 1 other` else `{vectorA} + {var10} others`
end

return function(p1) --[[ line: 68 | named "useShareSheetViewModel" ]]
	-- upvalues: signalsReactModule (ref), getExternalChatMessageSenderStoreModule (ref), useConversationList (ref), useShareSheetSelectionModule (ref), useExternalChatConversationEligibilityModule (ref), shareSheetConstantsModule (ref), reactModule (ref), useLocalization (ref), fetchConversationListPageToSignalsModule (ref), shareSheetTelemetryModule (ref), getAppFeaturePolicies (ref)
	local var11 = signalsReactModule.useSignalState(getExternalChatMessageSenderStoreModule().getSender)
	local var12 = var11 ~= nil
	local var13 = useConversationList(var12)
	local var14 = useShareSheetSelectionModule()
	local listStatus = var13.listStatus
	local var15 = #var13.items > 0
	local var16 = var12 and (not var15 and (listStatus.error == nil and (if listStatus.isFetchingConversations ~= true then listStatus.hasFetchedInitialPage ~= true else true)))
	local var17 = useExternalChatConversationEligibilityModule({
		conversations = var13.items,
		isActive = p1.isOpen == true and ((var11 ~= nil and var11.isAvailable) and var15),
		isGroupChatEnabled = if var11 then var11.isGroupChatEnabled else false,
		maxConversationCount = shareSheetConstantsModule.FIntShareSheetMaxConversations
	})
	local var18, var19 = reactModule.useState(false)
	local var20 = reactModule.useRef(false)
	local var21 = useLocalization({
		send = "CommonUI.Features.Action.Send",
		share = "Feature.SocialShare.Action.Share"
	})
	reactModule.useEffect(function() --[[ line: 94 ]]
		-- upvalues: var12 (ref), fetchConversationListPageToSignalsModule (copy)
		if var12 then
			fetchConversationListPageToSignalsModule()
		end
	end, { var12 })
	
	return {
		canShareLink = getAppFeaturePolicies().getEligibleForExternalContentSharing(),
		conversationEligibility = var17,
		context = p1.context,
		isOpen = p1.isOpen == true,
		isSending = var18,
		isSocialRowLoading = var11 ~= nil and (var11.isAvailable and var16),
		messagePlaceholder = p1.messagePlaceholder or "Share a message",
		onConversationActivated = var14.onConversationActivated,
		onClose = p1.onClose,
		onSendActivated = reactModule.useCallback(function(p2) --[[ line: 100 ]]
			-- upvalues: var20 (ref), var11 (ref), var13 (ref), var14 (ref), var19 (ref), p1 (ref), shareSheetTelemetryModule (copy)
			if var20.current then return end
			local t = {}
			
			if var11 ~= nil then
				for i, v in var13.items do
					if var14.selectedConversationIds[v.id] and var11.canSendToConversation(v) then
						table.insert(t, v)
					end
				end
			end
			var14.onSendActivated()
			
			if var11 == nil or #t == 0 then return end
			var20.current = true
			var19(true)
			local var23 = false
			local var24 = false
			local var25 = false
			local t_1 = {}
			local var27 = if p2 == "" then p1.url else `{p1.url} {p2}`
			
			local function finishSending() --[[ line: 130 ]]
				-- upvalues: var20 (copy), var19 (copy), var24 (write), var25 (write), p1 (copy), var11 (copy), t (ref), t_1 (ref), shareSheetTelemetryModule (copy)
				var20.current = false
				var19(false)
				
				if not var24 and not var25 then return end
				if p1.onShareSendResultSnackbar then
					local var34
					local navigateToChat = var11.navigateToChat
					local var32 = if #t == 1 and #t_1 == 1 then t_1[1].conversationId else nil
					local onShareSendResultSnackbar = p1.onShareSendResultSnackbar
					local t_2 = {
						action = if var25 and navigateToChat then {
							text = "View",
							onActivated = function() --[[ line: 146 ]]
								-- upvalues: navigateToChat (ref), var32 (ref)
								navigateToChat(var32)
							end
						} else nil
					}
					
					if not var25 then
						var34 = if #t == 1 then "Message can't be sent" else "Messages can't be sent"
					elseif p1.formatSuccessSnackbarText then
						local var35 = p1.formatSuccessSnackbarText(t_1)
						local var36 = #t_1 - 1
						var34 = if var36 <= 0 then var35 elseif var36 == 1 then `{var35} + 1 other` else `{var35} + {var36} others`
					else
						var34 = if #t == 1 then "Message was sent" else "Messages were sent"
					end
					t_2.title = var34
					onShareSendResultSnackbar(t_2)
				end
				if var25 then
					shareSheetTelemetryModule.logShareSheetMessageSent({
						context = p1.context,
						url = p1.url,
						telemetryId = p1.telemetryId or ""
					})
					p1.onClose()
				end
			end
			
			local function send(p3) --[[ line: 171 ]]
				-- upvalues: var11 (copy), var27 (ref), var25 (write), t_1 (ref), var24 (write), var23 (write)
				return var11.sendToConversation(p3, var27):catch(function() --[[ line: 174 ]]
					return { status = "failure" }
				end):andThen(function(p4) --[[ line: 179 ]]
					-- upvalues: var25 (copy), t_1 (copy), p3 (ref), var24 (copy), var23 (copy)
					if p4.status == "success" and p4.conversationId then
						var25 = true
						local var37 = t_1
						local t = { conversationId = p4.conversationId }
						local var39 = p3
						local titleForViewer = var39.titleForViewer
						t.displayName = if titleForViewer and titleForViewer ~= "" then titleForViewer else var39.title or ""
						table.insert(var37, t)
						
						return
					elseif p4.status == "failure" then
						var24 = true
						
						return
					elseif p4.status == "declined" then
						var23 = true
					end
				end)
			end
			
			local var30 = send(t[1])
			
			for i = 2, #t do
				local var31 = t[i]
				var30 = var30:andThen(function() --[[ line: 197 ]]
					-- upvalues: var23 (write), send (ref), var31 (ref)
					if var23 then
						return
					end
					return send(var31)
				end)
			end
			var30:andThen(finishSending)
		end, {
			var13.items, var11, p1.context, p1.formatSuccessSnackbarText, p1.onClose,
			p1.onShareSendResultSnackbar, p1.telemetryId, p1.url, var14.onSendActivated,
			var14.selectedConversationIds
		}),
		selectedConversationIds = var14.selectedConversationIds,
		sendLabel = var21.send,
		shareLabel = var21.share,
		telemetryId = p1.telemetryId,
		shouldShowSocialRow = var11 ~= nil and (var11.isAvailable and (var15 or var16)),
		url = p1.url
	}
end