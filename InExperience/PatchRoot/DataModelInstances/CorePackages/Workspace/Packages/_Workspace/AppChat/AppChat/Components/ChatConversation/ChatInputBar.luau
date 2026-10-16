local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local UserInputService = game:GetService("UserInputService")
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local Text = require(Parent.AppCommonLib).Text
local BuilderIconsModule = require(Parent.BuilderIcons)
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local IsKeyCodePressedModule = require(AppChat.Components.ChatConversation.Utils.isKeyCodePressed)
local CryoModule = require(Parent.Cryo)
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local CallbackInputBox = require(AppChat.SocialLibraries).Components.CallbackInputBox
local ChatInputBoxDisabledModule = require(script.Parent.ChatInputBoxDisabled)
local IsMessageValidModule = require(script.Parent.isMessageValid)
local UseKeystrokeCollectionModule = require(script.Parent.Hooks.useKeystrokeCollection)
local UseInputConnectionsModule = require(script.Parent.Hooks.useInputConnections)
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local UseIsSpatialFunction = require(Parent.Responsive).useIsSpatial
local SendButtonClickActionResultModule = require(AppChat.Analytics.Enums.SendButtonClickActionResult)
local _ = require(AppChat.types)
local FFlagAppChatGamepadSendButtonNavModule = require(AppChat.Flags.FFlagAppChatGamepadSendButtonNav)
local FFlagAppChatConsoleFocusFixesModule = require(AppChat.Flags.FFlagAppChatConsoleFocusFixes)
local UseChatWideModeFocusModule = require(AppChat.Contexts.ChatWideModeFocus.useChatWideModeFocus)
local config = {
	initialInputText = "",
	placeholderText = "Write a message",
	inputBarDisabledText = "Chat Disabled",
	inputBarRef = nil,
	inputBoxRef = nil,
	LayoutOrder = 0,
	maxKeystrokeDataLength = 200,
	messageListRef = nil,
	isDisabled = false,
	disabledEndTimestampDisplay = nil,
	textChangedFallback = false,
	moreMenuEnabled = false,
	userInputService = UserInputService,
	onDisabledInputBarActivated = function() --[[ Line: 68 ]] end,
	maxCharacterLength = require(script.Parent.MessageCharacterLimit),
	onHeightChanged = function(_) --[[ Line: 73 ]] end,
	onPositionChanged = function(_) --[[ Line: 74 ]] end,
	onFocusLost = function() --[[ Line: 75 ]] end,
	onSendBtnClicked = function(_) --[[ Line: 78 ]] end,
	onSendChat = function(_) --[[ Line: 79 ]] end,
	onTextChanged = function(_) --[[ Line: 80 ]] end,
	eventLoggingFunc = require(Parent.LoggingProtocol).default.logRobloxTelemetryEvent
}

local function heightOfNLines(p1: number, BodyLargeFont, ScaledBaseSize, p2) --[[ Line: 90 ]]
	-- upvalues: FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), Text (copy)
	return if FoundationFontFaceMigration then GetTextSizeFunction(string.rep("A\n", p1 - 1), ScaledBaseSize, BodyLargeFont, Vector2.new(p2 or 10000, 10000)).Y else Text.GetTextHeight(string.rep("A\n", p1 - 1), BodyLargeFont, ScaledBaseSize, p2)
end

