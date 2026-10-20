local TextChatService = game:GetService("TextChatService")
local FriendsChat = script:FindFirstAncestor("FriendsChat")
local Parent = FriendsChat.Parent
local ReactModule = require(Parent.React)
local ReactIsModule = require(Parent.ReactIs)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AppChatModule = require(Parent.AppChat)
local UseChatPlatformModule = require(Parent.ExpChatIntegration.useChatPlatform)
local UseChatInputBarSettingsModule = require(Parent.ExpChatIntegration.useChatInputBarSettings)
local UseInterpolatedClientSettingsModule = require(Parent.ExpChatIntegration.useInterpolatedClientSettings)
local UseChatWindowSettingsModule = require(Parent.ExpChatIntegration.useChatWindowSettings)
local UseConversationListPaginationModule = require(script.Parent.useConversationListPagination)
local LayoutConstantsModule = require(FriendsChat.LayoutConstants)
local UseFriendsChatLandingTelemetryModule = require(script.Parent.Parent.Telemetry.ChatLanding.useFriendsChatLandingTelemetry)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local FillBehavior = FoundationModule.Enums.FillBehavior
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens
local ConversationListUltimate = AppChatModule.Components.ChatLanding.ConversationListUltimate
local GetConversationTitleFunction = require(script.Parent.ExpChatConversationListAdapter).getConversationTitle
local UseConversationListFunction = AppChatModule.Hooks.useConversationList
local config = {
	SearchPlaceholder = "CommonUI.Controls.Action.Search",
	Retry = "InGame.CommonUI.Button.Retry"
}

local function _(p1, Transparency)
	return { Color3 = p1, Transparency = Transparency }
end

local _ = function(p1, p2)
	-- upvalues: ReactIsModule (copy)
	return if ReactIsModule.isBinding(p2) then p2:map(function(p3): number
		-- upvalues: p1 (copy)
		return p1 + p3 * (1 - p1)
	end) else p2
end

local _ = function(p1, p2)
	-- upvalues: ReactIsModule (copy)
	return if ReactIsModule.isBinding(p1) then p1:map(function(p3): number
		-- upvalues: p2 (copy)
		return p2 + p3 * (1 - p2)
	end) else p2
end

local _ = function(p1): string
	return string.lower(p1 or "")
end

local _ = function(p1, Pattern): boolean
	return Pattern == "" or string.find(string.lower(p1 or ""), Pattern, 1, true) ~= nil
end

local _ = function(p1, p2, p3)
	return if p1 == nil or p1 == "" or p1 == p2 then p3 else p1
end

