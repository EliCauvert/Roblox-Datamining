local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local domLocatorsModule = require(appChat.Utils.DomLocators)
local squadsModule = require(parent.Squads)
local fFlagDebugAppChatEnableDomLocatorsModule = require(appChat.Flags.FFlagDebugAppChatEnableDomLocators)
local fFlagAppChatRemoveConversationListDividerModule = require(appChat.Flags.FFlagAppChatRemoveConversationListDivider)
local conversationFacePileModule = require(appChat.Components.Cells.ConversationFacePile)
local useConversationRowPresentationModule = require(script.Parent.useConversationRowPresentation)
local squadButtonSourceEnum = squadsModule.Enums.SquadButtonSourceEnum
local squadComponentAccessWrapper = squadsModule.SquadComponentAccessWrapper
local squadJoinButton = squadsModule.SquadJoinButton
local var1 = reactModule.memo(conversationFacePileModule)

return reactModule.memo(function(p1)
	-- upvalues: useConversationRowPresentationModule (ref), foundationModule (ref), reactModule (ref), fFlagDebugAppChatEnableDomLocatorsModule (ref), var1 (ref), squadComponentAccessWrapper (ref), squadJoinButton (ref), squadButtonSourceEnum (ref), domLocatorsModule (ref), fFlagAppChatRemoveConversationListDividerModule (ref)
	local var2 = useConversationRowPresentationModule({
		conversationId = p1.conversationId,
		entryHeight = p1.entryHeight,
		isSquadEnabled = p1.isSquadEnabled,
		isWideMode = p1.isWideMode,
		onActivated = p1.onActivated,
		onSquadJoinButtonActivated = p1.onSquadJoinButtonActivated,
		fireImpressionEvent = p1.fireImpressionEvent,
		fireClickEvent = p1.fireClickEvent
	})
	local var3 = foundationModule.Hooks.useTokens()
	
	if not var2.hasConversation then
		return nil
	end
	local var4
	local uDim = UDim.new(0, var2.pagePaddingLeft)
	local uDim_1 = UDim.new(0, var2.pagePaddingRight)
	local var5 = p1.showBackground ~= false
	local createElement = reactModule.createElement
	local view = foundationModule.View
	local t = {
		BorderSizePixel = 0,
		backgroundStyle = var3.Color.None,
		Size = UDim2.new(1, 0, 0, var2.entryHeight),
		testId = if fFlagDebugAppChatEnableDomLocatorsModule then var2.testId else nil
	}
	local t_1 = {}
	local createElement_1 = reactModule.createElement
	local view_1 = foundationModule.View
	local t_2 = {
		Name = "cell",
		tag = { ["size-full"] = true, ["bg-surface-0"] = var5 },
		backgroundStyle = if var5 then nil else var3.Color.None,
		Size = UDim2.fromScale(1, 1),
		selection = { Selectable = true },
		onActivated = var2.onRowActivated,
		stateLayer = if var5 then {
			affordance = foundationModule.Enums.StateLayerAffordance.Background
		} else nil,
		ref = var2.rowRef
	}
	local t_3 = {
		debugCellContainer = if p1.debugCellValue then reactModule.createElement("Folder", {}, {
			debugCell = reactModule.createElement("StringValue", { Value = p1.debugCellValue })
		}) else nil
	}
	local createElement_2 = reactModule.createElement
	local view_2 = foundationModule.View
	local t_4 = {
		tag = "row align-y-center gap-small size-full",
		Size = UDim2.fromScale(1, 1),
		padding = { left = uDim, right = uDim_1 }
	}
	local t_5 = {
		avatar = reactModule.createElement(foundationModule.View, { tag = "size-1000-1000", LayoutOrder = 0 }, {
			facePile = reactModule.createElement(var1, {
				selectable = false,
				conversationId = var2.conversationId,
				onActivated = var2.onRowActivated,
				participants = var2.participants,
				localUserId = p1.localUserId
			})
		})
	}
	local createElement_3 = reactModule.createElement
	local view_3 = foundationModule.View
	local t_6 = {
		tag = "col fill size-0-full clip",
		Name = "body",
		LayoutOrder = 1
	}
	local t_7 = {}
	local createElement_4 = reactModule.createElement
	local view_4 = foundationModule.View
	local t_8 = {
		tag = "row align-y-center fill gap-small size-full-0 clip",
		Name = "mainContent",
		LayoutOrder = 1
	}
	local t_9 = {
		info = reactModule.createElement(foundationModule.View, {
			tag = "col align-y-center fill gap-xxsmall size-0-full clip",
			LayoutOrder = 1
		}, {
			titleContainer = reactModule.createElement(foundationModule.View, {
				tag = "row align-y-center gap-xxsmall size-full-0 auto-y clip",
				Name = "titleContainer",
				LayoutOrder = 1
			}, {
				title = reactModule.createElement(foundationModule.Text, {
					tag = "shrink auto-xy text-title-large text-align-x-left text-truncate-split content-default",
					Name = "title",
					LayoutOrder = 1,
					Text = var2.title
				}),
				subscriptionBadge = reactModule.createElement(foundationModule.View, {
					tag = "size-400-400",
					Name = "subscriptionBadge",
					LayoutOrder = 2,
					Visible = var2.showSubscriptionBadge
				}, {
					icon = reactModule.createElement(foundationModule.Icon, {
						name = foundationModule.Enums.IconName.RobloxPlus,
						size = foundationModule.Enums.IconSize.Small,
						style = var3.Color.Content.Emphasis
					})
				})
			}),
			subtitle = reactModule.createElement(foundationModule.Text, {
				tag = "size-full-0 auto-y text-body-small text-align-x-left text-truncate-end content-default",
				LayoutOrder = 2,
				Text = var2.subtitleText
			})
		})
	}
	local createElement_5 = reactModule.createElement
	local view_5 = foundationModule.View
	local t_10 = {
		tag = "row align-y-center size-0-full auto-x",
		LayoutOrder = 2,
		AutomaticSize = Enum.AutomaticSize.X
	}
	local t_11 = {}
	
	if var2.showSquadButton then
		var4 = reactModule.createElement
		var4 = var4(foundationModule.View, {
			tag = "row align-x-right align-y-center auto-xy",
			LayoutOrder = 0
		}, {
			wrapper = reactModule.createElement(squadComponentAccessWrapper, { parentChannelId = var2.conversationId }, {
				button = reactModule.createElement(squadJoinButton, {
					isFullWidth = false,
					isInCard = false,
					layoutOrder = 0,
					Selectable = false,
					shouldAnimate = false,
					conversationId = var2.conversationId,
					onActivated = var2.onSquadActivated,
					squadButtonSource = squadButtonSourceEnum.ConversationEntry,
					squadLocation = var2.squadLocation,
					testId = if fFlagDebugAppChatEnableDomLocatorsModule and var2.locatorTitle then domLocatorsModule.chatLandingConversationEntrySquadButton(var2.locatorTitle) else nil
				})
			})
		})
	else
		var4 = nil
	end
	t_11.squadButton = var4
	t_11.timestampCluster = reactModule.createElement(foundationModule.View, {
		tag = "row align-y-center gap-xsmall auto-xy",
		Name = "timestampCluster",
		LayoutOrder = 1,
		Visible = var2.showTimestamp
	}, {
		timestamp = reactModule.createElement(foundationModule.Text, {
			tag = "auto-xy text-body-small content-default",
			Name = "timeStamp",
			LayoutOrder = 1,
			Text = var2.timestampText
		}),
		unreadDot = reactModule.createElement(foundationModule.View, {
			tag = "size-200-200 radius-circle bg-action-emphasis",
			Name = "unreadDot",
			LayoutOrder = 2,
			Visible = var2.showUnread
		})
	})
	t_9.rightContent = createElement_5(view_5, t_10, t_11)
	t_7.mainContent = createElement_4(view_4, t_8, t_9)
	t_7.divider = if not fFlagAppChatRemoveConversationListDividerModule then reactModule.createElement(foundationModule.View, {
		tag = "size-full-0 auto-y",
		Name = "divider",
		LayoutOrder = 2
	}, {
		line = reactModule.createElement(foundationModule.Divider)
	}) else nil
	t_5.body = createElement_3(view_3, t_6, t_7)
	t_3.content = createElement_2(view_2, t_4, t_5)
	t_1.cell = createElement_1(view_1, t_2, t_3)
	
	return createElement(view, t, t_1)
end)