local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local RoactModule = require(Parent.Roact)
local Text = require(Parent.AppCommonLib).Text
local FoundationFontFaceMigration = require(Parent.Foundation).Utility.Flags.FoundationFontFaceMigration
local GetTextSizeFunction = require(Parent.Style).GetTextSize
local IsTenFootInterfaceFunction = require(Parent.AppCommonLib).isTenFootInterface
local UIBloxModule = require(Parent.UIBlox)
local Images = UIBloxModule.App.ImageSet.Images
local IconSize = UIBloxModule.App.Constant.IconSize
local Interactable = UIBloxModule.Core.Control.Interactable
local WithStyleFunction = UIBloxModule.Style.withStyle
local IsMessageValidModule = require(script.Parent.isMessageValid)
local IsKeyCodePressedModule = require(AppChat.Components.ChatConversation.Utils.isKeyCodePressed)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Default = require(Parent.LoggingProtocol).default
local UserInputService = game:GetService("UserInputService")
local Players = game:GetService("Players")
local WithChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.withChatPagePadding)
local WithSelectionCursorProviderFunction = UIBloxModule.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBloxModule.App.SelectionImage.CursorKind
local ReactFocusNavigationModule = require(Parent.ReactFocusNavigation)
local FocusNavigationEventNameEnum = require(Parent.FocusNavigationUtils).FocusNavigationEventNameEnum
local CallbackInputBox = require(AppChat.SocialLibraries).Components.CallbackInputBox
local ChatInputBoxDisabledModule = require(AppChat.Components.ChatConversation.ChatInputBoxDisabled)
local SendButtonClickActionResultModule = require(AppChat.Analytics.Enums.SendButtonClickActionResult)
local GetAppFeaturePoliciesFunction = require(Parent.UniversalAppPolicy).getAppFeaturePolicies
local IsVRAppBuildFunction = require(Parent.AppCommonLib).IsVRAppBuild
local GetFIntAppChatBehaviorCollectionEnabledPercentageModule = require(AppChat.Flags.getFIntAppChatBehaviorCollectionEnabledPercentage)
local FFlagAppChatOnConsoles = require(Parent.SharedFlags).FFlagAppChatOnConsoles
local AppChatUseTextBoxTextOnSend = game:DefineFastFlag("AppChatUseTextBoxTextOnSend", false)
local ChatInputBarDeprecated = RoactModule.PureComponent:extend("ChatInputBarDeprecated")
local KeystrokeEventModule = require(AppChat.Analytics.KeystrokeEvent)
ChatInputBarDeprecated.defaultProps = {
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
	userInputService = UserInputService,
	onDisabledInputBarActivated = function() --[[ Line: 55 ]] end,
	maxCharacterLength = require(script.Parent.MessageCharacterLimit),
	onHeightChanged = function() --[[ Line: 61 ]] end,
	onPositionChanged = function() --[[ Line: 62 ]] end,
	onFocusLost = function() --[[ Line: 63 ]] end,
	onTextChanged = function() --[[ Line: 70 ]] end,
	eventLoggingFunc = Default.logRobloxTelemetryEvent
}

