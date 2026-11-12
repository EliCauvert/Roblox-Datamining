local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local FFlagShareSheetPeoplePickerEnabledModule = require(ShareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)
local _ = require(Parent.AppChat.GetConversationListStore)
local _ = require(Parent.AppChat.GetExternalChatMessageSenderStore)
local FetchConversationListPageToSignalsModule = require(Parent.AppChat.fetchConversationListPageToSignals)
local UseExternalChatConversationEligibilityModule = require(Parent.AppChat.useExternalChatConversationEligibility)
local ListRecipientsStatusModule = require(ShareSheet.Recipients.ListRecipientsStatus)
local RecipientModule = require(ShareSheet.Recipients.Recipient)
local GetSelectableRecipientsModule = require(ShareSheet.Recipients.getSelectableRecipients)
local ShareSheetConstantsModule = require(ShareSheet.ShareSheetConstants)
local _ = require(ShareSheet.Types)
local UseConversationListModule = require(Parent.AppChat.useConversationList)

local function getCompactConversations(EligibleConversations, Conversations, SelectedConversationIds, Callback)
	-- upvalues: ShareSheetConstantsModule (copy)
	local List = {}
	local t = {}
	
	for i = 1, math.min(#EligibleConversations, ShareSheetConstantsModule.FIntShareSheetMaxConversations) do
		local EligibleConversation = EligibleConversations[i]
		table.insert(List, EligibleConversation)
		t[EligibleConversation.id] = true
	end
	for _, conversation in Conversations do
		if SelectedConversationIds[conversation.id] and not t[conversation.id] and Callback(conversation) then
			table.insert(List, conversation)
			t[conversation.id] = true
		end
	end
	return List
end

local function getCompactRecipients(Recipients, List, SelectedConversationIds, Callback)
	-- upvalues: ShareSheetConstantsModule (copy)
	local List1 = {}
	local t = {}
	
	for i = 1, math.min(#Recipients, ShareSheetConstantsModule.FIntShareSheetMaxConversations) do
		local Recipient = Recipients[i]
		table.insert(List1, Recipient)
		t[Recipient.id] = true
	end
	for _, value in List do
		if SelectedConversationIds[value.id] and not t[value.id] and Callback(value) then
			table.insert(List1, value)
			t[value.id] = true
		end
	end
	return List1
end

return function(p1)
	-- upvalues: FFlagShareSheetFriendsSort (copy), ReactModule (copy), ListRecipientsStatusModule (copy), UseConversationListModule (copy), RecipientModule (copy), ShareSheetConstantsModule (copy), FFlagShareSheetPeoplePickerEnabledModule (copy), GetSelectableRecipientsModule (copy), getCompactRecipients (copy), UseExternalChatConversationEligibilityModule (copy), getCompactConversations (copy), FetchConversationListPageToSignalsModule (copy)
	local HasChatShare = p1.chatShare ~= nil
	local Current = nil
	local Current1 = nil
	local Conversations = nil
	local v1 = nil
	local IsStatusMatch = nil
	local IsStatusMatch1 = nil
	
	if FFlagShareSheetFriendsSort then
		Current1 = p1.listResult
		local UseRefResult = ReactModule.useRef(Current1)
		
		if p1.isSending then
			Current1 = UseRefResult.current
		else
			UseRefResult.current = Current1
		end
		v1 = #Current1.recipients > 0
		IsStatusMatch = Current1.status == ListRecipientsStatusModule.Failed
		IsStatusMatch1 = Current1.status == ListRecipientsStatusModule.Loading
	else
		Current = UseConversationListModule(HasChatShare)
		local UseRefResult1 = ReactModule.useRef(Current)
		
		if p1.isSending then
			Current = UseRefResult1.current
		else
			UseRefResult1.current = Current
		end
		Conversations = Current.items
		v1 = #Conversations > 0
		local ListStatus = Current.listStatus
		IsStatusMatch = ListStatus.error ~= nil
		IsStatusMatch1 = #Conversations == 0 and ListStatus.error == nil and (ListStatus.isFetchingConversations == true or ListStatus.hasFetchedInitialPage ~= true)
	end
	local IsAvailable = p1.chatShare ~= nil and p1.chatShare.isAvailable
	local V29: boolean = p1.isOpen and (IsAvailable and v1)
	local IsGroupChatEnabled = if p1.chatShare then p1.chatShare.isGroupChatEnabled else false
	local ConversationEligibility = nil
	local SocialRowRecipients = nil
	local PeoplePickerEligibility = nil
	local PeoplePickerRecipients = nil
	
	if FFlagShareSheetFriendsSort then
		local Recipients = Current1.recipients
		local UseEligibleRecipientsResult = RecipientModule.useEligibleRecipients({
			recipients = Recipients,
			isActive = V29,
			isGroupChatEnabled = IsGroupChatEnabled,
			maxCount = ShareSheetConstantsModule.FIntShareSheetMaxConversations
		})
		SocialRowRecipients = UseEligibleRecipientsResult
		
		if FFlagShareSheetPeoplePickerEnabledModule then
			local SearchResult = p1.searchResult
			local UseEligibleRecipientsResult1 = RecipientModule.useEligibleRecipients({
				recipients = if SearchResult then SearchResult.recipients else Recipients,
				isActive = V29 and p1.isPeoplePickerDisplayed == true,
				isGroupChatEnabled = IsGroupChatEnabled,
				maxCount = ShareSheetConstantsModule.FIntShareSheetPeoplePickerMaxConversations
			})
			SocialRowRecipients = {
				recipients = getCompactRecipients(UseEligibleRecipientsResult.recipients, GetSelectableRecipientsModule(Recipients, p1.pickedRecipients), p1.selectedConversationIds, function(p2)
					-- upvalues: p1 (copy), RecipientModule (upval)
					return p1.chatShare ~= nil and RecipientModule.canSend(p1.chatShare, p2)
				end),
				isLoading = UseEligibleRecipientsResult.isLoading
			}
			PeoplePickerRecipients = {
				recipients = if UseEligibleRecipientsResult1.isLoading and not UseEligibleRecipientsResult.isLoading and SearchResult == nil then UseEligibleRecipientsResult.recipients else UseEligibleRecipientsResult1.recipients,
				isLoading = if SearchResult then SearchResult.status == ListRecipientsStatusModule.Loading or SearchResult.status == ListRecipientsStatusModule.Ready and UseEligibleRecipientsResult1.isLoading else not IsStatusMatch and UseEligibleRecipientsResult1.isLoading
			}
		end
	else
		local UseExternalChatConversationEligibilityModuleResult = UseExternalChatConversationEligibilityModule({
			conversations = Conversations,
			isActive = V29,
			isGroupChatEnabled = IsGroupChatEnabled,
			maxConversationCount = ShareSheetConstantsModule.FIntShareSheetMaxConversations
		})
		ConversationEligibility = UseExternalChatConversationEligibilityModuleResult
		
		if FFlagShareSheetPeoplePickerEnabledModule then
			local UseExternalChatConversationEligibilityModuleResult1 = UseExternalChatConversationEligibilityModule({
				conversations = Conversations,
				isActive = V29 and p1.isPeoplePickerDisplayed == true,
				isGroupChatEnabled = IsGroupChatEnabled,
				maxConversationCount = ShareSheetConstantsModule.FIntShareSheetPeoplePickerMaxConversations
			})
			ConversationEligibility = {
				eligibleConversations = getCompactConversations(UseExternalChatConversationEligibilityModuleResult.eligibleConversations, Conversations, p1.selectedConversationIds, function(p2)
					-- upvalues: p1 (copy)
					return p1.chatShare ~= nil and p1.chatShare.canSendToConversation(p2)
				end),
				isLoading = UseExternalChatConversationEligibilityModuleResult.isLoading
			}
			PeoplePickerEligibility = {
				eligibleConversations = if UseExternalChatConversationEligibilityModuleResult1.isLoading and not UseExternalChatConversationEligibilityModuleResult.isLoading then UseExternalChatConversationEligibilityModuleResult.eligibleConversations else UseExternalChatConversationEligibilityModuleResult1.eligibleConversations,
				isLoading = not IsStatusMatch and UseExternalChatConversationEligibilityModuleResult1.isLoading
			}
		end
	end
	if not FFlagShareSheetFriendsSort then
		ReactModule.useEffect(function()
			-- upvalues: HasChatShare (copy), FetchConversationListPageToSignalsModule (upval)
			if HasChatShare then
				FetchConversationListPageToSignalsModule()
			end
		end, { HasChatShare })
	end
	local IsStatusMatch1_1: boolean = HasChatShare and IsStatusMatch1
	
	return {
		conversationEligibility = ConversationEligibility,
		socialRowRecipients = SocialRowRecipients,
		isSocialRowLoading = IsAvailable and IsStatusMatch1_1,
		listStatus = if FFlagShareSheetFriendsSort then nil else Current.listStatus,
		peoplePickerEligibility = PeoplePickerEligibility,
		peoplePickerRecipients = PeoplePickerRecipients,
		peoplePickerListResult = if FFlagShareSheetFriendsSort then p1.searchResult or Current1 else nil,
		shouldShowSocialRow = IsAvailable and (v1 or IsStatusMatch1_1)
	}
end