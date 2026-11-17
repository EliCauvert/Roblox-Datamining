local Parent = script:FindFirstAncestor("AuthSignup").Parent
local RoactModule = require(Parent.Roact)
local _ = require(Parent.React)
local OtterModule = require(Parent.Otter)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local IconSize = FoundationModule.Enums.IconSize
local Loading = FoundationModule.Loading
local OpenTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local AuthCommonModule = require(Parent.AuthCommon)
local FormatBoldRichTextFunction = AuthCommonModule.Utils.formatBoldRichText
local FitChildren = AuthCommonModule.Components.FitChildren
local FitTextLabel = AuthCommonModule.Components.FitTextLabel
local AuthStatefulRoundCornerBorder = AuthCommonModule.Components.AuthStatefulRoundCornerBorder
local PasswordBox = AuthCommonModule.Components.PasswordBox
local GenericTextBox = AuthCommonModule.Components.GenericTextBox
local IssueTracker = AuthCommonModule.Components.IssueTracker
local InputValidity = AuthCommonModule.Enums.InputValidity
local RegisterAuditContent = AuthCommonModule.Components.RegisterAuditContent
local TextInput = FoundationModule.TextInput
local InputLabel = FoundationModule.InputLabel
local CollapsingTextInputValidator = RoactModule.PureComponent:extend("CollapsingTextInputValidator")
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagLuaAppEnable10ftSignUpViewFunction = SharedFlagsModule.GetFFlagLuaAppEnable10ftSignUpView
local GetFFlagEnableAuthStatefulTextInputUpdatesFunction = SharedFlagsModule.GetFFlagEnableAuthStatefulTextInputUpdates
local FFlagSignUpTrackFailedRequest = SharedFlagsModule.FFlagSignUpTrackFailedRequest
local GetFFlagLuaAppEnableOpenTypeSupportFunction = SharedFlagsModule.GetFFlagLuaAppEnableOpenTypeSupport
local GetFFlagLuaAppEnableOpenTypeSignUpPageFixFunction = SharedFlagsModule.GetFFlagLuaAppEnableOpenTypeSignUpPageFix
local EnableAndroidPasswordSuggestionEngineFeature = game:GetEngineFeature("EnableAndroidPasswordSuggestion")
local GetFFlagEnableAuditForSinglePageSignUpFunction = SharedFlagsModule.GetFFlagEnableAuditForSinglePageSignUp
local GetFFlagAuthCollapsingValidatorFoundationInputFunction = SharedFlagsModule.GetFFlagAuthCollapsingValidatorFoundationInput
local FFlagAuthValidatorStyleOverrides = SharedFlagsModule.FFlagAuthValidatorStyleOverrides
local FFlagAuthValidatorRebindTextBoxRef = SharedFlagsModule.FFlagAuthValidatorRebindTextBoxRef

local function _(p1, State)
	-- upvalues: FFlagSignUpTrackFailedRequest (copy), InputValidity (copy)
	return if FFlagSignUpTrackFailedRequest and p1.hasFieldFailed then true elseif p1.prerequisiteMet then State.inputTextToValidate ~= "" and (State.isInputTextValid == InputValidity.Invalid and State.interactionBegan) else State.textBoxFocused or State.interactionBegan and State.inputTextToValidate ~= ""
end

CollapsingTextInputValidator.defaultProps = { prerequisiteMet = true, captureFocusOnTapStart = true }

