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

local function heightOfNLines(p1, p2, p3, p4)
	-- upvalues: text (ref)
	return text.GetTextHeight(string.rep("A\n", p1 - 1), p2, p3, p4)
end

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), userInputService (ref), useChatPagePaddingModule (ref), foundationModule (ref), useStyle (ref), heightOfNLines (ref), useKeystrokeCollectionModule (ref), isMessageValidModule (ref), text (ref), sendButtonClickActionResultModule (ref), isKeyCodePressedModule (ref), useInputConnectionsModule (ref), fFlagAppChatReplyComposeBarContainerModule (ref), useIsSpatial (ref), fFlagAppChatGamepadSendButtonNavModule (ref), chatInputBoxDisabledModule (ref), callbackInputBox (ref), builderIconsModule (ref)
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
	local var17 = foundationModule.Hooks.useTokens()
	local var18 = useStyle()
	local font = var18.Font.Body.Font
	local var19 = var18.Font.BaseSize * var18.Font.Body.RelativeSize
	local var20 = reactModule.useMemo(function()
		-- upvalues: heightOfNLines (copy), font (ref), var19 (ref), var2 (ref)
		return heightOfNLines(4, font, var19, var2)
	end, { font, var19, var2 })
	local var21 = reactModule.useMemo(function()
		-- upvalues: heightOfNLines (copy), font (ref), var19 (ref)
		return heightOfNLines(1, font, var19)
	end, { font, var19 })
	local var22 = useKeystrokeCollectionModule({
		eventLoggingFunc = var1.eventLoggingFunc,
		maxKeystrokeDataLength = var1.maxKeystrokeDataLength
	})
	local var23 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), isMessageValidModule (copy), var1 (ref)
		return var12.current and isMessageValidModule(var12.current, var1.maxCharacterLength)
	end, { var1.maxCharacterLength })
	local var24 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var25 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var8 (write), text (copy), sendButtonClickActionResultModule (copy), var23 (ref), isMessageValidModule (copy), var1 (ref), var24 (ref), var10 (ref), var9 (write), var16 (ref), var22 (ref)
		local var26
		local var27 = text.Trim(if var8.current then var8.current.Text or "" else var12.current)
		local _ = sendButtonClickActionResultModule.None
		
		if var23() and isMessageValidModule(var27, var1.maxCharacterLength) then
			if var8.current then
				var8.current.Text = ""
			end
			if var24 and var24.focusedGuiObject:getValue() == var10.current then
				var24:focusGuiObject(var9.current, false)
			end
			var12.current = ""
			var16(false)
			
			if var27 == "/shrug" then
				var1.onSendChat("\194\175\\_(\227\131\132)_/\194\175")
			else
				var1.onSendChat(var27)
			end
			var26 = sendButtonClickActionResultModule.WillSend
			local listRef = var1.messageListRef and (var1.messageListRef.current and var1.messageListRef.current._listRef)
			
			if listRef then
				listRef:scrollToOffset({ offset = 0 })
			end
		else
			var26 = if not var23() then sendButtonClickActionResultModule.ButtonInactive else sendButtonClickActionResultModule.MessageInvalid
		end
		var1.onSendBtnClicked(var26)
		var22.sendKeystrokeEventOnSend()
	end, {
		var23,
		var1.onSendChat,
		var1.onSendBtnClicked,
		var22.sendKeystrokeEventOnSend,
		var24
	})
	local var26 = useInputConnectionsModule({
		userInputService = var1.userInputService,
		onInputBegan = reactModule.useCallback(function(p2, _)
			-- upvalues: var22 (ref), var14 (ref), isKeyCodePressedModule (copy), var1 (ref), var25 (ref)
			if var22 and not var14.current and p2.UserInputType == Enum.UserInputType.Keyboard then
				var22.recordKeystroke(true, p2.KeyCode)
			end
			if isKeyCodePressedModule({ p2 }, Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter) and not isKeyCodePressedModule(var1.userInputService:GetKeysPressed(), Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift) then
				var25()
			end
		end, {
			var1.userInputService,
			var22.recordKeystroke,
			var22.sendKeystrokeEventOnSend,
			var25
		}),
		onInputEnded = reactModule.useCallback(function(p2, _)
			-- upvalues: var22 (ref), var14 (ref)
			if var22 and not var14.current and p2.UserInputType == Enum.UserInputType.Keyboard then
				var22.recordKeystroke(false, p2.KeyCode)
			end
		end, { var22.recordKeystroke }),
		onFocusLost = var1.onFocusLost
	})
	local var27 = reactModule.useCallback(function(p2, p3)
		-- upvalues: text (copy), font (ref), var19 (ref), var20 (ref), fFlagAppChatReplyComposeBarContainerModule (copy), var17 (ref), var1 (ref)
		local var28 = var19 + math.min(text.GetTextHeight(p2, font, var19, p3), var20) + (if fFlagAppChatReplyComposeBarContainerModule then 0 else var17.Padding.Medium * 2)
		
		if var1.onHeightChanged then
			var1.onHeightChanged(var28)
		end
		return var28
	end, {
		var17,
		var20,
		var1.onHeightChanged,
		font,
		var19
	})
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref), var12 (ref), var16 (ref), var7 (ref), var23 (ref), var22 (ref), var14 (ref), var27 (ref), var2 (ref), var5 (ref), var1 (ref)
		if not var13.current then return end
		var12.current = p2
		var16(p2 ~= "")
		var7(var23())
		
		if var22 and var14.current then
			var22.recordTextChange(p2)
		end
		var5(var27(p2, var2))
		
		if var1.onTextChanged then
			var1.onTextChanged(p2)
		end
	end, {
		var22.recordTextChange,
		var27,
		var1.onTextChanged,
		var2
	})
	local var29 = reactModule.useCallback(function(p2)
		-- upvalues: var27 (ref), var12 (ref), var3 (ref), var5 (ref)
		local var30 = var27(var12.current, p2.AbsoluteSize.X)
		var3(p2.AbsoluteSize.X)
		var5(var30)
	end, { var27 })
	local var30 = reactModule.useCallback(function()
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
	local var31 = useIsSpatial()
	local var32 = if var4 ~= 0 then var27(var12.current, var2) else var4
	local var33 = var19 + var21
	local isDisabled = var1.isDisabled
	
	return reactModule.createElement(foundationModule.View, {
		tag = {
			["padding-y-medium"] = not fFlagAppChatReplyComposeBarContainerModule,
			["padding-x-xlarge"] = not moreMenuEnabled,
			fill = moreMenuEnabled
		},
		Size = UDim2.new(if moreMenuEnabled then 0 else 1, 0, 0, var32),
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
			onActivated = var30,
			ref = bubble,
			cornerRadius = UDim.new(0, var33 / 2),
			selection = {
				Selectable = true,
				NextSelectionRight = if fFlagAppChatGamepadSendButtonNavModule then var10 else nil
			},
			cursor = { offset = 0, radius = UDim.new(0, var33 / 2) }
		}, {
			inputBoxWrapper = reactModule.createElement(foundationModule.View, {
				tag = "size-0-full fill padding-left-large",
				LayoutOrder = 1,
				padding = {
					top = UDim.new(0, var19 / 2),
					bottom = UDim.new(0, var19 / 2)
				}
			}, {
				inputBox = if isDisabled then reactModule.createElement(chatInputBoxDisabledModule, {
					bodyText = var1.inputBarDisabledText,
					font = font,
					contentSize = var19,
					endTimestamp = var1.disabledEndTimestampDisplay,
					onActivated = var1.onDisabledInputBarActivated
				}) else reactModule.createElement(callbackInputBox, {
					initialInputText = var1.initialInputText,
					inputTextFont = font,
					inputTextColor3 = var18.Theme.TextEmphasis.Color,
					inputTextSize = var19,
					inputTextXAlignment = Enum.TextXAlignment.Left,
					inputTextYAlignment = Enum.TextYAlignment.Center,
					placeholderText = var1.placeholderText,
					placeholderTextColor3 = var18.Theme.TextMuted.Color,
					placeholderTextTransparency = var18.Theme.TextMuted.Transparency,
					clipsDescendants = false,
					multiLine = not var31,
					manualFocusRelease = true,
					textWrapped = true,
					focusChangedCallback = var26.focusChanged,
					clearButtonDisabled = true,
					clearButtonSize = 0,
					textChangedCallback = var28,
					[reactModule.Change.AbsoluteSize] = var29,
					inputBoxRef = var8,
					returnPressedFromOnScreenKeyboardCallback = if var31 then var25 else nil
				})
			}),
			sendButtonColumn = reactModule.createElement(foundationModule.View, {
				tag = "col size-0-full auto-x align-y-bottom",
				LayoutOrder = 2,
				Visible = var15
			}, {
				sendButtonWrapper = reactModule.createElement(foundationModule.View, {
					tag = "col flex-around padding-small",
					Size = UDim2.new(0, var33, 0, var33)
				}, {
					sendButton = reactModule.createElement(foundationModule.View, {
						tag = {
							["col radius-circle flex-around"] = true,
							["bg-action-emphasis"] = var6,
							["bg-action-standard"] = not var6
						},
						Size = UDim2.new(0, var33 - var17.Padding.Small, 0, var33 - var17.Padding.Small),
						isDisabled = not var6,
						onActivated = var25,
						selection = { Selectable = true, NextSelectionLeft = var9 },
						cursor = {
							radius = UDim.new(0, var33 / 2),
							offset = var17.Padding.Small / 2
						},
						ref = var10
					}, {
						sendButtonIcon = reactModule.createElement(foundationModule.Icon, {
							style = var17.Color.ActionEmphasis.Foreground,
							size = foundationModule.Enums.IconSize.Small,
							name = builderIconsModule.Icon.ArrowLargeUp
						})
					})
				})
			})
		})
	})
end)