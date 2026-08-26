local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local guiService = game:GetService("GuiService")
local socialLibrariesModule = require(appChat.SocialLibraries)
local roactModule = require(parent.Roact)
local text = require(parent.AppCommonLib).Text
local UIBloxModule = require(parent.UIBlox)
local images = UIBloxModule.App.ImageSet.Images
local iconSize = UIBloxModule.App.Constant.IconSize
local interactable = UIBloxModule.Core.Control.Interactable
local withStyle = UIBloxModule.Style.withStyle
local isMessageValidModule = require(script.Parent.isMessageValid)
local messageCharacterLimitModule = require(script.Parent.MessageCharacterLimit)
local isKeyCodePressedModule = require(appChat.Components.ChatConversation.Utils.isKeyCodePressed)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local default = require(parent.LoggingProtocol).default
local userInputService = game:GetService("UserInputService")
local playersService = game:GetService("Players")
local withChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.withChatPagePadding)
local withSelectionCursorProvider = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBloxModule.App.SelectionImage.CursorKind
local reactFocusNavigationModule = require(parent.ReactFocusNavigation)
local focusNavigationEventNameEnum = require(parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local callbackInputBox = socialLibrariesModule.Components.CallbackInputBox
local chatInputBoxDisabledModule = require(appChat.Components.ChatConversation.ChatInputBoxDisabled)
local sendButtonClickActionResultModule = require(appChat.Analytics.Enums.SendButtonClickActionResult)
local getAppFeaturePolicies = require(parent.UniversalAppPolicy).getAppFeaturePolicies
local isVRAppBuild = require(parent.AppCommonLib).IsVRAppBuild
local getFIntAppChatBehaviorCollectionEnabledPercentageModule = require(appChat.Flags.getFIntAppChatBehaviorCollectionEnabledPercentage)
local fFlagAppChatGamepadSendButtonNavModule = require(appChat.Flags.FFlagAppChatGamepadSendButtonNav)
local fFlagAppChatOnConsoles = require(parent.SharedFlags).FFlagAppChatOnConsoles
local appChatUseTextBoxTextOnSend = game:DefineFastFlag("AppChatUseTextBoxTextOnSend", false)
local chatInputBarDeprecated = roactModule.PureComponent:extend("ChatInputBarDeprecated")
local keystrokeEventModule = require(appChat.Analytics.KeystrokeEvent)
chatInputBarDeprecated.defaultProps = {
	initialInputText = "",
	placeholderText = "Say something",
	inputBarDisabledText = "Chat Disabled",
	sendButtonContainerSize = 45,
	LayoutOrder = 0,
	maxKeystrokeDataLength = 200,
	messageListRef = nil,
	isDisabled = false,
	disabledEndTimestampDisplay = nil,
	moreMenuEnabled = false,
	onSendBtnClicked = nil,
	onSendChat = nil,
	inputBoxRef = nil,
	inputBarRef = nil,
	textChangedFallback = false,
	userInputService = userInputService,
	onDisabledInputBarActivated = function() end,
	maxCharacterLength = messageCharacterLimitModule,
	onHeightChanged = function() end,
	onPositionChanged = function() end,
	onFocusLost = function() end,
	onTextChanged = function() end,
	eventLoggingFunc = default.logRobloxTelemetryEvent
}

function chatInputBarDeprecated.init(p1)
	-- upvalues: roactModule (ref), userInputService (ref), text (ref), getAppFeaturePolicies (ref), getFIntAppChatBehaviorCollectionEnabledPercentageModule (ref), playersService (ref), isMessageValidModule (ref), isKeyCodePressedModule (ref), appChatUseTextBoxTextOnSend (ref), sendButtonClickActionResultModule (ref), fFlagAppChatOnConsoles (ref), guiService (ref)
	p1.isMounted = false
	p1.state = {
		showSendChat = false,
		chatBarWidth = 0,
		frameHeight = 0,
		inputText = p1.props.initialInputText
	}
	p1.inputBoxRef = p1.props.inputBoxRef or roactModule.createRef()
	p1.messageListRef = p1.props.messageListRef
	p1.inputBoxFocusLossKeyCodeRef = roactModule.createRef()
	p1.inputBoxFocusLossKeyCodeRef.current = Enum.KeyCode.None
	p1.inputBarRef = p1.props.inputBarRef or roactModule.createRef()
	p1.sendButtonRef = roactModule.createRef()
	p1.eventHandlerRegistration = nil
	p1.textChangedFallback = p1.props.textChangedFallback or not userInputService.KeyboardEnabled
	
	function p0.heightOfFourLines(p2, p3, p4)
		-- upvalues: text (copy)
		return text.GetTextHeight("A\nB\nC\nD", p2, p3, p4)
	end
	
	function p0.isMoreMenuEnabled()
		-- upvalues: p1 (ref)
		return p1.props.moreMenuEnabled
	end
	
	function p0.calculateInputBoxHeight(p2, p3, p4, p5)
		-- upvalues: text (copy), p1 (ref)
		local textHeight = text.GetTextHeight(p2, p3, p4, p5)
		local var1 = p1.heightOfFourLines(p3, p4, p5)
		local var2 = if p1.isMoreMenuEnabled() then p4 + math.min(textHeight, var1) else p4 + math.min(textHeight, var1) + 16
		
		if p1.props.onHeightChanged then
			p1.props.onHeightChanged(var2)
		end
		return var2
	end
	
	p1.inputConnectionActive = false
	p1.inputBeganConnection = nil
	p1.inputEndedConnection = nil
	p1.keyPressedData = {}
	p1.eventTypeData = {}
	p1.timestampData = {}
	p1.shouldCollectKeystrokes = false
	local var1 = getFIntAppChatBehaviorCollectionEnabledPercentageModule()
	
	if var1 > 0 and playersService.LocalPlayer and getAppFeaturePolicies().getKeystrokeCollectionEnabled() then
		p1.shouldCollectKeystrokes = playersService.LocalPlayer.UserId % 100 < var1
	end
	function p0.onTextChanged(p2, p3, p4, p5)
		-- upvalues: p1 (ref), isMessageValidModule (copy)
		if not p1.isMounted then return end
		p1:setState({
			inputText = p2,
			showSendChat = if p2 and isMessageValidModule(p2, p1.props.maxCharacterLength) then true else false,
			frameHeight = p1.calculateInputBoxHeight(p2, p3, p4, p5)
		})
		p1.props.onTextChanged(p2)
		
		if p1.shouldCollectKeystrokes and p1.textChangedFallback then
			p1:recordTextChange(p2)
		end
	end
	
	function p0.onInputBeganEvent(p2)
		-- upvalues: p1 (ref), isKeyCodePressedModule (copy)
		if p1.shouldCollectKeystrokes and not p1.textChangedFallback and p2.UserInputType == Enum.UserInputType.Keyboard then
			p1:recordKeystroke(true, p2.KeyCode)
		end
		if isKeyCodePressedModule({ p2 }, Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter) and not isKeyCodePressedModule(p1.props.userInputService:GetKeysPressed(), Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift) then
			p1.onSendActivated()
		end
	end
	
	function p0.onInputEndedEvent(p2)
		-- upvalues: p1 (ref)
		if p1.shouldCollectKeystrokes and not p1.textChangedFallback and p2.UserInputType == Enum.UserInputType.Keyboard then
			p1:recordKeystroke(false, p2.KeyCode)
		end
	end
	
	function p0.focusChanged(p2)
		-- upvalues: p1 (ref)
		if p2 and not p1.inputConnectionActive then
			p1.inputBeganConnection = p1.props.userInputService.InputBegan:Connect(p1.onInputBeganEvent)
			p1.inputEndedConnection = p1.props.userInputService.InputEnded:Connect(p1.onInputEndedEvent)
			p1.inputConnectionActive = true
			
			return
		elseif not p2 and p1.inputConnectionActive then
			p1:disconnectInputConnection()
			p1.props.onFocusLost()
		end
	end
	
	function p0.onSendActivated()
		-- upvalues: appChatUseTextBoxTextOnSend (copy), p1 (ref), isMessageValidModule (copy), text (copy), sendButtonClickActionResultModule (copy), fFlagAppChatOnConsoles (copy), guiService (copy)
		local var2 = if appChatUseTextBoxTextOnSend then if p1.inputBoxRef.current then p1.inputBoxRef.current.Text else "" else p1.state.inputText
		local var3 = if appChatUseTextBoxTextOnSend then var2 and isMessageValidModule(var2, p1.props.maxCharacterLength) else p1.state.showSendChat
		local var4 = text.Trim(var2)
		local none = sendButtonClickActionResultModule.None
		
		if var3 and isMessageValidModule(var4, p1.props.maxCharacterLength) then
			p1.inputBoxRef:getValue().Text = ""
			
			if p1.focusNavigationService and p1.focusNavigationService.focusedGuiObject:getValue() == p1.sendButtonRef:getValue() then
				p1.focusNavigationService:focusGuiObject(p1.inputBarRef:getValue(), false)
			end
			if fFlagAppChatOnConsoles and (if fFlagAppChatOnConsoles then guiService:IsTenFootInterface() else nil) then
				p1.inputBoxRef.current:ReleaseFocus()
			end
			p1:setState({ inputText = "", showSendChat = false })
			
			if p1.props.onSendChat then
				if var4 == "/shrug" then
					p1.props.onSendChat("\194\175\\_(\227\131\132)_/\194\175")
				else
					p1.props.onSendChat(var4)
				end
				none = sendButtonClickActionResultModule.WillSend
			end
			local listRef = p1.messageListRef and (p1.messageListRef.current and p1.messageListRef.current._listRef)
			
			if listRef then
				listRef:scrollToOffset({ offset = 0 })
			end
		else
			none = if not var3 then sendButtonClickActionResultModule.ButtonInactive else sendButtonClickActionResultModule.MessageInvalid
		end
		if p1.props.onSendBtnClicked then
			p1.props.onSendBtnClicked(none)
		end
		if p1.shouldCollectKeystrokes then
			p1:sendKeystrokeEvent("UASendPressed")
		end
	end
	
	function p0.chatBoxSizeChanged(p2, p3, p4, p5)
		-- upvalues: p1 (ref)
		p1:setState({
			chatBarWidth = p2.AbsoluteSize.X,
			frameHeight = p1.calculateInputBoxHeight(p3, p4, p5, p2.AbsoluteSize.X)
		})
	end
	
	function p0.onDisabledInputBarActivated()
		-- upvalues: p1 (ref)
		p1.props.onDisabledInputBarActivated()
	end
	
	function p0.focusChatInputBox()
		-- upvalues: p1 (ref)
		if p1.inputBoxRef and p1.inputBoxRef.current then
			p1.inputBoxRef.current:CaptureFocus()
		end
	end
	
	function p0.focusNavigationEventHandler(p2)
		-- upvalues: p1 (ref)
		if p2.eventData and p1.inputBoxFocusLossKeyCodeRef.current == p2.eventData.KeyCode then
			p2:cancel()
			p1.inputBoxFocusLossKeyCodeRef.current = Enum.KeyCode.None
		end
	end
end

function chatInputBarDeprecated.render(p1)
	-- upvalues: roactModule (ref), reactFocusNavigationModule (ref)
	local isDisabled = p1.props.isDisabled
	
	return roactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Consumer, {
		render = function(p2)
			-- upvalues: p1 (ref), isDisabled (ref)
			p1.focusNavigationService = p2
			
			return p1:renderContent(isDisabled)
		end
	})
