local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local socialCarouselModule = require(parent.SocialCarousel)
local viewRecyclerModule = require(parent.ViewRecycler)
local chatLandingModalContainerModule = require(script.Parent.ChatLandingModal.ChatLandingModalContainer)
local conversationGroupsEntryContainerModule = require(script.Parent.ConversationGroupsEntryContainer)
local conversationListItemKindModule = require(script.Parent.ConversationListItemKind)
local conversationRowModule = require(script.Parent.ConversationRow.ConversationRow)
local conversationRowBindingHostModule = require(script.Parent.ConversationRow.ConversationRowBindingHost)
local partyQuickStartContainerModule = require(script.Parent.PartyQuickStartContainer)
local fFlagAppChatUseBindingViewRecyclerConversationRowModule = require(appChat.Flags.FFlagAppChatUseBindingViewRecyclerConversationRow)
local constants = socialCarouselModule.Constants
local view = foundationModule.View
local t = {
	readiness = viewRecyclerModule.RecyclableViewReadiness.ReadyOnCommit
}

local function selectCanvasSize(p1)
	return UDim2.new(1, 0, 0, p1.height)
end

local function _(value)
	return value.backgroundStyle
end

local frozen = table.freeze({
	[conversationListItemKindModule.CanvasTopPadding] = viewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: signalsReactModule (ref), selectCanvasSize (ref), reactModule (ref), view (ref)
		return reactModule.createElement(view, {
			BorderSizePixel = 0,
			Size = signalsReactModule.useSignalBinding(function(p2)
				-- upvalues: selectCanvasSize (copy), p1 (ref)
				return selectCanvasSize(p1.itemSignal(p2))
			end),
			backgroundStyle = signalsReactModule.useSignalBinding(function(p2)
				-- upvalues: p1 (ref)
				return p1.itemSignal(p2).backgroundStyle
			end)
		})
	end),
	[conversationListItemKindModule.ChatLandingModal] = viewRecyclerModule.createRecyclableView(function(_)
		-- upvalues: reactModule (ref), chatLandingModalContainerModule (ref)
		return reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ChatLandingModal = reactModule.createElement(chatLandingModalContainerModule)
		})
	end),
	[conversationListItemKindModule.Conversation] = if fFlagAppChatUseBindingViewRecyclerConversationRowModule then viewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: reactModule (ref), conversationRowBindingHostModule (ref)
		return reactModule.createElement(conversationRowBindingHostModule, { itemSignal = p1.itemSignal })
	end) else viewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: signalsReactModule (ref), reactModule (ref), conversationRowModule (ref)
		local var1 = signalsReactModule.useSignalState(p1.itemSignal)
		local var2 = signalsReactModule.useSignalState(var1.presentationSignal)
		
		return reactModule.createElement(conversationRowModule, {
			conversationId = var1.id,
			entryHeight = var2.entryHeight,
			isSquadEnabled = var2.isSquadEnabled,
			isWideMode = var2.isWideMode,
			onActivated = var2.onActivated,
			onSquadJoinButtonActivated = var2.onSquadJoinButtonActivated,
			fireImpressionEvent = var2.fireImpressionEvent,
			fireClickEvent = var2.fireClickEvent,
			showBackground = var2.showBackground,
			localUserId = var2.localUserId,
			debugCellValue = if var2.isDebugEnabled then var1.id else nil
		})
	end, t),
	[conversationListItemKindModule.GroupLink] = viewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: signalsReactModule (ref), reactModule (ref), conversationGroupsEntryContainerModule (ref)
		return reactModule.createElement(conversationGroupsEntryContainerModule, {
			entryHeight = signalsReactModule.useSignalState(p1.itemSignal).entryHeight
		})
	end, t),
	[conversationListItemKindModule.QuickStartLink] = viewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: signalsReactModule (ref), reactModule (ref), partyQuickStartContainerModule (ref)
		return reactModule.createElement(partyQuickStartContainerModule, {
			entryHeight = signalsReactModule.useSignalState(p1.itemSignal).entryHeight
		})
	end, t),
	[conversationListItemKindModule.SocialCarousel] = viewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: signalsReactModule (ref), reactModule (ref), socialCarouselModule (ref), constants (ref)
		local var1 = signalsReactModule.useSignalState(p1.itemSignal)
		
		return reactModule.createElement(socialCarouselModule.Entry, {
			roduxKey = "ChatAppReducer",
			hideCarouselHeader = true,
			customTileList = var1.customTileList,
			source = if var1.isInExperience then constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else constants.ANALYTICS.SRC.PARTY_PAGE_UA,
			unifiedLogging = var1.unifiedLogging
		})
	end, t)
})

return table.freeze({
	canvasTopPadding = function(p1, p2)
		-- upvalues: conversationListItemKindModule (ref)
		return {
			id = "CanvasTopPadding",
			kind = conversationListItemKindModule.CanvasTopPadding,
			height = p1,
			backgroundStyle = p2
		}
	end,
	chatLandingModal = function()
		-- upvalues: conversationListItemKindModule (ref)
		return {
			id = "UnfilteredThreadsFtux",
			kind = conversationListItemKindModule.ChatLandingModal
		}
	end,
	conversation = function(p1, p2)
		-- upvalues: conversationListItemKindModule (ref)
		return {
			id = tostring(p1),
			kind = conversationListItemKindModule.Conversation,
			presentationSignal = p2
		}
	end,
	getItemKey = function(p1)
		return p1.id
	end,
	getItemType = function(p1)
		-- upvalues: frozen (ref)
		local kind = frozen[p1.kind]
		assert(kind ~= nil, `ConversationListViewRecycler: unknown item kind "{tostring(p14.kind)}"`)
		
		return kind
	end,
	groupLink = function(p1)
		-- upvalues: conversationListItemKindModule (ref)
		return {
			id = "ConversationGroupsEntryContainer",
			kind = conversationListItemKindModule.GroupLink,
			entryHeight = p1
		}
	end,
	quickStart = function(p1)
		-- upvalues: conversationListItemKindModule (ref)
		return {
			id = "PartyQuickStartContainer",
			kind = conversationListItemKindModule.QuickStartLink,
			entryHeight = p1
		}
	end,
	socialCarousel = function(p1, p2, p3)
		-- upvalues: conversationListItemKindModule (ref)
		return {
			id = "SocialCarousel",
			kind = conversationListItemKindModule.SocialCarousel,
			customTileList = p1,
			isInExperience = p2,
			unifiedLogging = p3
		}
	end
})