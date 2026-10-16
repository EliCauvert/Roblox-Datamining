local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local appChatModule = require(parent.AppChat)
local reactModule = require(parent.React)
local fFlagShareSheetHoldRecipientsWhileSendingModule = require(shareSheet.Flags.FFlagShareSheetHoldRecipientsWhileSending)
local fFlagShareSheetPeoplePickerEnabledModule = require(shareSheet.Flags.FFlagShareSheetPeoplePickerEnabled)
local _ = require(parent.AppChat.GetConversationListStore)
local _ = require(parent.AppChat.GetExternalChatMessageSenderStore)
local fetchConversationListPageToSignalsModule = require(parent.AppChat.fetchConversationListPageToSignals)
local useExternalChatConversationEligibilityModule = require(parent.AppChat.useExternalChatConversationEligibility)
local shareSheetConstantsModule = require(shareSheet.ShareSheetConstants)
local _ = require(script.Parent.ShareSheetSocialRow)
local useConversationList = appChatModule.Hooks.useConversationList

local function getCompactConversations(p1, p2, p3, p4)
	-- upvalues: shareSheetConstantsModule (ref)
	local t = {}
	local t_1 = {}
	
	for i = 1, math.min(#p1, shareSheetConstantsModule.FIntShareSheetMaxConversations) do
		local var1 = p1[i]
		table.insert(t, var1)
		t_1[var1.id] = true
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
	-- upvalues: useConversationList (ref), fFlagShareSheetHoldRecipientsWhileSendingModule (ref), reactModule (ref), useExternalChatConversationEligibilityModule (ref), shareSheetConstantsModule (ref), fFlagShareSheetPeoplePickerEnabledModule (ref), getCompactConversations (ref), fetchConversationListPageToSignalsModule (ref)
	local var2 = p5.chatShare ~= nil
	local var3 = useConversationList(var2)
	
	if fFlagShareSheetHoldRecipientsWhileSendingModule then
		local var4 = reactModule.useRef(var3)
		
		if p5.isSending then
			var3 = var4.current
		else
			var4.current = var3
		end
	end
	local var5
	local var6 = #var3.items > 0
	local var7 = p5.chatShare ~= nil and p5.chatShare.isAvailable
	local var8 = p5.isOpen and (var7 and var6)
	local var9 = if p5.chatShare then p5.chatShare.isGroupChatEnabled else false
	local var10 = useExternalChatConversationEligibilityModule({
		conversations = var3.items,
		isActive = var8,
		isGroupChatEnabled = var9,
		maxConversationCount = shareSheetConstantsModule.FIntShareSheetMaxConversations
	})
	local var11 = var10
	local t = nil
	
	if fFlagShareSheetPeoplePickerEnabledModule then
		var5 = useExternalChatConversationEligibilityModule({
			conversations = var3.items,
			isActive = var8 and p5.isPeoplePickerDisplayed == true,
			isGroupChatEnabled = var9,
			maxConversationCount = shareSheetConstantsModule.FIntShareSheetPeoplePickerMaxConversations
		})
		var11 = {
			eligibleConversations = getCompactConversations(var10.eligibleConversations, var3.items, p5.selectedConversationIds, function(p6)
				-- upvalues: p5 (ref)
				return p5.chatShare ~= nil and p5.chatShare.canSendToConversation(p6)
			end),
			isLoading = var10.isLoading
		}
		t = {
			eligibleConversations = if var5.isLoading and not var10.isLoading then var10.eligibleConversations else var5.eligibleConversations,
			isLoading = var3.listStatus.error ~= nil and var5.isLoading
		}
	end
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), fetchConversationListPageToSignalsModule (copy)
		if var2 then
			fetchConversationListPageToSignalsModule()
		end
	end, { var2 })
	var5 = var2 and (not var6 and (var3.listStatus.error == nil and (if var3.listStatus.isFetchingConversations ~= true then var3.listStatus.hasFetchedInitialPage ~= true else true)))
	
	return {
		conversations = if fFlagShareSheetHoldRecipientsWhileSendingModule then nil else var3.items,
		conversationEligibility = var11,
		isSocialRowLoading = var7 and var5,
		listStatus = var3.listStatus,
		peoplePickerEligibility = t,
		shouldShowSocialRow = var7 and (var6 or var5)
	}
end