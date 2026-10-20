local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local Array = require(Parent.LuauPolyfill).Array
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagShareSheetPeoplePickerEnabledModule = require(ShareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local GetUniversalShareSheetStoreModule = if FFlagShareSheetPeoplePickerEnabledModule then require(ShareSheet.Stores.GetUniversalShareSheetStore) else nil
local GetExternalChatMessageSenderStoreModule = require(Parent.AppChat.GetExternalChatMessageSenderStore)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local _ = require(ShareSheet.Recipients.Recipient)
local RecipientSourceModule = require(ShareSheet.Recipients.RecipientSource)
local UseRecipientListModule = require(ShareSheet.Recipients.useRecipientList)
local GetSelectableRecipientsModule = require(ShareSheet.Recipients.getSelectableRecipients)
local UseRecipientSearchModule = require(ShareSheet.Recipients.useRecipientSearch)
local UsePeoplePickerSearchModule = require(script.Parent.PeoplePicker.usePeoplePickerSearch)
local ShareSheetTelemetryModule = require(ShareSheet.telemetry.ShareSheetTelemetry)
local _ = require(script.Parent.ShareSheetView)
local UsePeoplePickerViewModelModule = if FFlagShareSheetPeoplePickerEnabledModule then require(script.Parent.PeoplePicker.usePeoplePickerViewModel) else nil
local UseShareSheetConversationModelModule = require(script.Parent.useShareSheetConversationModel)
local UseShareSheetSelectionModule = require(script.Parent.useShareSheetSelection)
local UseShareSheetSendModule = require(script.Parent.useShareSheetSend)

return function(p1)
	-- upvalues: FFlagShareSheetFriendsSort (copy), FFlagShareSheetPeoplePickerEnabledModule (copy), GetUniversalShareSheetStoreModule (copy), SignalsReactModule (copy), GetExternalChatMessageSenderStoreModule (copy), UseRecipientListModule (copy), RecipientSourceModule (copy), UsePeoplePickerSearchModule (copy), UseRecipientSearchModule (copy), ReactModule (copy), GetSelectableRecipientsModule (copy), UseShareSheetSelectionModule (copy), UseShareSheetSendModule (copy), UseShareSheetConversationModelModule (copy), UseLocalizationFunction (copy), ShareSheetTelemetryModule (copy), Array (copy), UsePeoplePickerViewModelModule (copy), GetAppFeaturePoliciesFunction (copy)
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
		v2, v25 = UseRecipientListModule(RecipientSource or RecipientSourceModule.DefaultRecipientSource, UseSignalStateResult ~= nil)
	end
	local UsePeoplePickerSearchModuleResult = if FFlagShareSheetFriendsSort and FFlagShareSheetPeoplePickerEnabledModule then UsePeoplePickerSearchModule() else nil
	local UseRecipientSearchModuleResult = if FFlagShareSheetFriendsSort and FFlagShareSheetPeoplePickerEnabledModule then UseRecipientSearchModule(v3, UsePeoplePickerSearchModuleResult.debouncedQuery) else nil
	local v4 = nil
	local Callback = nil
	
	if FFlagShareSheetFriendsSort and FFlagShareSheetPeoplePickerEnabledModule then
		v4, Callback = ReactModule.useState({})
	end
	local UseMemoResult = if FFlagShareSheetFriendsSort and FFlagShareSheetPeoplePickerEnabledModule then ReactModule.useMemo(function()
		-- upvalues: GetSelectableRecipientsModule (upval), v2 (ref), v4 (ref)
		return GetSelectableRecipientsModule(v2.recipients, v4)
	end, { v2.recipients, v4 }) else nil
	local UseShareSheetSelectionModuleResult = UseShareSheetSelectionModule()
	local SelectedConversationIds = UseShareSheetSelectionModuleResult.selectedConversationIds
	local UseShareSheetSendModuleResult = UseShareSheetSendModule({
		chatShare = UseSignalStateResult,
		context = p1.context,
		recipients = if FFlagShareSheetFriendsSort and FFlagShareSheetPeoplePickerEnabledModule then UseMemoResult elseif FFlagShareSheetFriendsSort then v2.recipients else nil,
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
		searchResult = if FFlagShareSheetFriendsSort and FFlagShareSheetPeoplePickerEnabledModule then UseRecipientSearchModuleResult.result else nil,
		pickedRecipients = if FFlagShareSheetFriendsSort and FFlagShareSheetPeoplePickerEnabledModule then v4 else nil,
		selectedConversationIds = SelectedConversationIds
	})
	local UseLocalizationResult = UseLocalizationFunction({
		messagePlaceholder = "Feature.UniversalShareSheet.InputPlaceholder.ShareMessage",
		send = "CommonUI.Features.Action.Send",
		share = "Feature.SocialShare.Action.Share"
	})
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: ShareSheetTelemetryModule (upval), p1 (copy), RecipientSource (copy)
		ShareSheetTelemetryModule.logInteraction({
			context = p1.context,
			recipientSource = RecipientSource,
			telemetryId = p1.telemetryId or "",
			interactionType = ShareSheetTelemetryModule.InteractionType.CustomMessageComposerFocused
		})
	end, { p1.context, RecipientSource, p1.telemetryId })
	local UseResult1 = ReactModule.useCallback(function(RequestedConversationId)
		-- upvalues: UseShareSheetSendModuleResult (copy), SelectedConversationIds (copy), ShareSheetTelemetryModule (upval), p1 (copy), RecipientSource (copy), FFlagShareSheetFriendsSort (upval), FFlagShareSheetPeoplePickerEnabledModule (upval), Array (upval), UseShareSheetConversationModelModuleResult (copy), Callback (ref), UseShareSheetSelectionModuleResult (copy)
		if UseShareSheetSendModuleResult.isSending then return end
		ShareSheetTelemetryModule.logInteraction({
			context = p1.context,
			telemetryId = p1.telemetryId or "",
			interactionType = if SelectedConversationIds[RequestedConversationId] then "conversationDeselected" else "conversationSelected",
			recipientSource = RecipientSource,
			requestedConversationId = RequestedConversationId
		})
		
		if FFlagShareSheetFriendsSort and FFlagShareSheetPeoplePickerEnabledModule then
			local function hasId(p2): boolean
				-- upvalues: RequestedConversationId (copy)
				return p2.id == RequestedConversationId
			end
			
			local FindResult = Array.find(UseShareSheetConversationModelModuleResult.peoplePickerEligibleRecipients.recipients, hasId) or Array.find(UseShareSheetConversationModelModuleResult.eligibleRecipients.recipients, hasId)
			
			if FindResult then
				Callback(function(p2)
					-- upvalues: Array (upval), hasId (copy), FindResult (copy)
					return if Array.find(p2, hasId) then p2 else Array.concat(p2, { FindResult })
				end)
			end
		end
		UseShareSheetSelectionModuleResult.onConversationActivated(RequestedConversationId)
	end, {
		p1.context, RecipientSource, p1.telemetryId, SelectedConversationIds,
		UseShareSheetSelectionModuleResult.onConversationActivated,
		UseShareSheetSendModuleResult.isSending,
		UseShareSheetConversationModelModuleResult.eligibleRecipients,
		UseShareSheetConversationModelModuleResult.peoplePickerEligibleRecipients
	})
	local UseResult2 = nil
	local v5 = nil
	
	if FFlagShareSheetPeoplePickerEnabledModule then
		UseResult2 = ReactModule.useCallback(function()
			-- upvalues: v1 (ref)
			v1.setIsPeoplePickerDisplayed(true)
		end, { v1 })
		local PeoplePickerEligibility = UseShareSheetConversationModelModuleResult.peoplePickerEligibility
		local PeoplePickerEligibleRecipients = UseShareSheetConversationModelModuleResult.peoplePickerEligibleRecipients
		v5 = UsePeoplePickerViewModelModule({
			clientFilterQuery = if FFlagShareSheetFriendsSort then UseRecipientSearchModuleResult.clientFilterQuery else nil,
			conversations = if FFlagShareSheetFriendsSort then nil else PeoplePickerEligibility.eligibleConversations,
			recipients = if FFlagShareSheetFriendsSort then PeoplePickerEligibleRecipients.recipients else nil,
			isEligibilityLoading = if FFlagShareSheetFriendsSort then PeoplePickerEligibleRecipients.isLoading else PeoplePickerEligibility.isLoading,
			isPeoplePickerDisplayed = Enabled == true,
			listStatus = if FFlagShareSheetFriendsSort then nil else UseShareSheetConversationModelModuleResult.listStatus,
			loadMore = if FFlagShareSheetFriendsSort then UseRecipientSearchModuleResult.pageList.loadMore else nil,
			listResult = UseShareSheetConversationModelModuleResult.peoplePickerListResult,
			search = if FFlagShareSheetFriendsSort then UsePeoplePickerSearchModuleResult else nil,
			onBack = ReactModule.useCallback(function()
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
		peoplePicker = if FFlagShareSheetPeoplePickerEnabledModule then v5.viewModel else nil,
		recipientSource = RecipientSource,
		selectedConversationIds = SelectedConversationIds,
		sendLabel = UseLocalizationResult.send,
		shareLabel = UseLocalizationResult.share,
		telemetryId = p1.telemetryId,
		shouldShowSocialRow = UseShareSheetConversationModelModuleResult.shouldShowSocialRow,
		url = p1.url
	}
end