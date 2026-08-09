local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local userInputService = game:GetService("UserInputService")
local socialLibrariesModule = require(appChat.SocialLibraries)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local text = require(parent.AppCommonLib).Text
local builderIconsModule = require(parent.BuilderIcons)
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local isKeyCodePressedModule = require(appChat.Components.ChatConversation.Utils.isKeyCodePressed)
local default = require(parent.LoggingProtocol).default
local cryoModule = require(parent.Cryo)
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local callbackInputBox = socialLibrariesModule.Components.CallbackInputBox
local chatInputBoxDisabledModule = require(script.Parent.ChatInputBoxDisabled)
local isMessageValidModule = require(script.Parent.isMessageValid)
local useKeystrokeCollectionModule = require(script.Parent.Hooks.useKeystrokeCollection)
local useInputConnectionsModule = require(script.Parent.Hooks.useInputConnections)
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local useIsSpatial = require(parent.Responsive).useIsSpatial
local sendButtonClickActionResultModule = require(appChat.Analytics.Enums.SendButtonClickActionResult)
local _ = require(appChat.types)
local fFlagAppChatReplyComposeBarContainerModule = require(appChat.Flags.FFlagAppChatReplyComposeBarContainer)
local fFlagAppChatGamepadSendButtonNavModule = require(appChat.Flags.FFlagAppChatGamepadSendButtonNav)
local t = {
	initialInputText = "",
	placeholderText = "Write a message",
	inputBarDisabledText = "Chat Disabled",
	inputBarRef = nil,
	inputBoxRef = nil,
	LayoutOrder = 0,
	maxCharacterLength = 160,
	maxKeystrokeDataLength = 200,
	messageListRef = nil,
	isDisabled = false,
	disabledEndTimestampDisplay = nil,
	textChangedFallback = false,
	moreMenuEnabled = false,
	userInputService = userInputService,
	onDisabledInputBarActivated = function() --[[ line: 64 ]] end,
	onHeightChanged = function(_) --[[ line: 69 ]] end,
	onPositionChanged = function(_) --[[ line: 70 ]] end,
	onFocusLost = function() --[[ line: 71 ]] end,
	onSendBtnClicked = function(_) --[[ line: 74 ]] end,
	onSendChat = function(_) --[[ line: 75 ]] end,
	onTextChanged = function(_) --[[ line: 76 ]] end,
	eventLoggingFunc = default.logRobloxTelemetryEvent
}

local function heightOfNLines(p0, p1, p2, p3) --[[ line: 86 ]]
	-- upvalues: text (ref)
	return text.GetTextHeight(string.rep("A\n", p0 - 1), p1, p2, p3)
end

