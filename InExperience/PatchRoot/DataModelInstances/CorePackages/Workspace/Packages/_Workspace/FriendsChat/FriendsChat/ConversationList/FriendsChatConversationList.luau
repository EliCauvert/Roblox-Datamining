local TextChatService = game:GetService("TextChatService")
local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local ReactOtterModule = require(Parent.ReactOtter)
local FoundationModule = require(Parent.Foundation)
local PromiseModule = require(Parent.Promise)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppChatModule = require(Parent.AppChat)
local FFlagAppChatUseUltimateListConversationListModule = require(Parent.AppChat.FFlagAppChatUseUltimateListConversationList)
local UseConversationSearchModule = require(Parent.AppChat.useConversationSearch)
local SearchIntroducedConversationIdsModule = require(Parent.AppChat.searchIntroducedConversationIds)
local FFlagFriendsChatServerSideConversationSearchModule = require(FriendsChat.Flags.FFlagFriendsChatServerSideConversationSearch)
local FFlagFriendsChatConversationListFocusNav = require(Parent.SharedFlags).FFlagFriendsChatConversationListFocusNav
local FFlagExpChatTabShortcutNav = require(Parent.SharedFlags).FFlagExpChatTabShortcutNav
local BidirectionalFlatList = require(Parent.VirtualizedList).BidirectionalFlatList
local UseChatPlatformModule = require(Parent.ExpChatIntegration.useChatPlatform)
local UseChatInputBarSettingsModule = require(Parent.ExpChatIntegration.useChatInputBarSettings)
local UseInterpolatedClientSettingsModule = require(Parent.ExpChatIntegration.useInterpolatedClientSettings)
local UseChatWindowSettingsModule = require(Parent.ExpChatIntegration.useChatWindowSettings)
local UseFocusConversationListModule = require(script.Parent.useFocusConversationList)
local GetConversationRowHeightModule = require(script.Parent.getConversationRowHeight)
local ResolveListStateModule = require(script.Parent.resolveListState)
local UseConversationListPaginationModule = require(script.Parent.useConversationListPagination)
local LayoutConstantsModule = require(FriendsChat.LayoutConstants)
local UseChatSearchSessionModule = require(Parent.AppChat.useChatSearchSession)
local UseChatSearchResultsTelemetryModule = require(Parent.AppChat.useChatSearchResultsTelemetry)
local FFlagAppChatSearchSessionTelemetryModule = require(Parent.AppChat.FFlagAppChatSearchSessionTelemetry)
local UseFriendsChatLandingTelemetryModule = require(script.Parent.Parent.Telemetry.ChatLanding.useFriendsChatLandingTelemetry)
local GetLandingEmptyStateTypeModule = require(script.Parent.Parent.Telemetry.ChatLanding.getLandingEmptyStateType)
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseTextSizeOffsetFunction = FoundationModule.Hooks.useTextSizeOffset
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ConversationListUltimate = AppChatModule.Components.ChatLanding.ConversationListUltimate
local ConversationRow = AppChatModule.Components.ChatLanding.ConversationRow
local GetConversationTitleFunction = require(script.Parent.ExpChatConversationListAdapter).getConversationTitle
local UseConversationListFunction = AppChatModule.Hooks.useConversationList
local FriendsChatConversationListAutoscrollToTopThreshold = game:DefineFastInt("FriendsChatConversationListAutoscrollToTopThreshold", 33)
local FriendsChatConversationListInitialNumToRender = game:DefineFastInt("FriendsChatConversationListInitialNumToRender", 8)
local FriendsChatConversationListPaginationThresholdRows = game:DefineFastInt("FriendsChatConversationListPaginationThresholdRows", 10)
local FriendsChatConversationListScrollbarThickness = game:DefineFastInt("FriendsChatConversationListScrollbarThickness", 8)
local FriendsChatConversationListWindowSize = game:DefineFastInt("FriendsChatConversationListWindowSize", 2)
local FFlagFriendsChatScaleConversationRowHeightModule = require(FriendsChat.Flags.FFlagFriendsChatScaleConversationRowHeight)
local FFlagFriendsChatLandingTelemetryFieldsModule = require(FriendsChat.Flags.FFlagFriendsChatLandingTelemetryFields)
local NoFFlagAppChatUseUltimateListConversationListModule: boolean = require(FriendsChat.Flags.FFlagFriendsChatConversationListFadeScrollbar) and not FFlagAppChatUseUltimateListConversationListModule
local FriendsChatConversationListScrollbarIdleHideMsRatio = game:DefineFastInt("FriendsChatConversationListScrollbarIdleHideMs", 1500) / 1000
local config = {
	dampingRatio = 1,
	frequency = 2,
	restingVelocityLimit = 0.1,
	restingPositionLimit = 0.1
}
local config1 = {
	NoFriends = "Feature.Chat.Text.NoFriends",
	SearchPlaceholder = "CommonUI.Controls.Action.Search",
	Loading = "Feature.Chat.Label.Loading",
	NoChatFound = "Feature.Chat.Label.NoChatFound",
	SomethingWentWrong = "CommonUI.Messages.Response.SomethingWentWrong"
}