function CollapsingTextInputValidator.init(p1)
	-- upvalues: InputValidity (copy), RoactModule (copy), FFlagAuthValidatorRebindTextBoxRef (copy), FFlagAuthValidatorStyleOverrides (copy), GetFFlagLuaAppEnable10ftSignUpViewFunction (copy), FFlagSignUpTrackFailedRequest (copy), WithStyleFunction (copy), EnableAndroidPasswordSuggestionEngineFeature (copy), PasswordBox (copy), GenericTextBox (copy), GetFFlagLuaAppEnableOpenTypeSupportFunction (copy), GetFFlagLuaAppEnableOpenTypeSignUpPageFixFunction (copy), OpenTypeSupport (copy), TextInput (copy)
	local Props = p1.props
	p1.state = {
		inputTextToValidate = "",
		validatedInputText = "",
		interactionBegan = false,
		textBoxFocused = false,
		textBoxHover = false,
		issueSummaryHeight = 0,
		issueFullListHeight = 0,
		isInputTextValid = InputValidity.Unvalidated
	}
	p1.isMounted = false
	p1.frameRef = RoactModule.createRef()
	
	if p1:isUsingFoundationTextInput() then
		p1.foundationTextBoxRef = RoactModule.createRef()
		p1.foundationProxyText = Props.prefilledText or ""
		p1.foundationTextBoxProxy = nil
	end
	if FFlagAuthValidatorRebindTextBoxRef and p1.foundationTextBoxRef == nil then
		p1.foundationTextBoxRef = RoactModule.createRef()
	end
	function p1.getFrameRef()
		-- upvalues: p1 (copy)
		return p1.props.frameRef or p1.frameRef
	end
	
	p1.issueSummaryTextTransparency, p1.updateIssueSummaryTextTransparency = RoactModule.createBinding(1)
	p1.issueFullListTextTransparency, p1.updateIssueFullListTextTransparency = RoactModule.createBinding(1)
	p1.issueCheckmarkTransparency, p1.updateIssueCheckmarkTransparency = RoactModule.createBinding(1)
	p1.issueTrackerHeight, p1.updateIssueTrackerHeight = RoactModule.createBinding(UDim2.new(1, 0, 0, 0))
	
	function p1.getContentGap()
		-- upvalues: p1 (copy), FFlagAuthValidatorStyleOverrides (upval), GetFFlagLuaAppEnable10ftSignUpViewFunction (upval)
		local Props = p1.props
		
		return if FFlagAuthValidatorStyleOverrides and Props.contentGapOverride then Props.contentGapOverride elseif GetFFlagLuaAppEnable10ftSignUpViewFunction() and Props.tokens then Props.tokens.boxPadding else 5
	end
	
	p1.issueTrailingPadding = p1.issueTrackerHeight:map(function(p2): UDim
		-- upvalues: p1 (copy)
		return UDim.new(0, -math.max(0, p1.getContentGap() - p2.Y.Offset))
	end)
	p1.springOptions = { frequency = 3 }
	
	function p1.onSizeChange(p2, Frame)
		-- upvalues: p1 (copy)
		local AbsoluteSize = Frame.AbsoluteSize
		
		if AbsoluteSize.X > 0 and AbsoluteSize.Y > 0 then
			spawn(function()
				-- upvalues: p1 (upval), p2 (copy), AbsoluteSize (copy)
				if p1.isMounted then
					p1:setState({ [p2] = AbsoluteSize.Y })
				end
			end)
		end
	end
	
	function p1.onIssueSummarySizeChange(Frame)
		-- upvalues: p1 (copy)
		p1.onSizeChange("issueSummaryHeight", Frame)
	end
	
	function p1.onIssueFullListSizeChange(Frame)
		-- upvalues: p1 (copy)
		p1.onSizeChange("issueFullListHeight", Frame)
	end
	
	function p1.textInputChangedCallback(p2)
		-- upvalues: p1 (copy), InputValidity (upval)
		spawn(function()
			-- upvalues: p1 (upval), p2 (copy), InputValidity (upval)
			local Props = p1.props
			
			if p1.isMounted then
				local Text = p2.Text
				local OnInputTextChangedFunction: (any, any) -> () = Props.onInputTextChanged
				
				if OnInputTextChangedFunction then
					OnInputTextChangedFunction(Text, InputValidity.Unvalidated)
				end
				p1:setState({
					interactionBegan = true,
					inputTextToValidate = Text,
					isInputTextValid = InputValidity.Unvalidated
				})
			end
		end)
	end
	
	function p1.foundationTextInputChangedCallback(FoundationProxyText)
		-- upvalues: p1 (copy)
		p1.foundationProxyText = FoundationProxyText
		p1.textInputChangedCallback({ Text = FoundationProxyText })
	end
	
	function p1.bindFoundationTextBoxProxy()
		-- upvalues: p1 (copy)
		local TextBoxRef = p1.props.textBoxRef
		
		if TextBoxRef ~= nil and p1.foundationTextBoxProxy == nil then
			local Current = {
				CaptureFocus = function()
					-- upvalues: p1 (upval)
					local Current = p1.foundationTextBoxRef.current
					
					if Current and Current.focus then
						Current.focus()
					end
				end,
				ReleaseFocus = function()
					-- upvalues: p1 (upval)
					local Current = p1.foundationTextBoxRef.current
					
					if Current and Current.releaseFocus then
						Current.releaseFocus()
					end
				end,
				IsFocused = function(): boolean
					-- upvalues: p1 (upval)
					local Current = p1.foundationTextBoxRef.current
					
					return if Current and Current.getIsFocused then Current.getIsFocused() == true else false
				end
			}
			p1.foundationTextBoxProxy = Current
			TextBoxRef.current = Current
			setmetatable(Current, {
				__index = function(_, p2)
					-- upvalues: p1 (upval)
					return if p2 == "Text" then p1.foundationProxyText or "" else nil
				end,
				__newindex = function(_, p2, p3)
					-- upvalues: p1 (upval), Current (copy)
					if p2 == "Text" then
						local FoundationProxyText = if typeof(p3) == "string" then p3 else ""
						p1.foundationProxyText = FoundationProxyText
						p1.foundationTextInputChangedCallback(FoundationProxyText)
						
						return
					else
						rawset(Current, p2, p3)
					end
				end
			})
			
			return
		end
	end
	
	function p1.onTextValidated(ValidatedInputText, IsInputTextValid, p2)
		-- upvalues: p1 (copy), FFlagSignUpTrackFailedRequest (upval)
		spawn(function()
			-- upvalues: p1 (upval), ValidatedInputText (copy), FFlagSignUpTrackFailedRequest (upval), IsInputTextValid (copy), p2 (copy)
			local Props = p1.props
			
			if p1.isMounted and p1.state.inputTextToValidate == ValidatedInputText then
				local OnInputTextValidatedFunction: (any, any, any) -> () = Props.onInputTextValidated
				
				if OnInputTextValidatedFunction then
					if FFlagSignUpTrackFailedRequest then
						OnInputTextValidatedFunction(ValidatedInputText, IsInputTextValid, p2)
					else
						OnInputTextValidatedFunction(ValidatedInputText, IsInputTextValid)
					end
				end
				p1:setState({
					validatedInputText = ValidatedInputText,
					isInputTextValid = IsInputTextValid
				})
			end
		end)
	end
	
	function p1.onTextInputBoxFocused()
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval)
			local Props = p1.props
			
			if p1.isMounted then
				local FrameRef = p1.getFrameRef()
				
				if Props.textBoxFocusedCallback and FrameRef.current then
					Props.textBoxFocusedCallback(FrameRef.current.AbsolutePosition)
				end
				p1:setState({ textBoxFocused = true })
			end
		end)
	end
	
	function p1.onMouseEnter()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ textBoxHover = true })
		end
	end
	
	function p1.onMouseLeave()
		-- upvalues: p1 (copy)
		if p1.isMounted then
			p1:setState({ textBoxHover = false })
		end
	end
	
	function p1.onTextInputBoxFocusLost()
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval)
			local Props = p1.props
			
			if p1.isMounted then
				if Props.textBoxFocusLostCallback then
					Props.textBoxFocusLostCallback()
				end
				p1:setState({ textBoxFocused = false })
			end
		end)
	end
	
	function p1.onPositionChanged()
		-- upvalues: p1 (copy)
		spawn(function()
			-- upvalues: p1 (upval)
			local Props = p1.props
			
			if p1.isMounted and p1.state.textBoxFocused then
				local FrameRef = p1.getFrameRef()
				
				if Props.focusedTextBoxPositionChangedCallback and FrameRef.current then
					Props.focusedTextBoxPositionChangedCallback(FrameRef.current.AbsolutePosition)
				end
			end
		end)
	end
	
	function p1.isInErrorState()
		-- upvalues: p1 (copy), FFlagSignUpTrackFailedRequest (upval), InputValidity (upval)
		local Props = p1.props
		local State = p1.state
		
		if FFlagSignUpTrackFailedRequest and Props.hasFieldFailed then
			return true
		end
		local TextBoxFocused = nil
		if Props.prerequisiteMet then
			if State.inputTextToValidate == "" then
				return false
			end
			if State.isInputTextValid == InputValidity.Invalid then
				return State.interactionBegan
			end
			TextBoxFocused = false
		else
			TextBoxFocused = State.textBoxFocused
			
			if not TextBoxFocused then
				TextBoxFocused = State.interactionBegan
				
				if TextBoxFocused then
					return State.inputTextToValidate ~= ""
				end
			end
		end
		return TextBoxFocused
	end
	
	function p1.textInputBoxWithBorder()
		-- upvalues: WithStyleFunction (upval), p1 (copy), GetFFlagLuaAppEnable10ftSignUpViewFunction (upval), EnableAndroidPasswordSuggestionEngineFeature (upval), RoactModule (upval), PasswordBox (upval), GenericTextBox (upval), GetFFlagLuaAppEnableOpenTypeSupportFunction (upval), GetFFlagLuaAppEnableOpenTypeSignUpPageFixFunction (upval), OpenTypeSupport (upval)
		return WithStyleFunction(function(p2)
			-- upvalues: p1 (upval), GetFFlagLuaAppEnable10ftSignUpViewFunction (upval), EnableAndroidPasswordSuggestionEngineFeature (upval), RoactModule (upval), PasswordBox (upval), GenericTextBox (upval), GetFFlagLuaAppEnableOpenTypeSupportFunction (upval), GetFFlagLuaAppEnableOpenTypeSignUpPageFixFunction (upval), OpenTypeSupport (upval)
			local Props = p1.props
			local Tokens = Props.tokens
			local BodyFont = p2.Font.Body.Font
			local TextBodySize = if GetFFlagLuaAppEnable10ftSignUpViewFunction() and Tokens then Tokens.textBodySize else p2.Font.BaseSize * p2.Font.Body.RelativeSize
			local Color = p2.Theme.TextDefault.Color
			local Transparency = p2.Theme.TextDefault.Transparency
			local Color1 = p2.Theme.BackgroundUIContrast.Color
			local Transparency1 = p2.Theme.BackgroundUIContrast.Transparency
			local Color2 = p2.Theme.TextDefault.Color
			local PlaceholderText = Props.placeholderText
			local TextInputType = Props.textInputType
			local ReturnKeyType = Props.returnKeyType
			local PrefilledText = Props.prefilledText or ""
			
			return if TextInputType == Enum.TextInputType.Password or EnableAndroidPasswordSuggestionEngineFeature and TextInputType == Enum.TextInputType.NewPassword then RoactModule.createElement(PasswordBox, {
				Text = "",
				PlaceholderColor3 = nil,
				ManualFocusRelease = false,
				Size = UDim2.new(1, 0, 1, 0),
				Color = Color1,
				Transparency = Transparency1,
				TextSize = TextBodySize,
				TextColor = Color,
				TextTransparency = Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				PlaceholderText = PlaceholderText,
				PlaceholderColor = Color2,
				ReturnKeyType = ReturnKeyType,
				CaptureFocusOnTapStart = Props.captureFocusOnTapStart,
				Disabled = Props.disabled,
				onChangeText = p1.textInputChangedCallback,
				onFocused = p1.onTextInputBoxFocused,
				onFocusLost = p1.onTextInputBoxFocusLost,
				onMouseEnter = p1.onMouseEnter,
				onMouseLeave = p1.onMouseLeave,
				onReturnPressedFromOnScreenKeyboard = Props.onReturnPressedFromOnScreenKeyboard,
				IsKeyboardOverlayUsed = Props.IsKeyboardOverlayUsed,
				TextBoxRef = Props.textBoxRef,
				CentralOverlayBlocksInput = Props.centralOverlayBlocksInput,
				hidePassword = Props.hidePassword,
				onToggleCallback = Props.onToggleCallback,
				IsNewPassword = EnableAndroidPasswordSuggestionEngineFeature and (TextInputType == Enum.TextInputType.NewPassword or TextInputType == Enum.TextInputType.NewPasswordShown)
			}) else RoactModule.createElement(GenericTextBox, {
				ClearTextOnFocus = false,
				PaddingX = 12,
				PaddingY = 7,
				Size = UDim2.new(1, 0, 1, 0),
				Text = PrefilledText,
				Font = BodyFont,
				TextSize = TextBodySize,
				TextColor = Color,
				TextTransparency = Transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				Color = Color1,
				Transparency = Transparency1,
				TextInputType = TextInputType,
				openTypeFeatures = if GetFFlagLuaAppEnableOpenTypeSupportFunction() and GetFFlagLuaAppEnableOpenTypeSignUpPageFixFunction() then OpenTypeSupport:getUserNameStylisticAlternative() else nil,
				ReturnKeyType = ReturnKeyType,
				PlaceholderText = PlaceholderText,
				PlaceholderColor = Color2,
				onChangeText = p1.textInputChangedCallback,
				onFocused = p1.onTextInputBoxFocused,
				onFocusLost = p1.onTextInputBoxFocusLost,
				onMouseEnter = p1.onMouseEnter,
				onMouseLeave = p1.onMouseLeave,
				onReturnPressedFromOnScreenKeyboard = Props.onReturnPressedFromOnScreenKeyboard,
				NextSelectionDown = Props.NextSelectionDown,
				TextBoxRef = Props.textBoxRef
			})
		end)
	end
	
	function p1.textInputBoxFoundation()
		-- upvalues: p1 (copy), FFlagAuthValidatorStyleOverrides (upval), RoactModule (upval), TextInput (upval)
		local Props = p1.props
		local FoundationInputSize = nil
		local FoundationIconTrailing = nil
		
		if FFlagAuthValidatorStyleOverrides then
			FoundationInputSize = Props.foundationInputSize
			FoundationIconTrailing = Props.foundationIconTrailing
		end
		return RoactModule.createElement(TextInput, {
			LayoutOrder = 1,
			label = "",
			width = UDim.new(1, 0),
			size = FoundationInputSize,
			iconTrailing = FoundationIconTrailing,
			text = p1.foundationProxyText or "",
			placeholder = Props.placeholderText,
			textInputType = Props.textInputType,
			hasError = p1.isInErrorState(),
			isDisabled = Props.disabled,
			onChanged = p1.foundationTextInputChangedCallback,
			onFocusGained = p1.onTextInputBoxFocused,
			onFocusLost = p1.onTextInputBoxFocusLost,
			onReturnPressed = Props.onReturnPressedFromOnScreenKeyboard,
			textBoxRef = p1.foundationTextBoxRef,
			inputRef = Props.foundationInputRef,
			NextSelectionDown = Props.NextSelectionDown
		})
	end
