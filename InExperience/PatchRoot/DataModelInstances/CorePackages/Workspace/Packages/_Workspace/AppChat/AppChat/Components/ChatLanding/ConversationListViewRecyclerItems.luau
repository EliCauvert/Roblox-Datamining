local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local SocialCarouselModule = require(Parent.SocialCarousel)
local ViewRecyclerModule = require(Parent.ViewRecycler)
local ChatLandingModalContainerModule = require(script.Parent.ChatLandingModal.ChatLandingModalContainer)
local ConversationGroupsEntryContainerModule = require(script.Parent.ConversationGroupsEntryContainer)
local ConversationListItemKindModule = require(script.Parent.ConversationListItemKind)
local ConversationRowModule = require(script.Parent.ConversationRow.ConversationRow)
local ConversationRowBindingHostModule = require(script.Parent.ConversationRow.ConversationRowBindingHost)
local PartyQuickStartContainerModule = require(script.Parent.PartyQuickStartContainer)
local Constants = SocialCarouselModule.Constants
local View = require(Parent.Foundation).View
local config = {
	readiness = ViewRecyclerModule.RecyclableViewReadiness.ReadyOnCommit
}

local function selectCanvasSize(ItemSignalResult): UDim2
	return UDim2.new(1, 0, 0, ItemSignalResult.height)
end

local function _(p1)
	return p1.backgroundStyle
end

local RecyclableView = ViewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: SignalsReactModule (copy), ReactModule (copy), ConversationRowModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(p1.itemSignal)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseSignalStateResult.presentationSignal)
	
	return ReactModule.createElement(ConversationRowModule, {
		conversationId = UseSignalStateResult.id,
		entryHeight = UseSignalStateResult1.entryHeight,
		isSquadEnabled = UseSignalStateResult1.isSquadEnabled,
		isWideMode = UseSignalStateResult1.isWideMode,
		onActivated = UseSignalStateResult1.onActivated,
		onSquadJoinButtonActivated = UseSignalStateResult1.onSquadJoinButtonActivated,
		fireImpressionEvent = UseSignalStateResult1.fireImpressionEvent,
		fireClickEvent = UseSignalStateResult1.fireClickEvent,
		showBackground = UseSignalStateResult1.showBackground,
		localUserId = UseSignalStateResult1.localUserId,
		debugCellValue = if UseSignalStateResult1.isDebugEnabled then UseSignalStateResult.id else nil
	})
end, config)
local RecyclableView1 = ViewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: ReactModule (copy), ConversationRowBindingHostModule (copy)
	return ReactModule.createElement(ConversationRowBindingHostModule, { itemSignal = p1.itemSignal })
