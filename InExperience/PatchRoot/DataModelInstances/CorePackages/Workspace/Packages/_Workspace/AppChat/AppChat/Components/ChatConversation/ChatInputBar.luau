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
local fFlagAppChatConsoleFocusFixesModule = require(appChat.Flags.FFlagAppChatConsoleFocusFixes)
local useChatWideModeFocusModule = require(appChat.Contexts.ChatWideModeFocus.useChatWideModeFocus)
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

local function heightOfNLines(p1, p2, p3, p4)
	-- upvalues: text (ref)
	return text.GetTextHeight(string.rep("A\n", p1 - 1), p2, p3, p4)
end

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), userInputService (ref), useChatPagePaddingModule (ref), fFlagAppChatConsoleFocusFixesModule (ref), useChatWideModeFocusModule (ref), foundationModule (ref), useStyle (ref), heightOfNLines (ref), useKeystrokeCollectionModule (ref), isMessageValidModule (ref), text (ref), sendButtonClickActionResultModule (ref), isKeyCodePressedModule (ref), useInputConnectionsModule (ref), fFlagAppChatReplyComposeBarContainerModule (ref), useIsSpatial (ref), fFlagAppChatGamepadSendButtonNavModule (ref), chatInputBoxDisabledModule (ref), callbackInputBox (ref), builderIconsModule (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2, var3 = reactModule.useState(0)
	local var4, var5 = reactModule.useState(0)
	local var6, var7 = reactModule.useState(false)
	local var8 = if var1.inputBoxRef then var1.inputBoxRef else reactModule.useRef(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useRef(nil)
	
	if var1.inputBarRef then
		var9 = var1.inputBarRef
	end
	local var11 = reactModule.useRef(Enum.KeyCode.None)
	local bubble = reactFocusNavigationModule.useEventHandler(focusNavigationEventNameEnum.NavigateBack, function(p2)
		-- upvalues: var11 (ref)
		if p2.eventData and var11.current == p2.eventData.KeyCode then
			p2:cancel()
			var11.current = Enum.KeyCode.None
		end
	end, "Bubble", var9)
	local var12 = reactModule.useRef(var1.initialInputText or "")
	local var13 = reactModule.useRef(false)
	local var14 = reactModule.useRef(var1.textChangedFallback or not userInputService.KeyboardEnabled)
	local var15, var16 = reactModule.useBinding(var12.current ~= "")
	useChatPagePaddingModule()
	local var17 = if fFlagAppChatConsoleFocusFixesModule then useChatWideModeFocusModule() else nil
	local var18 = foundationModule.Hooks.useTokens()
	local var19 = useStyle()
	local font = var19.Font.Body.Font
	local var20 = var19.Font.BaseSize * var19.Font.Body.RelativeSize
	local var21 = reactModule.useMemo(function()
		-- upvalues: heightOfNLines (copy), font (ref), var20 (ref), var2 (ref)
		return heightOfNLines(4, font, var20, var2)
	end, { font, var20, var2 })
	local var22 = reactModule.useMemo(function()
		-- upvalues: heightOfNLines (copy), font (ref), var20 (ref)
		return heightOfNLines(1, font, var20)
	end, { font, var20 })
	local var23 = useKeystrokeCollectionModule({
		eventLoggingFunc = var1.eventLoggingFunc,
		maxKeystrokeDataLength = var1.maxKeystrokeDataLength
	})
	local var24 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), isMessageValidModule (copy), var1 (ref)
		return var12.current and isMessageValidModule(var12.current, var1.maxCharacterLength)
	end, { var1.maxCharacterLength })
	local var25 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var26 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var8 (write), text (copy), sendButtonClickActionResultModule (copy), var24 (ref), isMessageValidModule (copy), var1 (ref), var25 (ref), var10 (ref), var9 (write), var16 (ref), var23 (ref)
		local var27
		local var28 = text.Trim(if var8.current then var8.current.Text or "" else var12.current)
		local _ = sendButtonClickActionResultModule.None
		
		if var24() and isMessageValidModule(var28, var1.maxCharacterLength) then
			if var8.current then
				var8.current.Text = ""
			end
			if var25 and var25.focusedGuiObject:getValue() == var10.current then
				var25:focusGuiObject(var9.current, false)
			end
			var12.current = ""
			var16(false)
			
			if var28 == "/shrug" then
				var1.onSendChat("\194\175\\_(\227\131\132)_/\194\175")
			else
				var1.onSendChat(var28)
			end
			var27 = sendButtonClickActionResultModule.WillSend
			local listRef = var1.messageListRef and (var1.messageListRef.current and var1.messageListRef.current._listRef)
			
			if listRef then
				listRef:scrollToOffset({ offset = 0 })
			end
		else
			var27 = if not var24() then sendButtonClickActionResultModule.ButtonInactive else sendButtonClickActionResultModule.MessageInvalid
		end
		var1.onSendBtnClicked(var27)
		var23.sendKeystrokeEventOnSend()
	end, {
		var24,
		var1.onSendChat,
		var1.onSendBtnClicked,
		var23.sendKeystrokeEventOnSend,
		var25
	})
	local var27 = useInputConnectionsModule({
		userInputService = var1.userInputService,
		onInputBegan = reactModule.useCallback(function(p2, _)
			-- upvalues: var23 (ref), var14 (ref), isKeyCodePressedModule (copy), var1 (ref), var26 (ref)
			if var23 and not var14.current and p2.UserInputType == Enum.UserInputType.Keyboard then
				var23.recordKeystroke(true, p2.KeyCode)
			end
			if isKeyCodePressedModule({ p2 }, Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter) and not isKeyCodePressedModule(var1.userInputService:GetKeysPressed(), Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift) then
				var26()
			end
		end, {
			var1.userInputService,
			var23.recordKeystroke,
			var23.sendKeystrokeEventOnSend,
			var26
		}),
		onInputEnded = reactModule.useCallback(function(p2, _)
			-- upvalues: var23 (ref), var14 (ref)
			if var23 and not var14.current and p2.UserInputType == Enum.UserInputType.Keyboard then
				var23.recordKeystroke(false, p2.KeyCode)
			end
		end, { var23.recordKeystroke }),
		onFocusLost = var1.onFocusLost
	})
	local var28 = reactModule.useCallback(function(p2, p3)
		-- upvalues: text (copy), font (ref), var20 (ref), var21 (ref), fFlagAppChatReplyComposeBarContainerModule (copy), var18 (ref), var1 (ref)
		local var29 = var20 + math.min(text.GetTextHeight(p2, font, var20, p3), var21) + (if fFlagAppChatReplyComposeBarContainerModule then 0 else var18.Padding.Medium * 2)
		
		if var1.onHeightChanged then
			var1.onHeightChanged(var29)
		end
		return var29
	end, {
		var18,
		var21,
		var1.onHeightChanged,
		font,
		var20
	})
	local var29 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref), var12 (ref), var16 (ref), var7 (ref), var24 (ref), var23 (ref), var14 (ref), var28 (ref), var2 (ref), var5 (ref), var1 (ref)
		if not var13.current then return end
		var12.current = p2
		var16(p2 ~= "")
		var7(var24())
		
		if var23 and var14.current then
			var23.recordTextChange(p2)
		end
		var5(var28(p2, var2))
		
		if var1.onTextChanged then
			var1.onTextChanged(p2)
		end
	end, {
		var23.recordTextChange,
		var28,
		var1.onTextChanged,
		var2
	})
	local var30 = reactModule.useCallback(function(p2)
		-- upvalues: var28 (ref), var12 (ref), var3 (ref), var5 (ref)
		local var31 = var28(var12.current, p2.AbsoluteSize.X)
		var3(p2.AbsoluteSize.X)
		var5(var31)
	end, { var28 })
	local var31 = reactModule.useCallback(function()
		-- upvalues: var8 (write)
		if var8.current then
			var8.current:CaptureFocus()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), var1 (ref)
		var13.current = true
		
		return function()
			-- upvalues: var13 (copy), var1 (copy)
			var13.current = false
			
			if var1.onHeightChanged then
				var1.onHeightChanged(0)
			end
		end
	end, { var1.onHeightChanged })
	reactModule.useEffect(function()
		-- upvalues: var8 (write), var11 (ref)
		local focusLostConnection = nil
		
		if var8 and var8.current then
			var8.current.Selectable = false
			focusLostConnection = var8.current.FocusLost:Connect(function(_, p2)
				-- upvalues: var11 (copy)
				var11.current = if p2 then p2.KeyCode else Enum.KeyCode.None
			end)
		end
		return function()
			-- upvalues: focusLostConnection (write)
			if focusLostConnection then
				focusLostConnection:Disconnect()
			end
		end
	end, {})
	local moreMenuEnabled = var1.moreMenuEnabled
	local var32 = useIsSpatial()
	local var33 = if var4 ~= 0 then var28(var12.current, var2) else var4
	local var34 = var20 + var22
	local isDisabled = var1.isDisabled
	
	return reactModule.createElement(foundationModule.View, {
		tag = {
			["padding-y-medium"] = not fFlagAppChatReplyComposeBarContainerModule,
			["padding-x-xlarge"] = not moreMenuEnabled,
			fill = moreMenuEnabled
		},
		Size = UDim2.new(if moreMenuEnabled then 0 else 1, 0, 0, var33),
		LayoutOrder = var1.LayoutOrder,
		onAbsolutePositionChanged = var1.onPositionChanged
	}, {
		inputBar = reactModule.createElement(foundationModule.View, {
			LayoutOrder = 1,
			tag = {
				["row size-full"] = true,
				["stroke-emphasis stroke-thick"] = not isDisabled,
				["stroke-alert"] = isDisabled
			},
			onActivated = var31,
			ref = bubble,
			cornerRadius = UDim.new(0, var34 / 2),
			selection = {
				Selectable = true,
				NextSelectionRight = if fFlagAppChatGamepadSendButtonNavModule then var10 else nil,
				NextSelectionLeft = if fFlagAppChatConsoleFocusFixesModule and var17 then var17.conversationListRef else nil
			},
			cursor = { offset = 0, radius = UDim.new(0, var34 / 2) }
		}, {
			inputBoxWrapper = reactModule.createElement(foundationModule.View, {
				tag = "size-0-full fill padding-left-large",
				LayoutOrder = 1,
				padding = {
					top = UDim.new(0, var20 / 2),
					bottom = UDim.new(0, var20 / 2)
				}
			}, {
				inputBox = if isDisabled then reactModule.createElement(chatInputBoxDisabledModule, {
					bodyText = var1.inputBarDisabledText,
					font = font,
					contentSize = var20,
					endTimestamp = var1.disabledEndTimestampDisplay,
					onActivated = var1.onDisabledInputBarActivated
				}) else reactModule.createElement(callbackInputBox, {
					initialInputText = var1.initialInputText,
					inputTextFont = font,
					inputTextColor3 = var19.Theme.TextEmphasis.Color,
					inputTextSize = var20,
					inputTextXAlignment = Enum.TextXAlignment.Left,
					inputTextYAlignment = Enum.TextYAlignment.Center,
					placeholderText = var1.placeholderText,
					placeholderTextColor3 = var19.Theme.TextMuted.Color,
					placeholderTextTransparency = var19.Theme.TextMuted.Transparency,
					clipsDescendants = false,
					multiLine = not var32,
					manualFocusRelease = true,
					textWrapped = true,
					focusChangedCallback = var27.focusChanged,
					clearButtonDisabled = true,
					clearButtonSize = 0,
					textChangedCallback = var29,
					[reactModule.Change.AbsoluteSize] = var30,
					inputBoxRef = var8,
					returnPressedFromOnScreenKeyboardCallback = if var32 then var26 else nil
				})
			}),
			sendButtonColumn = reactModule.createElement(foundationModule.View, {
				tag = "col size-0-full auto-x align-y-bottom",
				LayoutOrder = 2,
				Visible = var15
			}, {
				sendButtonWrapper = reactModule.createElement(foundationModule.View, {
					tag = "col flex-around padding-small",
					Size = UDim2.new(0, var34, 0, var34)
				}, {
					sendButton = reactModule.createElement(foundationModule.View, {
						tag = {
							["col radius-circle flex-around"] = true,
							["bg-action-emphasis"] = var6,
							["bg-action-standard"] = not var6
						},
						Size = UDim2.new(0, var34 - var18.Padding.Small, 0, var34 - var18.Padding.Small),
						isDisabled = not var6,
						onActivated = var26,
						selection = { Selectable = true, NextSelectionLeft = var9 },
						cursor = {
							radius = UDim.new(0, var34 / 2),
							offset = var18.Padding.Small / 2
						},
						ref = var10
					}, {
						sendButtonIcon = reactModule.createElement(foundationModule.Icon, {
							style = var18.Color.ActionEmphasis.Foreground,
							size = foundationModule.Enums.IconSize.Small,
							name = builderIconsModule.Icon.ArrowLargeUp
						})
					})
				})
			})
		})
	})
end)