return reactModule.memo(function(p4) --[[ line: 90 | named "ChatInputBar" ]]
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), userInputService (ref), useChatPagePaddingModule (ref), foundationModule (ref), useStyle (ref), heightOfNLines (ref), useKeystrokeCollectionModule (ref), isMessageValidModule (ref), text (ref), sendButtonClickActionResultModule (ref), isKeyCodePressedModule (ref), useInputConnectionsModule (ref), fFlagAppChatReplyComposeBarContainerModule (ref), useIsSpatial (ref), fFlagAppChatGamepadSendButtonNavModule (ref), chatInputBoxDisabledModule (ref), callbackInputBox (ref), builderIconsModule (ref)
	local var19 = cryoModule.Dictionary.union(t, p4)
	local var20, var21 = reactModule.useState(0)
	local var22, var23 = reactModule.useState(0)
	local var24, var25 = reactModule.useState(false)
	local var26 = if var19.inputBoxRef then var19.inputBoxRef else reactModule.useRef(nil)
	local var27 = reactModule.useRef(nil)
	local var28 = reactModule.useRef(nil)
	
	if var19.inputBarRef then
		var27 = var19.inputBarRef
	end
	local var29 = reactModule.useRef(Enum.KeyCode.Unknown)
	local bubble = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, function(p5) --[[ line: 109 ]]
		-- upvalues: var29 (ref)
		if p5.eventData and var29.current == p5.eventData.KeyCode then
			p5:cancel()
			var29.current = Enum.KeyCode.Unknown
		end
	end, "Bubble", var27)
	local var31 = reactModule.useRef(var19.initialInputText or "")
	local var32 = reactModule.useRef(false)
	local var33 = reactModule.useRef(var19.textChangedFallback or not userInputService.KeyboardEnabled)
	local var34, var35 = reactModule.useBinding(var31.current ~= "")
	useChatPagePaddingModule()
	local var36 = foundationModule.Hooks.useTokens()
	local var37 = useStyle()
	local font = var37.Font.Body.Font
	local var38 = var37.Font.BaseSize * var37.Font.Body.RelativeSize
	local var39 = reactModule.useMemo(function() --[[ line: 130 ]]
		-- upvalues: heightOfNLines (copy), font (ref), var38 (ref), var20 (ref)
		return heightOfNLines(4, font, var38, var20)
	end, { font, var38, var20 })
	local var40 = reactModule.useMemo(function() --[[ line: 133 ]]
		-- upvalues: heightOfNLines (copy), font (ref), var38 (ref)
		return heightOfNLines(1, font, var38)
	end, { font, var38 })
	local var41 = useKeystrokeCollectionModule({
		eventLoggingFunc = var19.eventLoggingFunc,
		maxKeystrokeDataLength = var19.maxKeystrokeDataLength
	})
	local var42 = reactModule.useCallback(function() --[[ line: 142 ]]
		-- upvalues: var31 (ref), isMessageValidModule (copy), var19 (ref)
		return var31.current and isMessageValidModule(var31.current, var19.maxCharacterLength)
	end, { var19.maxCharacterLength })
	local var43 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var44 = reactModule.useCallback(function() --[[ line: 148 ]]
		-- upvalues: var31 (ref), var26 (write), text (copy), sendButtonClickActionResultModule (copy), var42 (ref), isMessageValidModule (copy), var19 (ref), var43 (ref), var28 (ref), var27 (write), var35 (ref), var41 (ref)
		local var54
		local var53 = text.Trim(if var26.current then var26.current.Text or "" else var31.current)
		local _ = sendButtonClickActionResultModule.None
		
		if var42() and isMessageValidModule(var53, var19.maxCharacterLength) then
			if var26.current then
				var26.current.Text = ""
			end
			if var43 and var43.focusedGuiObject:getValue() == var28.current then
				var43:focusGuiObject(var27.current, false)
			end
			var31.current = ""
			var35(false)
			
			if var53 == "/shrug" then
				var19.onSendChat("\194\175\\_(\227\131\132)_/\194\175")
			else
				var19.onSendChat(var53)
			end
			var54 = sendButtonClickActionResultModule.WillSend
			local listRef = var19.messageListRef and (var19.messageListRef.current and var19.messageListRef.current._listRef)
			
			if listRef then
				listRef:scrollToOffset({ offset = 0 })
			end
		else
			var54 = if not var42() then sendButtonClickActionResultModule.ButtonInactive else sendButtonClickActionResultModule.MessageInvalid
		end
		var19.onSendBtnClicked(var54)
		var41.sendKeystrokeEventOnSend()
	end, {
		var42,
		var19.onSendChat,
		var19.onSendBtnClicked,
		var41.sendKeystrokeEventOnSend,
		var43
	})
	local var45 = useInputConnectionsModule({
		userInputService = var19.userInputService,
		onInputBegan = reactModule.useCallback(function(p6, _) --[[ line: 222 ]]
			-- upvalues: var41 (ref), var33 (ref), isKeyCodePressedModule (copy), var19 (ref), var44 (ref)
			if var41 and not var33.current and p6.UserInputType == Enum.UserInputType.Keyboard then
				var41.recordKeystroke(true, p6.KeyCode)
			end
			if isKeyCodePressedModule({ p6 }, Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter) and not isKeyCodePressedModule(var19.userInputService:GetKeysPressed(), Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift) then
				var44()
			end
		end, {
			var19.userInputService,
			var41.recordKeystroke,
			var41.sendKeystrokeEventOnSend,
			var44
		}),
		onInputEnded = reactModule.useCallback(function(p7, _) --[[ line: 211 ]]
			-- upvalues: var41 (ref), var33 (ref)
			if var41 and not var33.current and p7.UserInputType == Enum.UserInputType.Keyboard then
				var41.recordKeystroke(false, p7.KeyCode)
			end
		end, { var41.recordKeystroke }),
		onFocusLost = var19.onFocusLost
	})
	local var46 = reactModule.useCallback(function(p8, p9) --[[ line: 257 ]]
		-- upvalues: text (copy), font (ref), var38 (ref), var39 (ref), fFlagAppChatReplyComposeBarContainerModule (copy), var36 (ref), var19 (ref)
		local var56 = var38 + math.min(text.GetTextHeight(p8, font, var38, p9), var39) + (if fFlagAppChatReplyComposeBarContainerModule then 0 else var36.Padding.Medium * 2)
		
		if var19.onHeightChanged then
			var19.onHeightChanged(var56)
		end
		return var56
	end, {
		var36,
		var39,
		var19.onHeightChanged,
		font,
		var38
	})
	local var47 = reactModule.useCallback(function(p10) --[[ line: 273 ]]
		-- upvalues: var32 (ref), var31 (ref), var35 (ref), var25 (ref), var42 (ref), var41 (ref), var33 (ref), var46 (ref), var20 (ref), var23 (ref), var19 (ref)
		if not var32.current then return end
		var31.current = p10
		var35(p10 ~= "")
		var25(var42())
		
		if var41 and var33.current then
			var41.recordTextChange(p10)
		end
		var23(var46(p10, var20))
		
		if var19.onTextChanged then
			var19.onTextChanged(p10)
		end
	end, {
		var41.recordTextChange,
		var46,
		var19.onTextChanged,
		var20
	})
	local var48 = reactModule.useCallback(function(p11) --[[ line: 296 ]]
		-- upvalues: var46 (ref), var31 (ref), var21 (ref), var23 (ref)
		local var57 = var46(var31.current, p11.AbsoluteSize.X)
		var21(p11.AbsoluteSize.X)
		var23(var57)
	end, { var46 })
	local var49 = reactModule.useCallback(function() --[[ line: 302 ]]
		-- upvalues: var26 (write)
		if var26.current then
			var26.current:CaptureFocus()
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 308 ]]
		-- upvalues: var32 (ref), var19 (ref)
		var32.current = true
		
		return function() --[[ line: 310 ]]
			-- upvalues: var32 (copy), var19 (copy)
			var32.current = false
			
			if var19.onHeightChanged then
				var19.onHeightChanged(0)
			end
		end
	end, { var19.onHeightChanged })
	reactModule.useEffect(function() --[[ line: 319 ]]
		-- upvalues: var26 (write), var29 (ref)
		local focusLostConnection = nil
		
		if var26 and var26.current then
			var26.current.Selectable = false
			focusLostConnection = var26.current.FocusLost:Connect(function(_, p12) --[[ line: 324 ]]
				-- upvalues: var29 (copy)
				var29.current = if p12 then p12.KeyCode else Enum.KeyCode.Unknown
			end)
		end
		return function() --[[ line: 331 ]]
			-- upvalues: focusLostConnection (write)
			if focusLostConnection then
				focusLostConnection:Disconnect()
			end
		end
	end, {})
	local moreMenuEnabled = var19.moreMenuEnabled
	local var50 = useIsSpatial()
	local var51 = if var22 ~= 0 then var46(var31.current, var20) else var22
	local var52 = var38 + var40
	local isDisabled = var19.isDisabled
	
	return reactModule.createElement(foundationModule.View, {
		tag = {
			["padding-y-medium"] = not fFlagAppChatReplyComposeBarContainerModule,
			["padding-x-xlarge"] = not moreMenuEnabled,
			fill = moreMenuEnabled
		},
		Size = UDim2.new(if moreMenuEnabled then 0 else 1, 0, 0, var51),
		LayoutOrder = var19.LayoutOrder,
		onAbsolutePositionChanged = var19.onPositionChanged
	}, {
		inputBar = reactModule.createElement(foundationModule.View, {
			LayoutOrder = 1,
			tag = {
				["row size-full"] = true,
				["stroke-emphasis stroke-thick"] = not isDisabled,
				["stroke-alert"] = isDisabled
			},
			onActivated = var49,
			ref = bubble,
			cornerRadius = UDim.new(0, var52 / 2),
			selection = {
				Selectable = true,
				NextSelectionRight = if fFlagAppChatGamepadSendButtonNavModule then var28 else nil
			},
			cursor = { offset = 0, radius = UDim.new(0, var52 / 2) }
		}, {
			inputBoxWrapper = reactModule.createElement(foundationModule.View, {
				tag = "size-0-full fill padding-left-large",
				LayoutOrder = 1,
				padding = {
					top = UDim.new(0, var38 / 2),
					bottom = UDim.new(0, var38 / 2)
				}
			}, {
				inputBox = if isDisabled then reactModule.createElement(chatInputBoxDisabledModule, {
					bodyText = var19.inputBarDisabledText,
					font = font,
					contentSize = var38,
					endTimestamp = var19.disabledEndTimestampDisplay,
					onActivated = var19.onDisabledInputBarActivated
				}) else reactModule.createElement(callbackInputBox, {
					initialInputText = var19.initialInputText,
					inputTextFont = font,
					inputTextColor3 = var37.Theme.TextEmphasis.Color,
					inputTextSize = var38,
					inputTextXAlignment = Enum.TextXAlignment.Left,
					inputTextYAlignment = Enum.TextYAlignment.Center,
					placeholderText = var19.placeholderText,
					placeholderTextColor3 = var37.Theme.TextMuted.Color,
					placeholderTextTransparency = var37.Theme.TextMuted.Transparency,
					clipsDescendants = false,
					multiLine = not var50,
					manualFocusRelease = true,
					textWrapped = true,
					focusChangedCallback = var45.focusChanged,
					clearButtonDisabled = true,
					clearButtonSize = 0,
					textChangedCallback = var47,
					[reactModule.Change.AbsoluteSize] = var48,
					inputBoxRef = var26,
					returnPressedFromOnScreenKeyboardCallback = if var50 then var44 else nil
				})
			}),
			sendButtonColumn = reactModule.createElement(foundationModule.View, {
				tag = "col size-0-full auto-x align-y-bottom",
				LayoutOrder = 2,
				Visible = var34
			}, {
				sendButtonWrapper = reactModule.createElement(foundationModule.View, {
					tag = "col flex-around padding-small",
					Size = UDim2.new(0, var52, 0, var52)
				}, {
					sendButton = reactModule.createElement(foundationModule.View, {
						tag = {
							["col radius-circle flex-around"] = true,
							["bg-action-emphasis"] = var24,
							["bg-action-standard"] = not var24
						},
						Size = UDim2.new(0, var52 - var36.Padding.Small, 0, var52 - var36.Padding.Small),
						isDisabled = not var24,
						onActivated = var44,
						selection = { Selectable = true, NextSelectionLeft = var27 },
						cursor = {
							radius = UDim.new(0, var52 / 2),
							offset = var36.Padding.Small / 2
						},
						ref = var28
					}, {
						sendButtonIcon = reactModule.createElement(foundationModule.Icon, {
							style = var36.Color.ActionEmphasis.Foreground,
							size = foundationModule.Enums.IconSize.Small,
							name = builderIconsModule.Icon.ArrowLargeUp
						})
					})
				})
			})
		})
	})
end)