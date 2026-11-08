local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local Array = require(Parent.LuauPolyfill).Array
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetUniversalShareSheetStoreModule = require(ShareSheet.Stores.GetUniversalShareSheetStore)
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
local UsePeoplePickerViewModelModule = require(script.Parent.PeoplePicker.usePeoplePickerViewModel)
local UseShareSheetRecipientModelModule = require(script.Parent.useShareSheetRecipientModel)
local UseShareSheetSelectionModule = require(script.Parent.useShareSheetSelection)
local UseShareSheetSendModule = require(script.Parent.useShareSheetSend)

return function(p1)
	-- upvalues: GetUniversalShareSheetStoreModule (copy), SignalsReactModule (copy), GetExternalChatMessageSenderStoreModule (copy), UseRecipientListModule (copy), RecipientSourceModule (copy), UsePeoplePickerSearchModule (copy), UseRecipientSearchModule (copy), ReactModule (copy), GetSelectableRecipientsModule (copy), UseShareSheetSelectionModule (copy), UseShareSheetSendModule (copy), UseShareSheetRecipientModelModule (copy), UseLocalizationFunction (copy), ShareSheetTelemetryModule (copy), Array (copy), UsePeoplePickerViewModelModule (copy), GetAppFeaturePoliciesFunction (copy)
	local UniversalShareSheetStoreModule = GetUniversalShareSheetStoreModule()
	local UseSignalStateResult = SignalsReactModule.useSignalState(UniversalShareSheetStoreModule.getIsPeoplePickerDisplayed)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(GetExternalChatMessageSenderStoreModule().getSender)
	local UseRecipientListModuleResult, UseRecipientListModuleResult2 = UseRecipientListModule(p1.recipientSource or RecipientSourceModule.DefaultRecipientSource, UseSignalStateResult1 ~= nil)
	local UsePeoplePickerSearchModuleResult = UsePeoplePickerSearchModule()
	local UseRecipientSearchModuleResult = UseRecipientSearchModule(UseRecipientListModuleResult2, UsePeoplePickerSearchModuleResult.debouncedQuery)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetSelectableRecipientsModule (upval), UseRecipientListModuleResult (copy), UseStateResult (copy)
		return GetSelectableRecipientsModule(UseRecipientListModuleResult.recipients, UseStateResult)
	end, { UseRecipientListModuleResult.recipients, UseStateResult })
	local UseShareSheetSelectionModuleResult = UseShareSheetSelectionModule()
	local SelectedConversationIds = UseShareSheetSelectionModuleResult.selectedConversationIds
	local UseShareSheetSendModuleResult = UseShareSheetSendModule({
		chatShare = UseSignalStateResult1,
		context = p1.context,
		recipients = UseMemoResult,
		recipientSource = p1.recipientSource,
		formatSuccessSnackbarText = p1.formatSuccessSnackbarText,
		onCloseWithReason = p1.onCloseWithReason,
		onSendActivated = UseShareSheetSelectionModuleResult.onSendActivated,
		onShareSendResultSnackbar = p1.onShareSendResultSnackbar,
		selectedConversationIds = SelectedConversationIds,
		telemetryId = p1.telemetryId,
		url = p1.url
	})
	local UseShareSheetRecipientModelModuleResult = UseShareSheetRecipientModelModule({
		listResult = UseRecipientListModuleResult,
		chatShare = UseSignalStateResult1,
		isOpen = p1.isOpen == true,
		isPeoplePickerDisplayed = UseSignalStateResult,
		isSending = UseShareSheetSendModuleResult.isSending,
		searchResult = UseRecipientSearchModuleResult.result,
		pickedRecipients = UseStateResult,
		selectedConversationIds = SelectedConversationIds
	})
	local UseLocalizationResult = UseLocalizationFunction({
		messagePlaceholder = "Feature.UniversalShareSheet.InputPlaceholder.ShareMessage",
		send = "CommonUI.Features.Action.Send",
		share = "Feature.SocialShare.Action.Share"
	})
	local UseResult = ReactModule.useCallback(function(RequestedConversationId)
		-- upvalues: UseShareSheetSendModuleResult (copy), SelectedConversationIds (copy), ShareSheetTelemetryModule (upval), p1 (copy), Array (upval), UseShareSheetRecipientModelModuleResult (copy), UseStateResult2 (copy), UseShareSheetSelectionModuleResult (copy)
		if UseShareSheetSendModuleResult.isSending then return end
		ShareSheetTelemetryModule.logInteraction({
			context = p1.context,
			telemetryId = p1.telemetryId or "",
			interactionType = if SelectedConversationIds[RequestedConversationId] then "conversationDeselected" else "conversationSelected",
			recipientSource = p1.recipientSource,
			requestedConversationId = RequestedConversationId
		})
		
		local function hasId(p2): boolean
			-- upvalues: RequestedConversationId (copy)
			return p2.id == RequestedConversationId
		end
		
		local FindResult = Array.find(UseShareSheetRecipientModelModuleResult.peoplePickerRecipients.recipients, hasId) or Array.find(UseShareSheetRecipientModelModuleResult.socialRowRecipients.recipients, hasId)
		
		if FindResult then
			UseStateResult2(function(p2)
				-- upvalues: Array (upval), hasId (copy), FindResult (copy)
				return if Array.find(p2, hasId) then p2 else Array.concat(p2, { FindResult })
			end)
		end
		UseShareSheetSelectionModuleResult.onConversationActivated(RequestedConversationId)
	end, {
		p1.context, p1.recipientSource, p1.telemetryId, SelectedConversationIds,
		UseShareSheetSelectionModuleResult.onConversationActivated,
		UseShareSheetSendModuleResult.isSending,
		UseShareSheetRecipientModelModuleResult.socialRowRecipients,
		UseShareSheetRecipientModelModuleResult.peoplePickerRecipients
	})
	local PeoplePickerRecipients = UseShareSheetRecipientModelModuleResult.peoplePickerRecipients
	
	return {
		canShareLink = GetAppFeaturePoliciesFunction().getEligibleForExternalContentSharing(),
		socialRowRecipients = UseShareSheetRecipientModelModuleResult.socialRowRecipients,
		context = p1.context,
		isOpen = p1.isOpen == true,
		isPeoplePickerDisplayed = UseSignalStateResult,
		isSending = UseShareSheetSendModuleResult.isSending,
		isSocialRowLoading = UseShareSheetRecipientModelModuleResult.isSocialRowLoading,
		messagePlaceholder = p1.messagePlaceholder or UseLocalizationResult.messagePlaceholder,
		onComposerFocused = ReactModule.useCallback(function()
			-- upvalues: ShareSheetTelemetryModule (upval), p1 (copy)
			ShareSheetTelemetryModule.logInteraction({
				context = p1.context,
				recipientSource = p1.recipientSource,
				telemetryId = p1.telemetryId or "",
				interactionType = ShareSheetTelemetryModule.InteractionType.CustomMessageComposerFocused
			})
		end, { p1.context, p1.recipientSource, p1.telemetryId }),
		onCloseWithReason = p1.onCloseWithReason,
		onConversationActivated = UseResult,
		onMoreActivated = ReactModule.useCallback(function()
			-- upvalues: UniversalShareSheetStoreModule (copy)
			UniversalShareSheetStoreModule.setIsPeoplePickerDisplayed(true)
		end, { UniversalShareSheetStoreModule }),
		onSendActivated = UseShareSheetSendModuleResult.onSendActivated,
		peoplePicker = UsePeoplePickerViewModelModule({
			filterQuery = UseRecipientSearchModuleResult.filterQuery,
			recipients = PeoplePickerRecipients.recipients,
			isEligibilityLoading = PeoplePickerRecipients.isLoading,
			isPeoplePickerDisplayed = UseSignalStateResult,
			loadMore = UseRecipientSearchModuleResult.pageList.loadMore,
			listResult = UseShareSheetRecipientModelModuleResult.peoplePickerListResult,
			search = UsePeoplePickerSearchModuleResult,
			onBack = ReactModule.useCallback(function()
				-- upvalues: UniversalShareSheetStoreModule (copy)
				UniversalShareSheetStoreModule.setIsPeoplePickerDisplayed(false)
			end, { UniversalShareSheetStoreModule }),
			onConversationActivated = UseResult,
			selectedConversationIds = SelectedConversationIds
		}).viewModel,
		recipientSource = p1.recipientSource,
		selectedConversationIds = SelectedConversationIds,
		sendLabel = UseLocalizationResult.send,
		shareLabel = UseLocalizationResult.share,
		telemetryId = p1.telemetryId,
		shouldShowSocialRow = UseShareSheetRecipientModelModuleResult.shouldShowSocialRow,
		url = p1.url
	}
end