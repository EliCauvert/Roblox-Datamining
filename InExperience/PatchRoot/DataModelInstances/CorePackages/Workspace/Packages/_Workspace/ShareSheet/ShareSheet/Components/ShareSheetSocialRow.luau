local shareSheet = script:FindFirstAncestor("ShareSheet")
local parent = shareSheet.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local radius = foundationModule.Enums.Radius
local fFlagSharePplPickerModule = require(shareSheet.Flags.FFlagSharePplPicker)
local shareSheetConstantsModule = require(shareSheet.ShareSheetConstants)
local shareSheetRowModule = require(script.Parent.ShareSheetRow)
local shareSheetItemContainerModule = require(script.Parent.ShareSheetItemContainer)
local playersService = game:GetService("Players")
local _ = require(parent.AppChat.GetConversationListStore)

local function _(p1, p2)
	local t = {}
	
	for i, v in p1 do
		if v ~= p2 then
			table.insert(t, v)
		end
	end
	return t
end

local function createSkeletonItems()
	-- upvalues: shareSheetConstantsModule (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local t = {}
	
	for i = 1, shareSheetConstantsModule.FIntShareSheetNumAvatarSkeletons do
		t[`Skeleton{i}`] = reactModule.createElement(view, {
			tag = "col align-x-center gap-small size-1700-0 auto-y",
			LayoutOrder = i
		}, {
			Avatar = reactModule.createElement(view, {
				LayoutOrder = 1,
				tag = "size-full-1700",
				testId = "share-sheet-avatar-skeleton-container"
			}, {
				Skeleton = reactModule.createElement(skeleton, {
					testId = "share-sheet-avatar-skeleton",
					radius = radius.Circle
				})
			}),
			Text = reactModule.createElement(view, {
				LayoutOrder = 2,
				tag = "size-full-400",
				testId = "share-sheet-text-skeleton-container"
			}, {
				Skeleton = reactModule.createElement(skeleton, {
					testId = "share-sheet-text-skeleton",
					radius = radius.Medium
				})
			})
		})
	end
	return t
end

local function onMoreActivated() end

local function ShareSheetConversationItem(p3)
	-- upvalues: reactModule (ref), shareSheetItemContainerModule (ref)
	local conversation = p3.conversation
	local id = conversation.id
	local var1 = reactModule.useCallback(function()
		-- upvalues: p3 (ref), id (ref)
		p3.onConversationActivated(id)
	end, { id, p3.onConversationActivated })
	local participants = conversation.participants or {}
	local localUserId = p3.localUserId
	local t = {}
	
	for i, v in participants do
		if v ~= localUserId then
			table.insert(t, v)
		end
	end
	local var2 = t[1] or p3.localUserId
	local var3 = if #t >= 2 then t[2] else nil
	local titleForViewer = conversation.titleForViewer
	
	return reactModule.createElement(shareSheetItemContainerModule, {
		primaryUserId = var2,
		secondUserId = var3,
		isSelected = p3.isSelected,
		label = if titleForViewer and titleForViewer ~= "" then titleForViewer else conversation.title or "",
		onActivated = var1,
		LayoutOrder = p3.LayoutOrder
	})
end

return function(p4)
	-- upvalues: playersService (ref), fFlagSharePplPickerModule (ref), useLocalization (ref), createSkeletonItems (ref), reactModule (ref), ShareSheetConversationItem (ref), shareSheetItemContainerModule (ref), iconName (ref), onMoreActivated (ref), shareSheetRowModule (ref)
	local var4 = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
	local var5 = if fFlagSharePplPickerModule then useLocalization({ more = "CommonUI.Features.Label.More" }) else nil
	local t = {}
	
	if p4.isLoading or p4.conversationEligibility.isLoading then
		t = createSkeletonItems()
	else
		local eligibleConversations = p4.conversationEligibility.eligibleConversations
		
		for i, v in eligibleConversations do
			local id = v.id
			t[id] = reactModule.createElement(ShareSheetConversationItem, {
				conversation = v,
				isSelected = p4.selectedConversationIds[id] == true,
				localUserId = var4,
				onConversationActivated = p4.onConversationActivated,
				LayoutOrder = i
			})
		end
		if fFlagSharePplPickerModule then
			t.More = reactModule.createElement(shareSheetItemContainerModule, {
				icon = iconName.ThreeDotsHorizontal,
				label = var5.more,
				onActivated = onMoreActivated,
				LayoutOrder = #eligibleConversations + 1
			})
		end
	end
	return reactModule.createElement(shareSheetRowModule, { LayoutOrder = p4.LayoutOrder }, t)
end