function ChatInputBarDeprecated.init(p1) --[[ Line: 79 ]]
	-- upvalues: RoactModule (copy), UserInputService (copy), FoundationFontFaceMigration (copy), GetTextSizeFunction (copy), Text (copy), GetAppFeaturePoliciesFunction (copy), GetFIntAppChatBehaviorCollectionEnabledPercentageModule (copy), Players (copy), IsMessageValidModule (copy), IsKeyCodePressedModule (copy), AppChatUseTextBoxTextOnSend (copy), SendButtonClickActionResultModule (copy), FFlagAppChatOnConsoles (copy), IsTenFootInterfaceFunction (copy)
	p1.isMounted = false
	p1.state = {
		showSendChat = false,
		chatBarWidth = 0,
		frameHeight = 0,
		inputText = p1.props.initialInputText
	}
	p1.inputBoxRef = p1.props.inputBoxRef or RoactModule.createRef()
	p1.messageListRef = p1.props.messageListRef
	p1.inputBoxFocusLossKeyCodeRef = RoactModule.createRef()
	p1.inputBoxFocusLossKeyCodeRef.current = Enum.KeyCode.None
	p1.inputBarRef = p1.props.inputBarRef or RoactModule.createRef()
	p1.sendButtonRef = RoactModule.createRef()
	p1.eventHandlerRegistration = nil
	p1.textChangedFallback = p1.props.textChangedFallback or not UserInputService.KeyboardEnabled
	
	function p1.heightOfFourLines(p2, p3, X) --[[ Line: 98 ]]
		-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), Text (upval)
		return if FoundationFontFaceMigration then GetTextSizeFunction("A\nB\nC\nD", p3, p2, Vector2.new(X, 10000)).Y else Text.GetTextHeight("A\nB\nC\nD", p2, p3, X)
	end
	
	function p1.isMoreMenuEnabled() --[[ Line: 105 ]]
		-- upvalues: p1 (copy)
		return p1.props.moreMenuEnabled
	end
	
	function p1.calculateInputBoxHeight(InputText, BodyLargeFont, ScaledBaseSize, X): number --[[ Line: 109 ]]
		-- upvalues: FoundationFontFaceMigration (upval), GetTextSizeFunction (upval), Text (upval), p1 (copy)
		local Y = if FoundationFontFaceMigration then GetTextSizeFunction(InputText, ScaledBaseSize, BodyLargeFont, Vector2.new(X, 10000)).Y else Text.GetTextHeight(InputText, BodyLargeFont, ScaledBaseSize, X)
		local HeightOfFourLinesResult: number = p1.heightOfFourLines(BodyLargeFont, ScaledBaseSize, X)
		local NewScaledBaseSize: number = if p1.isMoreMenuEnabled() then ScaledBaseSize + math.min(Y, HeightOfFourLinesResult) else ScaledBaseSize + math.min(Y, HeightOfFourLinesResult) + 16
		
		if p1.props.onHeightChanged then
			p1.props.onHeightChanged(NewScaledBaseSize)
		end
		return NewScaledBaseSize
	end
	
	p1.inputConnectionActive = false
	p1.inputBeganConnection = nil
	p1.inputEndedConnection = nil
	p1.keyPressedData = {}
	p1.eventTypeData = {}
	p1.timestampData = {}
	p1.shouldCollectKeystrokes = false
	local KeystrokeCollectionEnabled = GetAppFeaturePoliciesFunction().getKeystrokeCollectionEnabled()
	local FIntAppChatBehaviorCollectionEnabledPercentageModule: number = GetFIntAppChatBehaviorCollectionEnabledPercentageModule()
	
	if FIntAppChatBehaviorCollectionEnabledPercentageModule > 0 and Players.LocalPlayer and KeystrokeCollectionEnabled then
		p1.shouldCollectKeystrokes = Players.LocalPlayer.UserId % 100 < FIntAppChatBehaviorCollectionEnabledPercentageModule
	end
	function p1.onTextChanged(InputText, p2, p3, p4) --[[ Line: 142 ]]
		-- upvalues: p1 (copy), IsMessageValidModule (upval)
		if not p1.isMounted then return end
		p1:setState({
			inputText = InputText,
			showSendChat = if InputText and IsMessageValidModule(InputText, p1.props.maxCharacterLength) then true else false,
			frameHeight = p1.calculateInputBoxHeight(InputText, p2, p3, p4)
		})
		p1.props.onTextChanged(InputText)
		
		if p1.shouldCollectKeystrokes and p1.textChangedFallback then
			p1:recordTextChange(InputText)
		end
	end
	
	function p1.onInputBeganEvent(Input) --[[ Line: 169 ]]
		-- upvalues: p1 (copy), IsKeyCodePressedModule (upval)
		if p1.shouldCollectKeystrokes and not p1.textChangedFallback and Input.UserInputType == Enum.UserInputType.Keyboard then
			p1:recordKeystroke(true, Input.KeyCode)
		end
		if IsKeyCodePressedModule({ Input }, Enum.KeyCode.Return, Enum.KeyCode.KeypadEnter) and not IsKeyCodePressedModule(p1.props.userInputService:GetKeysPressed(), Enum.KeyCode.LeftShift, Enum.KeyCode.RightShift) then
			p1.onSendActivated()
		end
	end
	
	function p1.onInputEndedEvent(Input) --[[ Line: 188 ]]
		-- upvalues: p1 (copy)
		if p1.shouldCollectKeystrokes and not p1.textChangedFallback and Input.UserInputType == Enum.UserInputType.Keyboard then
			p1:recordKeystroke(false, Input.KeyCode)
		end
	end
	
	function p1.focusChanged(p2) --[[ Line: 196 ]]
		-- upvalues: p1 (copy)
		if p2 and not p1.inputConnectionActive then
			p1.inputBeganConnection = p1.props.userInputService.InputBegan:Connect(p1.onInputBeganEvent)
			p1.inputEndedConnection = p1.props.userInputService.InputEnded:Connect(p1.onInputEndedEvent)
			p1.inputConnectionActive = true
			
			return
		end
		if not p2 and p1.inputConnectionActive then
			p1:disconnectInputConnection()
			p1.props.onFocusLost()
		end
	end
	
	function p1.onSendActivated() --[[ Line: 207 ]]
		-- upvalues: AppChatUseTextBoxTextOnSend (upval), p1 (copy), IsMessageValidModule (upval), Text (upval), SendButtonClickActionResultModule (upval), FFlagAppChatOnConsoles (upval), IsTenFootInterfaceFunction (upval)
		local Text1 = if AppChatUseTextBoxTextOnSend then if p1.inputBoxRef.current then p1.inputBoxRef.current.Text else "" else p1.state.inputText
		local IsMessageValidModule1 = if AppChatUseTextBoxTextOnSend then Text1 and IsMessageValidModule(Text1, p1.props.maxCharacterLength) else p1.state.showSendChat
		local TrimResult = Text.Trim(Text1)
		local None = SendButtonClickActionResultModule.None
		
		if IsMessageValidModule1 and IsMessageValidModule(TrimResult, p1.props.maxCharacterLength) then
			p1.inputBoxRef:getValue().Text = ""
			
			if p1.focusNavigationService and p1.focusNavigationService.focusedGuiObject:getValue() == p1.sendButtonRef:getValue() then
				p1.focusNavigationService:focusGuiObject(p1.inputBarRef:getValue(), false)
			end
			local IsTenFootInterface = if FFlagAppChatOnConsoles then IsTenFootInterfaceFunction() else nil
			
			if FFlagAppChatOnConsoles and IsTenFootInterface then
				p1.inputBoxRef.current:ReleaseFocus()
			end
			p1:setState({ inputText = "", showSendChat = false })
			
			if p1.props.onSendChat then
				if TrimResult == "/shrug" then
					p1.props.onSendChat("¯\\_(ツ)_/¯")
				else
					p1.props.onSendChat(TrimResult)
				end
				None = SendButtonClickActionResultModule.WillSend
			end
			local ListRef = p1.messageListRef and (p1.messageListRef.current and p1.messageListRef.current._listRef)
			
			if ListRef then
				ListRef:scrollToOffset({ offset = 0 })
			end
		else
			None = if IsMessageValidModule1 then SendButtonClickActionResultModule.MessageInvalid else SendButtonClickActionResultModule.ButtonInactive
		end
		if p1.props.onSendBtnClicked then
			p1.props.onSendBtnClicked(None)
		end
		if p1.shouldCollectKeystrokes then
			p1:sendKeystrokeEvent("UASendPressed")
		end
	end
	
	function p1.chatBoxSizeChanged(Frame: Frame, InputText, BodyLargeFont, ScaledBaseSize) --[[ Line: 274 ]]
		-- upvalues: p1 (copy)
		p1:setState({
			chatBarWidth = Frame.AbsoluteSize.X,
			frameHeight = p1.calculateInputBoxHeight(InputText, BodyLargeFont, ScaledBaseSize, Frame.AbsoluteSize.X)
		})
	end
	
	function p1.onDisabledInputBarActivated() --[[ Line: 282 ]]
		-- upvalues: p1 (copy)
		p1.props.onDisabledInputBarActivated()
	end
	
	function p1.focusChatInputBox() --[[ Line: 286 ]]
		-- upvalues: p1 (copy)
		if p1.inputBoxRef and p1.inputBoxRef.current then
			p1.inputBoxRef.current:CaptureFocus()
		end
	end
	
	function p1.focusNavigationEventHandler(p2) --[[ Line: 292 ]]
		-- upvalues: p1 (copy)
		if p2.eventData and p1.inputBoxFocusLossKeyCodeRef.current == p2.eventData.KeyCode then
			p2:cancel()
			p1.inputBoxFocusLossKeyCodeRef.current = Enum.KeyCode.None
		end
	end