end

function chatInputBarDeprecated.renderContent(p1, p2)
	-- upvalues: withStyle (ref), withChatPagePaddingModule (ref), withSelectionCursorProvider (ref), fFlagAppChatOnConsoles (ref), isVRAppBuild (ref), guiService (ref), roactModule (ref), imageSetLabel (ref), images (ref), interactable (ref), cursorKind (ref), fFlagAppChatGamepadSendButtonNavModule (ref), chatInputBoxDisabledModule (ref), callbackInputBox (ref), iconSize (ref)
	return withStyle(function(p3)
		-- upvalues: withChatPagePaddingModule (copy), withSelectionCursorProvider (copy), fFlagAppChatOnConsoles (copy), isVRAppBuild (copy), guiService (copy), p1 (ref), p2 (ref), roactModule (copy), imageSetLabel (copy), images (copy), interactable (copy), cursorKind (copy), fFlagAppChatGamepadSendButtonNavModule (copy), chatInputBoxDisabledModule (copy), callbackInputBox (copy), iconSize (copy)
		return withChatPagePaddingModule(function(p4)
			-- upvalues: withSelectionCursorProvider (copy), p3 (ref), fFlagAppChatOnConsoles (copy), isVRAppBuild (copy), guiService (copy), p1 (copy), p2 (copy), roactModule (copy), imageSetLabel (copy), images (copy), interactable (copy), cursorKind (copy), fFlagAppChatGamepadSendButtonNavModule (copy), chatInputBoxDisabledModule (copy), callbackInputBox (copy), iconSize (copy)
			return withSelectionCursorProvider(function(p5)
				-- upvalues: p3 (copy), fFlagAppChatOnConsoles (copy), isVRAppBuild (copy), guiService (copy), p1 (copy), p4 (ref), p2 (copy), roactModule (copy), imageSetLabel (copy), images (copy), interactable (copy), cursorKind (copy), fFlagAppChatGamepadSendButtonNavModule (copy), chatInputBoxDisabledModule (copy), callbackInputBox (copy), withSelectionCursorProvider (copy), iconSize (copy)
				local font = p3.Font
				local font_1 = font.Body.Font
				local var1 = font.BaseSize * font.Body.RelativeSize
				local var2 = if fFlagAppChatOnConsoles then isVRAppBuild() or guiService:IsTenFootInterface() else nil
				local frameHeight = p1.state.frameHeight
				
				if frameHeight == 0 then
					frameHeight = p1.calculateInputBoxHeight(p1.state.inputText, font_1, var1, p1.state.chatBarWidth)
				end
				return roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = p1.props.LayoutOrder,
					Size = UDim2.new(1, 0, 0, frameHeight),
					[roactModule.Change.AbsolutePosition] = p1.props.onPositionChanged
				}, {
					layout = roactModule.createElement("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					flex = if p1.isMoreMenuEnabled() then roactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
					padding = if p1.isMoreMenuEnabled() then nil else roactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, p4.left),
						PaddingRight = if p2 then UDim.new(0, p4.right) else UDim.new(0, math.max(p4.right - 6, 0)),
						PaddingBottom = UDim.new(0, 13),
						PaddingTop = UDim.new(0, 8)
					}),
					inputBorder = roactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, if p2 then 0 else -p1.props.sendButtonContainerSize, 1, 0),
						Image = images["component_assets/circle_21_stroke_1"],
						ImageColor3 = if p1.props.isDisabled then p3.Tokens.Color.System.Alert.Color3 else p3.Theme.Divider.Color,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						inputImage = roactModule.createElement(interactable, {
							Name = "inputBar",
							SelectionImageObject = p5(cursorKind.RoundedRectNoInset),
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Selectable = true,
							NextSelectionRight = if fFlagAppChatGamepadSendButtonNavModule then p1.sendButtonRef else nil,
							onActivated = p1.focusChatInputBox,
							[roactModule.Ref] = p1.inputBarRef
						}, {
							roactModule.createElement(imageSetLabel, {
								BackgroundTransparency = 1,
								LayoutOrder = 1,
								Size = UDim2.new(1, 0, 1, 0),
								Image = images["component_assets/circle_21"],
								ImageColor3 = p3.Theme.UIMuted.Color,
								ImageTransparency = p3.Theme.UIMuted.Transparency,
								ScaleType = Enum.ScaleType.Slice,
								SliceCenter = Rect.new(8, 8, 9, 9)
							}, {
								padding = roactModule.createElement("UIPadding", {
									PaddingTop = if p1.isMoreMenuEnabled() then nil else UDim.new(0, var1 / 2.5),
									PaddingLeft = UDim.new(0.02, 0),
									PaddingRight = UDim.new(0.02, 0)
								}),
								inputBox = if p2 then roactModule.createElement(chatInputBoxDisabledModule, {
									bodyText = p1.props.inputBarDisabledText,
									contentSize = var1,
									endTimestamp = p1.props.disabledEndTimestampDisplay,
									font = font_1,
									onActivated = p1.onDisabledInputBarActivated
								}) else roactModule.createElement(callbackInputBox, {
									initialInputText = p1.props.initialInputText,
									inputTextFont = font_1,
									inputTextColor3 = p3.Theme.TextEmphasis.Color,
									inputTextSize = var1,
									inputTextXAlignment = Enum.TextXAlignment.Left,
									inputTextYAlignment = if p1.isMoreMenuEnabled() then Enum.TextYAlignment.Center else Enum.TextYAlignment.Top,
									placeholderText = p1.props.placeholderText,
									placeholderTextColor3 = p3.Theme.TextMuted.Color,
									placeholderTextTransparency = p3.Theme.TextMuted.Transparency,
									clipsDescendants = false,
									multiLine = not isVRAppBuild(),
									manualFocusRelease = true,
									textWrapped = true,
									focusChangedCallback = p1.focusChanged,
									clearButtonDisabled = true,
									clearButtonSize = 0,
									textChangedCallback = function(p6)
										-- upvalues: p1 (copy), font_1 (ref), var1 (ref)
										p1.onTextChanged(p6, font_1, var1, p1.state.chatBarWidth)
									end,
									[roactModule.Change.AbsoluteSize] = function(p6)
										-- upvalues: p1 (copy), font_1 (ref), var1 (ref)
										p1.chatBoxSizeChanged(p6, p1.state.inputText, font_1, var1)
									end,
									inputBoxRef = p1.inputBoxRef,
									returnPressedFromOnScreenKeyboardCallback = if fFlagAppChatOnConsoles then if var2 then p1.onSendActivated else nil elseif isVRAppBuild() then p1.onSendActivated else nil
								})
							})
						})
					}),
					sendButton = if not p2 then withSelectionCursorProvider(function(p6)
						-- upvalues: roactModule (copy), p1 (copy), cursorKind (copy), imageSetLabel (copy), iconSize (copy), p3 (copy), images (copy)
						return roactModule.createElement("TextButton", {
							Name = "sendButton",
							Size = UDim2.new(0, p1.props.sendButtonContainerSize, 1, 0),
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Text = "",
							SelectionImageObject = p6(cursorKind.RoundedRectNoInset),
							Selectable = true,
							NextSelectionLeft = p1.inputBarRef,
							[roactModule.Event.Activated] = p1.onSendActivated,
							[roactModule.Ref] = p1.sendButtonRef
						}, {
							layout = roactModule.createElement("UIListLayout", {
								VerticalAlignment = Enum.VerticalAlignment.Center,
								HorizontalAlignment = Enum.HorizontalAlignment.Right
							}),
							sendIcon = roactModule.createElement(imageSetLabel, {
								BackgroundTransparency = 1,
								Size = UDim2.new(0, iconSize.Regular, 0, iconSize.Regular),
								ImageColor3 = if p1.state.showSendChat then p3.Tokens.Color.Content.Emphasis.Color3 else p3.Tokens.Color.Content.Default.Color3,
								ImageTransparency = if p1.state.showSendChat then 0 else 0.5,
								Image = images["icons/actions/send"]
							})
						})
					end) else nil
				})
			end)
		end)
	end)
