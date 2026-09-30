local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local fFlagShareSheetHoldRecipientsWhileSendingModule = require(shareSheet.Flags.FFlagShareSheetHoldRecipientsWhileSending)
local fFlagShareSheetLocalizeStringsModule = require(shareSheet.Flags.FFlagShareSheetLocalizeStrings)
local fFlagShareSheetPeoplePickerEnabledModule = require(shareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)
local var1 = if fFlagShareSheetPeoplePickerEnabledModule then require(shareSheet.Stores.GetUniversalShareSheetStore) else nil
local getExternalChatMessageSenderStoreModule = require(parent.AppChat.GetExternalChatMessageSenderStore)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)
local _ = require(script.Parent.ShareSheetView)
local var2 = if fFlagShareSheetPeoplePickerEnabledModule then require(script.Parent.PeoplePicker.usePeoplePickerViewModel) else nil
local useShareSheetConversationModelModule = require(script.Parent.useShareSheetConversationModel)
local useShareSheetSelectionModule = require(script.Parent.useShareSheetSelection)
local useShareSheetSendModule = require(script.Parent.useShareSheetSend)

return function(p1)
	-- upvalues: fFlagShareSheetPeoplePickerEnabledModule (ref), var1 (ref), signalsReactModule (ref), getExternalChatMessageSenderStoreModule (ref), useShareSheetSelectionModule (ref), fFlagShareSheetHoldRecipientsWhileSendingModule (ref), useShareSheetSendModule (ref), useShareSheetConversationModelModule (ref), useLocalization (ref), fFlagShareSheetLocalizeStringsModule (ref), reactModule (ref), shareSheetTelemetryModule (ref), var2 (ref), getAppFeaturePolicies (ref)
	local var3 = nil
	local var4 = nil
	
	if fFlagShareSheetPeoplePickerEnabledModule then
		var3 = var1()
		var4 = signalsReactModule.useSignalState(var3.getIsPeoplePickerDisplayed)
	end
	local var5 = signalsReactModule.useSignalState(getExternalChatMessageSenderStoreModule().getSender)
	local var6 = useShareSheetSelectionModule()
	local selectedConversationIds = var6.selectedConversationIds
	local var7 = if fFlagShareSheetHoldRecipientsWhileSendingModule then useShareSheetSendModule({
		chatShare = var5,
		context = p1.context,
		formatSuccessSnackbarText = p1.formatSuccessSnackbarText,
		onCloseWithReason = p1.onCloseWithReason,
		onSendActivated = var6.onSendActivated,
		onShareSendResultSnackbar = p1.onShareSendResultSnackbar,
		selectedConversationIds = selectedConversationIds,
		telemetryId = p1.telemetryId,
		url = p1.url
	}) else nil
	local var8 = useShareSheetConversationModelModule({
		chatShare = var5,
		isOpen = p1.isOpen == true,
		isPeoplePickerDisplayed = var4,
		isSending = if fFlagShareSheetHoldRecipientsWhileSendingModule then var7.isSending else nil,
		selectedConversationIds = selectedConversationIds
	})
	local var9 = useLocalization({
		send = "CommonUI.Features.Action.Send",
		share = "Feature.SocialShare.Action.Share",
		messagePlaceholder = if fFlagShareSheetLocalizeStringsModule then "Feature.UniversalShareSheet.InputPlaceholder.ShareMessage" else nil
	})
	local var10 = reactModule.useCallback(function()
		-- upvalues: shareSheetTelemetryModule (copy), p1 (ref)
		shareSheetTelemetryModule.logInteraction({
			context = p1.context,
			telemetryId = p1.telemetryId or "",
			interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageComposerFocused
		})
	end, { p1.context, p1.telemetryId })
	local var11 = reactModule.useCallback(function(p2)
		-- upvalues: fFlagShareSheetHoldRecipientsWhileSendingModule (copy), var7 (write), selectedConversationIds (ref), shareSheetTelemetryModule (copy), p1 (ref), var6 (ref)
		if fFlagShareSheetHoldRecipientsWhileSendingModule and var7.isSending then
			return
		end
		shareSheetTelemetryModule.logInteraction({
			context = p1.context,
			telemetryId = p1.telemetryId or "",
			interactionType = if selectedConversationIds[p2] then "conversationDeselected" else "conversationSelected",
			requestedConversationId = p2
		})
		var6.onConversationActivated(p2)
	end, {
		p1.context,
		p1.telemetryId,
		selectedConversationIds,
		var6.onConversationActivated,
		if fFlagShareSheetHoldRecipientsWhileSendingModule then var7.isSending else false
	})
	local var12 = nil
	local var13 = nil
	
	if fFlagShareSheetPeoplePickerEnabledModule then
		var12 = reactModule.useCallback(function()
			-- upvalues: var3 (write)
			var3.setIsPeoplePickerDisplayed(true)
		end, { var3 })
		local peoplePickerEligibility = var8.peoplePickerEligibility
		var13 = var2({
			conversations = peoplePickerEligibility.eligibleConversations,
			isEligibilityLoading = peoplePickerEligibility.isLoading,
			isPeoplePickerDisplayed = var4 == true,
			listStatus = var8.listStatus,
			onBack = reactModule.useCallback(function()
				-- upvalues: var3 (write)
				var3.setIsPeoplePickerDisplayed(false)
			end, { var3 }),
			onConversationActivated = var11,
			selectedConversationIds = selectedConversationIds
		})
	end
	if not fFlagShareSheetHoldRecipientsWhileSendingModule then
		var7 = useShareSheetSendModule({
			chatShare = var5,
			context = p1.context,
			conversations = var8.conversations,
			formatSuccessSnackbarText = p1.formatSuccessSnackbarText,
			onCloseWithReason = p1.onCloseWithReason,
			onSendActivated = var6.onSendActivated,
			onShareSendResultSnackbar = p1.onShareSendResultSnackbar,
			selectedConversationIds = selectedConversationIds,
			telemetryId = p1.telemetryId,
			url = p1.url
		})
	end
	return {
		canShareLink = getAppFeaturePolicies().getEligibleForExternalContentSharing(),
		conversationEligibility = var8.conversationEligibility,
		context = p1.context,
		isOpen = p1.isOpen == true,
		isPeoplePickerDisplayed = if fFlagShareSheetPeoplePickerEnabledModule then var4 else nil,
		isSending = var7.isSending,
		isSocialRowLoading = var8.isSocialRowLoading,
		messagePlaceholder = p1.messagePlaceholder or (if fFlagShareSheetLocalizeStringsModule then var9.messagePlaceholder else "Share a message"),
		onComposerFocused = var10,
		onCloseWithReason = p1.onCloseWithReason,
		onConversationActivated = var11,
		onMoreActivated = if fFlagShareSheetPeoplePickerEnabledModule then var12 else nil,
		onSendActivated = var7.onSendActivated,
		peoplePicker = if fFlagShareSheetPeoplePickerEnabledModule then var13.viewModel else nil,
		selectedConversationIds = selectedConversationIds,
		sendLabel = var9.send,
		shareLabel = var9.share,
		telemetryId = p1.telemetryId,
		shouldShowSocialRow = var8.shouldShowSocialRow,
		url = p1.url
	}
end