end

function CollapsingTextInputValidator.isUsingFoundationTextInput(p1)
	-- upvalues: FFlagAuthValidatorStyleOverrides (copy), GetFFlagAuthCollapsingValidatorFoundationInputFunction (copy)
	local Props = p1.props
	
	return if FFlagAuthValidatorStyleOverrides then Props.useFoundationTextInput else Props.useFoundationTextInput and GetFFlagAuthCollapsingValidatorFoundationInputFunction()
end

function CollapsingTextInputValidator.didMount(p1)
	-- upvalues: OtterModule (copy), InputValidity (copy)
	local Props = p1.props
	p1.isMounted = true
	
	if p1:isUsingFoundationTextInput() then
		p1.bindFoundationTextBoxProxy()
	end
	p1.motor = OtterModule.createGroupMotor({
		issueSummaryTextTransparency = 1,
		issueFullListTextTransparency = 1,
		issueCheckmarkTransparency = 1,
		issueTrackerHeight = 0
	})
	p1.motor:onStep(function(p2)
		-- upvalues: p1 (copy)
		p1.updateIssueSummaryTextTransparency(p2.issueSummaryTextTransparency)
		p1.updateIssueFullListTextTransparency(p2.issueFullListTextTransparency)
		p1.updateIssueCheckmarkTransparency(p2.issueCheckmarkTransparency)
		p1.updateIssueTrackerHeight(UDim2.new(1, 0, 0, p2.issueTrackerHeight))
	end)
	p1.motor:onComplete(function()
		-- upvalues: p1 (copy)
		local Props = p1.props
		
		if Props.onAnimationStateChangeCallback then
			Props.onAnimationStateChangeCallback(Props.textInputType, false)
		end
	end)
	p1.motor:start()
	local PrefilledText = Props.prefilledText
	
	if PrefilledText and PrefilledText ~= "" then
		p1:setState({
			interactionBegan = false,
			inputTextToValidate = PrefilledText,
			isInputTextValid = InputValidity.Unvalidated
		})
	end
