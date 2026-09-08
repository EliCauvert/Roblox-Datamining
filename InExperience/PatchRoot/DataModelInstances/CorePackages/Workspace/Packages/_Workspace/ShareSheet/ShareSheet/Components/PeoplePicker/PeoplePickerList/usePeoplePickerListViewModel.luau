local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local userProfileModule = require(parent.DataHydration.UserProfile)
local shareSheetConstantsModule = require(shareSheet.ShareSheetConstants)
local _ = require(shareSheet.Components.ShareSheetSocialRow)
local conversationUtilsModule = require(shareSheet.Utils.ConversationUtils)
local filterConversationsByQueryModule = require(shareSheet.Utils.filterConversationsByQuery)
local formatPeoplePickerUserInfoModule = require(shareSheet.Utils.formatPeoplePickerUserInfo)
local playersService = game:GetService("Players")

local function _(p1)
	-- upvalues: userProfileModule (ref)
	return if p1 == nil or p1 == "" then nil else userProfileModule.getAndFetchUserInfo(p1)
end

local _ = function(p1, p2)
	if p1 == nil then
		return nil, false
	end
	return p1.info(p2), p1.status(p2) == "NotReady"
end

local function getDisplayNames(p1, p2, p3, p4)
	-- upvalues: conversationUtilsModule (ref), formatPeoplePickerUserInfoModule (ref)
	local t = {}
	local t_1 = {}
	local var1 = false
	local t_2 = {}
	
	for i, v in p2 do
		local displayName = conversationUtilsModule.getDisplayName(v)
		local id = p3[v.id]
		
		if not id then
			t_1[v.id] = displayName
			continue
		end
		local var2, isNotReady
		local primary = id.primary
		
		if primary == nil then
			var2 = nil
			isNotReady = false
		else
			var2 = primary.info(p1)
			isNotReady = primary.status(p1) == "NotReady"
		end
		local var3, isNotReady_1
		local second = id.second
		
		if second == nil then
			var3 = nil
			isNotReady_1 = false
		else
			var3 = second.info(p1)
			isNotReady_1 = second.status(p1) == "NotReady"
		end
		local isNotReady_2 = isNotReady or isNotReady_1
		
		if isNotReady_2 then
			var1 = true
		end
		local t_3 = { displayName = p4 }
		local t_4 = {}
		
		if var2 then
			table.insert(t_4, var2)
		else
			table.insert(t_4, t_3)
		end
		if id.second ~= nil then
			if var3 then
				table.insert(t_4, var3)
			else
				table.insert(t_4, t_3)
			end
		end
		if displayName == "" then
			if isNotReady_2 then
				t_2[v.id] = true
			else
				displayName = formatPeoplePickerUserInfoModule.formatTitle(t_4)
			end
		end
		if not isNotReady_2 then
			t[v.id] = formatPeoplePickerUserInfoModule.formatDescription(t_4)
		end
	end
	return {
		descriptionsByConversationId = t,
		displayNamesByConversationId = t_1,
		isLoading = var1,
		loadingConversationIds = t_2
	}
end

local function useConversationDisplayNames(p5, p6, p7)
	-- upvalues: reactModule (ref), conversationUtilsModule (ref), userProfileModule (ref), signalsModule (ref), getDisplayNames (ref), signalsReactModule (ref)
	local var4 = reactModule.useMemo(function()
		-- upvalues: p5 (ref), conversationUtilsModule (copy), p6 (ref), userProfileModule (copy)
		local t = {}
		
		for i, v in p5 do
			local participantUserIds, participantUserIds_1 = conversationUtilsModule.getParticipantUserIds(v, p6)
			t[v.id] = {
				primary = if participantUserIds == nil or participantUserIds == "" then nil else userProfileModule.getAndFetchUserInfo(participantUserIds),
				second = if participantUserIds_1 == nil or participantUserIds_1 == "" then nil else userProfileModule.getAndFetchUserInfo(participantUserIds_1)
			}
		end
		return t
	end, { p5, p6 })
	
	return signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), getDisplayNames (copy), p5 (ref), var4 (ref), p7 (ref)
		return signalsModule.createComputed(function(p8)
			-- upvalues: getDisplayNames (copy), p5 (copy), var4 (copy), p7 (copy)
			return getDisplayNames(p8, p5, var4, p7)
		end)
	end, { p5, p7, var4 }))
end

return function(p8)
	-- upvalues: playersService (ref), useLocalization (ref), useConversationDisplayNames (ref), reactModule (ref), filterConversationsByQueryModule (ref), conversationUtilsModule (ref), shareSheetConstantsModule (ref)
	local var5 = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
	local var6 = useConversationDisplayNames(p8.conversations, var5, useLocalization({ unknownUser = "Feature.Chat.Label.UnknownUser" }).unknownUser)
	local displayNamesByConversationId = var6.displayNamesByConversationId
	local t = {}
	
	for i, v in reactModule.useMemo(function()
		-- upvalues: filterConversationsByQueryModule (copy), p8 (ref), displayNamesByConversationId (ref), var6 (ref)
		return filterConversationsByQueryModule(p8.conversations, p8.debouncedQuery, displayNamesByConversationId, var6.descriptionsByConversationId)
	end, {
		displayNamesByConversationId,
		var6.descriptionsByConversationId,
		p8.conversations,
		p8.debouncedQuery
	}) do
		local id = v.id
		local participantUserIds, participantUserIds_1 = conversationUtilsModule.getParticipantUserIds(v, var5)
		table.insert(t, {
			description = var6.descriptionsByConversationId[id],
			displayName = displayNamesByConversationId[id],
			id = id,
			isLoading = var6.loadingConversationIds[id] == true,
			isSelected = p8.selectedConversationIds[id] == true,
			primaryUserId = participantUserIds,
			secondUserId = participantUserIds_1
		})
	end
	local isLoading = p8.isLoading or var6.isLoading and #t == 0
	
	return {
		items = t,
		LayoutOrder = p8.LayoutOrder,
		onConversationActivated = p8.onConversationActivated,
		shouldShowEmptyState = #t == 0 and not isLoading,
		skeletonCount = if isLoading then shareSheetConstantsModule.FIntShareSheetNumAvatarSkeletons else 0
	}
end