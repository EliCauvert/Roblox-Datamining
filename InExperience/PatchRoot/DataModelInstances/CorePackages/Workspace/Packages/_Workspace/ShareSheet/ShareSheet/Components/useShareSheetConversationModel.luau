local ShareSheet = script:FindFirstAncestor("ShareSheet")
local Parent = ShareSheet.Parent
local ReactModule = require(Parent.React)
local FFlagShareSheetFriendsSort = require(Parent.SharedFlags).FFlagShareSheetFriendsSort
local FFlagShareSheetPeoplePickerEnabledModule = require(ShareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)
local _ = require(Parent.AppChat.GetConversationListStore)
local _ = require(Parent.AppChat.GetExternalChatMessageSenderStore)
local FetchConversationListPageToSignalsModule = require(Parent.AppChat.fetchConversationListPageToSignals)
local UseExternalChatConversationEligibilityModule = require(Parent.AppChat.useExternalChatConversationEligibility)
local ShareSheetConstantsModule = require(ShareSheet.ShareSheetConstants)
local _ = require(ShareSheet.Types)
local UseConversationListModule = require(Parent.AppChat.useConversationList)

local function getCompactConversations(EligibleConversations, Items, SelectedConversationIds, Callback) --[[ Line: 38 ]]
	-- upvalues: ShareSheetConstantsModule (copy)
	local List = {}
	local t = {}
	
	for i = 1, math.min(#EligibleConversations, ShareSheetConstantsModule.FIntShareSheetMaxConversations) do
		local EligibleConversation = EligibleConversations[i]
		table.insert(List, EligibleConversation)
		t[EligibleConversation.id] = true
	end
	for _, item in Items do
		if SelectedConversationIds[item.id] and not t[item.id] and Callback(item) then
			table.insert(List, item)
			t[item.id] = true
		end
	end
	return List
end

return function(p1) --[[ Line: 66 | Named "useShareSheetConversationModel" ]]
	-- upvalues: UseConversationListModule (copy), ReactModule (copy), UseExternalChatConversationEligibilityModule (copy), ShareSheetConstantsModule (copy), FFlagShareSheetPeoplePickerEnabledModule (copy), getCompactConversations (copy), FFlagShareSheetFriendsSort (copy), FetchConversationListPageToSignalsModule (copy)
	local HasChatShare = p1.chatShare ~= nil
	local UseConversationListModuleResult = UseConversationListModule(HasChatShare)
	local UseRefResult = ReactModule.useRef(UseConversationListModuleResult)
	
	if p1.isSending then
		UseConversationListModuleResult = UseRefResult.current
	else
		UseRefResult.current = UseConversationListModuleResult
	end
	local v1 = #UseConversationListModuleResult.items > 0
	local IsAvailable = p1.chatShare ~= nil and p1.chatShare.isAvailable
	local V19: boolean = p1.isOpen and (IsAvailable and v1)
	local IsGroupChatEnabled = if p1.chatShare then p1.chatShare.isGroupChatEnabled else false
	local UseExternalChatConversationEligibilityModuleResult = UseExternalChatConversationEligibilityModule({
		conversations = UseConversationListModuleResult.items,
		isActive = V19,
		isGroupChatEnabled = IsGroupChatEnabled,
		maxConversationCount = ShareSheetConstantsModule.FIntShareSheetMaxConversations
	})
	local ConversationEligibility = UseExternalChatConversationEligibilityModuleResult
	local PeoplePickerEligibility = nil
	
	if FFlagShareSheetPeoplePickerEnabledModule then
		local UseExternalChatConversationEligibilityModuleResult1 = UseExternalChatConversationEligibilityModule({
			conversations = UseConversationListModuleResult.items,
			isActive = V19 and p1.isPeoplePickerDisplayed == true,
			isGroupChatEnabled = IsGroupChatEnabled,
			maxConversationCount = ShareSheetConstantsModule.FIntShareSheetPeoplePickerMaxConversations
		})
		ConversationEligibility = {
			eligibleConversations = getCompactConversations(UseExternalChatConversationEligibilityModuleResult.eligibleConversations, UseConversationListModuleResult.items, p1.selectedConversationIds, function(p2) --[[ Line: 102 ]]
				-- upvalues: p1 (copy)
				return p1.chatShare ~= nil and p1.chatShare.canSendToConversation(p2)
			end),
			isLoading = UseExternalChatConversationEligibilityModuleResult.isLoading
		}
		PeoplePickerEligibility = {
			eligibleConversations = if UseExternalChatConversationEligibilityModuleResult1.isLoading and not UseExternalChatConversationEligibilityModuleResult.isLoading then UseExternalChatConversationEligibilityModuleResult.eligibleConversations else UseExternalChatConversationEligibilityModuleResult1.eligibleConversations,
			isLoading = UseConversationListModuleResult.listStatus.error == nil and UseExternalChatConversationEligibilityModuleResult1.isLoading
		}
	end
	if not FFlagShareSheetFriendsSort then
		ReactModule.useEffect(function() --[[ Line: 118 ]]
			-- upvalues: HasChatShare (copy), FetchConversationListPageToSignalsModule (upval)
			if HasChatShare then
				FetchConversationListPageToSignalsModule()
			end
		end, { HasChatShare })
	end
	local IsIsFetchingConversations: boolean = HasChatShare and (not v1 and (UseConversationListModuleResult.listStatus.error == nil and (UseConversationListModuleResult.listStatus.isFetchingConversations == true or UseConversationListModuleResult.listStatus.hasFetchedInitialPage ~= true)))
	
	return {
		conversationEligibility = ConversationEligibility,
		isSocialRowLoading = IsAvailable and IsIsFetchingConversations,
		listStatus = UseConversationListModuleResult.listStatus,
		peoplePickerEligibility = PeoplePickerEligibility,
		shouldShowSocialRow = IsAvailable and (v1 or IsIsFetchingConversations)
	}
end