local parent = script.Parent.Parent
local reactModule = require(parent.React)
local reactUtilsModule = require(parent.ReactUtils)
local foundationModule = require(parent.Foundation)
local responsiveModule = require(parent.Responsive)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationUtilsModule = require(parent.FocusNavigationUtils)
local inputHandlersModule = require(parent.InputHandlers)
local _ = require(parent.Signals)
local textChatWindowInputBarHostModule = require(script.Parent.TextChatWindowInputBarHost)
local chatWindowTopBannerModule = require(script.Parent.ChatWindowTopBanner)
local messageListAreaModule = require(script.Parent.MessageListArea)
local _ = require(script.Parent.Message)
local themeFromBackgroundColorModule = require(script.Parent.themeFromBackgroundColor)
local useChatWindowEntryHandoffModule = require(script.Parent.useChatWindowEntryHandoff)
local selectionInputsModule = require(script.Parent.FocusNavigation.SelectionInputs)
local fFlagExpChatTextChannelWindowThemeByBackgroundModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowThemeByBackground)
local fFlagExpChatTextChannelWindowFocusNavModule = require(script.Parent.Flags.FFlagExpChatTextChannelWindowFocusNav)
local expChatTCWAllowKeyboardNav = game:DefineFastFlag("ExpChatTCWAllowKeyboardNav", false)
local guiService = game:GetService("GuiService")
local userInputService = game:GetService("UserInputService")
local provider = focusNavigationUtilsModule.FocusNavigableSurfaceRegistry.Provider
local focusNavigableSurfaceIdentifierEnum = focusNavigationUtilsModule.FocusNavigableSurfaceIdentifierEnum
local focusNavigationEventNameEnum = focusNavigationUtilsModule.FocusNavigationEventNameEnum
local useFocusRoot = focusNavigationUtilsModule.useFocusRoot
local createNextOrder = reactUtilsModule.createNextOrder
local var1 = if fFlagExpChatTextChannelWindowFocusNavModule then reactFocusNavigationModule.FocusNavigationService.new(reactFocusNavigationModule.EngineInterface.CoreGui) else nil
local t = {}

if expChatTCWAllowKeyboardNav then
	for i, v in selectionInputsModule.Back do
		if v.EnumType == Enum.KeyCode then
			t[v] = focusNavigationEventNameEnum.NavigateBack
		end
	end
else
	t[Enum.KeyCode.ButtonB] = focusNavigationEventNameEnum.NavigateBack
end
local t_1 = {}
local t_2 = {
	SelectionBehaviorUp = Enum.SelectionBehavior.Stop,
	SelectionBehaviorDown = Enum.SelectionBehavior.Stop,
	SelectionBehaviorLeft = Enum.SelectionBehavior.Stop,
	SelectionBehaviorRight = Enum.SelectionBehavior.Stop
}

