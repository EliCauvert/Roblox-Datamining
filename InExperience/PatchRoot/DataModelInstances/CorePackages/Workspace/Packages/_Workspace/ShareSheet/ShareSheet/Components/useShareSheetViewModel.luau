local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local appChatModule = require(parent.AppChat)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local fFlagSharePplPickerModule = require(shareSheet.Flags.FFlagSharePplPicker)
local var1 = if fFlagSharePplPickerModule then require(shareSheet.Stores.GetUniversalShareSheetStore) else nil
local getExternalChatMessageSenderStoreModule = require(parent.AppChat.GetExternalChatMessageSenderStore)
local useConversationList = appChatModule.Hooks.useConversationList
local fetchConversationListPageToSignalsModule = require(parent.AppChat.fetchConversationListPageToSignals)
local useExternalChatConversationEligibilityModule = require(parent.AppChat.useExternalChatConversationEligibility)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local shareSheetConstantsModule = require(shareSheet.ShareSheetConstants)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)
local _ = require(script.Parent.ShareSheetView)
local usePeoplePickerViewModel = require(script.Parent.PeoplePicker).usePeoplePickerViewModel
local useShareSheetSelectionModule = require(script.Parent.useShareSheetSelection)

local function _(p1)
	local titleForViewer = p1.titleForViewer
	
	return if titleForViewer and titleForViewer ~= "" then titleForViewer else p1.title or ""
end

local _ = function(vectorA, vectorB)
	local var2 = vectorB - 1
	
	return if var2 <= 0 then vectorA elseif var2 == 1 then `{vectorA} + 1 other` else `{vectorA} + {var2} others`
end