return ReactModule.memo(function(Frame)
	-- upvalues: UseTokensFunction (copy), UseChatPlatformModule (copy), UseChatWindowSettingsModule (copy), ReactModule (copy), UseLocalizationFunction (copy), config (copy), UseInterpolatedClientSettingsModule (copy), ReactIsModule (copy), UseChatInputBarSettingsModule (copy), LayoutConstantsModule (copy), UseConversationListFunction (copy), UseConversationListPaginationModule (copy), GetConversationTitleFunction (copy), UseFriendsChatLandingTelemetryModule (copy), TextChatService (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), ConversationListUltimate (copy), Text (copy), Button (copy), FillBehavior (copy), InputSize (copy), ButtonVariant (copy)
	local UseTokensResult = UseTokensFunction()
	local GetTransparencyStoreFunction = UseChatPlatformModule().getTransparencyStore
	local UseChatWindowSettingsModuleResult = UseChatWindowSettingsModule()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: UseChatWindowSettingsModuleResult (copy)
		return {
			BackgroundColor3 = UseChatWindowSettingsModuleResult.ChatWindowBackgroundColor3,
			BackgroundTransparency = UseChatWindowSettingsModuleResult.ChatWindowBackgroundTransparency
		}
	end, { UseChatWindowSettingsModuleResult })
	local ChatWindowSettings = Frame.chatWindowSettings or UseMemoResult
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseInterpolatedClientSettingsModuleResult = UseInterpolatedClientSettingsModule(ChatWindowSettings)
	local BackgroundTransparency = UseInterpolatedClientSettingsModuleResult.BackgroundTransparency
	local BackgroundColor3 = UseInterpolatedClientSettingsModuleResult.BackgroundColor3 or (UseInterpolatedClientSettingsModuleResult.BackgroundColor or ChatWindowSettings.BackgroundColor3)
	local TransparencyValue = Frame.transparencyValue or UseChatWindowSettingsModuleResult.ChatWindowBackgroundTransparency
	local GroupTransparency = nil
	
	if Frame.transparencyValue == nil then
		GroupTransparency = 0
	elseif ReactIsModule.isBinding(TransparencyValue) then
		local v1 = 0
		GroupTransparency = TransparencyValue:map(function(p1): number
			-- upvalues: v1 (copy)
			return v1 + p1 * (1 - v1)
		end)
	else
		GroupTransparency = TransparencyValue
	end
	local TextTransparency = Frame.textTransparency or ReactModule.createBinding(0)
	local Size1200 = UseTokensResult.Size.Size_1200
	local Size1400 = UseTokensResult.Size.Size_1400
	local UseChatInputBarSettingsModuleResult = UseChatInputBarSettingsModule()
	local NewInputBarTopPadding = LayoutConstantsModule.InputBarTopPadding + LayoutConstantsModule.InputBarBottomPadding + LayoutConstantsModule.InputBarTextVerticalPadding + ((if Frame.isSpatialUIEnabled and UseChatInputBarSettingsModuleResult and UseChatInputBarSettingsModuleResult.SpatialPanelTextSize then UseChatInputBarSettingsModuleResult.SpatialPanelTextSize elseif UseChatInputBarSettingsModuleResult then UseChatInputBarSettingsModuleResult.TextSize else UseTokensResult.Typography.CaptionMedium.FontSize) or UseTokensResult.Typography.CaptionMedium.FontSize)
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local IsVisible = Frame.visible ~= false
	local UseConversationListResult = UseConversationListFunction(IsVisible)
	local UseConversationListPaginationModuleResult = UseConversationListPaginationModule(IsVisible, UseConversationListResult.listStatus)
	local ListStatus = UseConversationListResult.listStatus
	local Items = UseConversationListResult.items
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseStateResult (copy), Items (copy), GetConversationTitleFunction (upval)
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
	local v2: boolean = ListStatus.isFetchingConversations == true and #Items == 0
	local HasError = ListStatus.error ~= nil
	local IsNotUseStateResultMatch = UseStateResult ~= ""
	local UseFriendsChatLandingTelemetryModuleResult = UseFriendsChatLandingTelemetryModule({
		conversations = Items,
		displayedConversations = UseMemoResult1,
		isFiltered = IsNotUseStateResultMatch
	})
	local v3: boolean = HasError and #Items == 0
	local v4: boolean = #UseMemoResult1 == 0 and (ListStatus.isFetchingConversations ~= true and (#Items > 0 or (ListStatus.hasFetchedInitialPage == true or v3)))
	local SearchPlaceholder = UseLocalizationResult.SearchPlaceholder
	local SearchPlaceholder1 = config.SearchPlaceholder
	local Search = if SearchPlaceholder == nil or SearchPlaceholder == "" or SearchPlaceholder == SearchPlaceholder1 then "Search" else SearchPlaceholder
	local Retry = UseLocalizationResult.Retry
	local Retry1 = config.Retry
	local config1 = {
		loadingConversations = "Loading conversations...",
		loadConversationsError = "Unable to load conversations.",
		noLoadedConversationsFound = "No loaded conversations found",
		noConversationsYet = "No conversations yet",
		searchPlaceholder = Search,
		retry = if Retry == nil or Retry == "" or Retry == Retry1 then "Retry" else Retry
	}
	local LoadingConversations = if v2 then config1.loadingConversations elseif v3 then config1.loadConversationsError elseif v4 then if IsNotUseStateResultMatch then config1.noLoadedConversationsFound else config1.noConversationsYet else nil
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: Frame (copy)
		if Frame.onConversationActivated ~= nil and p1 ~= nil and p1.id ~= nil then
			Frame.onConversationActivated(p1.id)
			
			return
		end
	end, { Frame.onConversationActivated })
	local UseResult1 = ReactModule.useCallback(function(p1)
		-- upvalues: TextChatService (upval), Frame (copy)
		local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if ChatWindowConfiguration and Frame.onAbsoluteSizeChanged then
			Frame.onAbsoluteSizeChanged(p1, ChatWindowConfiguration)
		end
	end, { Frame.onAbsoluteSizeChanged })
	local UseResult2 = ReactModule.useCallback(function(p1)
		-- upvalues: TextChatService (upval), Frame (copy)
		local ChatWindowConfiguration = TextChatService:FindFirstChildOfClass("ChatWindowConfiguration")
		
		if ChatWindowConfiguration and Frame.onAbsolutePositionChanged then
			Frame.onAbsolutePositionChanged(p1, ChatWindowConfiguration)
		end
	end, { Frame.onAbsolutePositionChanged })
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: UseFriendsChatLandingTelemetryModuleResult (copy), GetTransparencyStoreFunction (copy)
		UseFriendsChatLandingTelemetryModuleResult.fireSearchActivatedEvent()
		GetTransparencyStoreFunction(false).setTextboxFocus()
	end, {
		GetTransparencyStoreFunction,
		UseFriendsChatLandingTelemetryModuleResult.fireSearchActivatedEvent
	})
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: GetTransparencyStoreFunction (copy)
		GetTransparencyStoreFunction(false).clearTextboxFocus()
	end, { GetTransparencyStoreFunction })
	ReactModule.useEffect(function()
		-- upvalues: GetTransparencyStoreFunction (copy)
		return function()
			-- upvalues: GetTransparencyStoreFunction (upval)
			GetTransparencyStoreFunction(false).clearTextboxFocus()
		end
	end, { GetTransparencyStoreFunction })
	local CreateElementFunction = ReactModule.createElement
	local v5 = "Frame"
	local config2 = {
		Name = "chatWindow",
		Active = true,
		BackgroundColor3 = BackgroundColor3,
		BackgroundTransparency = if ReactIsModule.isBinding(TransparencyValue) then TransparencyValue:map(function(p1): number
			-- upvalues: BackgroundTransparency (copy)
			return BackgroundTransparency + p1 * (1 - BackgroundTransparency)
		end) else TransparencyValue,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		LayoutOrder = Frame.LayoutOrder or 1,
		Size = Frame.size or UDim2.new(1, 0, 1, LayoutConstantsModule.PanelTopSpacerHeight + NewInputBarTopPadding + LayoutConstantsModule.PanelBottomCornerRadius),
		Visible = IsVisible,
		[ReactModule.Change.AbsoluteSize] = UseResult1,
		[ReactModule.Change.AbsolutePosition] = UseResult2,
		[ReactModule.Event.MouseEnter] = Frame.onHovered,
		[ReactModule.Event.MouseLeave] = Frame.onUnhovered
	}
	local Transparency = UseTokensResult.Color.Content.Default.Transparency
	local Transparency1 = UseTokensResult.Color.Content.Emphasis.Transparency
	local config3 = {
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
			SearchContent = ReactModule.createElement("CanvasGroup", {
				Name = "SearchContent",
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				GroupTransparency = GroupTransparency,
				Position = UDim2.fromOffset(-1, -1),
				Size = UDim2.new(1, 2, 1, 2)
			}, {
				SearchField = ReactModule.createElement(View, {
					Name = "SearchField",
					tag = "row align-y-center gap-small padding-x-medium stroke-standard stroke-default radius-circle",
					BackgroundTransparency = 1,
					Position = UDim2.fromOffset(1, 1),
					Size = UDim2.new(1, -2, 0, UseTokensResult.Size.Size_800)
				}, {
					SearchIcon = ReactModule.createElement(Icon, {
						LayoutOrder = 1,
						name = IconName.MagnifyingGlass,
						size = IconSize.Small,
						style = {
							Color3 = UseTokensResult.Color.Content.Default.Color3,
							Transparency = if ReactIsModule.isBinding(TextTransparency) then TextTransparency:map(function(p1): number
								-- upvalues: Transparency (copy)
								return Transparency + p1 * (1 - Transparency)
							end) else Transparency
						}
					}),
					SearchBox = ReactModule.createElement("TextBox", {
						Name = "FriendsChatConversationListSearchBox",
						BackgroundTransparency = 1,
						ClearTextOnFocus = false,
						Font = UseTokensResult.Typography.BodySmall.Font,
						LineHeight = UseTokensResult.Typography.BodySmall.LineHeight,
						LayoutOrder = 2,
						PlaceholderColor3 = UseTokensResult.Color.Content.Muted.Color3,
						PlaceholderText = config1.searchPlaceholder,
						Size = UDim2.new(0, 0, 1, 0),
						Text = UseStateResult,
						TextColor3 = UseTokensResult.Color.Content.Emphasis.Color3,
						TextSize = UseTokensResult.Typography.BodySmall.FontSize,
						TextTransparency = if ReactIsModule.isBinding(TextTransparency) then TextTransparency:map(function(p1): number
							-- upvalues: Transparency1 (copy)
							return Transparency1 + p1 * (1 - Transparency1)
						end) else Transparency1,
						TextXAlignment = Enum.TextXAlignment.Left,
						TextYAlignment = Enum.TextYAlignment.Center,
						[ReactModule.Event.Focused] = UseResult3,
						[ReactModule.Event.FocusLost] = UseResult4,
						[ReactModule.Change.Text] = ReactModule.useCallback(function(p1)
							-- upvalues: UseStateResult2 (copy)
							UseStateResult2(p1.Text)
						end, {})
					}, {
						Flex = ReactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill })
					})
				})
			})
		})
	}
	local CreateElementFunction2 = ReactModule.createElement
	local config4 = {
		Name = "ListArea",
		BorderSizePixel = 0,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 1, -Size1200)
	}
	local t = {}
	local CreateElementFunction1 = ReactModule.createElement
	local v6 = "CanvasGroup"
	local config5 = {
		Name = "ListContent",
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		GroupTransparency = GroupTransparency,
		Size = UDim2.fromScale(1, 1)
	}
	local config6 = {
		ListWrapper = ReactModule.createElement("Frame", {
			Name = "FriendsChatConversationListWrapper",
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = 1,
			Size = UDim2.fromScale(1, 1)
		}, {
			List = ReactModule.createElement(ConversationListUltimate, {
				isWideMode = false,
				showHeaderEntries = false,
				shouldLogHeaderEntryExposures = false,
				Size = UDim2.fromScale(1, 1),
				entryHeight = Size1400,
				itemList = UseMemoResult1,
				loadNext = UseConversationListPaginationModuleResult.loadNext,
				isLoadingNext = ListStatus.isFetchingNextPage == true,
				oldestConversationIsFetched = ListStatus.oldestConversationIsFetched == true or ListStatus.isExhausted == true,
				onScrollUpdate = ReactModule.useCallback(function(_)
					-- upvalues: GetTransparencyStoreFunction (copy)
					GetTransparencyStoreFunction(false).resetAllTransparency()
				end, { GetTransparencyStoreFunction }),
				rowProps = { showBackground = false, localUserId = Frame.localUserId },
				localUserId = Frame.localUserId,
				onActivated = UseResult,
				fireConversationClickedEvent = UseFriendsChatLandingTelemetryModuleResult.fireConversationClickedEvent,
				fireConversationImpressionEvent = UseFriendsChatLandingTelemetryModuleResult.fireConversationImpressionEvent
			})
		})
	}
	local Element = nil
	
	if LoadingConversations == nil then
		Element = nil
	else
		local Transparency2 = UseTokensResult.Color.Content.Default.Transparency
		Element = ReactModule.createElement(View, {
			tag = "col align-x-center align-y-center gap-small size-full",
			BorderSizePixel = 0,
			LayoutOrder = 2
		}, {
			Message = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-medium text-align-x-center content-default",
				Text = LoadingConversations,
				textStyle = {
					Color3 = UseTokensResult.Color.Content.Default.Color3,
					Transparency = if ReactIsModule.isBinding(TextTransparency) then TextTransparency:map(function(p1): number
						-- upvalues: Transparency2 (copy)
						return Transparency2 + p1 * (1 - Transparency2)
					end) else Transparency2
				}
			}),
			Retry = v3 and ReactModule.createElement(Button, {
				fillBehavior = FillBehavior.Fit,
				onActivated = UseConversationListPaginationModuleResult.retryInitialFetch,
				size = InputSize.Small,
				text = config1.retry,
				variant = ButtonVariant.Standard
			}) or nil
		}) or nil
	end
	config6.Status = Element
	t.ListContent = CreateElementFunction1(v6, config5, config6)
	config3.ListArea = CreateElementFunction2(View, config4, t)
	
	return (CreateElementFunction(v5, config2, config3))
end)