end

function ChatInputBarDeprecated.render(p1) --[[ Line: 300 ]]
	-- upvalues: RoactModule (copy), ReactFocusNavigationModule (copy)
	local IsDisabled = p1.props.isDisabled
	
	return RoactModule.createElement(ReactFocusNavigationModule.FocusNavigationContext.Consumer, {
		render = function(FocusNavigationService) --[[ Line: 303 ]]
			-- upvalues: p1 (copy), IsDisabled (copy)
			p1.focusNavigationService = FocusNavigationService
			
			return p1:renderContent(IsDisabled)
		end
	})
end

function ChatInputBarDeprecated.renderContent(p1, IsDisabled) --[[ Line: 310 ]]
	-- upvalues: WithStyleFunction (copy), WithChatPagePaddingModule (copy), WithSelectionCursorProviderFunction (copy), FoundationFontFaceMigration (copy), FFlagAppChatOnConsoles (copy), IsVRAppBuildFunction (copy), IsTenFootInterfaceFunction (copy), RoactModule (copy), ImageSetLabel (copy), Images (copy), Interactable (copy), CursorKind (copy), ChatInputBoxDisabledModule (copy), CallbackInputBox (copy), IconSize (copy)
	return WithStyleFunction(function(p2) --[[ Line: 311 ]]
		-- upvalues: WithChatPagePaddingModule (upval), WithSelectionCursorProviderFunction (upval), FoundationFontFaceMigration (upval), FFlagAppChatOnConsoles (upval), IsVRAppBuildFunction (upval), IsTenFootInterfaceFunction (upval), p1 (copy), IsDisabled (copy), RoactModule (upval), ImageSetLabel (upval), Images (upval), Interactable (upval), CursorKind (upval), ChatInputBoxDisabledModule (upval), CallbackInputBox (upval), IconSize (upval)
		return WithChatPagePaddingModule(function(p3) --[[ Line: 312 ]]
			-- upvalues: WithSelectionCursorProviderFunction (upval), p2 (copy), FoundationFontFaceMigration (upval), FFlagAppChatOnConsoles (upval), IsVRAppBuildFunction (upval), IsTenFootInterfaceFunction (upval), p1 (upval), IsDisabled (upval), RoactModule (upval), ImageSetLabel (upval), Images (upval), Interactable (upval), CursorKind (upval), ChatInputBoxDisabledModule (upval), CallbackInputBox (upval), IconSize (upval)
			return WithSelectionCursorProviderFunction(function(Callback) --[[ Line: 313 ]]
				-- upvalues: p2 (upval), FoundationFontFaceMigration (upval), FFlagAppChatOnConsoles (upval), IsVRAppBuildFunction (upval), IsTenFootInterfaceFunction (upval), p1 (upval), p3 (copy), IsDisabled (upval), RoactModule (upval), ImageSetLabel (upval), Images (upval), Interactable (upval), CursorKind (upval), ChatInputBoxDisabledModule (upval), CallbackInputBox (upval), WithSelectionCursorProviderFunction (upval), IconSize (upval)
				local _Font = p2.Font
				local BodyLargeFont = if FoundationFontFaceMigration then p2.Tokens.Typography.BodyLarge.Font else _Font.Body.Font
				local ScaledBaseSize = _Font.BaseSize * _Font.Body.RelativeSize
				local IsVRAppBuild = if FFlagAppChatOnConsoles then IsVRAppBuildFunction() or IsTenFootInterfaceFunction() else nil
				local FrameHeight = p1.state.frameHeight
				
				if FrameHeight == 0 then
					FrameHeight = p1.calculateInputBoxHeight(p1.state.inputText, BodyLargeFont, ScaledBaseSize, p1.state.chatBarWidth)
				end
				local _UDim: UDim = if IsDisabled then UDim.new(0, p3.right) else UDim.new(0, (math.max(p3.right - 6, 0)))
				
				return RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					BackgroundTransparency = 1,
					LayoutOrder = p1.props.LayoutOrder,
					Size = UDim2.new(1, 0, 0, FrameHeight),
					[RoactModule.Change.AbsolutePosition] = p1.props.onPositionChanged
				}, {
					layout = RoactModule.createElement("UIListLayout", {
						VerticalAlignment = Enum.VerticalAlignment.Center,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					flex = if p1.isMoreMenuEnabled() then RoactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Fill }) else nil,
					padding = if p1.isMoreMenuEnabled() then nil else RoactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, p3.left),
						PaddingRight = _UDim,
						PaddingBottom = UDim.new(0, 13),
						PaddingTop = UDim.new(0, 8)
					}),
					inputBorder = RoactModule.createElement(ImageSetLabel, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Size = UDim2.new(1, if IsDisabled then 0 else -p1.props.sendButtonContainerSize, 1, 0),
						Image = Images["component_assets/circle_21_stroke_1"],
						ImageColor3 = if p1.props.isDisabled then p2.Tokens.Color.System.Alert.Color3 else p2.Theme.Divider.Color,
						ScaleType = Enum.ScaleType.Slice,
						SliceCenter = Rect.new(8, 8, 9, 9)
					}, {
						inputImage = RoactModule.createElement(Interactable, {
							Name = "inputBar",
							SelectionImageObject = Callback(CursorKind.RoundedRectNoInset),
							Size = UDim2.new(1, 0, 1, 0),
							BackgroundTransparency = 1,
							LayoutOrder = 1,
							Selectable = true,
							NextSelectionRight = p1.sendButtonRef,
							onActivated = p1.focusChatInputBox,
							[RoactModule.Ref] = p1.inputBarRef
						}, {
							RoactModule.createElement(ImageSetLabel, {
								BackgroundTransparency = 1,
								LayoutOrder = 1,
								Size = UDim2.new(1, 0, 1, 0),
								Image = Images["component_assets/circle_21"],
								ImageColor3 = p2.Theme.UIMuted.Color,
								ImageTransparency = p2.Theme.UIMuted.Transparency,
								ScaleType = Enum.ScaleType.Slice,
								SliceCenter = Rect.new(8, 8, 9, 9)
							}, {
								padding = RoactModule.createElement("UIPadding", {
									PaddingTop = if p1.isMoreMenuEnabled() then nil else UDim.new(0, ScaledBaseSize / 2.5),
									PaddingLeft = UDim.new(0.02, 0),
									PaddingRight = UDim.new(0.02, 0)
								}),
								inputBox = if IsDisabled then RoactModule.createElement(ChatInputBoxDisabledModule, {
									bodyText = p1.props.inputBarDisabledText,
									contentSize = ScaledBaseSize,
									endTimestamp = p1.props.disabledEndTimestampDisplay,
									font = BodyLargeFont,
									onActivated = p1.onDisabledInputBarActivated
								}) else RoactModule.createElement(CallbackInputBox, {
									initialInputText = p1.props.initialInputText,
									inputTextFont = BodyLargeFont,
									inputTextColor3 = p2.Theme.TextEmphasis.Color,
									inputTextSize = ScaledBaseSize,
									inputTextXAlignment = Enum.TextXAlignment.Left,
									inputTextYAlignment = if p1.isMoreMenuEnabled() then Enum.TextYAlignment.Center else Enum.TextYAlignment.Top,
									placeholderText = p1.props.placeholderText,
									placeholderTextColor3 = p2.Theme.TextMuted.Color,
									placeholderTextTransparency = p2.Theme.TextMuted.Transparency,
									clipsDescendants = false,
									multiLine = not IsVRAppBuildFunction(),
									manualFocusRelease = true,
									textWrapped = true,
									focusChangedCallback = p1.focusChanged,
									clearButtonDisabled = true,
									clearButtonSize = 0,
									textChangedCallback = function(p4) --[[ Line: 438 ]]
										-- upvalues: p1 (upval), BodyLargeFont (copy), ScaledBaseSize (copy)
										p1.onTextChanged(p4, BodyLargeFont, ScaledBaseSize, p1.state.chatBarWidth)
									end,
									[RoactModule.Change.AbsoluteSize] = function(Frame) --[[ Line: 441 ]]
										-- upvalues: p1 (upval), BodyLargeFont (copy), ScaledBaseSize (copy)
										p1.chatBoxSizeChanged(Frame, p1.state.inputText, BodyLargeFont, ScaledBaseSize)
									end,
									inputBoxRef = p1.inputBoxRef,
									returnPressedFromOnScreenKeyboardCallback = if FFlagAppChatOnConsoles then if IsVRAppBuild then p1.onSendActivated else nil elseif IsVRAppBuildFunction() then p1.onSendActivated else nil
								})
							})
						})
					}),
					sendButton = if IsDisabled then nil else WithSelectionCursorProviderFunction(function(Callback) --[[ Line: 453 ]]
						-- upvalues: RoactModule (upval), p1 (upval), CursorKind (upval), ImageSetLabel (upval), IconSize (upval), p2 (upval), Images (upval)
						return RoactModule.createElement("TextButton", {
							Name = "sendButton",
							Size = UDim2.new(0, p1.props.sendButtonContainerSize, 1, 0),
							LayoutOrder = 2,
							BackgroundTransparency = 1,
							Text = "",
							SelectionImageObject = Callback(CursorKind.RoundedRectNoInset),
							Selectable = true,
							NextSelectionLeft = p1.inputBarRef,
							[RoactModule.Event.Activated] = p1.onSendActivated,
							[RoactModule.Ref] = p1.sendButtonRef
						}, {
							layout = RoactModule.createElement("UIListLayout", {
								VerticalAlignment = Enum.VerticalAlignment.Center,
								HorizontalAlignment = Enum.HorizontalAlignment.Right
							}),
							sendIcon = RoactModule.createElement(ImageSetLabel, {
								BackgroundTransparency = 1,
								Size = UDim2.new(0, IconSize.Regular, 0, IconSize.Regular),
								ImageColor3 = if p1.state.showSendChat then p2.Tokens.Color.Content.Emphasis.Color3 else p2.Tokens.Color.Content.Default.Color3,
								ImageTransparency = if p1.state.showSendChat then 0 else 0.5,
								Image = Images["icons/actions/send"]
							})
						})
					end)
				})
			end)
		end)
	end)
