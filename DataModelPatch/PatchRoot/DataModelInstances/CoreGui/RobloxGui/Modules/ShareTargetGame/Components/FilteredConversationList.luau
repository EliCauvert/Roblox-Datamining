local ShareTargetGame = script:FindFirstAncestor("ShareTargetGame")
local DependenciesModule = require(ShareTargetGame.dependencies)
local Roact = DependenciesModule.Roact
local UIBlox = DependenciesModule.UIBlox
local User = DependenciesModule.User
local FilteredScrollingList = DependenciesModule.SocialLibraries.Components.FilteredScrollingList
local ConversationSortComparatorModule = require(ShareTargetGame.Utils.conversationSortComparator)
local ConversationCellWithSendButtonModule = require(script.Parent.ConversationCellWithSendButton)
local FilteredConversationList = Roact.PureComponent:extend("FilteredConversationList")
FilteredConversationList.defaultProps = {
	touchedBottomCallback = nil,
	filterBoxPlaceHolderText = nil,
	offlinePresence = nil,
	onlinePresence = nil,
	sendText = "Send",
	sentText = "Sent",
	sendingText = "Sending",
	failedText = "Failed",
	entryHeight = nil,
	isLoading = false,
	searchFilterPredicate = function(Text: string, p1): boolean
		local Title: string = p1.title
		
		return not Text or Text == "" or string.find(string.lower(Title), string.lower(Text), 1, true) ~= nil
	end,
	conversations = {},
	conversationSendingStatuses = {},
	onSendButtonActivated = function(_) end
}

function FilteredConversationList.init(p1)
	-- upvalues: User (copy), Roact (copy), ConversationCellWithSendButtonModule (copy)
	p1.loadingEntries = table.create(3, { title = "" })
	
	function p1.renderConversationCell(Conversation)
		-- upvalues: User (upval), p1 (copy), Roact (upval), ConversationCellWithSendButtonModule (upval)
		return Roact.createElement(ConversationCellWithSendButtonModule, {
			conversation = Conversation,
			sentStatus = p1.props.conversationSendingStatuses[Conversation.conversationId],
			subTitleText = if Conversation.presence then if Conversation.presence == User.PresenceType.ONLINE then p1.props.onlinePresence elseif Conversation.presence == User.PresenceType.OFFLINE then p1.props.offlinePresence else Conversation.lastLocation else "",
			sendText = p1.props.sendText,
			sentText = p1.props.sentText,
			sendingText = p1.props.sendingText,
			failedText = p1.props.failedText,
			secondaryTitleText = Conversation.alias,
			onSendButtonActivated = p1.props.onSendButtonActivated,
			isLoading = p1.props.isLoading
		})
	end
end

function FilteredConversationList.render(p1)
	-- upvalues: UIBlox (copy), Roact (copy), FilteredScrollingList (copy), ConversationSortComparatorModule (copy)
	local LoadingEntries = p1.props.isLoading and p1.loadingEntries or p1.props.conversations
	
	return UIBlox.Style.withStyle(function(p2)
		-- upvalues: Roact (upval), FilteredScrollingList (upval), p1 (copy), LoadingEntries (copy), ConversationSortComparatorModule (upval)
		local Theme = p2.Theme
		local _Font = p2.Font
		
		return Roact.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
			layout = Roact.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			dividerTop = Roact.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 1,
				BackgroundColor3 = Theme.Divider.Color,
				BackgroundTransparency = Theme.Divider.Transparency,
				Size = UDim2.new(1, 0, 0, 1)
			}),
			filterBoxContainer = Roact.createElement(FilteredScrollingList, {
				searchBoxHeight = 48,
				searchIconCellWidth = 60,
				searchIconSize = 24,
				searchIconImage = "rbxasset://textures/ui/LuaChat/icons/ic-search.png",
				searchClearIcon = "rbxasset://textures/ui/LuaChat/icons/ic-close-white.png",
				searchDividerHeight = 1,
				LayoutOrder = 2,
				searchBackgroundColor3 = Theme.UIMuted.Color,
				searchBackgroundTransparency = Theme.UIMuted.Transparency,
				searchIconColor3 = Theme.TextDefault.Color,
				searchIconTransparency = Theme.TextDefault.Transparency,
				searchInputTextFont = _Font.Body.Font,
				searchInputTextColor3 = Theme.TextDefault.Color,
				searchInputTextSize = _Font.BaseSize * _Font.Body.RelativeSize,
				searchInputTextTransparency = Theme.TextDefault.Transparency,
				searchPlaceholderTextTransparency = Theme.PlaceHolder.Transparency,
				searchPlaceholderTextColor3 = Theme.TextDefault.Color,
				searchPlaceholderText = p1.props.filterBoxPlaceHolderText,
				searchClearIconColor3 = Theme.TextDefault.Color,
				searchDividerColor3 = Theme.Divider.Color,
				searchDividerTransparency = Theme.Divider.Transparency,
				scrollBarImageTransparency = p2.Theme.UIDefault.Transparency,
				scrollBarImageColor3 = p2.Theme.UIDefault.Color,
				entries = LoadingEntries,
				renderEntry = p1.renderConversationCell,
				entryHeight = p1.props.entryHeight,
				scrollTouchedBottomCallback = p1.props.touchedBottomCallback,
				filterPredicate = p1.props.searchFilterPredicate,
				sortComparator = ConversationSortComparatorModule
			})
		})
	end)
end

return FilteredConversationList