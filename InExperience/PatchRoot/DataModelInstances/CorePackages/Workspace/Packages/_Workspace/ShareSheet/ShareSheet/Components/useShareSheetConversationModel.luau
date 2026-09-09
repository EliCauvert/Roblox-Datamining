local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local appChatModule = require(parent.AppChat)
local reactModule = require(parent.React)
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
	-- upvalues: useConversationList (ref), useExternalChatConversationEligibilityModule (ref), shareSheetConstantsModule (ref), fFlagShareSheetPeoplePickerEnabledModule (ref), getCompactConversations (ref), reactModule (ref), fetchConversationListPageToSignalsModule (ref)
	local var2
	local var3 = p5.chatShare ~= nil
	local var4 = useConversationList(var3)
	local var5 = #var4.items > 0
	local var6 = p5.chatShare ~= nil and p5.chatShare.isAvailable
	local var7 = p5.isOpen and (var6 and var5)
	local var8 = if p5.chatShare then p5.chatShare.isGroupChatEnabled else false
	local var9 = useExternalChatConversationEligibilityModule({
		conversations = var4.items,
		isActive = var7,
		isGroupChatEnabled = var8,
		maxConversationCount = shareSheetConstantsModule.FIntShareSheetMaxConversations
	})
	local var10 = var9
	local t = nil
	
	if fFlagShareSheetPeoplePickerEnabledModule then
		var2 = useExternalChatConversationEligibilityModule({
			conversations = var4.items,
			isActive = var7 and p5.isPeoplePickerDisplayed == true,
			isGroupChatEnabled = var8,
			maxConversationCount = shareSheetConstantsModule.FIntShareSheetPeoplePickerMaxConversations
		})
		var10 = {
			eligibleConversations = getCompactConversations(var9.eligibleConversations, var4.items, p5.selectedConversationIds, function(p6)
				-- upvalues: p5 (ref)
				return p5.chatShare ~= nil and p5.chatShare.canSendToConversation(p6)
			end),
			isLoading = var9.isLoading
		}
		t = {
			eligibleConversations = if var2.isLoading and not var9.isLoading then var9.eligibleConversations else var2.eligibleConversations,
			isLoading = var4.listStatus.error ~= nil and var2.isLoading
		}
	end
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), fetchConversationListPageToSignalsModule (copy)
		if var3 then
			fetchConversationListPageToSignalsModule()
		end
	end, { var3 })
	var2 = var3 and (not var5 and (var4.listStatus.error == nil and (if var4.listStatus.isFetchingConversations ~= true then var4.listStatus.hasFetchedInitialPage ~= true else true)))
	
	return {
		conversations = var4.items,
		conversationEligibility = var10,
		isSocialRowLoading = var6 and var2,
		listStatus = var4.listStatus,
		peoplePickerEligibility = t,
		shouldShowSocialRow = var6 and (var5 or var2)
	}
end