return ReactModule.memo(function(p1) --[[ Line: 97 | Named "ChatInputBar" ]]
	-- upvalues: CryoModule (copy), config (copy), ReactModule (copy), ReactFocusNavigationModule (copy), FocusNavigationEventNameEnum (copy), UserInputService (copy), UseChatPagePaddingModule (copy), FFlagAppChatConsoleFocusFixesModule (copy), UseChatWideModeFocusModule (copy), FoundationModule (copy), UseStyleFunction (copy), FoundationFontFaceMigration (copy), heightOfNLines (copy), UseKeystrokeCollectionModule (copy), IsMessageValidModule (copy), Text (copy), SendButtonClickActionResultModule (copy), IsKeyCodePressedModule (copy), UseInputConnectionsModule (copy), GetTextSizeFunction (copy), UseIsSpatialFunction (copy), FFlagAppChatGamepadSendButtonNavModule (copy), ChatInputBoxDisabledModule (copy), CallbackInputBox (copy), BuilderIconsModule (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local InputBoxRef = if UnionResult.inputBoxRef then UnionResult.inputBoxRef else ReactModule.useRef(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(nil)
	
	if UnionResult.inputBarRef then
		UseRefResult = UnionResult.inputBarRef
	end
	local UseRefResult2 = ReactModule.useRef(Enum.KeyCode.None)
	local Bubble = ReactFocusNavigationModule.useEventHandler(FocusNavigationEventNameEnum.NavigateBack, function(p2) --[[ Line: 116 ]]
		-- upvalues: UseRefResult2 (copy)
		if p2.eventData and UseRefResult2.current == p2.eventData.KeyCode then
			p2:cancel()
			UseRefResult2.current = Enum.KeyCode.None
		end
	end, "Bubble", UseRefResult)
	local UseRefResult3 = ReactModule.useRef(UnionResult.initialInputText or "")
	local UseRefResult4 = ReactModule.useRef(false)
	local UseRefResult5 = ReactModule.useRef(UnionResult.textChangedFallback or not UserInputService.KeyboardEnabled)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UseRefResult3.current ~= "")
	UseChatPagePaddingModule()
	local UseChatWideModeFocusModuleResult = if FFlagAppChatConsoleFocusFixesModule then UseChatWideModeFocusModule() else nil
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local UseStyleResult = UseStyleFunction()
	local BodyLargeFont = if FoundationFontFaceMigration then UseTokensResult.Typography.BodyLarge.Font else UseStyleResult.Font.Body.Font
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.Body.RelativeSize
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 140 ]]
		-- upvalues: heightOfNLines (upval), BodyLargeFont (copy), ScaledBaseSize (copy), UseStateResult (copy)
		return heightOfNLines(4, BodyLargeFont, ScaledBaseSize, UseStateResult)
	end, { BodyLargeFont, ScaledBaseSize, UseStateResult })
	local UseMemoResult1: number = ReactModule.useMemo(function() --[[ Line: 143 ]]
		-- upvalues: heightOfNLines (upval), BodyLargeFont (copy), ScaledBaseSize (copy)
		return heightOfNLines(1, BodyLargeFont, ScaledBaseSize)
	end, { BodyLargeFont, ScaledBaseSize })
	local UseKeystrokeCollectionModuleResult = UseKeystrokeCollectionModule({
		eventLoggingFunc = UnionResult.eventLoggingFunc,
		maxKeystrokeDataLength = UnionResult.maxKeystrokeDataLength
	})
	local UseResult = ReactModule.useCallback(function() --[[ Line: 152 ]]
		-- upvalues: UseRefResult3 (copy), IsMessageValidModule (upval), UnionResult (copy)
		return UseRefResult3.current and IsMessageValidModule(UseRefResult3.current, UnionResult.maxCharacterLength)
	end, { UnionResult.maxCharacterLength })
	local UseContextResult = ReactModule.useContext(ReactFocusNavigationModule.FocusNavigationContext)
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 158 ]]
		-- upvalues: UseRefResult3 (copy), InputBoxRef (ref), Text (upval), SendButtonClickActionResultModule (upval), UseResult (copy), IsMessageValidModule (upval), UnionResult (copy), UseContextResult (copy), UseRefResult1 (copy), UseRefResult (ref), UseBindingResult2 (copy), UseKeystrokeCollectionModuleResult (copy)
		local TrimResult = Text.Trim(if InputBoxRef.current then InputBoxRef.current.Text or "" else UseRefResult3.current)
		local _ = SendButtonClickActionResultModule.None
		local MessageInvalid = nil
		
		if UseResult() and IsMessageValidModule(TrimResult, UnionResult.maxCharacterLength) then
			if InputBoxRef.current then
				InputBoxRef.current.Text = ""
			end
			if UseContextResult and UseContextResult.focusedGuiObject:getValue() == UseRefResult1.current then
				UseContextResult:focusGuiObject(UseRefResult.current, false)
			end
			UseRefResult3.current = ""
			UseBindingResult2(false)
			
			if TrimResult == "/shrug" then
				UnionResult.onSendChat("¯\\_(ツ)_/¯")
			else
				UnionResult.onSendChat(TrimResult)
			end
			MessageInvalid = SendButtonClickActionResultModule.WillSend
			local ListRef = UnionResult.messageListRef and (UnionResult.messageListRef.current and UnionResult.messageListRef.current._listRef)
			
			if ListRef then
				ListRef:scrollToOffset({ offset = 0 })
			end
		else
			MessageInvalid = if UseResult() then SendButtonClickActionResultModule.MessageInvalid else SendButtonClickActionResultModule.ButtonInactive
		end
		UnionResult.onSendBtnClicked(MessageInvalid)
		UseKeystrokeCollectionModuleResult.sendKeystrokeEventOnSend()
	end, {
		UseResult,
		UnionResult.onSendChat,
		UnionResult.onSendBtnClicked,
		UseKeystrokeCollectionModuleResult.sendKeystrokeEventOnSend,
		UseContextResult
	})
	local UseInputConnectionsModuleResult = UseInputConnectionsModule({
		userInputService = UnionResult.userInputService,
		onInputBegan = ReactModule.useCallback(function(Input, _) --[[ Line: 232 ]]
			-- upvalues: UseKeystrokeCollectionModuleResult (copy), UseRefResult5 (copy), IsKeyCodePressedModule (upval), UnionResult (copy), UseResult1 (copy)
			if UseKeystrokeCollectionModuleResult and not UseRefResult5.current and Input.UserInputType == Enum.UserInputType.Keyboard then
				UseKeystrokeCollectionModuleResult.recordKeystroke(true, Input.KeyCode)
			end
			if IsKeyCodePressedModule({ Input }, Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter) and not IsKeyCodePressedModule(UnionResult.userInputService:GetKeysPressed(), Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift) then
				UseResult1()
			end
		end, {
			UnionResult.userInputService,
			UseKeystrokeCollectionModuleResult.recordKeystroke,
			UseKeystrokeCollectionModuleResult.sendKeystrokeEventOnSend,
			UseResult1
		}),
		onInputEnded = ReactModule.useCallback(function(Input, _) --[[ Line: 221 ]]
			-- upvalues: UseKeystrokeCollectionModuleResult (copy), UseRefResult5 (copy)
			if UseKeystrokeCollectionModuleResult and not UseRefResult5.current and Input.UserInputType == Enum.UserInputType.Keyboard then
				UseKeystrokeCollectionModuleResult.recordKeystroke(false, Input.KeyCode)
			end
		end, { UseKeystrokeCollectionModuleResult.recordKeystroke }),
		onFocusLost = UnionResult.onFocusLost
	})
	local UseResult2 = ReactModule.useCallback(function(p2, X) --[[ Line: 267 ]]
		-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), ScaledBaseSize (copy), UseTokensResult (copy), Text (upval), BodyLargeFont (copy), UseMemoResult (copy), UnionResult (copy)
		local NewScaledBaseSize = ScaledBaseSize + math.min(if FoundationFontFaceMigration then GetTextSizeFunction(p2, ScaledBaseSize, UseTokensResult.Typography.BodyLarge.Font, Vector2.new(X, 10000)).Y else Text.GetTextHeight(p2, BodyLargeFont, ScaledBaseSize, X), UseMemoResult)
		
		if UnionResult.onHeightChanged then
			UnionResult.onHeightChanged(NewScaledBaseSize)
		end
		return NewScaledBaseSize
	end, {
		UseTokensResult,
		UseMemoResult,
		UnionResult.onHeightChanged,
		BodyLargeFont,
		ScaledBaseSize
	})
	local UseResult3 = ReactModule.useCallback(function(Current) --[[ Line: 283 ]]
		-- upvalues: UseRefResult4 (copy), UseRefResult3 (copy), UseBindingResult2 (copy), UseStateResult2_2 (copy), UseResult (copy), UseKeystrokeCollectionModuleResult (copy), UseRefResult5 (copy), UseResult2 (copy), UseStateResult (copy), UseStateResult2_1 (copy), UnionResult (copy)
		if not UseRefResult4.current then return end
		UseRefResult3.current = Current
		UseBindingResult2(Current ~= "")
		UseStateResult2_2(UseResult())
		
		if UseKeystrokeCollectionModuleResult and UseRefResult5.current then
			UseKeystrokeCollectionModuleResult.recordTextChange(Current)
		end
		UseStateResult2_1((UseResult2(Current, UseStateResult)))
		
		if UnionResult.onTextChanged then
			UnionResult.onTextChanged(Current)
		end
	end, {
		UseKeystrokeCollectionModuleResult.recordTextChange,
		UseResult2,
		UnionResult.onTextChanged,
		UseStateResult
	})
	local UseResult4 = ReactModule.useCallback(function(Frame: Frame) --[[ Line: 306 ]]
		-- upvalues: UseResult2 (copy), UseRefResult3 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy)
		local UseResultResult = UseResult2(UseRefResult3.current, Frame.AbsoluteSize.X)
		UseStateResult2(Frame.AbsoluteSize.X)
		UseStateResult2_1(UseResultResult)
	end, { UseResult2 })
	local UseResult5 = ReactModule.useCallback(function() --[[ Line: 312 ]]
		-- upvalues: InputBoxRef (ref)
		if InputBoxRef.current then
			InputBoxRef.current:CaptureFocus()
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 318 ]]
		-- upvalues: UseRefResult4 (copy), UnionResult (copy)
		UseRefResult4.current = true
		
		return function() --[[ Line: 320 ]]
			-- upvalues: UseRefResult4 (upval), UnionResult (upval)
			UseRefResult4.current = false
			
			if UnionResult.onHeightChanged then
				UnionResult.onHeightChanged(0)
			end
		end
	end, { UnionResult.onHeightChanged })
	ReactModule.useEffect(function() --[[ Line: 329 ]]
		-- upvalues: InputBoxRef (ref), UseRefResult2 (copy)
		local Connection = nil
		
		if InputBoxRef and InputBoxRef.current then
			InputBoxRef.current.Selectable = false
			Connection = InputBoxRef.current.FocusLost:Connect(function(_, CauseInput) --[[ Line: 334 ]]
				-- upvalues: UseRefResult2 (upval)
				UseRefResult2.current = if CauseInput then CauseInput.KeyCode else Enum.KeyCode.None
			end)
		end
		return function() --[[ Line: 341 ]]
			-- upvalues: Connection (ref)
			if Connection then
				Connection:Disconnect()
			end
		end
	end, {})
	local MoreMenuEnabled = UnionResult.moreMenuEnabled
	local UseIsSpatialResult = UseIsSpatialFunction()
	local XOffset = ScaledBaseSize + UseMemoResult1
	local IsDisabled = UnionResult.isDisabled
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = {
			["padding-x-xlarge"] = not MoreMenuEnabled,
			fill = MoreMenuEnabled
		},
		Size = UDim2.new(if MoreMenuEnabled then 0 else 1, 0, 0, if UseStateResult1 == 0 then UseResult2(UseRefResult3.current, UseStateResult) else UseStateResult1),
		LayoutOrder = UnionResult.LayoutOrder,
		onAbsolutePositionChanged = UnionResult.onPositionChanged
	}, {
		inputBar = ReactModule.createElement(FoundationModule.View, {
			LayoutOrder = 1,
			tag = {
				["row size-full"] = true,
				["stroke-emphasis stroke-thick"] = not IsDisabled,
				["stroke-alert"] = IsDisabled
			},
			onActivated = UseResult5,
			ref = Bubble,
			cornerRadius = UDim.new(0, XOffset / 2),
			selection = {
				Selectable = true,
				NextSelectionRight = if FFlagAppChatGamepadSendButtonNavModule then UseRefResult1 else nil,
				NextSelectionLeft = if FFlagAppChatConsoleFocusFixesModule and UseChatWideModeFocusModuleResult then UseChatWideModeFocusModuleResult.conversationListRef else nil
			},
			cursor = { offset = 0, radius = UDim.new(0, XOffset / 2) }
		}, {
			inputBoxWrapper = ReactModule.createElement(FoundationModule.View, {
				tag = "size-0-full fill padding-left-large",
				LayoutOrder = 1,
				padding = {
					top = UDim.new(0, ScaledBaseSize / 2),
					bottom = UDim.new(0, ScaledBaseSize / 2)
				}
			}, {
				inputBox = if IsDisabled then ReactModule.createElement(ChatInputBoxDisabledModule, {
					bodyText = UnionResult.inputBarDisabledText,
					font = BodyLargeFont,
					contentSize = ScaledBaseSize,
					endTimestamp = UnionResult.disabledEndTimestampDisplay,
					onActivated = UnionResult.onDisabledInputBarActivated
				}) else ReactModule.createElement(CallbackInputBox, {
					initialInputText = UnionResult.initialInputText,
					inputTextFont = BodyLargeFont,
					inputTextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
					inputTextSize = ScaledBaseSize,
					inputTextXAlignment = Enum.TextXAlignment.Left,
					inputTextYAlignment = Enum.TextYAlignment.Center,
					placeholderText = UnionResult.placeholderText,
					placeholderTextColor3 = UseStyleResult.Theme.TextMuted.Color,
					placeholderTextTransparency = UseStyleResult.Theme.TextMuted.Transparency,
					clipsDescendants = false,
					multiLine = not UseIsSpatialResult,
					manualFocusRelease = true,
					textWrapped = true,
					focusChangedCallback = UseInputConnectionsModuleResult.focusChanged,
					clearButtonDisabled = true,
					clearButtonSize = 0,
					textChangedCallback = UseResult3,
					[ReactModule.Change.AbsoluteSize] = UseResult4,
					inputBoxRef = InputBoxRef,
					returnPressedFromOnScreenKeyboardCallback = if UseIsSpatialResult then UseResult1 else nil
				})
			}),
			sendButtonColumn = ReactModule.createElement(FoundationModule.View, {
				tag = "col size-0-full auto-x align-y-bottom",
				LayoutOrder = 2,
				Visible = UseBindingResult
			}, {
				sendButtonWrapper = ReactModule.createElement(FoundationModule.View, {
					tag = "col flex-around padding-small",
					Size = UDim2.new(0, XOffset, 0, XOffset)
				}, {
					sendButton = ReactModule.createElement(FoundationModule.View, {
						tag = {
							["col radius-circle flex-around"] = true,
							["bg-action-emphasis"] = UseStateResult3,
							["bg-action-standard"] = not UseStateResult3
						},
						Size = UDim2.new(0, XOffset - UseTokensResult.Padding.Small, 0, XOffset - UseTokensResult.Padding.Small),
						isDisabled = not UseStateResult3,
						onActivated = UseResult1,
						selection = { Selectable = true, NextSelectionLeft = UseRefResult },
						cursor = {
							radius = UDim.new(0, XOffset / 2),
							offset = UseTokensResult.Padding.Small / 2
						},
						ref = UseRefResult1
					}, {
						sendButtonIcon = ReactModule.createElement(FoundationModule.Icon, {
							style = UseTokensResult.Color.ActionEmphasis.Foreground,
							size = FoundationModule.Enums.IconSize.Small,
							name = BuilderIconsModule.Icon.ArrowLargeUp
						})
					})
				})
			})
		})
	})
end)