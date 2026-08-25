local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local shareSheetRowModule = require(script.Parent.ShareSheetRow)
local shareSheetItemContainerModule = require(script.Parent.ShareSheetItemContainer)
local playersService = game:GetService("Players")
local shareSheetNumAvatarSkeletons = game:DefineFastInt("ShareSheetNumAvatarSkeletons", 6)
local _ = require(parent.AppChat.GetConversationListStore)

local function _(p0, p1)
	local t = {}
	
	for i, v in p0 do
		if v ~= p1 then
			table.insert(t, v)
		end
	end
	return t
end

local function createSkeletonItems()
	-- upvalues: shareSheetNumAvatarSkeletons (ref), reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local t = {}
	
	for i = 1, shareSheetNumAvatarSkeletons do
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

local function ShareSheetConversationItem(p2)
	-- upvalues: reactModule (ref), shareSheetItemContainerModule (ref)
	local conversation = p2.conversation
	local id = conversation.id
	local var10 = reactModule.useCallback(function()
		-- upvalues: p2 (ref), id (ref)
		p2.onConversationActivated(id)
	end, { id, p2.onConversationActivated })
	local participants = conversation.participants or {}
	local localUserId = p2.localUserId
	local t = {}
	
	for i, v in participants do
		if v ~= localUserId then
			table.insert(t, v)
		end
	end
	local var13 = t[1] or p2.localUserId
	local var14 = if #t >= 2 then t[2] else nil
	local titleForViewer = conversation.titleForViewer
	
	return reactModule.createElement(shareSheetItemContainerModule, {
		primaryUserId = var13,
		secondUserId = var14,
		isSelected = p2.isSelected,
		label = if titleForViewer and titleForViewer ~= "" then titleForViewer else conversation.title or "",
		onActivated = var10,
		LayoutOrder = p2.LayoutOrder
	})
end

return function(p3)
	-- upvalues: playersService (ref), createSkeletonItems (ref), reactModule (ref), ShareSheetConversationItem (ref), shareSheetRowModule (ref)
	local var15 = tostring(if playersService.LocalPlayer then playersService.LocalPlayer.UserId else 0)
	local t = {}
	
	if p3.isLoading or p3.conversationEligibility.isLoading then
		t = createSkeletonItems()
	else
		for i, v in p3.conversationEligibility.eligibleConversations do
			local id = v.id
			t[id] = reactModule.createElement(ShareSheetConversationItem, {
				conversation = v,
				isSelected = p3.selectedConversationIds[id] == true,
				localUserId = var15,
				onConversationActivated = p3.onConversationActivated,
				LayoutOrder = i
			})
		end
	end
	return reactModule.createElement(shareSheetRowModule, { LayoutOrder = p3.LayoutOrder }, t)
end