local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagShareSheetPeoplePickerEnabledModule = require(ShareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local GetUniversalShareSheetStoreModule = if FFlagShareSheetPeoplePickerEnabledModule then require(ShareSheet.Stores.GetUniversalShareSheetStore) else nil
local GetExternalChatMessageSenderStoreModule = require(Parent.AppChat.GetExternalChatMessageSenderStore)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local RecipientSourceModule = require(ShareSheet.Recipients.RecipientSource)
local UseRecipientListModule = require(ShareSheet.Recipients.useRecipientList)
local ShareSheetTelemetryModule = require(ShareSheet.telemetry.ShareSheetTelemetry)
local _ = require(script.Parent.ShareSheetView)
local UsePeoplePickerViewModelModule = if FFlagShareSheetPeoplePickerEnabledModule then require(script.Parent.PeoplePicker.usePeoplePickerViewModel) else nil
local UseShareSheetConversationModelModule = require(script.Parent.useShareSheetConversationModel)
local UseShareSheetSelectionModule = require(script.Parent.useShareSheetSelection)
local UseShareSheetSendModule = require(script.Parent.useShareSheetSend)

return function(p1) --[[ Line: 46 | Named "useShareSheetViewModel" ]]
	-- upvalues: FFlagShareSheetFriendsSort (copy), FFlagShareSheetPeoplePickerEnabledModule (copy), GetUniversalShareSheetStoreModule (copy), SignalsReactModule (copy), GetExternalChatMessageSenderStoreModule (copy), UseRecipientListModule (copy), RecipientSourceModule (copy), UseShareSheetSelectionModule (copy), UseShareSheetSendModule (copy), UseShareSheetConversationModelModule (copy), UseLocalizationFunction (copy), ReactModule (copy), ShareSheetTelemetryModule (copy), UsePeoplePickerViewModelModule (copy), GetAppFeaturePoliciesFunction (copy)
	local RecipientSource = if FFlagShareSheetFriendsSort then p1.recipientSource else nil
	local v1 = nil
	local Enabled = nil
	
	if FFlagShareSheetPeoplePickerEnabledModule then
		v1 = GetUniversalShareSheetStoreModule()
		Enabled = SignalsReactModule.useSignalState(v1.getIsPeoplePickerDisplayed)
	end
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetExternalChatMessageSenderStoreModule().getSender)
	local v2 = nil
	local v3 = nil
	
	if FFlagShareSheetFriendsSort then
		v2, v20 = UseRecipientListModule(RecipientSource or RecipientSourceModule.DefaultRecipientSource, UseSignalStateResult ~= nil)
	end
	local UseShareSheetSelectionModuleResult = UseShareSheetSelectionModule()
	local SelectedConversationIds = UseShareSheetSelectionModuleResult.selectedConversationIds
	local UseShareSheetSendModuleResult = UseShareSheetSendModule({
		chatShare = UseSignalStateResult,
		context = p1.context,
		recipients = if FFlagShareSheetFriendsSort then v2.recipients else nil,
		recipientSource = RecipientSource,
		formatSuccessSnackbarText = p1.formatSuccessSnackbarText,
		onCloseWithReason = p1.onCloseWithReason,
		onSendActivated = UseShareSheetSelectionModuleResult.onSendActivated,
		onShareSendResultSnackbar = p1.onShareSendResultSnackbar,
		selectedConversationIds = SelectedConversationIds,
		telemetryId = p1.telemetryId,
		url = p1.url
	})
	local UseShareSheetConversationModelModuleResult = UseShareSheetConversationModelModule({
		listResult = if FFlagShareSheetFriendsSort then v2 else nil,
		chatShare = UseSignalStateResult,
		isOpen = p1.isOpen == true,
		isPeoplePickerDisplayed = Enabled,
		isSending = UseShareSheetSendModuleResult.isSending,
		selectedConversationIds = SelectedConversationIds
	})
	local UseLocalizationResult = UseLocalizationFunction({
		messagePlaceholder = "Feature.UniversalShareSheet.InputPlaceholder.ShareMessage",
		send = "CommonUI.Features.Action.Send",
		share = "Feature.SocialShare.Action.Share"
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 91 ]]
		-- upvalues: ShareSheetTelemetryModule (upval), p1 (copy), RecipientSource (copy)
		ShareSheetTelemetryModule.logInteraction({
			context = p1.context,
			recipientSource = RecipientSource,
			telemetryId = p1.telemetryId or "",
			interactionType = ShareSheetTelemetryModule.InteractionType.CustomMessageComposerFocused
		})
	end, { p1.context, RecipientSource, p1.telemetryId })
	local UseResult1 = ReactModule.useCallback(function(RequestedConversationId) --[[ Line: 100 ]]
		-- upvalues: UseShareSheetSendModuleResult (copy), SelectedConversationIds (copy), ShareSheetTelemetryModule (upval), p1 (copy), RecipientSource (copy), UseShareSheetSelectionModuleResult (copy)
		if not UseShareSheetSendModuleResult.isSending then
			ShareSheetTelemetryModule.logInteraction({
				context = p1.context,
				telemetryId = p1.telemetryId or "",
				interactionType = if SelectedConversationIds[RequestedConversationId] then "conversationDeselected" else "conversationSelected",
				recipientSource = RecipientSource,
				requestedConversationId = RequestedConversationId
			})
			UseShareSheetSelectionModuleResult.onConversationActivated(RequestedConversationId)
			
			return
		end
	end, {
		p1.context, RecipientSource, p1.telemetryId, SelectedConversationIds,
		UseShareSheetSelectionModuleResult.onConversationActivated,
		UseShareSheetSendModuleResult.isSending
	})
	local UseResult2 = nil
	local v4 = nil
	
	if FFlagShareSheetPeoplePickerEnabledModule then
		UseResult2 = ReactModule.useCallback(function() --[[ Line: 128 ]]
			-- upvalues: v1 (ref)
			v1.setIsPeoplePickerDisplayed(true)
		end, { v1 })
		local PeoplePickerEligibility = UseShareSheetConversationModelModuleResult.peoplePickerEligibility
		local PeoplePickerEligibleRecipients = UseShareSheetConversationModelModuleResult.peoplePickerEligibleRecipients
		v4 = UsePeoplePickerViewModelModule({
			conversations = if FFlagShareSheetFriendsSort then nil else PeoplePickerEligibility.eligibleConversations,
			recipients = if FFlagShareSheetFriendsSort then PeoplePickerEligibleRecipients.recipients else nil,
			isEligibilityLoading = if FFlagShareSheetFriendsSort then PeoplePickerEligibleRecipients.isLoading else PeoplePickerEligibility.isLoading,
			isPeoplePickerDisplayed = Enabled == true,
			listStatus = if FFlagShareSheetFriendsSort then nil else UseShareSheetConversationModelModuleResult.listStatus,
			loadMore = if FFlagShareSheetFriendsSort then v3.loadMore else nil,
			listResult = UseShareSheetConversationModelModuleResult.listResult,
			onBack = ReactModule.useCallback(function() --[[ Line: 131 ]]
				-- upvalues: v1 (ref)
				v1.setIsPeoplePickerDisplayed(false)
			end, { v1 }),
			onConversationActivated = UseResult1,
			selectedConversationIds = SelectedConversationIds
		})
	end
	return {
		canShareLink = GetAppFeaturePoliciesFunction().getEligibleForExternalContentSharing(),
		conversationEligibility = if FFlagShareSheetFriendsSort then nil else UseShareSheetConversationModelModuleResult.conversationEligibility,
		eligibleRecipients = if FFlagShareSheetFriendsSort then UseShareSheetConversationModelModuleResult.eligibleRecipients else nil,
		context = p1.context,
		isOpen = p1.isOpen == true,
		isPeoplePickerDisplayed = if FFlagShareSheetPeoplePickerEnabledModule then Enabled else nil,
		isSending = UseShareSheetSendModuleResult.isSending,
		isSocialRowLoading = UseShareSheetConversationModelModuleResult.isSocialRowLoading,
		messagePlaceholder = p1.messagePlaceholder or UseLocalizationResult.messagePlaceholder,
		onComposerFocused = UseResult,
		onCloseWithReason = p1.onCloseWithReason,
		onConversationActivated = UseResult1,
		onMoreActivated = if FFlagShareSheetPeoplePickerEnabledModule then UseResult2 else nil,
		onSendActivated = UseShareSheetSendModuleResult.onSendActivated,
		peoplePicker = if FFlagShareSheetPeoplePickerEnabledModule then v4.viewModel else nil,
		recipientSource = RecipientSource,
		selectedConversationIds = SelectedConversationIds,
		sendLabel = UseLocalizationResult.send,
		shareLabel = UseLocalizationResult.share,
		telemetryId = p1.telemetryId,
		shouldShowSocialRow = UseShareSheetConversationModelModuleResult.shouldShowSocialRow,
		url = p1.url
	}
end