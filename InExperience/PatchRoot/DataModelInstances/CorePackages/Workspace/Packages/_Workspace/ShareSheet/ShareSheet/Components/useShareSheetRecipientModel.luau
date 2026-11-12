local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local _ = require(Parent.AppChat.GetExternalChatMessageSenderStore)
local ListRecipientsStatusModule = require(ShareSheet.Recipients.ListRecipientsStatus)
local RecipientModule = require(ShareSheet.Recipients.Recipient)
local GetSelectableRecipientsModule = require(ShareSheet.Recipients.getSelectableRecipients)
local ShareSheetConstantsModule = require(ShareSheet.ShareSheetConstants)
local _ = require(ShareSheet.Types)

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
	-- upvalues: ReactModule (copy), ListRecipientsStatusModule (copy), RecipientModule (copy), ShareSheetConstantsModule (copy), GetSelectableRecipientsModule (copy), getCompactRecipients (copy)
	local HasChatShare = p1.chatShare ~= nil
	local ListResult = p1.listResult
	local UseRefResult = ReactModule.useRef(ListResult)
	
	if p1.isSending then
		ListResult = UseRefResult.current
	else
		UseRefResult.current = ListResult
	end
	local v1 = #ListResult.recipients > 0
	local IsStatusMatch = ListResult.status == ListRecipientsStatusModule.Failed
	local IsStatusMatch1 = ListResult.status == ListRecipientsStatusModule.Loading
	local IsAvailable = p1.chatShare ~= nil and p1.chatShare.isAvailable
	local V16: boolean = p1.isOpen and (IsAvailable and v1)
	local IsGroupChatEnabled = if p1.chatShare then p1.chatShare.isGroupChatEnabled else false
	local Recipients = ListResult.recipients
	local UseEligibleRecipientsResult = RecipientModule.useEligibleRecipients({
		recipients = Recipients,
		isActive = V16,
		isGroupChatEnabled = IsGroupChatEnabled,
		maxCount = ShareSheetConstantsModule.FIntShareSheetMaxConversations
	})
	local SearchResult = p1.searchResult
	local UseEligibleRecipientsResult1 = RecipientModule.useEligibleRecipients({
		recipients = if SearchResult then SearchResult.recipients else Recipients,
		isActive = V16 and p1.isPeoplePickerDisplayed,
		isGroupChatEnabled = IsGroupChatEnabled,
		maxCount = ShareSheetConstantsModule.FIntShareSheetPeoplePickerMaxConversations
	})
	local IsStatusMatch1_1: boolean = HasChatShare and IsStatusMatch1
	
	return {
		socialRowRecipients = {
			recipients = getCompactRecipients(UseEligibleRecipientsResult.recipients, GetSelectableRecipientsModule(Recipients, p1.pickedRecipients), p1.selectedConversationIds, function(p2)
				-- upvalues: p1 (copy), RecipientModule (upval)
				return p1.chatShare ~= nil and RecipientModule.canSend(p1.chatShare, p2)
			end),
			isLoading = UseEligibleRecipientsResult.isLoading
		},
		isSocialRowLoading = IsAvailable and IsStatusMatch1_1,
		peoplePickerRecipients = {
			recipients = if UseEligibleRecipientsResult1.isLoading and not UseEligibleRecipientsResult.isLoading and SearchResult == nil then UseEligibleRecipientsResult.recipients else UseEligibleRecipientsResult1.recipients,
			isLoading = if SearchResult then SearchResult.status == ListRecipientsStatusModule.Loading or SearchResult.status == ListRecipientsStatusModule.Ready and UseEligibleRecipientsResult1.isLoading else not IsStatusMatch and UseEligibleRecipientsResult1.isLoading
		},
		peoplePickerListResult = p1.searchResult or ListResult,
		shouldShowSocialRow = IsAvailable and (v1 or IsStatusMatch1_1)
	}
end