end)
local RecyclableView2 = ViewRecyclerModule.createRecyclableView(function(p1)
	-- upvalues: SignalsReactModule (copy), selectCanvasSize (copy), ReactModule (copy), View (copy)
	return ReactModule.createElement(View, {
		BorderSizePixel = 0,
		Size = SignalsReactModule.useSignalBinding(function(p2)
			-- upvalues: selectCanvasSize (upval), p1 (copy)
			return selectCanvasSize(p1.itemSignal(p2))
		end),
		backgroundStyle = SignalsReactModule.useSignalBinding(function(p2)
			-- upvalues: p1 (copy)
			return p1.itemSignal(p2).backgroundStyle
		end)
	})
end)
local Frozen = table.freeze({
	[ConversationListItemKindModule.CanvasBottomPadding] = RecyclableView2,
	[ConversationListItemKindModule.CanvasTopPadding] = RecyclableView2,
	[ConversationListItemKindModule.ChatLandingModal] = ViewRecyclerModule.createRecyclableView(function(_)
		-- upvalues: ReactModule (copy), ChatLandingModalContainerModule (copy)
		return ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			ChatLandingModal = ReactModule.createElement(ChatLandingModalContainerModule)
		})
	end),
	[ConversationListItemKindModule.Conversation] = if require(AppChat.Flags.FFlagAppChatUseBindingViewRecyclerConversationRow) then RecyclableView1 else RecyclableView,
	[ConversationListItemKindModule.GroupLink] = ViewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: SignalsReactModule (copy), ReactModule (copy), ConversationGroupsEntryContainerModule (copy)
		return ReactModule.createElement(ConversationGroupsEntryContainerModule, {
			entryHeight = SignalsReactModule.useSignalState(p1.itemSignal).entryHeight
		})
	end, config),
	[ConversationListItemKindModule.QuickStartLink] = ViewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: SignalsReactModule (copy), ReactModule (copy), PartyQuickStartContainerModule (copy)
		return ReactModule.createElement(PartyQuickStartContainerModule, {
			entryHeight = SignalsReactModule.useSignalState(p1.itemSignal).entryHeight
		})
	end, config),
	[ConversationListItemKindModule.SocialCarousel] = ViewRecyclerModule.createRecyclableView(function(p1)
		-- upvalues: SignalsReactModule (copy), ReactModule (copy), SocialCarouselModule (copy), Constants (copy)
		local UseSignalStateResult = SignalsReactModule.useSignalState(p1.itemSignal)
		
		return ReactModule.createElement(SocialCarouselModule.Entry, {
			roduxKey = "ChatAppReducer",
			hideCarouselHeader = true,
			customTileList = UseSignalStateResult.customTileList,
			source = if UseSignalStateResult.isInExperience then Constants.ANALYTICS.SRC.PARTY_PAGE_IN_EXP else Constants.ANALYTICS.SRC.PARTY_PAGE_UA,
			unifiedLogging = UseSignalStateResult.unifiedLogging
		})
	end, config)
})

return table.freeze({
	canvasBottomPadding = function(Height, BackgroundStyle)
		-- upvalues: ConversationListItemKindModule (copy)
		return {
			id = "CanvasBottomPadding",
			kind = ConversationListItemKindModule.CanvasBottomPadding,
			height = Height,
			backgroundStyle = BackgroundStyle
		}
	end,
	canvasTopPadding = function(Height, BackgroundStyle)
		-- upvalues: ConversationListItemKindModule (copy)
		return {
			id = "CanvasTopPadding",
			kind = ConversationListItemKindModule.CanvasTopPadding,
			height = Height,
			backgroundStyle = BackgroundStyle
		}
	end,
	chatLandingModal = function()
		-- upvalues: ConversationListItemKindModule (copy)
		return {
			id = "UnfilteredThreadsFtux",
			kind = ConversationListItemKindModule.ChatLandingModal
		}
	end,
	conversation = function(p1, PresentationSignal)
		-- upvalues: ConversationListItemKindModule (copy)
		return {
			id = tostring(p1),
			kind = ConversationListItemKindModule.Conversation,
			presentationSignal = PresentationSignal
		}
	end,
	getItemKey = function(p1)
		return p1.id
	end,
	getItemType = function(p1)
		-- upvalues: Frozen (copy)
		local FrozenEntry = Frozen[p1.kind]
		assert(FrozenEntry ~= nil, `ConversationListViewRecycler: unknown item kind "{tostring(p11.kind)}"`)
		
		return FrozenEntry
	end,
	groupLink = function(EntryHeight)
		-- upvalues: ConversationListItemKindModule (copy)
		return {
			id = "ConversationGroupsEntryContainer",
			kind = ConversationListItemKindModule.GroupLink,
			entryHeight = EntryHeight
		}
	end,
	quickStart = function(EntryHeight)
		-- upvalues: ConversationListItemKindModule (copy)
		return {
			id = "PartyQuickStartContainer",
			kind = ConversationListItemKindModule.QuickStartLink,
			entryHeight = EntryHeight
		}
	end,
	socialCarousel = function(CustomTileList, IsInExperience, UnifiedLogging)
		-- upvalues: ConversationListItemKindModule (copy)
		return {
			id = "SocialCarousel",
			kind = ConversationListItemKindModule.SocialCarousel,
			customTileList = CustomTileList,
			isInExperience = IsInExperience,
			unifiedLogging = UnifiedLogging
		}
	end
})