local function _(p1, Transparency) --[[ Line: 117 | Named "getColorStyle" ]]
	return { Color3 = p1, Transparency = Transparency }
end

local _ = function(p1, p2) --[[ Line: 124 | Named "getTransparencyOrBindingValue" ]]
	-- upvalues: ReactIsModule (copy)
	return if ReactIsModule.isBinding(p2) then p2:map(function(p3): number --[[ Line: 126 ]]
		-- upvalues: p1 (copy)
		return p1 + p3 * (1 - p1)
	end) else p2
end

local _ = function(p1, p2) --[[ Line: 134 | Named "getTextTransparency" ]]
	-- upvalues: ReactIsModule (copy)
	return if ReactIsModule.isBinding(p1) then p1:map(function(p3): number --[[ Line: 136 ]]
		-- upvalues: p2 (copy)
		return p2 + p3 * (1 - p2)
	end) else p2
end

local function mergeTransparency(Transparency, List) --[[ Line: 144 ]]
	-- upvalues: ReactIsModule (copy), ReactModule (copy)
	local List1 = {}
	local Total: number = Transparency
	
	for _, value in List do
		if ReactIsModule.isBinding(value) then
			table.insert(List1, value)
		else
			Total += (value or 0) * (1 - Total)
		end
	end
	return if #List1 == 0 then Total else ReactModule.joinBindings(List1):map(function(List): number --[[ Line: 160 ]]
		-- upvalues: Total (ref)
		local Total1: number = Total
		
		for _, value in List do
			Total1 += value * (1 - Total1)
		end
		return Total1
	end)
end

local _ = function(p1): string --[[ Line: 169 | Named "normalizeSearchText" ]]
	return string.lower(p1 or "")
end

local _ = function(p1, Pattern): boolean --[[ Line: 173 | Named "containsSearchText" ]]
	return Pattern == "" or string.find(string.lower(p1 or ""), Pattern, 1, true) ~= nil
end