local function ChatWindowBody(p1)
	-- upvalues: foundationModule (ref), createNextOrder (ref), reactModule (ref), t_2 (ref), fFlagExpChatTextChannelWindowThemeByBackgroundModule (ref), messageListAreaModule (ref), textChatWindowInputBarHostModule (ref), chatWindowTopBannerModule (ref)
	local var2 = foundationModule.Hooks.useTokens()
	local var3 = createNextOrder()
	
	return reactModule.createElement(foundationModule.View, {
		Size = p1.Size or UDim2.fromScale(1, 1),
		ref = p1.focusRootRef,
		selectionGroup = if p1.focusNavEnabled then t_2 else nil
	}, {
		chatView = reactModule.createElement(foundationModule.View, {
			tag = "col fill size-full clip",
			cornerRadius = if not fFlagExpChatTextChannelWindowThemeByBackgroundModule then UDim.new(0, var2.Radius.Medium) else nil,
			backgroundStyle = if not fFlagExpChatTextChannelWindowThemeByBackgroundModule then {
				Transparency = 0.3,
				Color3 = var2.DarkMode.Surface.Surface_100.Color3
			} else nil
		}, {
			messageList = reactModule.createElement(foundationModule.View, { tag = "fill size-full-0", LayoutOrder = var3() }, {
				content = reactModule.createElement(messageListAreaModule, {
					channelState = p1.channelState,
					messagesSignal = p1.messagesSignal,
					fontFace = p1.fontFace,
					windowName = p1.windowName,
					selectableRows = p1.focusNavEnabled,
					selectionCursor = p1.selectionCursor
				})
			}),
			inputBar = reactModule.createElement(foundationModule.View, {
				tag = "size-full-0 auto-y padding-small",
				LayoutOrder = var3()
			}, {
				host = reactModule.createElement(textChatWindowInputBarHostModule, {
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
		topBanner = reactModule.createElement(chatWindowTopBannerModule, {
			ZIndex = 2,
			messagesSignal = p1.messagesSignal,
			targetChannel = p1.targetChannel,
			focusNavEnabled = p1.focusNavEnabled,
			onOpenChanged = p1.setReportMenuOpen
		})
	})
end

local function ChatAppFocusNav(p1)
	-- upvalues: reactModule (ref), responsiveModule (ref), expChatTCWAllowKeyboardNav (ref), foundationModule (ref), guiService (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), inputHandlersModule (ref), userInputService (ref), useFocusRoot (ref), focusNavigableSurfaceIdentifierEnum (ref), t_1 (ref), t (ref), useChatWindowEntryHandoffModule (ref), ChatWindowBody (ref)
	local var2
	local var3 = reactModule.useRef(nil)
	local var4 = responsiveModule.usePreferredInput() == responsiveModule.Input.Directional
	
	if expChatTCWAllowKeyboardNav then
		var2 = p1.windowInstance ~= nil
		var2 = nil
	else
		var2 = var4 and p1.windowInstance ~= nil
	end
	local var5 = foundationModule.Hooks.useCursor(foundationModule.Enums.CursorType.RoundedRect)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(false)
	local windowInstance = p1.windowInstance
	local var10 = reactModule.useCallback(function()
		-- upvalues: guiService (copy), windowInstance (ref)
		guiService.SelectedCoreObject = nil
		
		if windowInstance and windowInstance:IsDescendantOf(game) then
			guiService.SelectedObject = windowInstance
		end
	end, { windowInstance })
	local var11 = useFocusRoot({
		isAutoFocusRoot = false,
		shouldRestoreFocus = false,
		surfaceIdentifier = focusNavigableSurfaceIdentifierEnum.PopUp,
		eventMap = if var6 or var8 then t_1 else t,
		eventHandlers = reactModule.useMemo(function()
			-- upvalues: focusNavigationEventNameEnum (copy), inputHandlersModule (copy), userInputService (copy), var10 (ref)
			return {
				[focusNavigationEventNameEnum.NavigateBack] = {
					handler = inputHandlersModule.onRelease(function(p2)
						-- upvalues: userInputService (copy), var10 (copy)
						if userInputService:GetFocusedTextBox() == nil then
							var10()
							p2:cancel()
							
							return
						end
					end)
				}
			}
		end, { var10 })
	})
	useChatWindowEntryHandoffModule({
		enabled = var2,
		windowInstance = p1.windowInstance,
		focusTargetRef = var3,
		setSelection = reactFocusNavigationModule.useFocusGuiObject()
	})
	local cloned = table.clone(p1)
	cloned.focusNavEnabled = var2
	cloned.selectionCursor = var5
	cloned.focusRootRef = var11
	cloned.inputTextBoxRef = var3
	cloned.setReportMenuOpen = var7
	cloned.setExpressionTrayOpen = var9
	
	return reactModule.createElement(ChatWindowBody, cloned)
end

return function(p1)
	-- upvalues: fFlagExpChatTextChannelWindowThemeByBackgroundModule (ref), themeFromBackgroundColorModule (ref), foundationModule (ref), fFlagExpChatTextChannelWindowFocusNavModule (ref), reactModule (ref), reactFocusNavigationModule (ref), var1 (ref), provider (ref), ChatAppFocusNav (ref), ChatWindowBody (ref)
	local var2
	local var3 = if fFlagExpChatTextChannelWindowThemeByBackgroundModule and p1.backgroundColor then themeFromBackgroundColorModule(p1.backgroundColor) else foundationModule.Enums.ColorMode.Dark
	local _ = nil
	
	if fFlagExpChatTextChannelWindowFocusNavModule then
		var2 = reactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Provider, { value = var1 }, {
			registryProvider = reactModule.createElement(provider, nil, { inner = reactModule.createElement(ChatAppFocusNav, p1) })
		})
	else
		local cloned = table.clone(p1)
		cloned.focusNavEnabled = false
		var2 = reactModule.createElement(ChatWindowBody, cloned)
	end
	return reactModule.createElement(foundationModule.FoundationProvider, { colorMode = var3 }, { inner = var2 })
end