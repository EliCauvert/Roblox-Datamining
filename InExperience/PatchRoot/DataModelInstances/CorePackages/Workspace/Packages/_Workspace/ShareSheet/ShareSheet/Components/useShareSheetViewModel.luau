local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
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
	-- upvalues: fFlagShareSheetPeoplePickerEnabledModule (ref), var1 (ref), signalsReactModule (ref), getExternalChatMessageSenderStoreModule (ref), useShareSheetSelectionModule (ref), useShareSheetConversationModelModule (ref), useLocalization (ref), reactModule (ref), shareSheetTelemetryModule (ref), var2 (ref), useShareSheetSendModule (ref), getAppFeaturePolicies (ref)
	local var3 = nil
	local var4 = nil
	
	if fFlagShareSheetPeoplePickerEnabledModule then
		var3 = var1()
		var4 = signalsReactModule.useSignalState(var3.getIsPeoplePickerDisplayed)
	end
	local var5 = signalsReactModule.useSignalState(getExternalChatMessageSenderStoreModule().getSender)
	local var6 = useShareSheetSelectionModule()
	local selectedConversationIds = var6.selectedConversationIds
	local var7 = useShareSheetConversationModelModule({
		chatShare = var5,
		isOpen = p1.isOpen == true,
		isPeoplePickerDisplayed = var4,
		selectedConversationIds = selectedConversationIds
	})
	local var8 = useLocalization({
		send = "CommonUI.Features.Action.Send",
		share = "Feature.SocialShare.Action.Share"
	})
	local var9 = reactModule.useCallback(function()
		-- upvalues: shareSheetTelemetryModule (copy), p1 (ref)
		shareSheetTelemetryModule.logInteraction({
			context = p1.context,
			telemetryId = p1.telemetryId or "",
			interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageComposerFocused
		})
	end, { p1.context, p1.telemetryId })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: selectedConversationIds (ref), shareSheetTelemetryModule (copy), p1 (ref), var6 (ref)
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
		var6.onConversationActivated
	})
	local var11 = nil
	local var12 = nil
	
	if fFlagShareSheetPeoplePickerEnabledModule then
		var11 = reactModule.useCallback(function()
			-- upvalues: var3 (write)
			var3.setIsPeoplePickerDisplayed(true)
		end, { var3 })
		local peoplePickerEligibility = var7.peoplePickerEligibility
		var12 = var2({
			conversations = peoplePickerEligibility.eligibleConversations,
			isEligibilityLoading = peoplePickerEligibility.isLoading,
			isPeoplePickerDisplayed = var4 == true,
			listStatus = var7.listStatus,
			onBack = reactModule.useCallback(function()
				-- upvalues: var3 (write)
				var3.setIsPeoplePickerDisplayed(false)
			end, { var3 }),
			onConversationActivated = var10,
			selectedConversationIds = selectedConversationIds
		})
	end
	local var13 = useShareSheetSendModule({
		chatShare = var5,
		context = p1.context,
		conversations = var7.conversations,
		formatSuccessSnackbarText = p1.formatSuccessSnackbarText,
		onCloseWithReason = p1.onCloseWithReason,
		onSendActivated = var6.onSendActivated,
		onShareSendResultSnackbar = p1.onShareSendResultSnackbar,
		selectedConversationIds = selectedConversationIds,
		telemetryId = p1.telemetryId,
		url = p1.url
	})
	
	return {
		canShareLink = getAppFeaturePolicies().getEligibleForExternalContentSharing(),
		conversationEligibility = var7.conversationEligibility,
		context = p1.context,
		isOpen = p1.isOpen == true,
		isPeoplePickerDisplayed = if fFlagShareSheetPeoplePickerEnabledModule then var4 else nil,
		isSending = var13.isSending,
		isSocialRowLoading = var7.isSocialRowLoading,
		messagePlaceholder = p1.messagePlaceholder or "Share a message",
		onComposerFocused = var9,
		onCloseWithReason = p1.onCloseWithReason,
		onConversationActivated = var10,
		onMoreActivated = if fFlagShareSheetPeoplePickerEnabledModule then var11 else nil,
		onSendActivated = var13.onSendActivated,
		peoplePicker = if fFlagShareSheetPeoplePickerEnabledModule then var12.viewModel else nil,
		selectedConversationIds = selectedConversationIds,
		sendLabel = var8.send,
		shareLabel = var8.share,
		telemetryId = p1.telemetryId,
		shouldShowSocialRow = var7.shouldShowSocialRow,
		url = p1.url
	}
end