end

function CollapsingTextInputValidator.didUpdate(p1, p2, State)
	-- upvalues: FFlagAuthValidatorRebindTextBoxRef (copy), FFlagSignUpTrackFailedRequest (copy), InputValidity (copy), OtterModule (copy)
	local Props = p1.props
	
	if p1:isUsingFoundationTextInput() and p2.prefilledText ~= Props.prefilledText then
		p1.foundationTextInputChangedCallback(Props.prefilledText or "")
	end
	if FFlagAuthValidatorRebindTextBoxRef and p2.useFoundationTextInput ~= Props.useFoundationTextInput then
		if p1:isUsingFoundationTextInput() then
			p1.bindFoundationTextBoxProxy()
		else
			p1.foundationTextBoxProxy = nil
			p1.foundationProxyText = nil
		end
	end
	local TextBoxFocused = p1.state.textBoxFocused
	local IssueSummaryHeight = p1.state.issueSummaryHeight
	local IssueFullListHeight = p1.state.issueFullListHeight
	local ShowDetailedError = Props.showDetailedError
	local IsNotValidatedInputTextMatch = State.validatedInputText ~= ""
	local NoTextBoxFocused: boolean = not TextBoxFocused or not Props.prerequisiteMet
	local IsNotValidatedInputTextMatch1 = p1.state.validatedInputText ~= ""
	local State1 = p1.state
	local InteractionBegan = if FFlagSignUpTrackFailedRequest and Props.hasFieldFailed then true elseif Props.prerequisiteMet then State1.inputTextToValidate ~= "" and (State1.isInputTextValid == InputValidity.Invalid and State1.interactionBegan) else State1.textBoxFocused or State1.interactionBegan and State1.inputTextToValidate ~= ""
	local InteractionBegan1 = if FFlagSignUpTrackFailedRequest and p2.hasFieldFailed then true elseif p2.prerequisiteMet then State.inputTextToValidate ~= "" and (State.isInputTextValid == InputValidity.Invalid and State.interactionBegan) else State.textBoxFocused or State.interactionBegan and State.inputTextToValidate ~= ""
	
	if ShowDetailedError and InteractionBegan then
		NoTextBoxFocused = false
		IsNotValidatedInputTextMatch1 = true
	end
	local IssueFullListHeight1 = if TextBoxFocused or ShowDetailedError and InteractionBegan then if Props.prerequisiteMet then IssueFullListHeight else IssueSummaryHeight elseif InteractionBegan then IssueSummaryHeight else 0
	local Flag = false
	
	if Props.pillClicked then
		IssueSummaryHeight = 0
		IssueFullListHeight1 = 0
		local ResetPillClickedFunction: () -> () = Props.resetPillClicked
		assert(ResetPillClickedFunction, "pillClicked requires resetPillClicked")
		ResetPillClickedFunction()
		Flag = true
	end
	if TextBoxFocused == State.textBoxFocused and IsNotValidatedInputTextMatch == IsNotValidatedInputTextMatch1 and (not ShowDetailedError or not InteractionBegan) and InteractionBegan == InteractionBegan1 then
		if IssueSummaryHeight ~= State.issueSummaryHeight or IssueFullListHeight ~= State.issueFullListHeight then
			if Flag then
				p1.motor:setGoal({
					issueTrackerHeight = OtterModule.spring(IssueFullListHeight1, p1.springOptions)
				})
			else
				p1.motor:setGoal({
					issueTrackerHeight = OtterModule.instant(IssueFullListHeight1)
				})
			end
			if Props.onAnimationStateChangeCallback then
				Props.onAnimationStateChangeCallback(Props.textInputType, true)
			end
		end
	else
		p1.motor:setGoal({
			issueSummaryTextTransparency = OtterModule.spring(if NoTextBoxFocused then 0 else 1, p1.springOptions),
			issueFullListTextTransparency = OtterModule.spring(if NoTextBoxFocused then 1 else 0, p1.springOptions),
			issueCheckmarkTransparency = OtterModule.spring(if IsNotValidatedInputTextMatch1 then 0 else 1, p1.springOptions),
			issueTrackerHeight = OtterModule.spring(IssueFullListHeight1, p1.springOptions)
		})
		
		if Props.onAnimationStateChangeCallback then
			Props.onAnimationStateChangeCallback(Props.textInputType, true)
			
			return
		end
	end