return ReactModule.memo(function(Frame) --[[ Line: 180 | Named "FriendsChatConversationList" ]]
	-- upvalues: UseTokensFunction (copy), FFlagFriendsChatScaleConversationRowHeightModule (copy), UseTextSizeOffsetFunction (copy), UseChatPlatformModule (copy), UseChatWindowSettingsModule (copy), ReactModule (copy), UseLocalizationFunction (copy), config1 (copy), UseInterpolatedClientSettingsModule (copy), ReactIsModule (copy), mergeTransparency (copy), GetConversationRowHeightModule (copy), UseChatInputBarSettingsModule (copy), LayoutConstantsModule (copy), FFlagExpChatTabShortcutNav (copy), FoundationModule (copy), UseFocusConversationListModule (copy), UseConversationListFunction (copy), UseConversationListPaginationModule (copy), FFlagFriendsChatServerSideConversationSearchModule (copy), GetConversationTitleFunction (copy), UseConversationSearchModule (copy), FFlagAppChatSearchSessionTelemetryModule (copy), UseChatSearchResultsTelemetryModule (copy), ResolveListStateModule (copy), FFlagFriendsChatLandingTelemetryFieldsModule (copy), GetLandingEmptyStateTypeModule (copy), UseChatSearchSessionModule (copy), UseFriendsChatLandingTelemetryModule (copy), SearchIntroducedConversationIdsModule (copy), TextChatService (copy), NoFFlagAppChatUseUltimateListConversationListModule (copy), ReactOtterModule (copy), FriendsChatConversationListScrollbarIdleHideMsRatio (copy), config (copy), FFlagFriendsChatConversationListFocusNav (copy), ConversationRow (copy), PromiseModule (copy), FFlagAppChatUseUltimateListConversationListModule (copy), ConversationListUltimate (copy), BidirectionalFlatList (copy), FriendsChatConversationListScrollbarThickness (copy), FriendsChatConversationListWindowSize (copy), FriendsChatConversationListInitialNumToRender (copy), FriendsChatConversationListPaginationThresholdRows (copy), FriendsChatConversationListAutoscrollToTopThreshold (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), Text (copy), IconButton (copy), InputSize (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local UseTextSizeOffsetResult = if FFlagFriendsChatScaleConversationRowHeightModule then UseTextSizeOffsetFunction() else nil
	local GetTransparencyStoreFunction = UseChatPlatformModule().getTransparencyStore
	local UseChatWindowSettingsModuleResult = UseChatWindowSettingsModule()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 188 ]]
		-- upvalues: UseChatWindowSettingsModuleResult (copy)
		return {
			BackgroundColor3 = UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3,
			BackgroundTransparency = UseChatWindowSettingsModuleResult.ChatWindowBackgroundTransparency
		}
	end, { UseChatWindowSettingsModuleResult })
	local ChatWindowSettings = Frame.chatWindowSettings or UseMemoResult
	local UseLocalizationResult = UseLocalizationFunction(config1)
	local UseInterpolatedClientSettingsModuleResult = UseInterpolatedClientSettingsModule(ChatWindowSettings)
	local BackgroundTransparency = UseInterpolatedClientSettingsModuleResult.BackgroundTransparency
	local BackgroundColor3 = UseInterpolatedClientSettingsModuleResult.BackgroundColor3 or (UseInterpolatedClientSettingsModuleResult.BackgroundColor or ChatWindowSettings.BackgroundColor3)
	local TransparencyValue = Frame.transparencyValue or UseChatWindowSettingsModuleResult.ChatWindowBackgroundTransparency
	local MapResult = nil
	
	if Frame.transparencyValue == nil then
		MapResult = 0
	elseif ReactIsModule.isBinding(TransparencyValue) then
		local v1 = 0
		MapResult = TransparencyValue:map(function(p1): number --[[ Line: 126 ]]
			-- upvalues: v1 (copy)
			return v1 + p1 * (1 - v1)
		end)
	else
		MapResult = TransparencyValue
	end
	local TextTransparency = Frame.textTransparency or ReactModule.createBinding(0)
	local MergeTransparencyResult = mergeTransparency(UseTokensResult.Color.Content.Default.Transparency, { TextTransparency, MapResult })
	local MergeTransparencyResult1 = mergeTransparency(UseTokensResult.Color.Content.Emphasis.Transparency, { TextTransparency, MapResult })
	local MergeTransparencyResult2 = mergeTransparency(UseTokensResult.Color.Stroke.Default.Transparency, { MapResult })
	local Size1200 = UseTokensResult.Size.Size_1200
	local ConversationRowHeightModule = GetConversationRowHeightModule(UseTokensResult.Size.Size_1400, UseTextSizeOffsetResult or 0, FFlagFriendsChatScaleConversationRowHeightModule)
	local UseChatInputBarSettingsModuleResult = UseChatInputBarSettingsModule()
	local NewInputBarTopPadding = LayoutConstantsModule.InputBarTopPadding + LayoutConstantsModule.InputBarBottomPadding + LayoutConstantsModule.InputBarTextVerticalPadding + ((if Frame.isSpatialUIEnabled and UseChatInputBarSettingsModuleResult and UseChatInputBarSettingsModuleResult.SpatialPanelTextSize then UseChatInputBarSettingsModuleResult.SpatialPanelTextSize elseif UseChatInputBarSettingsModuleResult then UseChatInputBarSettingsModuleResult.TextSize else UseTokensResult.Typography.CaptionMedium.FontSize) or UseTokensResult.Typography.CaptionMedium.FontSize)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseCursorResult = if FFlagExpChatTabShortcutNav then FoundationModule.Hooks.useCursor(FoundationModule.Enums.CursorType.RoundedRect) else nil
	local UseRefResult = ReactModule.useRef(nil)
	local UseFocusConversationListModuleResult, UseFocusConversationListModuleResult2 = UseFocusConversationListModule(GetTransparencyStoreFunction)
	local IsVisible = Frame.visible ~= false
	local UseConversationListResult = UseConversationListFunction(IsVisible)
	local UseConversationListPaginationModuleResult = UseConversationListPaginationModule(IsVisible, UseConversationListResult.listStatus)
	local ListStatus = UseConversationListResult.listStatus
	local Items = UseConversationListResult.items
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 246 ]]
		-- upvalues: FFlagFriendsChatServerSideConversationSearchModule (upval), Items (copy), UseStateResult (copy), GetConversationTitleFunction (upval)
		if FFlagFriendsChatServerSideConversationSearchModule then
			return Items
		end
		local Lowered = string.lower(UseStateResult or "")
		local List = {}
		
		for _, item in Items do
			local ConversationTitle = GetConversationTitleFunction(item) or (item.title or item.titleForViewer)
			local PreviewContent = item.previewContent
			
			if Lowered == "" or string.find(string.lower(ConversationTitle or ""), Lowered, 1, true) ~= nil or (Lowered == "" or string.find(string.lower(PreviewContent or ""), Lowered, 1, true) ~= nil) then
				table.insert(List, item)
			end
		end
		return List
	end, { Items, UseStateResult })
	local v2 = nil
	
	if FFlagFriendsChatServerSideConversationSearchModule then
		local UseConversationSearchModuleResult = UseConversationSearchModule(UseStateResult, IsVisible)
		v2 = UseConversationSearchModuleResult
		
		if FFlagAppChatSearchSessionTelemetryModule then
			UseChatSearchResultsTelemetryModule(UseConversationSearchModuleResult)
		end
	end
	local v3 = if v2 == nil or not v2.isActive then nil else v2
	local ResolveListStateModuleResult = ResolveListStateModule({
		items = if FFlagFriendsChatServerSideConversationSearchModule then Items else UseMemoResult1,
		totalCount = #Items,
		isFetching = ListStatus.isFetchingConversations == true,
		hasError = ListStatus.error ~= nil,
		hasFetchedInitialPage = ListStatus.hasFetchedInitialPage == true,
		isFetchingNextPage = ListStatus.isFetchingNextPage == true,
		oldestConversationIsFetched = ListStatus.oldestConversationIsFetched == true or ListStatus.isExhausted == true,
		loadNext = UseConversationListPaginationModuleResult.loadNext
	}, v3)
	local Items1 = ResolveListStateModuleResult.items
	local ShouldOfferRetry = ResolveListStateModuleResult.shouldOfferRetry
	local IsNotUseStateResultMatch = UseStateResult ~= ""
	local IsNotUseStateResultMatch1: boolean = if FFlagFriendsChatServerSideConversationSearchModule then v3 ~= nil else IsNotUseStateResultMatch
	local LandingEmptyStateTypeModule = if FFlagFriendsChatLandingTelemetryFieldsModule then GetLandingEmptyStateTypeModule(ResolveListStateModuleResult, IsNotUseStateResultMatch) else nil
	
	if FFlagAppChatSearchSessionTelemetryModule then
		UseChatSearchSessionModule(IsNotUseStateResultMatch1 and Frame.visible ~= false, FFlagFriendsChatServerSideConversationSearchModule)
	end
	local UseFriendsChatLandingTelemetryModuleResult = UseFriendsChatLandingTelemetryModule({
		conversations = Items,
		displayedConversations = Items1,
		isFiltered = IsNotUseStateResultMatch1,
		emptyStateType = LandingEmptyStateTypeModule
	})
	local config2 = {
		searchPlaceholder = UseLocalizationResult.SearchPlaceholder,
		loadingConversations = UseLocalizationResult.Loading,
		loadConversationsError = UseLocalizationResult.SomethingWentWrong,
		noLoadedConversationsFound = UseLocalizationResult.NoChatFound,
		noFriends = UseLocalizationResult.NoFriends
	}
	local LoadingConversations = if ResolveListStateModuleResult.isInitialLoading then config2.loadingConversations elseif ResolveListStateModuleResult.shouldShowBlockingError then config2.loadConversationsError elseif ResolveListStateModuleResult.shouldShowEmptyState then if ResolveListStateModuleResult.hasNoFriends then config2.noFriends else config2.noLoadedConversationsFound else nil
	local UseResult = ReactModule.useCallback(function(p1) --[[ Line: 337 ]]
		-- upvalues: Frame (copy), FFlagFriendsChatServerSideConversationSearchModule (upval), SearchIntroducedConversationIdsModule (upval)
		if Frame.onConversationActivated == nil or p1 == nil or p1.id == nil then return end
		if FFlagFriendsChatServerSideConversationSearchModule then
			SearchIntroducedConversationIdsModule.remove(p1.id)
		end
		Frame.onConversationActivated(p1.id)
	end, { Frame.onConversationActivated })
	local UseResult1 = ReactModule.useCallback(function(p1) --[[ Line: 350 ]]
		-- upvalues: TextChatService (upval), Frame (copy)
		local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if ChatWindowConfiguration and Frame.onAbsoluteSizeChanged then
			Frame.onAbsoluteSizeChanged(p1, ChatWindowConfiguration)
		end
	end, { Frame.onAbsoluteSizeChanged })
	local UseResult2 = ReactModule.useCallback(function(p1) --[[ Line: 357 ]]
		-- upvalues: TextChatService (upval), Frame (copy)
		local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if ChatWindowConfiguration and Frame.onAbsolutePositionChanged then
			Frame.onAbsolutePositionChanged(p1, ChatWindowConfiguration)
		end
	end, { Frame.onAbsolutePositionChanged })
	local UseResult3 = ReactModule.useCallback(function() --[[ Line: 364 ]]
		-- upvalues: UseFriendsChatLandingTelemetryModuleResult (copy), GetTransparencyStoreFunction (copy)
		UseFriendsChatLandingTelemetryModuleResult.fireSearchActivatedEvent()
		GetTransparencyStoreFunction(false).setTextboxFocus()
	end, {
		GetTransparencyStoreFunction,
		UseFriendsChatLandingTelemetryModuleResult.fireSearchActivatedEvent
	})
	local UseResult4 = ReactModule.useCallback(function() --[[ Line: 369 ]]
		-- upvalues: GetTransparencyStoreFunction (copy)
		GetTransparencyStoreFunction(false).clearTextboxFocus()
	end, { GetTransparencyStoreFunction })
	ReactModule.useEffect(function() --[[ Line: 373 ]]
		-- upvalues: GetTransparencyStoreFunction (copy)
		return function() --[[ Line: 374 ]]
			-- upvalues: GetTransparencyStoreFunction (upval)
			GetTransparencyStoreFunction(false).clearTextboxFocus()
		end
	end, { GetTransparencyStoreFunction })
	local v4 = nil
	local Callback = nil
	
	if NoFFlagAppChatUseUltimateListConversationListModule then
		local UseRefResult1 = ReactModule.useRef(nil)
		local UseAnimatedBindingResult2 = nil
		v4, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1)
		Callback = ReactModule.useCallback(function() --[[ Line: 389 ]]
			-- upvalues: UseRefResult1 (copy), UseAnimatedBindingResult2 (ref), ReactOtterModule (upval), FriendsChatConversationListScrollbarIdleHideMsRatio (upval), config (upval)
			if UseRefResult1.current ~= nil then
				pcall(task.cancel, UseRefResult1.current)
				UseRefResult1.current = nil
			end
			UseAnimatedBindingResult2(ReactOtterModule.instant(0))
			UseRefResult1.current = task.delay(FriendsChatConversationListScrollbarIdleHideMsRatio, function() --[[ Line: 397 ]]
				-- upvalues: UseRefResult1 (upval), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), config (upval)
				UseRefResult1.current = nil
				UseAnimatedBindingResult2((ReactOtterModule.spring(1, config)))
			end)
		end, { UseAnimatedBindingResult2 })
		ReactModule.useEffect(function() --[[ Line: 404 ]]
			-- upvalues: UseRefResult1 (copy)
			return function() --[[ Line: 405 ]]
				-- upvalues: UseRefResult1 (upval)
				if UseRefResult1.current ~= nil then
					pcall(task.cancel, UseRefResult1.current)
					UseRefResult1.current = nil
				end
			end
		end, {})
	end
	local UseResult5 = ReactModule.useCallback(function(_) --[[ Line: 415 ]]
		-- upvalues: NoFFlagAppChatUseUltimateListConversationListModule (upval), Callback (ref), GetTransparencyStoreFunction (copy)
		if NoFFlagAppChatUseUltimateListConversationListModule then
			Callback()
		end
		GetTransparencyStoreFunction(false).resetAllTransparency()
	end, {
		GetTransparencyStoreFunction,
		if NoFFlagAppChatUseUltimateListConversationListModule then Callback else nil
	})
	local Text1 = if FFlagFriendsChatConversationListFocusNav and Items1[1] ~= nil then tostring(Items1[1].id) else nil
	local UseResult6 = ReactModule.useCallback(function(p1) --[[ Line: 436 ]]
		-- upvalues: ReactModule (upval), ConversationRow (upval), ConversationRowHeightModule (copy), UseResult (copy), UseFriendsChatLandingTelemetryModuleResult (copy), Frame (copy), FFlagFriendsChatConversationListFocusNav (upval), Text1 (ref), UseFocusConversationListModuleResult2 (copy)
		local Text = tostring(p1.item.id)
		
		return ReactModule.createElement(ConversationRow, {
			isWideMode = false,
			showBackground = false,
			conversationId = Text,
			entryHeight = ConversationRowHeightModule,
			onActivated = UseResult,
			fireClickEvent = UseFriendsChatLandingTelemetryModuleResult.fireConversationClickedEvent,
			fireImpressionEvent = UseFriendsChatLandingTelemetryModuleResult.fireConversationImpressionEvent,
			localUserId = Frame.localUserId,
			ref = if FFlagFriendsChatConversationListFocusNav and Text == Text1 then UseFocusConversationListModuleResult2 else nil
		})
	end, {
		ConversationRowHeightModule,
		UseFriendsChatLandingTelemetryModuleResult.fireConversationClickedEvent,
		UseFriendsChatLandingTelemetryModuleResult.fireConversationImpressionEvent,
		UseResult, Frame.localUserId, Text1, UseFocusConversationListModuleResult2
	})
	local UseResult7 = ReactModule.useCallback(function(_, Index: number) --[[ Line: 465 ]]
		-- upvalues: ConversationRowHeightModule (copy)
		return {
			length = ConversationRowHeightModule,
			offset = ConversationRowHeightModule * (Index - 1),
			index = Index
		}
	end, { ConversationRowHeightModule })
	local UseResult8 = ReactModule.useCallback(function() --[[ Line: 473 ]]
		-- upvalues: ResolveListStateModuleResult (copy)
		ResolveListStateModuleResult.loadNext()
	end, { ResolveListStateModuleResult.loadNext })
	local UseResult9 = ReactModule.useCallback(function(_, p1) --[[ Line: 477 ]]
		-- upvalues: UseRefResult (copy), UseResult8 (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil and p1 <= Current.AbsoluteSize.Y then
			UseResult8()
		end
	end, { UseResult8 })
	local UseResult10 = ReactModule.useCallback(function() --[[ Line: 484 ]]
		-- upvalues: UseResult8 (copy), PromiseModule (upval)
		UseResult8()
		
		return PromiseModule.resolve()
	end, { UseResult8 })
	local UseResult11 = ReactModule.useCallback(function() --[[ Line: 493 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2("")
	end, {})
	local IsLoadingNextPage = ResolveListStateModuleResult.isLoadingNextPage
	local OldestConversationIsFetched = ResolveListStateModuleResult.oldestConversationIsFetched
	local ListKey = if FFlagFriendsChatServerSideConversationSearchModule then ResolveListStateModuleResult.listKey else nil
	local CreateElementFunction1 = ReactModule.createElement
	local v5 = "Frame"
	local config3 = {
		Name = "chatWindow",
		Active = true,
		BackgroundColor3 = BackgroundColor3,
		BackgroundTransparency = if ReactIsModule.isBinding(TransparencyValue) then TransparencyValue:map(function(p1): number --[[ Line: 126 ]]
			-- upvalues: BackgroundTransparency (copy)
			return BackgroundTransparency + p1 * (1 - BackgroundTransparency)
		end) else TransparencyValue,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = Frame.LayoutOrder or 1,
		Size = Frame.size or UDim2.new(1, 0, 1, LayoutConstantsModule.PanelTopSpacerHeight + NewInputBarTopPadding + LayoutConstantsModule.PanelBottomCornerRadius),
		Visible = IsVisible,
		ref = UseFocusConversationListModuleResult,
		[ReactModule.Change.AbsoluteSize] = UseResult1,
		[ReactModule.Change.AbsolutePosition] = UseResult2,
		[ReactModule.Event.MouseEnter] = Frame.onHovered,
		[ReactModule.Event.MouseLeave] = Frame.onUnhovered
	}
	local config4 = {
		bottomCorner = ReactModule.createElement("UICorner", {
			BottomLeftRadius = UDim.new(0, LayoutConstantsModule.PanelBottomCornerRadius),
			BottomRightRadius = UDim.new(0, LayoutConstantsModule.PanelBottomCornerRadius),
			TopLeftRadius = UDim.new(0, 0),
			TopRightRadius = UDim.new(0, 0)
		}),
		layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, 0),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		SearchContainer = ReactModule.createElement(View, {
			Name = "SearchContainer",
			tag = "padding-small",
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, Size1200)
		}, {
			SearchContent = ReactModule.createElement("Frame", {
				Name = "SearchContent",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Position = UDim2.fromOffset(-1, -1),
				Size = UDim2.new(1, 2, 1, 2)
			}, {
				SearchField = ReactModule.createElement(View, {
					Name = "SearchField",
					tag = "row align-y-center items-center gap-small padding-x-medium radius-circle clip",
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(1, 1),
					Size = UDim2.new(1, -2, 0, UseTokensResult.Size.Size_800),
					stroke = {
						Color = UseTokensResult.Color.Stroke.Default.Color3,
						Transparency = MergeTransparencyResult2,
						Thickness = UseTokensResult.Stroke.Standard
					}
				}, {
					SearchIcon = ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						name = IconName.MagnifyingGlass,
						size = IconSize.Small,
						style = {
							Color3 = UseTokensResult.Color.Content.Default.Color3,
							Transparency = MergeTransparencyResult
						}
					}),
					SearchBox = ReactModule.createElement("TextBox", {
						Name = "FriendsChatConversationListSearchBox",
						BackgroundTransparency = 1,
						SelectionImageObject = UseCursorResult,
						ClearTextOnFocus = false,
						ClipsDescendants = true,
						Font = if FoundationFontFaceMigration then nil else UseTokensResult.Typography.BodySmall.Font,
						FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseTokensResult.Typography.BodySmall.Font) else nil,
						LineHeight = UseTokensResult.Typography.BodySmall.LineHeight,
						LayoutOrder = 2,
						PlaceholderColor3 = UseTokensResult.Color.Content.Muted.Color3,
						PlaceholderText = config2.searchPlaceholder,
						Size = UDim2.new(0, 0, 1, 0),
						Text = UseStateResult,
						TextColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
						TextSize = UseTokensResult.Typography.BodySmall.FontSize,
						TextTransparency = MergeTransparencyResult1,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						[ReactModule.Event.Focused] = UseResult3,
						[ReactModule.Event.FocusLost] = UseResult4,
						[ReactModule.Change.Text] = ReactModule.useCallback(function(p1) --[[ Line: 489 ]]
							-- upvalues: UseStateResult2 (copy)
							UseStateResult2(p1.Text)
						end, {})
					}, {
						Flex = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
					}),
					ClearButton = if IsNotUseStateResultMatch then ReactModule.createElement(View, {
						Name = "FriendsChatConversationListSearchClear",
						LayoutOrder = 3,
						tag = "auto-xy",
						onActivated = UseResult11
					}, {
						Icon = ReactModule.createElement(Icon, {
							name = IconName.CircleX,
							size = IconSize.Small,
							style = {
								Color3 = UseTokensResult.Color.Content.Default.Color3,
								Transparency = MergeTransparencyResult
							}
						})
					}) else nil
				})
			})
		})
	}
	local CreateElementFunction2 = ReactModule.createElement
	local config5 = {
		Name = "ListArea",
		BorderSizePixel = 0,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 1, -Size1200)
	}
	local t = {}
	local CreateElementFunction = ReactModule.createElement
	local v6 = "CanvasGroup"
	local config6 = {
		Name = "ListContent",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		GroupTransparency = MapResult,
		Size = UDim2.fromScale(1, 1)
	}
	local config7 = {
		ListWrapper = ReactModule.createElement("Frame", {
			Name = "FriendsChatConversationListWrapper",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1),
			ref = UseRefResult
		}, {
			List = if FFlagAppChatUseUltimateListConversationListModule then ReactModule.createElement(ConversationListUltimate, {
				isWideMode = false,
				showScrollbarOnScroll = true,
				showHeaderEntries = false,
				shouldLogHeaderEntryExposures = false,
				key = ListKey,
				Size = UDim2.fromScale(1, 1),
				entryHeight = ConversationRowHeightModule,
				itemList = Items1,
				loadNext = UseResult8,
				isLoadingNext = IsLoadingNextPage,
				oldestConversationIsFetched = OldestConversationIsFetched,
				onScrollUpdate = UseResult5,
				rowProps = { showBackground = false, localUserId = Frame.localUserId },
				localUserId = Frame.localUserId,
				onActivated = UseResult,
				fireConversationClickedEvent = UseFriendsChatLandingTelemetryModuleResult.fireConversationClickedEvent,
				fireConversationImpressionEvent = UseFriendsChatLandingTelemetryModuleResult.fireConversationImpressionEvent
			}) else ReactModule.createElement(BidirectionalFlatList, {
				enableAutoscrollToTop = true,
				key = ListKey,
				data = Items1,
				renderItem = UseResult6,
				getItemLayout = UseResult7,
				keyExtractor = function(p1): string --[[ Line: 535 ]]
					return (tostring(p1.id))
				end,
				compareItemData = function(p1, p2): boolean --[[ Line: 538 ]]
					return p1.id == p2.id
				end,
				style = {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Selectable = false,
					ScrollBarImageTransparency = if NoFFlagAppChatUseUltimateListConversationListModule then v4 else nil,
					ScrollBarThickness = FriendsChatConversationListScrollbarThickness
				},
				contentContainerStyle = { BackgroundTransparency = 1, BorderSizePixel = 0 },
				windowSize = FriendsChatConversationListWindowSize,
				initialNumToRender = FriendsChatConversationListInitialNumToRender,
				onScroll = UseResult5,
				onContentSizeChange = UseResult9,
				onEndReached = UseResult10,
				onEndReachedThreshold = ConversationRowHeightModule * FriendsChatConversationListPaginationThresholdRows,
				AutomaticCanvasSize = Enum.AutomaticSize.XY,
				CanvasSize = UDim2.fromScale(0, 0),
				autoscrollToTopThreshold = FriendsChatConversationListAutoscrollToTopThreshold
			})
		})
	}
	local Element = nil
	
	if LoadingConversations == nil then
		Element = nil
	else
		local Transparency = UseTokensResult.Color.Content.Default.Transparency
		Element = ReactModule.createElement(View, {
			tag = "col align-x-center align-y-center gap-small size-full padding-large",
			BorderSizePixel = 0,
			LayoutOrder = 2
		}, {
			Message = ReactModule.createElement(Text, {
				tag = "size-full-0 auto-y text-body-medium text-wrap text-align-x-center content-default",
				Text = LoadingConversations,
				textStyle = {
					Color3 = UseTokensResult.Color.Content.Default.Color3,
					Transparency = if ReactIsModule.isBinding(TextTransparency) then TextTransparency:map(function(p1): number --[[ Line: 136 ]]
						-- upvalues: Transparency (copy)
						return Transparency + p1 * (1 - Transparency)
					end) else Transparency
				}
			}),
			Retry = ShouldOfferRetry and ReactModule.createElement(IconButton, {
				icon = IconName.ArrowSpinClockwise,
				onActivated = UseConversationListPaginationModuleResult.retryInitialFetch,
				size = InputSize.Small,
				variant = ButtonVariant.Standard
			}) or nil
		}) or nil
	end
	config7.Status = Element
	t.ListContent = CreateElementFunction(v6, config6, config7)
	config4.ListArea = CreateElementFunction2(View, config5, t)
	
	return (CreateElementFunction1(v5, config3, config4))
end)