local function getCompactConversations(p1, p2, p3, p4)
	-- upvalues: shareSheetConstantsModule (ref)
	local t = {}
	local t_1 = {}
	
	for i = 1, math.min(#p1, shareSheetConstantsModule.FIntShareSheetMaxConversations) do
		local var2 = p1[i]
		table.insert(t, var2)
		t_1[var2.id] = true
	end
	for i_1, v in p2 do
		if p3[v.id] and not t_1[v.id] and p4(v) then
			table.insert(t, v)
			t_1[v.id] = true
		end
	end
	return t
end

return function(p5)
	-- upvalues: fFlagSharePplPickerModule (ref), var1 (ref), signalsReactModule (ref), getExternalChatMessageSenderStoreModule (ref), useConversationList (ref), useShareSheetSelectionModule (ref), useExternalChatConversationEligibilityModule (ref), shareSheetConstantsModule (ref), getCompactConversations (ref), reactModule (ref), useLocalization (ref), fetchConversationListPageToSignalsModule (ref), shareSheetTelemetryModule (ref), usePeoplePickerViewModel (ref), getAppFeaturePolicies (ref)
	local var3 = nil
	local var4 = nil
	
	if fFlagSharePplPickerModule then
		var3 = var1()
		var4 = signalsReactModule.useSignalState(var3.getIsPeoplePickerDisplayed)
	end
	local var5
	local var6 = signalsReactModule.useSignalState(getExternalChatMessageSenderStoreModule().getSender)
	local var7 = var6 ~= nil
	local var8 = useConversationList(var7)
	local var9 = useShareSheetSelectionModule()
	local listStatus = var8.listStatus
	local selectedConversationIds = var9.selectedConversationIds
	local var10 = #var8.items > 0
	local var11 = var7 and (not var10 and (listStatus.error == nil and (if listStatus.isFetchingConversations ~= true then listStatus.hasFetchedInitialPage ~= true else true)))
	local var12 = p5.isOpen == true and ((var6 ~= nil and var6.isAvailable) and var10)
	local var13 = useExternalChatConversationEligibilityModule({
		conversations = var8.items,
		isActive = var12,
		isGroupChatEnabled = if var6 then var6.isGroupChatEnabled else false,
		maxConversationCount = shareSheetConstantsModule.FIntShareSheetMaxConversations
	})
	local t = nil
	local t_1 = nil
	
	if fFlagSharePplPickerModule then
		var5 = useExternalChatConversationEligibilityModule({
			conversations = var8.items,
			isActive = var12 and var4,
			isGroupChatEnabled = if var6 then var6.isGroupChatEnabled else false,
			maxConversationCount = shareSheetConstantsModule.FIntShareSheetPeoplePickerMaxConversations
		})
		t = {
			eligibleConversations = getCompactConversations(var13.eligibleConversations, var8.items, selectedConversationIds, function(p6)
				-- upvalues: var6 (ref)
				return var6 ~= nil and var6.canSendToConversation(p6)
			end),
			isLoading = var13.isLoading
		}
		t_1 = {
			eligibleConversations = if var5.isLoading and not var13.isLoading then var13.eligibleConversations else var5.eligibleConversations,
			isLoading = var5.isLoading
		}
	end
	var5, var30 = reactModule.useState(false)
	local var14 = reactModule.useRef(false)
	local var15 = useLocalization({
		send = "CommonUI.Features.Action.Send",
		share = "Feature.SocialShare.Action.Share"
	})
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), fetchConversationListPageToSignalsModule (copy)
		if var7 then
			fetchConversationListPageToSignalsModule()
		end
	end, { var7 })
	local var16 = reactModule.useCallback(function()
		-- upvalues: shareSheetTelemetryModule (copy), p5 (ref)
		shareSheetTelemetryModule.logInteraction({
			context = p5.context,
			telemetryId = p5.telemetryId or "",
			interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageComposerFocused
		})
	end, { p5.context, p5.telemetryId })
	local var17 = reactModule.useCallback(function(p6)
		-- upvalues: selectedConversationIds (ref), shareSheetTelemetryModule (copy), p5 (ref), var9 (ref)
		shareSheetTelemetryModule.logInteraction({
			context = p5.context,
			telemetryId = p5.telemetryId or "",
			interactionType = if selectedConversationIds[p6] then "conversationDeselected" else "conversationSelected",
			requestedConversationId = p6
		})
		var9.onConversationActivated(p6)
	end, {
		p5.context,
		p5.telemetryId,
		selectedConversationIds,
		var9.onConversationActivated
	})
	local var18 = nil
	local var19 = nil
	
	if fFlagSharePplPickerModule then
		var18 = reactModule.useCallback(function()
			-- upvalues: var3 (write)
			var3.setIsPeoplePickerDisplayed(true)
		end, { var3 })
		var19 = usePeoplePickerViewModel({
			conversations = t_1.eligibleConversations,
			isLoading = t_1.isLoading,
			onBack = reactModule.useCallback(function()
				-- upvalues: var3 (write)
				var3.setIsPeoplePickerDisplayed(false)
			end, { var3 }),
			onConversationActivated = var17,
			selectedConversationIds = selectedConversationIds
		})
	end
	return {
		canShareLink = getAppFeaturePolicies().getEligibleForExternalContentSharing(),
		conversationEligibility = if fFlagSharePplPickerModule then t else var13,
		context = p5.context,
		isOpen = p5.isOpen == true,
		isPeoplePickerDisplayed = if fFlagSharePplPickerModule then var4 else nil,
		isSending = var5,
		isSocialRowLoading = var6 ~= nil and (var6.isAvailable and var11),
		messagePlaceholder = p5.messagePlaceholder or "Share a message",
		onComposerFocused = var16,
		onCloseWithReason = p5.onCloseWithReason,
		onConversationActivated = var17,
		onMoreActivated = if fFlagSharePplPickerModule then var18 else nil,
		onSendActivated = reactModule.useCallback(function(p6)
			-- upvalues: var14 (ref), shareSheetTelemetryModule (copy), p5 (ref), var6 (ref), var8 (ref), selectedConversationIds (ref), var9 (ref), var30 (ref)
			if var14.current then return end
			if string.find(p6, "%S") ~= nil then
				shareSheetTelemetryModule.logInteraction({
					context = p5.context,
					telemetryId = p5.telemetryId or "",
					interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageSubmitted
				})
			end
			local t = {}
			
			if var6 ~= nil then
				for i, v in var8.items do
					if selectedConversationIds[v.id] and var6.canSendToConversation(v) then
						table.insert(t, v)
					end
				end
			end
			var9.onSendActivated()
			
			if var6 == nil or #t == 0 then return end
			var14.current = true
			var30(true)
			local var20 = false
			local var21 = false
			local var22 = false
			local t_1 = {}
			local var23 = if p6 == "" then p5.url else `{p5.url} {p6}`
			
			local function finishSending()
				-- upvalues: var14 (copy), var30 (copy), var21 (write), var22 (write), p5 (copy), var6 (copy), t (ref), t_1 (ref), shareSheetTelemetryModule (copy)
				var14.current = false
				var30(false)
				
				if not var21 and not var22 then return end
				if p5.onShareSendResultSnackbar then
					local var24
					local navigateToChat = var6.navigateToChat
					local var25 = if #t == 1 and #t_1 == 1 then t_1[1].conversationId else nil
					local onShareSendResultSnackbar = p5.onShareSendResultSnackbar
					local t_2 = {
						action = if var22 and navigateToChat then {
							text = "View",
							onActivated = function()
								-- upvalues: navigateToChat (ref), var25 (ref)
								navigateToChat(var25)
							end
						} else nil
					}
					
					if not var22 then
						var24 = if #t == 1 then "Message can't be sent" else "Messages can't be sent"
					elseif p5.formatSuccessSnackbarText then
						local var26 = p5.formatSuccessSnackbarText(t_1)
						local var27 = #t_1 - 1
						var24 = if var27 <= 0 then var26 elseif var27 == 1 then `{var26} + 1 other` else `{var26} + {var27} others`
					else
						var24 = if #t == 1 then "Message was sent" else "Messages were sent"
					end
					t_2.title = var24
					onShareSendResultSnackbar(t_2)
				end
				if var22 then
					p5.onCloseWithReason(shareSheetTelemetryModule.CloseReason.SendSuccess)
				end
			end
			
			local function send(p7)
				-- upvalues: var6 (copy), var23 (ref), var22 (write), t_1 (ref), var21 (write), var20 (write)
				return var6.sendToConversation(p7, var23):catch(function()
					return { status = "failure" }
				end):andThen(function(p8)
					-- upvalues: var22 (copy), t_1 (copy), p7 (ref), var21 (copy), var20 (copy)
					if p8.status == "success" and p8.conversationId then
						var22 = true
						local var24 = t_1
						local t = { conversationId = p8.conversationId }
						local var25 = p7
						local titleForViewer = var25.titleForViewer
						t.displayName = if titleForViewer and titleForViewer ~= "" then titleForViewer else var25.title or ""
						table.insert(var24, t)
						
						return
					elseif p8.status == "failure" then
						var21 = true
						
						return
					elseif p8.status == "declined" then
						var20 = true
					end
				end)
			end
			
			local var24 = send(t[1])
			
			for i = 2, #t do
				local var25 = t[i]
				var24 = var24:andThen(function()
					-- upvalues: var20 (write), send (ref), var25 (ref)
					if var20 then
						return
					end
					return send(var25)
				end)
			end
			var24:andThen(finishSending)
		end, {
			var8.items, var6, p5.context, p5.formatSuccessSnackbarText,
			p5.onCloseWithReason, p5.onShareSendResultSnackbar, p5.telemetryId, p5.url,
			selectedConversationIds, var9.onSendActivated
		}),
		peoplePicker = if fFlagSharePplPickerModule then var19.viewModel else nil,
		selectedConversationIds = selectedConversationIds,
		sendLabel = var15.send,
		shareLabel = var15.share,
		telemetryId = p5.telemetryId,
		shouldShowSocialRow = var6 ~= nil and (var6.isAvailable and (var10 or var11)),
		url = p5.url
	}
end