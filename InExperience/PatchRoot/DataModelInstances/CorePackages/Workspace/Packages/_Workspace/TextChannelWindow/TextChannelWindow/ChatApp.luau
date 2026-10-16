local Parent = script.Parent.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationUtilsModule = require(Parent.FocusNavigationUtils)
local InputHandlersModule = require(Parent.InputHandlers)
local _ = require(Parent.Signals)
local TextChatWindowInputBarHostModule = require(script.Parent.TextChatWindowInputBarHost)
local ChatWindowTopBannerModule = require(script.Parent.ChatWindowTopBanner)
local MessageListAreaModule = require(script.Parent.MessageListArea)
local _ = require(script.Parent.Message)
local ThemeFromBackgroundColorModule = require(script.Parent.themeFromBackgroundColor)
local UseChatWindowEntryHandoffModule = require(script.Parent.useChatWindowEntryHandoff)
local SelectionInputsModule = require(script.Parent.FocusNavigation.SelectionInputs)
local FFlagExpChatTextChannelWindowThemeByBackgroundModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowThemeByBackground)
local FFlagExpChatTextChannelWindowFocusNavModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowFocusNav)
local FFlagExpChatExpressionTrayReducedMotion = require(Parent.ChatUIPrimitives).Flags.FFlagExpChatExpressionTrayReducedMotion
local ExpChatTCWAllowKeyboardNav = game:DefineFastFlag("ExpChatTCWAllowKeyboardNav", false)
local FFlagExpChatTCWMemoizeChatWindowBodyModule = require(script.Parent.Flags.FFlagExpChatTCWMemoizeChatWindowBody)
local GuiService = game:GetService("GuiService")
local UserInputService = game:GetService("UserInputService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local Provider = FocusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider
local FocusNavigableSurfaceIdentifierEnum = FocusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local FocusNavigationEventNameEnum = FocusNavigationUtilsModule.FocusNavigationEventNameEnum
local UseFocusRootFunction = FocusNavigationUtilsModule.useFocusRoot
local CreateNextOrderFunction = require(Parent.ReactUtils).createNextOrder
local NewResult = if FFlagExpChatTextChannelWindowFocusNavModule then ReactFocusNavigationModule.FocusNavigationService.new(ReactFocusNavigationModule.EngineInterface.CoreGui) else nil
local NavigateBacks = {}

if ExpChatTCWAllowKeyboardNav then
	for _, value in SelectionInputsModule.Back do
		if value.EnumType == Enum.KeyCode then
			NavigateBacks[value] = FocusNavigationEventNameEnum.NavigateBack
		end
	end
else
	NavigateBacks[Enum.KeyCode.ButtonB] = FocusNavigationEventNameEnum.NavigateBack
end
local t = {}
local config = {
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop
}

local function ChatWindowBody(p1) --[[ Line: 109 ]]
	-- upvalues: FoundationModule (copy), CreateNextOrderFunction (copy), ReactModule (copy), config (copy), FFlagExpChatTextChannelWindowThemeByBackgroundModule (copy), MessageListAreaModule (copy), TextChatWindowInputBarHostModule (copy), ChatWindowTopBannerModule (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local NextOrder = CreateNextOrderFunction()
	
	return ReactModule.createElement(FoundationModule.View, {
		Size = p1.Size or UDim2.fromScale(1, 1),
		ref = p1.focusRootRef,
		selectionGroup = if p1.focusNavEnabled then config else nil
	}, {
		chatView = ReactModule.createElement(FoundationModule.View, {
			tag = "col fill size-full clip",
			cornerRadius = if FFlagExpChatTextChannelWindowThemeByBackgroundModule then nil else UDim.new(0, UseTokensResult.Radius.Medium),
			backgroundStyle = if FFlagExpChatTextChannelWindowThemeByBackgroundModule then nil else {
				Transparency = 0.3,
				Color3 = UseTokensResult.DarkMode.Surface.Surface_100.Color3
			}
		}, {
			messageList = ReactModule.createElement(FoundationModule.View, { tag = "fill size-full-0", LayoutOrder = NextOrder() }, {
				content = ReactModule.createElement(MessageListAreaModule, {
					channelState = p1.channelState,
					messagesSignal = p1.messagesSignal,
					fontFace = p1.fontFace,
					windowName = p1.windowName,
					selectableRows = p1.focusNavEnabled,
					selectionCursor = p1.selectionCursor,
					onLatestUsernameChanged = p1.onLatestUsernameChanged
				})
			}),
			inputBar = ReactModule.createElement(FoundationModule.View, {
				tag = "size-full-0 auto-y padding-small",
				LayoutOrder = NextOrder()
			}, {
				host = ReactModule.createElement(TextChatWindowInputBarHostModule, {
					targetChannel = p1.targetChannel,
					canLocalUserChat = p1.canLocalUserChat,
					localUserId = p1.localUserId,
					fontFace = p1.fontFace,
					textBoxRef = p1.inputTextBoxRef,
					focusNavEnabled = p1.focusNavEnabled,
					selectionCursor = p1.selectionCursor,
					onExpressionTrayOpenChanged = p1.setExpressionTrayOpen
				})
			})
		}),
		topBanner = ReactModule.createElement(ChatWindowTopBannerModule, {
			ZIndex = 2,
			messagesSignal = p1.messagesSignal,
			targetChannel = p1.targetChannel,
			focusNavEnabled = p1.focusNavEnabled,
			onOpenChanged = p1.setReportMenuOpen
		})
	})
end

local MemoResult = if FFlagExpChatTCWMemoizeChatWindowBodyModule then ReactModule.memo(ChatWindowBody) else ChatWindowBody

local function ChatAppFocusNav(Tbl) --[[ Line: 180 ]]
	-- upvalues: ReactModule (copy), ResponsiveModule (copy), ExpChatTCWAllowKeyboardNav (copy), FoundationModule (copy), GuiService (copy), ReactFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy), InputHandlersModule (copy), UserInputService (copy), UseFocusRootFunction (copy), FocusNavigableSurfaceIdentifierEnum (copy), t (copy), NavigateBacks (copy), UseChatWindowEntryHandoffModule (copy), MemoResult (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local IsUsePreferredInputResultMatch = ResponsiveModule.usePreferredInput() == ResponsiveModule.Input.Directional
	local HasWindowInstance: boolean = if ExpChatTCWAllowKeyboardNav then Tbl.windowInstance ~= nil else IsUsePreferredInputResultMatch and Tbl.windowInstance ~= nil
	local UseCursorResult = FoundationModule.Hooks.useCursor(FoundationModule.Enums.CursorType.RoundedRect)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local WindowInstance = Tbl.windowInstance
	local UseResult = ReactModule.useCallback(function() --[[ Line: 196 ]]
		-- upvalues: GuiService (upval), WindowInstance (copy)
		GuiService.SelectedCoreObject = nil
		
		if WindowInstance and WindowInstance:IsDescendantOf(game) then
			GuiService.SelectedObject = WindowInstance
		end
	end, { WindowInstance })
	local UseFocusGuiObjectResult = ReactFocusNavigationModule.useFocusGuiObject()
	local UseFocusRootResult = UseFocusRootFunction({
		isAutoFocusRoot = false,
		shouldRestoreFocus = false,
		surfaceIdentifier = FocusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = if UseStateResult or UseStateResult1 then t else NavigateBacks,
		eventHandlers = ReactModule.useMemo(function() --[[ Line: 204 ]]
			-- upvalues: FocusNavigationEventNameEnum (upval), InputHandlersModule (upval), UserInputService (upval), UseResult (copy)
			return {
				[FocusNavigationEventNameEnum.NavigateBack] = {
					handler = InputHandlersModule.onRelease(function(p1) --[[ Line: 207 ]]
						-- upvalues: UserInputService (upval), UseResult (upval)
						if UserInputService:GetFocusedTextBox() == nil then
							UseResult()
							p1:cancel()
							
							return
						end
					end)
				}
			}
		end, { UseResult })
	})
	UseChatWindowEntryHandoffModule({
		enabled = HasWindowInstance,
		windowInstance = Tbl.windowInstance,
		focusTargetRef = UseRefResult,
		setSelection = UseFocusGuiObjectResult
	})
	local UseRefResult1 = ReactModule.useRef(nil)
	local Copy = table.clone(Tbl)
	Copy.focusNavEnabled = HasWindowInstance
	Copy.selectionCursor = UseCursorResult
	Copy.focusRootRef = UseFocusRootResult
	Copy.onLatestUsernameChanged = ReactModule.useCallback(function(Current) --[[ Line: 242 ]]
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy)
		local Current1 = UseRefResult.current
		local Current2 = UseRefResult1.current
		
		if Current2 ~= nil and Current2 ~= Current then
			Current2.NextSelectionDown = nil
		end
		UseRefResult1.current = Current
		
		if Current1 == nil then return end
		Current1.NextSelectionUp = Current
		
		if Current ~= nil then
			Current.NextSelectionDown = Current1
		end
	end, { UseRefResult })
	Copy.inputTextBoxRef = UseRefResult
	Copy.setReportMenuOpen = UseStateResult2
	Copy.setExpressionTrayOpen = UseStateResult2_1
	
	return ReactModule.createElement(MemoResult, Copy)
end

local function useReducedMotion() --[[ Line: 273 ]]
	-- upvalues: ReactModule (copy), UserGameSettings (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(UserGameSettings.ReducedMotion)
	ReactModule.useEffect(function() --[[ Line: 275 ]]
		-- upvalues: UseStateResult2 (copy), UserGameSettings (upval)
		UseStateResult2(UserGameSettings.ReducedMotion)
		local Connection = UserGameSettings:GetPropertyChangedSignal("ReducedMotion"):Connect(function() --[[ Line: 277 ]]
			-- upvalues: UseStateResult2 (upval), UserGameSettings (upval)
			UseStateResult2(UserGameSettings.ReducedMotion)
		end)
		
		return function() --[[ Line: 280 ]]
			-- upvalues: Connection (copy)
			Connection:Disconnect()
		end
	end, {})
	
	return UseStateResult
end

return function(Tbl) --[[ Line: 287 | Named "ChatApp" ]]
	-- upvalues: FFlagExpChatTextChannelWindowThemeByBackgroundModule (copy), ThemeFromBackgroundColorModule (copy), FoundationModule (copy), FFlagExpChatExpressionTrayReducedMotion (copy), useReducedMotion (copy), FFlagExpChatTextChannelWindowFocusNavModule (copy), ReactModule (copy), ReactFocusNavigationModule (copy), NewResult (copy), Provider (copy), ChatAppFocusNav (copy), MemoResult (copy)
	local ThemeFromBackgroundColorModuleResult = if FFlagExpChatTextChannelWindowThemeByBackgroundModule and Tbl.backgroundColor then ThemeFromBackgroundColorModule(Tbl.backgroundColor) else FoundationModule.Enums.ColorMode.Dark
	local UseReducedMotionResult = if FFlagExpChatExpressionTrayReducedMotion then useReducedMotion() else false
	local Element = nil
	
	if FFlagExpChatTextChannelWindowFocusNavModule then
		Element = ReactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Provider, { value = NewResult }, {
			registryProvider = ReactModule.createElement(Provider, nil, { inner = ReactModule.createElement(ChatAppFocusNav, Tbl) })
		})
	else
		local Copy = table.clone(Tbl)
		Copy.focusNavEnabled = false
		Element = ReactModule.createElement(MemoResult, Copy)
	end
	return ReactModule.createElement(FoundationModule.FoundationProvider, {
		colorMode = ThemeFromBackgroundColorModuleResult,
		preferences = if FFlagExpChatExpressionTrayReducedMotion then { reducedMotion = UseReducedMotionResult } else nil
	}, { inner = Element })
end