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
	onDisabledInputBarActivated = function() --[[ line: 53 ]] end,
	maxCharacterLength = messageCharacterLimitModule,
	onHeightChanged = function() --[[ line: 59 ]] end,
	onPositionChanged = function() --[[ line: 60 ]] end,
	onFocusLost = function() --[[ line: 61 ]] end,
	onTextChanged = function() --[[ line: 68 ]] end,
	eventLoggingFunc = default.logRobloxTelemetryEvent
}

function chatInputBarDeprecated.init(p0) --[[ line: 77 ]]
	-- upvalues: roactModule (ref), userInputService (ref), text (ref), getAppFeaturePolicies (ref), getFIntAppChatBehaviorCollectionEnabledPercentageModule (ref), playersService (ref), isMessageValidModule (ref), isKeyCodePressedModule (ref), appChatUseTextBoxTextOnSend (ref), sendButtonClickActionResultModule (ref), fFlagAppChatOnConsoles (ref), guiService (ref)
	p0.isMounted = false
	p0.state = {
		showSendChat = false,
		chatBarWidth = 0,
		frameHeight = 0,
		inputText = p0.props.initialInputText
	}
	p0.inputBoxRef = p0.props.inputBoxRef or roactModule.createRef()
	p0.messageListRef = p0.props.messageListRef
	p0.inputBoxFocusLossKeyCodeRef = roactModule.createRef()
	p0.inputBoxFocusLossKeyCodeRef.current = Enum.KeyCode.None
	p0.inputBarRef = p0.props.inputBarRef or roactModule.createRef()
	p0.sendButtonRef = roactModule.createRef()
	p0.eventHandlerRegistration = nil
	p0.textChangedFallback = p0.props.textChangedFallback or not userInputService.KeyboardEnabled
	
	function p0.heightOfFourLines(p1, p2, p3) --[[ line: 96 ]]
		-- upvalues: text (copy)
		return text.GetTextHeight("A\nB\nC\nD", p1, p2, p3)
	end
	
	function p0.isMoreMenuEnabled() --[[ line: 100 ]]
		-- upvalues: p0 (ref)
		return p0.props.moreMenuEnabled
	end
	
	function p0.calculateInputBoxHeight(p4, p5, p6, p7) --[[ line: 104 ]]
		-- upvalues: text (copy), p0 (ref)
		local textHeight = text.GetTextHeight(p4, p5, p6, p7)
		local var21 = p0.heightOfFourLines(p5, p6, p7)
		local var22 = if p0.isMoreMenuEnabled() then p6 + math.min(textHeight, var21) else p6 + math.min(textHeight, var21) + 16
		
		if p0.props.onHeightChanged then
			p0.props.onHeightChanged(var22)
		end
		return var22
	end
	
	p0.inputConnectionActive = false
	p0.inputBeganConnection = nil
	p0.inputEndedConnection = nil
	p0.keyPressedData = {}
	p0.eventTypeData = {}
	p0.timestampData = {}
	p0.shouldCollectKeystrokes = false
	local var19 = getFIntAppChatBehaviorCollectionEnabledPercentageModule()
	
	if var19 > 0 and playersService.LocalPlayer and getAppFeaturePolicies().getKeystrokeCollectionEnabled() then
		p0.shouldCollectKeystrokes = playersService.LocalPlayer.UserId % 100 < var19
	end
	function p0.onTextChanged(p8, p9, p10, p11) --[[ line: 135 ]]
		-- upvalues: p0 (ref), isMessageValidModule (copy)
		if not p0.isMounted then return end
		p0:setState({
			inputText = p8,
			showSendChat = if p8 and isMessageValidModule(p8, p0.props.maxCharacterLength) then true else false,
			frameHeight = p0.calculateInputBoxHeight(p8, p9, p10, p11)
		})
		p0.props.onTextChanged(p8)
		
		if p0.shouldCollectKeystrokes and p0.textChangedFallback then
			p0:recordTextChange(p8)
		end
	end
	
	function p0.onInputBeganEvent(p12) --[[ line: 162 ]]
		-- upvalues: p0 (ref), isKeyCodePressedModule (copy)
		if p0.shouldCollectKeystrokes and not p0.textChangedFallback and p12.UserInputType == Enum.UserInputType.Keyboard then
			p0:recordKeystroke(true, p12.KeyCode)
		end
		if isKeyCodePressedModule({ p12 }, Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter) and not isKeyCodePressedModule(p0.props.userInputService:GetKeysPressed(), Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift) then
			p0.onSendActivated()
		end
	end
	
	function p0.onInputEndedEvent(p13) --[[ line: 181 ]]
		-- upvalues: p0 (ref)
		if p0.shouldCollectKeystrokes and not p0.textChangedFallback and p13.UserInputType == Enum.UserInputType.Keyboard then
			p0:recordKeystroke(false, p13.KeyCode)
		end
	end
	
	function p0.focusChanged(p14) --[[ line: 189 ]]
		-- upvalues: p0 (ref)
		if p14 and not p0.inputConnectionActive then
			p0.inputBeganConnection = p0.props.userInputService.InputBegan:Connect(p0.onInputBeganEvent)
			p0.inputEndedConnection = p0.props.userInputService.InputEnded:Connect(p0.onInputEndedEvent)
			p0.inputConnectionActive = true
			
			return
		elseif not p14 and p0.inputConnectionActive then
			p0:disconnectInputConnection()
			p0.props.onFocusLost()
		end
	end
	
	function p0.onSendActivated() --[[ line: 200 ]]
		-- upvalues: appChatUseTextBoxTextOnSend (copy), p0 (ref), isMessageValidModule (copy), text (copy), sendButtonClickActionResultModule (copy), fFlagAppChatOnConsoles (copy), guiService (copy)
		local var23 = if appChatUseTextBoxTextOnSend then if p0.inputBoxRef.current then p0.inputBoxRef.current.Text else "" else p0.state.inputText
		local var24 = if appChatUseTextBoxTextOnSend then var23 and isMessageValidModule(var23, p0.props.maxCharacterLength) else p0.state.showSendChat
		local var25 = text.Trim(var23)
		local none = sendButtonClickActionResultModule.None
		
		if var24 and isMessageValidModule(var25, p0.props.maxCharacterLength) then
			p0.inputBoxRef:getValue().Text = ""
			
			if p0.focusNavigationService and p0.focusNavigationService.focusedGuiObject:getValue() == p0.sendButtonRef:getValue() then
				p0.focusNavigationService:focusGuiObject(p0.inputBarRef:getValue(), false)
			end
			if fFlagAppChatOnConsoles and (if fFlagAppChatOnConsoles then guiService:IsTenFootInterface() else nil) then
				p0.inputBoxRef.current:ReleaseFocus()
			end
			p0:setState({ inputText = "", showSendChat = false })
			
			if p0.props.onSendChat then
				if var25 == "/shrug" then
					p0.props.onSendChat("\194\175\\_(\227\131\132)_/\194\175")
				else
					p0.props.onSendChat(var25)
				end
				none = sendButtonClickActionResultModule.WillSend
			end
			local listRef = p0.messageListRef and (p0.messageListRef.current and p0.messageListRef.current._listRef)
			
			if listRef then
				listRef:scrollToOffset({ offset = 0 })
			end
		else
			none = if not var24 then sendButtonClickActionResultModule.ButtonInactive else sendButtonClickActionResultModule.MessageInvalid
		end
		if p0.props.onSendBtnClicked then
			p0.props.onSendBtnClicked(none)
		end
		if p0.shouldCollectKeystrokes then
			p0:sendKeystrokeEvent("UASendPressed")
		end
	end
	
	function p0.chatBoxSizeChanged(p15, p16, p17, p18) --[[ line: 267 ]]
		-- upvalues: p0 (ref)
		p0:setState({
			chatBarWidth = p15.AbsoluteSize.X,
			frameHeight = p0.calculateInputBoxHeight(p16, p17, p18, p15.AbsoluteSize.X)
		})
	end
	
	function p0.onDisabledInputBarActivated() --[[ line: 275 ]]
		-- upvalues: p0 (ref)
		p0.props.onDisabledInputBarActivated()
	end
	
	function p0.focusChatInputBox() --[[ line: 279 ]]
		-- upvalues: p0 (ref)
		if p0.inputBoxRef and p0.inputBoxRef.current then
			p0.inputBoxRef.current:CaptureFocus()
		end
	end
	
	function p0.focusNavigationEventHandler(p19) --[[ line: 285 ]]
		-- upvalues: p0 (ref)
		if p19.eventData and p0.inputBoxFocusLossKeyCodeRef.current == p19.eventData.KeyCode then
			p19:cancel()
			p0.inputBoxFocusLossKeyCodeRef.current = Enum.KeyCode.None
		end
	end