end

function CollapsingTextInputValidator.willUnmount(p1)
	local Props = p1.props
	p1.isMounted = false
	p1.motor:destroy()
	
	if p1.foundationTextBoxProxy ~= nil and Props.textBoxRef ~= nil and Props.textBoxRef.current == p1.foundationTextBoxProxy then
		Props.textBoxRef.current = nil
		p1.foundationTextBoxProxy = nil
	end
end

function CollapsingTextInputValidator.render(p1)
	-- upvalues: AuthStatefulRoundCornerBorder (copy), FFlagAuthValidatorRebindTextBoxRef (copy), FFlagAuthValidatorStyleOverrides (copy), WithStyleFunction (copy), GetFFlagLuaAppEnable10ftSignUpViewFunction (copy), WithLocalizationFunction (copy), RoactModule (copy), FitChildren (copy), InputLabel (copy), FormatBoldRichTextFunction (copy), FitTextLabel (copy), Loading (copy), IconSize (copy), GetFFlagEnableAuditForSinglePageSignUpFunction (copy), RegisterAuditContent (copy), GetFFlagEnableAuthStatefulTextInputUpdatesFunction (copy), IssueTracker (copy), FFlagSignUpTrackFailedRequest (copy)
	local Props = p1.props
	local LayoutOrder = Props.layoutOrder
	local TitleTextKey = Props.titleTextKey
	local SummaryErrorTextKey = Props.summaryErrorTextKey
	local Validator = Props.validator
	local ValidatorAdditionalProps = Props.validatorAdditionalProps
	local InputTextToValidate = p1.state.inputTextToValidate
	local Tokens = Props.tokens
	
	if not Props.prerequisiteMet then
		InputTextToValidate = ""
	end
	local Error = if p1.isInErrorState() then AuthStatefulRoundCornerBorder.BorderState.Error elseif p1.state.textBoxFocused then AuthStatefulRoundCornerBorder.BorderState.Focused elseif p1.state.textBoxHover then AuthStatefulRoundCornerBorder.BorderState.Hover else AuthStatefulRoundCornerBorder.BorderState.Default
	local IsUsingFoundationTextInput = p1:isUsingFoundationTextInput()
	
	if FFlagAuthValidatorRebindTextBoxRef and IsUsingFoundationTextInput and p1.foundationProxyText == nil then
		p1.foundationProxyText = p1.state.inputTextToValidate
	end
	local PaddingTopOverride = nil
	local UseTrailingPadding = nil
	local ColorContentOverride = nil
	local UseFoundationTitle = nil
	local FoundationTitleIsRequired = nil
	local IsFoundationTitleIsBold: boolean? = nil
	local FoundationTitleSize = nil
	
	if FFlagAuthValidatorStyleOverrides then
		PaddingTopOverride = Props.paddingTopOverride
		UseTrailingPadding = Props.useTrailingPadding
		ColorContentOverride = Props.colorContentOverride
		UseFoundationTitle = Props.useFoundationTitle
		FoundationTitleSize = Props.foundationTitleSize
		FoundationTitleIsRequired = Props.foundationTitleIsRequired
		IsFoundationTitleIsBold = Props.foundationTitleIsBold == true
	end
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy), GetFFlagLuaAppEnable10ftSignUpViewFunction (upval), Tokens (copy), WithLocalizationFunction (upval), TitleTextKey (copy), SummaryErrorTextKey (copy), RoactModule (upval), FitChildren (upval), LayoutOrder (copy), PaddingTopOverride (ref), UseTrailingPadding (ref), Props (copy), UseFoundationTitle (ref), InputLabel (upval), IsFoundationTitleIsBold (ref), FormatBoldRichTextFunction (upval), FoundationTitleIsRequired (ref), FoundationTitleSize (ref), FitTextLabel (upval), IsUsingFoundationTextInput (copy), AuthStatefulRoundCornerBorder (upval), Error (ref), Loading (upval), IconSize (upval), GetFFlagEnableAuditForSinglePageSignUpFunction (upval), RegisterAuditContent (upval), GetFFlagEnableAuthStatefulTextInputUpdatesFunction (upval), IssueTracker (upval), Validator (copy), ValidatorAdditionalProps (copy), InputTextToValidate (ref), FFlagSignUpTrackFailedRequest (upval), ColorContentOverride (ref)
		local ScaledBaseSize = p2.Font.BaseSize * p2.Font.CaptionHeader.RelativeSize
		local ContentGap = p1.getContentGap()
		
		if GetFFlagLuaAppEnable10ftSignUpViewFunction() and Tokens then
			ScaledBaseSize = Tokens.textCaptionHeaderSize
		end
		return WithLocalizationFunction({
			titleText = TitleTextKey,
			summaryErrorText = SummaryErrorTextKey
		})(function(p3)
			-- upvalues: RoactModule (upval), FitChildren (upval), LayoutOrder (upval), p1 (upval), ContentGap (copy), PaddingTopOverride (upval), UseTrailingPadding (upval), Props (upval), UseFoundationTitle (upval), InputLabel (upval), IsFoundationTitleIsBold (upval), FormatBoldRichTextFunction (upval), FoundationTitleIsRequired (upval), FoundationTitleSize (upval), FitTextLabel (upval), p2 (copy), ScaledBaseSize (ref), IsUsingFoundationTextInput (upval), AuthStatefulRoundCornerBorder (upval), GetFFlagLuaAppEnable10ftSignUpViewFunction (upval), Tokens (upval), Error (upval), Loading (upval), IconSize (upval), GetFFlagEnableAuditForSinglePageSignUpFunction (upval), RegisterAuditContent (upval), TitleTextKey (upval), GetFFlagEnableAuthStatefulTextInputUpdatesFunction (upval), IssueTracker (upval), Validator (upval), ValidatorAdditionalProps (upval), InputTextToValidate (upval), FFlagSignUpTrackFailedRequest (upval), ColorContentOverride (upval)
			return RoactModule.createElement(FitChildren.FitFrame, {
				LayoutOrder = LayoutOrder,
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = FitChildren.FitAxis.Height,
				BackgroundTransparency = 1,
				[RoactModule.Ref] = p1.getFrameRef(),
				[RoactModule.Change.AbsolutePosition] = p1.onPositionChanged
			}, {
				UIListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, ContentGap)
				}),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, if PaddingTopOverride then PaddingTopOverride else 5),
					PaddingBottom = if UseTrailingPadding then p1.issueTrailingPadding else UDim.new(0, if Props.paddingBottomOverride then Props.paddingBottomOverride else 5)
				}),
				Title = if UseFoundationTitle then RoactModule.createElement(InputLabel, {
					LayoutOrder = 0,
					Text = if IsFoundationTitleIsBold then FormatBoldRichTextFunction(p3.titleText or "") else p3.titleText or "",
					RichText = IsFoundationTitleIsBold,
					isRequired = FoundationTitleIsRequired,
					size = FoundationTitleSize
				}) else RoactModule.createElement(FitTextLabel, {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildren.FitAxis.Height,
					Text = p3.titleText or "",
					Font = p2.Font.CaptionHeader.Font,
					TextSize = ScaledBaseSize,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					TextTransparency = p2.Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				TextInputBox = if IsUsingFoundationTextInput then RoactModule.createElement(p1.textInputBoxFoundation) else RoactModule.createElement(AuthStatefulRoundCornerBorder, {
					layoutOrder = 1,
					size = UDim2.new(1, 0, 0, if GetFFlagLuaAppEnable10ftSignUpViewFunction() and Tokens then Tokens.textboxHeight else 36),
					borderState = Error
				}, {
					textbox = RoactModule.createElement(p1.textInputBoxWithBorder),
					loadingSpinner = if Props.shouldShowLoadingIcon then RoactModule.createElement(Loading, {
						size = IconSize.Small,
						Position = UDim2.new(1, -22, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5)
					}) else nil
				}),
				RegisterTitleAuditContent = if GetFFlagEnableAuditForSinglePageSignUpFunction() and Props.enableAuditContentCapture and RegisterAuditContent then RoactModule.createElement(RegisterAuditContent, {
					translationKey = TitleTextKey,
					translatedSourceString = p3.titleText
				}) else nil,
				AnimatedWrapper = RoactModule.createElement("Frame", {
					LayoutOrder = 2,
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					Size = p1.issueTrackerHeight
				}, {
					Padding = RoactModule.createElement("UIPadding", {
						PaddingRight = UDim.new(0, 12),
						PaddingLeft = if GetFFlagEnableAuthStatefulTextInputUpdatesFunction() then UDim.new(0, 0) else UDim.new(0, 12)
					}),
					IssueSummaryWrapper = RoactModule.createElement(FitChildren.FitFrame, {
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = FitChildren.FitAxis.Height,
						BackgroundTransparency = 1,
						[RoactModule.Change.AbsoluteSize] = p1.onIssueSummarySizeChange
					}, {
						IssueSummaryText = p1.isInErrorState() and RoactModule.createElement(FitTextLabel, {
							BackgroundTransparency = 1,
							TextWrapped = true,
							Size = UDim2.new(1, 0, 0, 0),
							fitAxis = FitChildren.FitAxis.Height,
							Text = p3.summaryErrorText or "",
							Font = p2.Font.CaptionBody.Font,
							TextSize = p2.Font.BaseSize * p2.Font.CaptionBody.RelativeSize,
							TextColor3 = p2.Theme.Alert.Color,
							TextTransparency = p1.issueSummaryTextTransparency,
							TextXAlignment = Enum.TextXAlignment.Left
						})
					}),
					IssueTrackerWrapper = RoactModule.createElement(FitChildren.FitFrame, {
						LayoutOrder = 2,
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = FitChildren.FitAxis.Height,
						BackgroundTransparency = 1,
						[RoactModule.Change.AbsoluteSize] = p1.onIssueFullListSizeChange
					}, {
						IssueTracker = RoactModule.createElement(IssueTracker, {
							validator = Validator,
							validatorAdditionalProps = ValidatorAdditionalProps,
							textToValidate = InputTextToValidate,
							onTextValidated = p1.onTextValidated,
							contentTransparency = p1.issueFullListTextTransparency,
							checkmarkTransparency = p1.issueCheckmarkTransparency,
							updateIssueCondition = Props.updateIssueCondition,
							debounceTime = if FFlagSignUpTrackFailedRequest then Props.debounceTime else nil,
							colorContentOverride = ColorContentOverride
						})
					})
				})
			})
		end)
	end)
end

return CollapsingTextInputValidator