end

function ChatInputBarDeprecated.didMount(p1) --[[ Line: 489 ]]
	-- upvalues: FocusNavigationEventNameEnum (copy)
	p1.isMounted = true
	
	if p1.inputBoxRef and p1.inputBoxRef.current then
		p1.inputBoxRef.current.Selectable = false
		p1.focusLostConnection = p1.inputBoxRef.current.FocusLost:Connect(function(_, CauseInput) --[[ Line: 494 ]]
			-- upvalues: p1 (copy)
			p1.inputBoxFocusLossKeyCodeRef.current = if CauseInput then CauseInput.KeyCode else Enum.KeyCode.None
		end)
	end
	if p1.focusNavigationService and p1.inputBarRef.current then
		p1.eventHandlerRegistration = p1.focusNavigationService:registerEventHandler(p1.inputBarRef.current, FocusNavigationEventNameEnum.NavigateBack, p1.focusNavigationEventHandler)
	end
end

function ChatInputBarDeprecated.willUnmount(p1) --[[ Line: 512 ]]
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

function ChatInputBarDeprecated.recordKeystroke(p1, p2, KeyCode) --[[ Line: 532 ]]
	if p2 then
		table.insert(p1.keyPressedData, KeyCode.Name)
		table.insert(p1.eventTypeData, 0)
		table.insert(p1.timestampData, DateTime.now().UnixTimestampMillis)
	elseif KeyCode ~= Enum.KeyCode.Return and KeyCode ~= Enum.KeyCode.KeypadEnter or #p1.keyPressedData ~= 0 then
		table.insert(p1.keyPressedData, KeyCode.Name)
		table.insert(p1.eventTypeData, 1)
		table.insert(p1.timestampData, DateTime.now().UnixTimestampMillis)
	end
	if p1.props.maxKeystrokeDataLength <= #p1.keyPressedData then
		p1:sendKeystrokeEvent("UAMaxLengthReached")
	end
end

function ChatInputBarDeprecated.recordTextChange(p1, Text: string) --[[ Line: 552 ]]
	table.insert(p1.keyPressedData, Text:sub(-1))
	table.insert(p1.timestampData, DateTime.now().UnixTimestampMillis)
	
	if p1.props.maxKeystrokeDataLength <= #p1.keyPressedData then
		p1:sendKeystrokeEvent("UAMaxLengthReached")
	end
end

function ChatInputBarDeprecated.sendKeystrokeEvent(p1, ChatContext) --[[ Line: 562 ]]
	-- upvalues: Default (copy), KeystrokeEventModule (copy)
	if #p1.keyPressedData >= 0 then
		p1.props.eventLoggingFunc(Default, KeystrokeEventModule, {}, {
			chatContext = ChatContext,
			keyPressedData = table.concat(p1.keyPressedData, ","),
			eventTypeData = table.concat(p1.eventTypeData, ","),
			timestampData = table.concat(p1.timestampData, ",")
		})
		p1.keyPressedData = {}
		p1.eventTypeData = {}
		p1.timestampData = {}
	end
end

function ChatInputBarDeprecated.disconnectInputConnection(p1) --[[ Line: 576 ]]
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

return ChatInputBarDeprecated