end

function chatInputBarDeprecated.render(p20) --[[ line: 293 ]]
	-- upvalues: roactModule (ref), reactFocusNavigationModule (ref)
	local isDisabled = p20.props.isDisabled
	
	return roactModule.createElement(reactFocusNavigationModule.FocusNavigationContext.Consumer, {
		render = function(p21) --[[ line: 296 ]]
			-- upvalues: p20 (ref), isDisabled (ref)
			p20.focusNavigationService = p21
			
			return p20:renderContent(isDisabled)
		end
	})
end

function chatInputBarDeprecated.renderContent(p22, p23) --[[ line: 303 ]]
	-- upvalues: withStyle (ref), withChatPagePaddingModule (ref), withSelectionCursorProvider (ref), fFlagAppChatOnConsoles (ref), isVRAppBuild (ref), guiService (ref), roactModule (ref), imageSetLabel (ref), images (ref), interactable (ref), cursorKind (ref), fFlagAppChatGamepadSendButtonNavModule (ref), chatInputBoxDisabledModule (ref), callbackInputBox (ref), iconSize (ref)
	return withStyle(function(p24) --[[ line: 304 ]]
		-- upvalues: withChatPagePaddingModule (copy), withSelectionCursorProvider (copy), fFlagAppChatOnConsoles (copy), isVRAppBuild (copy), guiService (copy), p22 (ref), p23 (ref), roactModule (copy), imageSetLabel (copy), images (copy), interactable (copy), cursorKind (copy), fFlagAppChatGamepadSendButtonNavModule (copy), chatInputBoxDisabledModule (copy), callbackInputBox (copy), iconSize (copy)
		return withChatPagePaddingModule(function(p25) --[[ line: 305 ]]
			-- upvalues: withSelectionCursorProvider (copy), p24 (ref), fFlagAppChatOnConsoles (copy), isVRAppBuild (copy), guiService (copy), p22 (copy), p23 (copy), roactModule (copy), imageSetLabel (copy), images (copy), interactable (copy), cursorKind (copy), fFlagAppChatGamepadSendButtonNavModule (copy), chatInputBoxDisabledModule (copy), callbackInputBox (copy), iconSize (copy)
			return withSelectionCursorProvider(function(p26) --[[ line: 306 ]]
				-- upvalues: p24 (copy), fFlagAppChatOnConsoles (copy), isVRAppBuild (copy), guiService (copy), p22 (copy), p25 (ref), p23 (copy), roactModule (copy), imageSetLabel (copy), images (copy), interactable (copy), cursorKind (copy), fFlagAppChatGamepadSendButtonNavModule (copy), chatInputBoxDisabledModule (copy), callbackInputBox (copy), withSelectionCursorProvider (copy), iconSize (copy)
				local font = p24.Font
				local font_1 = font.Body.Font
				local var27 = font.BaseSize * font.Body.RelativeSize
				local var28 = if fFlagAppChatOnConsoles then isVRAppBuild() or guiService:IsTenFootInterface() else nil
				local frameHeight = p22.state.frameHeight
				
				if frameHeight == 0 then
					frameHeight = p22.calculateInputBoxHeight(p22.state.inputText, font_1, var27, p22.state.chatBarWidth)
				end
				return roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = p22.props.LayoutOrder,
					Size = UDim2.new(1, 0, 0, frameHeight),
					[roactModule.Change.AbsolutePosition] = p22.props.onPositionChanged
				}, {
					layout = roactModule.createElement("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					flex = if p22.isMoreMenuEnabled() then roactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
					padding = if p22.isMoreMenuEnabled() then nil else roactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, p25.left),
						PaddingRight = if p23 then UDim.new(0, p25.right) else UDim.new(0, math.max(p25.right - 6, 0)),
						PaddingBottom = UDim.new(0, 13),
						PaddingTop = UDim.new(0, 8)
					}),
					inputBorder = roactModule.createElement(imageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, if p23 then 0 else -p22.props.sendButtonContainerSize, 1, 0),
						Image = images["component_assets/circle_21_stroke_1"],
						ImageColor3 = if p22.props.isDisabled then p24.Tokens.Color.System.Alert.Color3 else p24.Theme.Divider.Color,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						inputImage = roactModule.createElement(interactable, {
							Name = "inputBar",
							SelectionImageObject = p26(cursorKind.RoundedRectNoInset),
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Selectable = true,
							NextSelectionRight = if fFlagAppChatGamepadSendButtonNavModule then p22.sendButtonRef else nil,
							onActivated = p22.focusChatInputBox,
							[roactModule.Ref] = p22.inputBarRef
						}, {
							roactModule.createElement(imageSetLabel, {
								BackgroundTransparency = 1,
								LayoutOrder = 1,
								Size = UDim2.new(1, 0, 1, 0),
								Image = images["component_assets/circle_21"],
								ImageColor3 = p24.Theme.UIMuted.Color,
								ImageTransparency = p24.Theme.UIMuted.Transparency,
								ScaleType = Enum.ScaleType.Slice,
								SliceCenter = Rect.new(8, 8, 9, 9)
							}, {
								padding = roactModule.createElement("UIPadding", {
									PaddingTop = if p22.isMoreMenuEnabled() then nil else UDim.new(0, var27 / 2.5),
									PaddingLeft = UDim.new(0.02, 0),
									PaddingRight = UDim.new(0.02, 0)
								}),
								inputBox = if p23 then roactModule.createElement(chatInputBoxDisabledModule, {
									bodyText = p22.props.inputBarDisabledText,
									contentSize = var27,
									endTimestamp = p22.props.disabledEndTimestampDisplay,
									font = font_1,
									onActivated = p22.onDisabledInputBarActivated
								}) else roactModule.createElement(callbackInputBox, {
									initialInputText = p22.props.initialInputText,
									inputTextFont = font_1,
									inputTextColor3 = p24.Theme.TextEmphasis.Color,
									inputTextSize = var27,
									inputTextXAlignment = Enum.TextXAlignment.Left,
									inputTextYAlignment = if p22.isMoreMenuEnabled() then Enum.TextYAlignment.Center else Enum.TextYAlignment.Top,
									placeholderText = p22.props.placeholderText,
									placeholderTextColor3 = p24.Theme.TextMuted.Color,
									placeholderTextTransparency = p24.Theme.TextMuted.Transparency,
									clipsDescendants = false,
									multiLine = not isVRAppBuild(),
									manualFocusRelease = true,
									textWrapped = true,
									focusChangedCallback = p22.focusChanged,
									clearButtonDisabled = true,
									clearButtonSize = 0,
									textChangedCallback = function(p27) --[[ line: 429 ]]
										-- upvalues: p22 (copy), font_1 (ref), var27 (ref)
										p22.onTextChanged(p27, font_1, var27, p22.state.chatBarWidth)
									end,
									[roactModule.Change.AbsoluteSize] = function(p28) --[[ line: 432 ]]
										-- upvalues: p22 (copy), font_1 (ref), var27 (ref)
										p22.chatBoxSizeChanged(p28, p22.state.inputText, font_1, var27)
									end,
									inputBoxRef = p22.inputBoxRef,
									returnPressedFromOnScreenKeyboardCallback = if fFlagAppChatOnConsoles then if var28 then p22.onSendActivated else nil elseif isVRAppBuild() then p22.onSendActivated else nil
								})
							})
						})
					}),
					sendButton = if not p23 then withSelectionCursorProvider(function(p29) --[[ line: 444 ]]
						-- upvalues: roactModule (copy), p22 (copy), cursorKind (copy), imageSetLabel (copy), iconSize (copy), p24 (copy), images (copy)
						return roactModule.createElement("TextButton", {
							Name = "sendButton",
							Size = UDim2.new(0, p22.props.sendButtonContainerSize, 1, 0),
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Text = "",
							SelectionImageObject = p29(cursorKind.RoundedRectNoInset),
							Selectable = true,
							NextSelectionLeft = p22.inputBarRef,
							[roactModule.Event.Activated] = p22.onSendActivated,
							[roactModule.Ref] = p22.sendButtonRef
						}, {
							layout = roactModule.createElement("UIListLayout", {
								VerticalAlignment = Enum.VerticalAlignment.Center,
								HorizontalAlignment = Enum.HorizontalAlignment.Right
							}),
							sendIcon = roactModule.createElement(imageSetLabel, {
								BackgroundTransparency = 1,
								Size = UDim2.new(0, iconSize.Regular, 0, iconSize.Regular),
								ImageColor3 = if p22.state.showSendChat then p24.Tokens.Color.Content.Emphasis.Color3 else p24.Tokens.Color.Content.Default.Color3,
								ImageTransparency = if p22.state.showSendChat then 0 else 0.5,
								Image = images["icons/actions/send"]
							})
						})
					end) else nil
				})
			end)
		end)
	end)