end

function chatInputBarDeprecated.didMount(p1)
	-- upvalues: focusNavigationEventNameEnum (ref)
	p1.isMounted = true
	
	if p1.inputBoxRef and p1.inputBoxRef.current then
		p1.inputBoxRef.current.Selectable = false
		p1.focusLostConnection = p1.inputBoxRef.current.FocusLost:Connect(function(_, p2)
			-- upvalues: p1 (ref)
			p1.inputBoxFocusLossKeyCodeRef.current = if p2 then p2.KeyCode else Enum.KeyCode.None
		end)
	end
	if p1.focusNavigationService and p1.inputBarRef.current then
		p1.eventHandlerRegistration = p1.focusNavigationService:registerEventHandler(p1.inputBarRef.current, focusNavigationEventNameEnum.NavigateBack, p1.focusNavigationEventHandler)
	end
end

function chatInputBarDeprecated.willUnmount(p1)
	p1.isMounted = false
	
	if p1.inputConnectionActive then
		p1:disconnectInputConnection()
	end
	if p1.props.onHeightChanged then
		p1.props.onHeightChanged(0)
	end
	if p1.focusLostConnection then
		p1.focusLostConnection:Disconnect()
	end
	if p1.eventHandlerRegistration then
		p1.eventHandlerRegistration:Disconnect()
	end
