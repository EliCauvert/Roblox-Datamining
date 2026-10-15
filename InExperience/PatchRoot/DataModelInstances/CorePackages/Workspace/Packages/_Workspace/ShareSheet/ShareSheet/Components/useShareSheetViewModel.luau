local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local fFlagShareSheetPeoplePickerEnabledModule = require(shareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)
local fFlagShareSheetFriendsSort = require(parent.SharedFlags).FFlagShareSheetFriendsSort
local var1 = if fFlagShareSheetPeoplePickerEnabledModule then require(shareSheet.Stores.GetUniversalShareSheetStore) else nil
local getExternalChatMessageSenderStoreModule = require(parent.AppChat.GetExternalChatMessageSenderStore)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local recipientSourceModule = require(shareSheet.Recipients.RecipientSource)
local useRecipientListModule = require(shareSheet.Recipients.useRecipientList)
local shareSheetTelemetryModule = require(shareSheet.telemetry.ShareSheetTelemetry)
local _ = require(script.Parent.ShareSheetView)
local var2 = if fFlagShareSheetPeoplePickerEnabledModule then require(script.Parent.PeoplePicker.usePeoplePickerViewModel) else nil
local useShareSheetConversationModelModule = require(script.Parent.useShareSheetConversationModel)
local useShareSheetSelectionModule = require(script.Parent.useShareSheetSelection)
local useShareSheetSendModule = require(script.Parent.useShareSheetSend)

return function(p1)
	-- upvalues: fFlagShareSheetFriendsSort (ref), fFlagShareSheetPeoplePickerEnabledModule (ref), var1 (ref), signalsReactModule (ref), getExternalChatMessageSenderStoreModule (ref), useRecipientListModule (ref), recipientSourceModule (ref), useShareSheetSelectionModule (ref), useShareSheetSendModule (ref), useShareSheetConversationModelModule (ref), useLocalization (ref), reactModule (ref), shareSheetTelemetryModule (ref), var2 (ref), getAppFeaturePolicies (ref)
	local var3 = if fFlagShareSheetFriendsSort then p1.recipientSource else nil
	local var4 = nil
	local var5 = nil
	
	if fFlagShareSheetPeoplePickerEnabledModule then
		var4 = var1()
		var5 = signalsReactModule.useSignalState(var4.getIsPeoplePickerDisplayed)
	end
	local var6 = signalsReactModule.useSignalState(getExternalChatMessageSenderStoreModule().getSender)
	local var7 = nil
	local var8 = nil
	
	if fFlagShareSheetFriendsSort then
		local var9, var10 = useRecipientListModule(var3 or recipientSourceModule.DefaultRecipientSource, var6 ~= nil)
		var7 = var9
		var8 = var10
	end
	local var11 = useShareSheetSelectionModule()
	local selectedConversationIds = var11.selectedConversationIds
	local var12 = useShareSheetSendModule({
		chatShare = var6,
		context = p1.context,
		recipientSource = var3,
		formatSuccessSnackbarText = p1.formatSuccessSnackbarText,
		onCloseWithReason = p1.onCloseWithReason,
		onSendActivated = var11.onSendActivated,
		onShareSendResultSnackbar = p1.onShareSendResultSnackbar,
		selectedConversationIds = selectedConversationIds,
		telemetryId = p1.telemetryId,
		url = p1.url
	})
	local var13 = useShareSheetConversationModelModule({
		chatShare = var6,
		isOpen = p1.isOpen == true,
		isPeoplePickerDisplayed = var5,
		isSending = var12.isSending,
		selectedConversationIds = selectedConversationIds
	})
	local var14 = useLocalization({
		messagePlaceholder = "Feature.UniversalShareSheet.InputPlaceholder.ShareMessage",
		send = "CommonUI.Features.Action.Send",
		share = "Feature.SocialShare.Action.Share"
	})
	local var15 = reactModule.useCallback(function()
		-- upvalues: shareSheetTelemetryModule (copy), p1 (ref), var3 (ref)
		shareSheetTelemetryModule.logInteraction({
			context = p1.context,
			recipientSource = var3,
			telemetryId = p1.telemetryId or "",
			interactionType = shareSheetTelemetryModule.InteractionType.CustomMessageComposerFocused
		})
	end, { p1.context, var3, p1.telemetryId })
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: var12 (ref), selectedConversationIds (ref), shareSheetTelemetryModule (copy), p1 (ref), var3 (ref), var11 (ref)
		if var12.isSending then
			return
		end
		shareSheetTelemetryModule.logInteraction({
			context = p1.context,
			telemetryId = p1.telemetryId or "",
			interactionType = if selectedConversationIds[p2] then "conversationDeselected" else "conversationSelected",
			recipientSource = var3,
			requestedConversationId = p2
		})
		var11.onConversationActivated(p2)
	end, {
		p1.context, var3, p1.telemetryId, selectedConversationIds,
		var11.onConversationActivated, var12.isSending
	})
	local var17 = nil
	local var18 = nil
	
	if fFlagShareSheetPeoplePickerEnabledModule then
		var17 = reactModule.useCallback(function()
			-- upvalues: var4 (write)
			var4.setIsPeoplePickerDisplayed(true)
		end, { var4 })
		local peoplePickerEligibility = var13.peoplePickerEligibility
		var18 = var2({
			conversations = peoplePickerEligibility.eligibleConversations,
			isEligibilityLoading = peoplePickerEligibility.isLoading,
			isPeoplePickerDisplayed = var5 == true,
			listStatus = var13.listStatus,
			loadMore = if fFlagShareSheetFriendsSort then var8.loadMore else nil,
			listResult = if fFlagShareSheetFriendsSort then var7 else nil,
			onBack = reactModule.useCallback(function()
				-- upvalues: var4 (write)
				var4.setIsPeoplePickerDisplayed(false)
			end, { var4 }),
			onConversationActivated = var16,
			selectedConversationIds = selectedConversationIds
		})
	end
	return {
		canShareLink = getAppFeaturePolicies().getEligibleForExternalContentSharing(),
		conversationEligibility = var13.conversationEligibility,
		context = p1.context,
		isOpen = p1.isOpen == true,
		isPeoplePickerDisplayed = if fFlagShareSheetPeoplePickerEnabledModule then var5 else nil,
		isSending = var12.isSending,
		isSocialRowLoading = var13.isSocialRowLoading,
		messagePlaceholder = p1.messagePlaceholder or var14.messagePlaceholder,
		onComposerFocused = var15,
		onCloseWithReason = p1.onCloseWithReason,
		onConversationActivated = var16,
		onMoreActivated = if fFlagShareSheetPeoplePickerEnabledModule then var17 else nil,
		onSendActivated = var12.onSendActivated,
		peoplePicker = if fFlagShareSheetPeoplePickerEnabledModule then var18.viewModel else nil,
		recipientSource = var3,
		selectedConversationIds = selectedConversationIds,
		sendLabel = var14.send,
		shareLabel = var14.share,
		telemetryId = p1.telemetryId,
		shouldShowSocialRow = var13.shouldShowSocialRow,
		url = p1.url
	}
end