end

function chatInputBarDeprecated.didMount(p30) --[[ line: 480 ]]
	-- upvalues: focusNavigationEventNameEnum (ref)
	p30.isMounted = true
	
	if p30.inputBoxRef and p30.inputBoxRef.current then
		p30.inputBoxRef.current.Selectable = false
		p30.focusLostConnection = p30.inputBoxRef.current.FocusLost:Connect(function(_, p31) --[[ line: 485 ]]
			-- upvalues: p30 (ref)
			p30.inputBoxFocusLossKeyCodeRef.current = if p31 then p31.KeyCode else Enum.KeyCode.None
		end)
	end
	if p30.focusNavigationService and p30.inputBarRef.current then
		p30.eventHandlerRegistration = p30.focusNavigationService:registerEventHandler(p30.inputBarRef.current, focusNavigationEventNameEnum.NavigateBack, p30.focusNavigationEventHandler)
	end
end

function chatInputBarDeprecated.willUnmount(p32) --[[ line: 503 ]]
	p32.isMounted = false
	
	if p32.inputConnectionActive then
		p32:disconnectInputConnection()
	end
	if p32.props.onHeightChanged then
		p32.props.onHeightChanged(0)
	end
	if p32.focusLostConnection then
		p32.focusLostConnection:Disconnect()
	end
	if p32.eventHandlerRegistration then
		p32.eventHandlerRegistration:Disconnect()
	end