end

function chatInputBarDeprecated.recordKeystroke(p1, p2, p3)
	if p2 then
		table.insert(p1.keyPressedData, p3.Name)
		table.insert(p1.eventTypeData, 0)
		table.insert(p1.timestampData, DateTime.now().UnixTimestampMillis)
	elseif p3 ~= Enum.KeyCode.Return and p3 ~= Enum.KeyCode.KeypadEnter or #p1.keyPressedData ~= 0 then
		table.insert(p1.keyPressedData, p3.Name)
		table.insert(p1.eventTypeData, 1)
		table.insert(p1.timestampData, DateTime.now().UnixTimestampMillis)
	end
	if p1.props.maxKeystrokeDataLength <= #p1.keyPressedData then
		p1:sendKeystrokeEvent("UAMaxLengthReached")
	end
end

function chatInputBarDeprecated.recordTextChange(p1, p2)
	table.insert(p1.keyPressedData, p2:sub(-1))
	table.insert(p1.timestampData, DateTime.now().UnixTimestampMillis)
	
	if p1.props.maxKeystrokeDataLength <= #p1.keyPressedData then
		p1:sendKeystrokeEvent("UAMaxLengthReached")
	end
end

function chatInputBarDeprecated.sendKeystrokeEvent(p1, p2)
	-- upvalues: default (ref), keystrokeEventModule (ref)
	if #p1.keyPressedData >= 0 then
		p1.props.eventLoggingFunc(default, keystrokeEventModule, {}, {
			chatContext = p2,
			keyPressedData = table.concat(p1.keyPressedData, ","),
			eventTypeData = table.concat(p1.eventTypeData, ","),
			timestampData = table.concat(p1.timestampData, ",")
		})
		p1.keyPressedData = {}
		p1.eventTypeData = {}
		p1.timestampData = {}
	end
end

function chatInputBarDeprecated.disconnectInputConnection(p1)
	if p1.inputBeganConnection then
		p1.inputBeganConnection:Disconnect()
		p1.inputBeganConnection = nil
	end
	if p1.inputEndedConnection then
		p1.inputEndedConnection:Disconnect()
		p1.inputEndedConnection = nil
	end
	p1.inputConnectionActive = false
end

return chatInputBarDeprecated