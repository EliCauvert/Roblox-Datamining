local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local userInputService = game:GetService("UserInputService")
local socialLibrariesModule = require(appChat.SocialLibraries)
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local foundationFontFaceMigration = foundationModule.Utility.Flags.FoundationFontFaceMigration
local getTextSize = require(parent.Style).GetTextSize
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
	-- upvalues: foundationFontFaceMigration (ref), getTextSize (ref), text (ref)
	return if foundationFontFaceMigration then getTextSize(string.rep("A\n", p1 - 1), p3, p2, Vector2.new(p4 or 10000, 10000)).Y else text.GetTextHeight(string.rep("A\n", p1 - 1), p2, p3, p4)
end

return reactModule.memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), reactModule (ref), reactFocusNavigationModule (ref), focusNavigationEventNameEnum (ref), userInputService (ref), useChatPagePaddingModule (ref), fFlagAppChatConsoleFocusFixesModule (ref), useChatWideModeFocusModule (ref), foundationModule (ref), useStyle (ref), foundationFontFaceMigration (ref), heightOfNLines (ref), useKeystrokeCollectionModule (ref), isMessageValidModule (ref), text (ref), sendButtonClickActionResultModule (ref), isKeyCodePressedModule (ref), useInputConnectionsModule (ref), getTextSize (ref), useIsSpatial (ref), fFlagAppChatGamepadSendButtonNavModule (ref), chatInputBoxDisabledModule (ref), callbackInputBox (ref), builderIconsModule (ref)
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
	local var20 = if foundationFontFaceMigration then var18.Typography.BodyLarge.Font else var19.Font.Body.Font
	local var21 = var19.Font.BaseSize * var19.Font.Body.RelativeSize
	local var22 = reactModule.useMemo(function()
		-- upvalues: heightOfNLines (copy), var20 (ref), var21 (ref), var2 (ref)
		return heightOfNLines(4, var20, var21, var2)
	end, { var20, var21, var2 })
	local var23 = reactModule.useMemo(function()
		-- upvalues: heightOfNLines (copy), var20 (ref), var21 (ref)
		return heightOfNLines(1, var20, var21)
	end, { var20, var21 })
	local var24 = useKeystrokeCollectionModule({
		eventLoggingFunc = var1.eventLoggingFunc,
		maxKeystrokeDataLength = var1.maxKeystrokeDataLength
	})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), isMessageValidModule (copy), var1 (ref)
		return var12.current and isMessageValidModule(var12.current, var1.maxCharacterLength)
	end, { var1.maxCharacterLength })
	local var26 = reactModule.useContext(reactFocusNavigationModule.FocusNavigationContext)
	local var27 = reactModule.useCallback(function()
		-- upvalues: var12 (ref), var8 (write), text (copy), sendButtonClickActionResultModule (copy), var25 (ref), isMessageValidModule (copy), var1 (ref), var26 (ref), var10 (ref), var9 (write), var16 (ref), var24 (ref)
		local var28
		local var29 = text.Trim(if var8.current then var8.current.Text or "" else var12.current)
		local _ = sendButtonClickActionResultModule.None
		
		if var25() and isMessageValidModule(var29, var1.maxCharacterLength) then
			if var8.current then
				var8.current.Text = ""
			end
			if var26 and var26.focusedGuiObject:getValue() == var10.current then
				var26:focusGuiObject(var9.current, false)
			end
			var12.current = ""
			var16(false)
			
			if var29 == "/shrug" then
				var1.onSendChat("\194\175\\_(\227\131\132)_/\194\175")
			else
				var1.onSendChat(var29)
			end
			var28 = sendButtonClickActionResultModule.WillSend
			local listRef = var1.messageListRef and (var1.messageListRef.current and var1.messageListRef.current._listRef)
			
			if listRef then
				listRef:scrollToOffset({ offset = 0 })
			end
		else
			var28 = if not var25() then sendButtonClickActionResultModule.ButtonInactive else sendButtonClickActionResultModule.MessageInvalid
		end
		var1.onSendBtnClicked(var28)
		var24.sendKeystrokeEventOnSend()
	end, {
		var25,
		var1.onSendChat,
		var1.onSendBtnClicked,
		var24.sendKeystrokeEventOnSend,
		var26
	})
	local var28 = useInputConnectionsModule({
		userInputService = var1.userInputService,
		onInputBegan = reactModule.useCallback(function(p2, _)
			-- upvalues: var24 (ref), var14 (ref), isKeyCodePressedModule (copy), var1 (ref), var27 (ref)
			if var24 and not var14.current and p2.UserInputType == Enum.UserInputType.Keyboard then
				var24.recordKeystroke(true, p2.KeyCode)
			end
			if isKeyCodePressedModule({ p2 }, Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter) and not isKeyCodePressedModule(var1.userInputService:GetKeysPressed(), Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift) then
				var27()
			end
		end, {
			var1.userInputService,
			var24.recordKeystroke,
			var24.sendKeystrokeEventOnSend,
			var27
		}),
		onInputEnded = reactModule.useCallback(function(p2, _)
			-- upvalues: var24 (ref), var14 (ref)
			if var24 and not var14.current and p2.UserInputType == Enum.UserInputType.Keyboard then
				var24.recordKeystroke(false, p2.KeyCode)
			end
		end, { var24.recordKeystroke }),
		onFocusLost = var1.onFocusLost
	})
	local var29 = reactModule.useCallback(function(p2, p3)
		-- upvalues: foundationFontFaceMigration (copy), getTextSize (copy), var21 (ref), var18 (ref), text (copy), var20 (ref), var22 (ref), var1 (ref)
		local var30 = var21 + math.min(if foundationFontFaceMigration then getTextSize(p2, var21, var18.Typography.BodyLarge.Font, Vector2.new(p3, 10000)).Y else text.GetTextHeight(p2, var20, var21, p3), var22)
		
		if var1.onHeightChanged then
			var1.onHeightChanged(var30)
		end
		return var30
	end, {
		var18,
		var22,
		var1.onHeightChanged,
		var20,
		var21
	})
	local var30 = reactModule.useCallback(function(p2)
		-- upvalues: var13 (ref), var12 (ref), var16 (ref), var7 (ref), var25 (ref), var24 (ref), var14 (ref), var29 (ref), var2 (ref), var5 (ref), var1 (ref)
		if not var13.current then return end
		var12.current = p2
		var16(p2 ~= "")
		var7(var25())
		
		if var24 and var14.current then
			var24.recordTextChange(p2)
		end
		var5(var29(p2, var2))
		
		if var1.onTextChanged then
			var1.onTextChanged(p2)
		end
	end, {
		var24.recordTextChange,
		var29,
		var1.onTextChanged,
		var2
	})
	local var31 = reactModule.useCallback(function(p2)
		-- upvalues: var29 (ref), var12 (ref), var3 (ref), var5 (ref)
		local var32 = var29(var12.current, p2.AbsoluteSize.X)
		var3(p2.AbsoluteSize.X)
		var5(var32)
	end, { var29 })
	local var32 = reactModule.useCallback(function()
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
	local var33 = useIsSpatial()
	local var34 = if var4 ~= 0 then var29(var12.current, var2) else var4
	local var35 = var21 + var23
	local isDisabled = var1.isDisabled
	
	return reactModule.createElement(foundationModule.View, {
		tag = {
			["padding-x-xlarge"] = not moreMenuEnabled,
			fill = moreMenuEnabled
		},
		Size = UDim2.new(if moreMenuEnabled then 0 else 1, 0, 0, var34),
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
			onActivated = var32,
			ref = bubble,
			cornerRadius = UDim.new(0, var35 / 2),
			selection = {
				Selectable = true,
				NextSelectionRight = if fFlagAppChatGamepadSendButtonNavModule then var10 else nil,
				NextSelectionLeft = if fFlagAppChatConsoleFocusFixesModule and var17 then var17.conversationListRef else nil
			},
			cursor = { offset = 0, radius = UDim.new(0, var35 / 2) }
		}, {
			inputBoxWrapper = reactModule.createElement(foundationModule.View, {
				tag = "size-0-full fill padding-left-large",
				LayoutOrder = 1,
				padding = {
					top = UDim.new(0, var21 / 2),
					bottom = UDim.new(0, var21 / 2)
				}
			}, {
				inputBox = if isDisabled then reactModule.createElement(chatInputBoxDisabledModule, {
					bodyText = var1.inputBarDisabledText,
					font = var20,
					contentSize = var21,
					endTimestamp = var1.disabledEndTimestampDisplay,
					onActivated = var1.onDisabledInputBarActivated
				}) else reactModule.createElement(callbackInputBox, {
					initialInputText = var1.initialInputText,
					inputTextFont = var20,
					inputTextColor3 = var19.Theme.TextEmphasis.Color,
					inputTextSize = var21,
					inputTextXAlignment = Enum.TextXAlignment.Left,
					inputTextYAlignment = Enum.TextYAlignment.Center,
					placeholderText = var1.placeholderText,
					placeholderTextColor3 = var19.Theme.TextMuted.Color,
					placeholderTextTransparency = var19.Theme.TextMuted.Transparency,
					clipsDescendants = false,
					multiLine = not var33,
					manualFocusRelease = true,
					textWrapped = true,
					focusChangedCallback = var28.focusChanged,
					clearButtonDisabled = true,
					clearButtonSize = 0,
					textChangedCallback = var30,
					[reactModule.Change.AbsoluteSize] = var31,
					inputBoxRef = var8,
					returnPressedFromOnScreenKeyboardCallback = if var33 then var27 else nil
				})
			}),
			sendButtonColumn = reactModule.createElement(foundationModule.View, {
				tag = "col size-0-full auto-x align-y-bottom",
				LayoutOrder = 2,
				Visible = var15
			}, {
				sendButtonWrapper = reactModule.createElement(foundationModule.View, {
					tag = "col flex-around padding-small",
					Size = UDim2.new(0, var35, 0, var35)
				}, {
					sendButton = reactModule.createElement(foundationModule.View, {
						tag = {
							["col radius-circle flex-around"] = true,
							["bg-action-emphasis"] = var6,
							["bg-action-standard"] = not var6
						},
						Size = UDim2.new(0, var35 - var18.Padding.Small, 0, var35 - var18.Padding.Small),
						isDisabled = not var6,
						onActivated = var27,
						selection = { Selectable = true, NextSelectionLeft = var9 },
						cursor = {
							radius = UDim.new(0, var35 / 2),
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