end

function chatInputBarDeprecated.recordKeystroke(p33, p34, p35) --[[ line: 523 ]]
	if p34 then
		table.insert(p33.keyPressedData, p35.Name)
		table.insert(p33.eventTypeData, 0)
		table.insert(p33.timestampData, DateTime.now().UnixTimestampMillis)
	elseif p35 ~= Enum.KeyCode.Return and p35 ~= Enum.KeyCode.KeypadEnter or #p33.keyPressedData ~= 0 then
		table.insert(p33.keyPressedData, p35.Name)
		table.insert(p33.eventTypeData, 1)
		table.insert(p33.timestampData, DateTime.now().UnixTimestampMillis)
	end
	if p33.props.maxKeystrokeDataLength <= #p33.keyPressedData then
		p33:sendKeystrokeEvent("UAMaxLengthReached")
	end
end

function chatInputBarDeprecated.recordTextChange(p36, p37) --[[ line: 543 ]]
	table.insert(p36.keyPressedData, p37:sub(-1))
	table.insert(p36.timestampData, DateTime.now().UnixTimestampMillis)
	
	if p36.props.maxKeystrokeDataLength <= #p36.keyPressedData then
		p36:sendKeystrokeEvent("UAMaxLengthReached")
	end
end

function chatInputBarDeprecated.sendKeystrokeEvent(p38, p39) --[[ line: 553 ]]
	-- upvalues: default (ref), keystrokeEventModule (ref)
	if #p38.keyPressedData >= 0 then
		p38.props.eventLoggingFunc(default, keystrokeEventModule, {}, {
			chatContext = p39,
			keyPressedData = table.concat(p38.keyPressedData, ","),
			eventTypeData = table.concat(p38.eventTypeData, ","),
			timestampData = table.concat(p38.timestampData, ",")
		})
		p38.keyPressedData = {}
		p38.eventTypeData = {}
		p38.timestampData = {}
	end
end

function chatInputBarDeprecated.disconnectInputConnection(p40) --[[ line: 567 ]]
	if p40.inputBeganConnection then
		p40.inputBeganConnection:Disconnect()
		p40.inputBeganConnection = nil
	end
	if p40.inputEndedConnection then
		p40.inputEndedConnection:Disconnect()
		p40.inputEndedConnection = nil
	end
	p40.inputConnectionActive = false
end

return chatInputBarDeprecated