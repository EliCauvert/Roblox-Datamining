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
local messageCharacterLimitModule = require(script.Parent.MessageCharacterLimit)
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
	maxKeystrokeDataLength = 200,
	messageListRef = nil,
	isDisabled = false,
	disabledEndTimestampDisplay = nil,
	textChangedFallback = false,
	moreMenuEnabled = false,
	userInputService = userInputService,
	onDisabledInputBarActivated = function() end,
	maxCharacterLength = messageCharacterLimitModule,
	onHeightChanged = function(_) end,
	onPositionChanged = function(_) end,
	onFocusLost = function() end,
	onSendBtnClicked = function(_) end,
	onSendChat = function(_) end,
	onTextChanged = function(_) end,
	eventLoggingFunc = default.logRobloxTelemetryEvent
}

local function heightOfNLines(p0, p1, p2, p3)
	-- upvalues: text (ref)
	return text.GetTextHeight(string.rep("A\n", p0 - 1), p1, p2, p3)
end

return reactModule.memo(function(p4)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), userInputService (ref), useChatPagePaddingModule (ref), foundationModule (ref), useStyle (ref), heightOfNLines (ref), useKeystrokeCollectionModule (ref), isMessageValidModule (ref), text (ref), sendButtonClickActionResultModule (ref), isKeyCodePressedModule (ref), useInputConnectionsModule (ref), fFlagAppChatReplyComposeBarContainerModule (ref), useIsSpatial (ref), fFlagAppChatGamepadSendButtonNavModule (ref), chatInputBoxDisabledModule (ref), callbackInputBox (ref), builderIconsModule (ref)
	local var20 = cryoModule.Dictionary.union(t, p4)
	local var21, var22 = reactModule.useState(0)
	local var23, var24 = reactModule.useState(0)
	local var25, var26 = reactModule.useState(false)
	local var27 = if var20.inputBoxRef then var20.inputBoxRef else reactModule.useRef(nil)
	local var28 = reactModule.useRef(nil)
	local var29 = reactModule.useRef(nil)
	
	if var20.inputBarRef then
		var28 = var20.inputBarRef
	end
	local var30 = reactModule.useRef(Enum.KeyCode.None)
	local bubble = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, function(p5)
		-- upvalues: var30 (ref)
		if p5.eventData and var30.current == p5.eventData.KeyCode then
			p5:cancel()
			var30.current = Enum.KeyCode.None
		end
	end, "Bubble", var28)
	local var32 = reactModule.useRef(var20.initialInputText or "")
	local var33 = reactModule.useRef(false)
	local var34 = reactModule.useRef(var20.textChangedFallback or not userInputService.KeyboardEnabled)
	local var35, var36 = reactModule.useBinding(var32.current ~= "")
	useChatPagePaddingModule()
	local var37 = foundationModule.Hooks.useTokens()
	local var38 = useStyle()
	local font = var38.Font.Body.Font
	local var39 = var38.Font.BaseSize * var38.Font.Body.RelativeSize
	local var40 = reactModule.useMemo(function()
		-- upvalues: heightOfNLines (copy), font (ref), var39 (ref), var21 (ref)
		return heightOfNLines(4, font, var39, var21)
	end, { font, var39, var21 })
	local var41 = reactModule.useMemo(function()
		-- upvalues: heightOfNLines (copy), font (ref), var39 (ref)
		return heightOfNLines(1, font, var39)
	end, { font, var39 })
	local var42 = useKeystrokeCollectionModule({
		eventLoggingFunc = var20.eventLoggingFunc,
		maxKeystrokeDataLength = var20.maxKeystrokeDataLength
	})
	local var43 = reactModule.useCallback(function()
		-- upvalues: var32 (ref), isMessageValidModule (copy), var20 (ref)
		return var32.current and isMessageValidModule(var32.current, var20.maxCharacterLength)
	end, { var20.maxCharacterLength })
	local var44 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var45 = reactModule.useCallback(function()
		-- upvalues: var32 (ref), var27 (write), text (copy), sendButtonClickActionResultModule (copy), var43 (ref), isMessageValidModule (copy), var20 (ref), var44 (ref), var29 (ref), var28 (write), var36 (ref), var42 (ref)
		local var55
		local var54 = text.Trim(if var27.current then var27.current.Text or "" else var32.current)
		local _ = sendButtonClickActionResultModule.None
		
		if var43() and isMessageValidModule(var54, var20.maxCharacterLength) then
			if var27.current then
				var27.current.Text = ""
			end
			if var44 and var44.focusedGuiObject:getValue() == var29.current then
				var44:focusGuiObject(var28.current, false)
			end
			var32.current = ""
			var36(false)
			
			if var54 == "/shrug" then
				var20.onSendChat("\194\175\\_(\227\131\132)_/\194\175")
			else
				var20.onSendChat(var54)
			end
			var55 = sendButtonClickActionResultModule.WillSend
			local listRef = var20.messageListRef and (var20.messageListRef.current and var20.messageListRef.current._listRef)
			
			if listRef then
				listRef:scrollToOffset({ offset = 0 })
			end
		else
			var55 = if not var43() then sendButtonClickActionResultModule.ButtonInactive else sendButtonClickActionResultModule.MessageInvalid
		end
		var20.onSendBtnClicked(var55)
		var42.sendKeystrokeEventOnSend()
	end, {
		var43,
		var20.onSendChat,
		var20.onSendBtnClicked,
		var42.sendKeystrokeEventOnSend,
		var44
	})
	local var46 = useInputConnectionsModule({
		userInputService = var20.userInputService,
		onInputBegan = reactModule.useCallback(function(p6, _)
			-- upvalues: var42 (ref), var34 (ref), isKeyCodePressedModule (copy), var20 (ref), var45 (ref)
			if var42 and not var34.current and p6.UserInputType == Enum.UserInputType.Keyboard then
				var42.recordKeystroke(true, p6.KeyCode)
			end
			if isKeyCodePressedModule({ p6 }, Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter) and not isKeyCodePressedModule(var20.userInputService:GetKeysPressed(), Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift) then
				var45()
			end
		end, {
			var20.userInputService,
			var42.recordKeystroke,
			var42.sendKeystrokeEventOnSend,
			var45
		}),
		onInputEnded = reactModule.useCallback(function(p7, _)
			-- upvalues: var42 (ref), var34 (ref)
			if var42 and not var34.current and p7.UserInputType == Enum.UserInputType.Keyboard then
				var42.recordKeystroke(false, p7.KeyCode)
			end
		end, { var42.recordKeystroke }),
		onFocusLost = var20.onFocusLost
	})
	local var47 = reactModule.useCallback(function(p8, p9)
		-- upvalues: text (copy), font (ref), var39 (ref), var40 (ref), fFlagAppChatReplyComposeBarContainerModule (copy), var37 (ref), var20 (ref)
		local var57 = var39 + math.min(text.GetTextHeight(p8, font, var39, p9), var40) + (if fFlagAppChatReplyComposeBarContainerModule then 0 else var37.Padding.Medium * 2)
		
		if var20.onHeightChanged then
			var20.onHeightChanged(var57)
		end
		return var57
	end, {
		var37,
		var40,
		var20.onHeightChanged,
		font,
		var39
	})
	local var48 = reactModule.useCallback(function(p10)
		-- upvalues: var33 (ref), var32 (ref), var36 (ref), var26 (ref), var43 (ref), var42 (ref), var34 (ref), var47 (ref), var21 (ref), var24 (ref), var20 (ref)
		if not var33.current then return end
		var32.current = p10
		var36(p10 ~= "")
		var26(var43())
		
		if var42 and var34.current then
			var42.recordTextChange(p10)
		end
		var24(var47(p10, var21))
		
		if var20.onTextChanged then
			var20.onTextChanged(p10)
		end
	end, {
		var42.recordTextChange,
		var47,
		var20.onTextChanged,
		var21
	})
	local var49 = reactModule.useCallback(function(p11)
		-- upvalues: var47 (ref), var32 (ref), var22 (ref), var24 (ref)
		local var58 = var47(var32.current, p11.AbsoluteSize.X)
		var22(p11.AbsoluteSize.X)
		var24(var58)
	end, { var47 })
	local var50 = reactModule.useCallback(function()
		-- upvalues: var27 (write)
		if var27.current then
			var27.current:CaptureFocus()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var33 (ref), var20 (ref)
		var33.current = true
		
		return function()
			-- upvalues: var33 (copy), var20 (copy)
			var33.current = false
			
			if var20.onHeightChanged then
				var20.onHeightChanged(0)
			end
		end
	end, { var20.onHeightChanged })
	reactModule.useEffect(function()
		-- upvalues: var27 (write), var30 (ref)
		local focusLostConnection = nil
		
		if var27 and var27.current then
			var27.current.Selectable = false
			focusLostConnection = var27.current.FocusLost:Connect(function(_, p12)
				-- upvalues: var30 (copy)
				var30.current = if p12 then p12.KeyCode else Enum.KeyCode.None
			end)
		end
		return function()
			-- upvalues: focusLostConnection (write)
			if focusLostConnection then
				focusLostConnection:Disconnect()
			end
		end
	end, {})
	local moreMenuEnabled = var20.moreMenuEnabled
	local var51 = useIsSpatial()
	local var52 = if var23 ~= 0 then var47(var32.current, var21) else var23
	local var53 = var39 + var41
	local isDisabled = var20.isDisabled
	
	return reactModule.createElement(foundationModule.View, {
		tag = {
			["padding-y-medium"] = not fFlagAppChatReplyComposeBarContainerModule,
			["padding-x-xlarge"] = not moreMenuEnabled,
			fill = moreMenuEnabled
		},
		Size = UDim2.new(if moreMenuEnabled then 0 else 1, 0, 0, var52),
		LayoutOrder = var20.LayoutOrder,
		onAbsolutePositionChanged = var20.onPositionChanged
	}, {
		inputBar = reactModule.createElement(foundationModule.View, {
			LayoutOrder = 1,
			tag = {
				["row size-full"] = true,
				["stroke-emphasis stroke-thick"] = not isDisabled,
				["stroke-alert"] = isDisabled
			},
			onActivated = var50,
			ref = bubble,
			cornerRadius = UDim.new(0, var53 / 2),
			selection = {
				Selectable = true,
				NextSelectionRight = if fFlagAppChatGamepadSendButtonNavModule then var29 else nil
			},
			cursor = { offset = 0, radius = UDim.new(0, var53 / 2) }
		}, {
			inputBoxWrapper = reactModule.createElement(foundationModule.View, {
				tag = "size-0-full fill padding-left-large",
				LayoutOrder = 1,
				padding = {
					top = UDim.new(0, var39 / 2),
					bottom = UDim.new(0, var39 / 2)
				}
			}, {
				inputBox = if isDisabled then reactModule.createElement(chatInputBoxDisabledModule, {
					bodyText = var20.inputBarDisabledText,
					font = font,
					contentSize = var39,
					endTimestamp = var20.disabledEndTimestampDisplay,
					onActivated = var20.onDisabledInputBarActivated
				}) else reactModule.createElement(callbackInputBox, {
					initialInputText = var20.initialInputText,
					inputTextFont = font,
					inputTextColor3 = var38.Theme.TextEmphasis.Color,
					inputTextSize = var39,
					inputTextXAlignment = Enum.TextXAlignment.Left,
					inputTextYAlignment = Enum.TextYAlignment.Center,
					placeholderText = var20.placeholderText,
					placeholderTextColor3 = var38.Theme.TextMuted.Color,
					placeholderTextTransparency = var38.Theme.TextMuted.Transparency,
					clipsDescendants = false,
					multiLine = not var51,
					manualFocusRelease = true,
					textWrapped = true,
					focusChangedCallback = var46.focusChanged,
					clearButtonDisabled = true,
					clearButtonSize = 0,
					textChangedCallback = var48,
					[reactModule.Change.AbsoluteSize] = var49,
					inputBoxRef = var27,
					returnPressedFromOnScreenKeyboardCallback = if var51 then var45 else nil
				})
			}),
			sendButtonColumn = reactModule.createElement(foundationModule.View, {
				tag = "col size-0-full auto-x align-y-bottom",
				LayoutOrder = 2,
				Visible = var35
			}, {
				sendButtonWrapper = reactModule.createElement(foundationModule.View, {
					tag = "col flex-around padding-small",
					Size = UDim2.new(0, var53, 0, var53)
				}, {
					sendButton = reactModule.createElement(foundationModule.View, {
						tag = {
							["col radius-circle flex-around"] = true,
							["bg-action-emphasis"] = var25,
							["bg-action-standard"] = not var25
						},
						Size = UDim2.new(0, var53 - var37.Padding.Small, 0, var53 - var37.Padding.Small),
						isDisabled = not var25,
						onActivated = var45,
						selection = { Selectable = true, NextSelectionLeft = var28 },
						cursor = {
							radius = UDim.new(0, var53 / 2),
							offset = var37.Padding.Small / 2
						},
						ref = var29
					}, {
						sendButtonIcon = reactModule.createElement(foundationModule.Icon, {
							style = var37.Color.ActionEmphasis.Foreground,
							size = foundationModule.Enums.IconSize.Small,
							name = builderIconsModule.Icon.ArrowLargeUp
						})
					})
				})
			})
		})
	})
end)