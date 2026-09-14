local parent = script:FindFirstAncestor("AuthSignup").Parent
local roactModule = require(parent.Roact)
local otterModule = require(parent.Otter)
local UIBloxModule = require(parent.UIBlox)
local foundationModule = require(parent.Foundation)
local iconSize = foundationModule.Enums.IconSize
local loading = foundationModule.Loading
local openTypeSupport = UIBloxModule.Utility.OpenTypeSupport
local withStyle = UIBloxModule.Style.withStyle
local withLocalization = require(parent.Localization).withLocalization
local authCommonModule = require(parent.AuthCommon)
local fitChildren = authCommonModule.Components.FitChildren
local fitTextLabel = authCommonModule.Components.FitTextLabel
local authStatefulRoundCornerBorder = authCommonModule.Components.AuthStatefulRoundCornerBorder
local passwordBox = authCommonModule.Components.PasswordBox
local genericTextBox = authCommonModule.Components.GenericTextBox
local issueTracker = authCommonModule.Components.IssueTracker
local inputValidity = authCommonModule.Enums.InputValidity
local registerAuditContent = authCommonModule.Components.RegisterAuditContent
local textInput = foundationModule.TextInput
local inputLabel = foundationModule.InputLabel
local collapsingTextInputValidator = roactModule.PureComponent:extend("CollapsingTextInputValidator")
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagLuaAppEnable10ftSignUpView = sharedFlagsModule.GetFFlagLuaAppEnable10ftSignUpView
local getFFlagEnableAuthStatefulTextInputUpdates = sharedFlagsModule.GetFFlagEnableAuthStatefulTextInputUpdates
local fFlagSignUpTrackFailedRequest = sharedFlagsModule.FFlagSignUpTrackFailedRequest
local getFFlagLuaAppEnableOpenTypeSupport = sharedFlagsModule.GetFFlagLuaAppEnableOpenTypeSupport
local getFFlagLuaAppEnableOpenTypeSignUpPageFix = sharedFlagsModule.GetFFlagLuaAppEnableOpenTypeSignUpPageFix
local enableAndroidPasswordSuggestionEngineFeature = game:GetEngineFeature("EnableAndroidPasswordSuggestion")
local getFFlagEnableAuditForSinglePageSignUp = sharedFlagsModule.GetFFlagEnableAuditForSinglePageSignUp
local getFFlagAuthCollapsingValidatorFoundationInput = sharedFlagsModule.GetFFlagAuthCollapsingValidatorFoundationInput
local fFlagAuthValidatorStyleOverrides = sharedFlagsModule.FFlagAuthValidatorStyleOverrides

local function _(p1, p2)
	-- upvalues: fFlagSignUpTrackFailedRequest (ref), inputValidity (ref)
	return if fFlagSignUpTrackFailedRequest and p1.hasFieldFailed then true elseif p1.prerequisiteMet then if p2.inputTextToValidate == "" then false else p2.isInputTextValid == inputValidity.Invalid and p2.interactionBegan else p2.textBoxFocused or p2.interactionBegan and p2.inputTextToValidate ~= ""
end

collapsingTextInputValidator.defaultProps = { prerequisiteMet = true, captureFocusOnTapStart = true }

function collapsingTextInputValidator.init(p1)
	-- upvalues: inputValidity (ref), roactModule (ref), fFlagAuthValidatorStyleOverrides (ref), getFFlagLuaAppEnable10ftSignUpView (ref), fFlagSignUpTrackFailedRequest (ref), withStyle (ref), enableAndroidPasswordSuggestionEngineFeature (ref), passwordBox (ref), genericTextBox (ref), getFFlagLuaAppEnableOpenTypeSupport (ref), getFFlagLuaAppEnableOpenTypeSignUpPageFix (ref), openTypeSupport (ref), textInput (ref)
	p1.state = {
		inputTextToValidate = "",
		validatedInputText = "",
		interactionBegan = false,
		textBoxFocused = false,
		textBoxHover = false,
		issueSummaryHeight = 0,
		issueFullListHeight = 0,
		isInputTextValid = inputValidity.Unvalidated
	}
	p1.isMounted = false
	p1.frameRef = roactModule.createRef()
	
	if p1:isUsingFoundationTextInput() then
		p1.foundationTextBoxRef = roactModule.createRef()
		p1.foundationProxyText = p1.props.prefilledText or ""
		p1.foundationTextBoxProxy = nil
	end
	function p2.getFrameRef()
		-- upvalues: p1 (ref)
		return p1.props.frameRef or p1.frameRef
	end
	
	local var1, var2 = roactModule.createBinding(1)
	p1.issueSummaryTextTransparency = var1
	p1.updateIssueSummaryTextTransparency = var2
	local var3, var4 = roactModule.createBinding(1)
	p1.issueFullListTextTransparency = var3
	p1.updateIssueFullListTextTransparency = var4
	local var5, var6 = roactModule.createBinding(1)
	p1.issueCheckmarkTransparency = var5
	p1.updateIssueCheckmarkTransparency = var6
	local var7, var8 = roactModule.createBinding(UDim2.new(1, 0, 0, 0))
	p1.issueTrackerHeight = var7
	p1.updateIssueTrackerHeight = var8
	
	function p2.getContentGap()
		-- upvalues: fFlagAuthValidatorStyleOverrides (copy), p1 (ref), getFFlagLuaAppEnable10ftSignUpView (copy)
		return if fFlagAuthValidatorStyleOverrides and p1.props.contentGapOverride then p1.props.contentGapOverride elseif getFFlagLuaAppEnable10ftSignUpView() and p1.props.tokens then p1.props.tokens.boxPadding else 5
	end
	
	p1.issueTrailingPadding = p1.issueTrackerHeight:map(function(p2)
		-- upvalues: p1 (ref)
		return UDim.new(0, -math.max(0, p1.getContentGap() - p2.Y.Offset))
	end)
	p1.springOptions = { frequency = 3 }
	
	function p2.onSizeChange(p2, p3)
		-- upvalues: p1 (ref)
		local absoluteSize = p3.AbsoluteSize
		
		if absoluteSize.X > 0 and absoluteSize.Y > 0 then
			spawn(function()
				-- upvalues: p1 (copy), p2 (ref), absoluteSize (ref)
				if p1.isMounted then
					p1:setState({ [p2] = absoluteSize.Y })
				end
			end)
		end
	end
	
	function p2.onIssueSummarySizeChange(p2)
		-- upvalues: p1 (ref)
		p1.onSizeChange("issueSummaryHeight", p2)
	end
	
	function p2.onIssueFullListSizeChange(p2)
		-- upvalues: p1 (ref)
		p1.onSizeChange("issueFullListHeight", p2)
	end
	
	function p2.textInputChangedCallback(p2)
		-- upvalues: p1 (ref), inputValidity (copy)
		spawn(function()
			-- upvalues: p1 (copy), p2 (ref), inputValidity (copy)
			if p1.isMounted then
				local text = p2.Text
				local onInputTextChanged = p1.props.onInputTextChanged
				
				if onInputTextChanged then
					onInputTextChanged(text, inputValidity.Unvalidated)
				end
				p1:setState({
					interactionBegan = true,
					inputTextToValidate = text,
					isInputTextValid = inputValidity.Unvalidated
				})
			end
		end)
	end
	
	function p2.foundationTextInputChangedCallback(p2)
		-- upvalues: p1 (ref)
		p1.foundationProxyText = p2
		p1.textInputChangedCallback({ Text = p2 })
	end
	
	function p2.bindFoundationTextBoxProxy()
		-- upvalues: p1 (ref)
		local textBoxRef = p1.props.textBoxRef
		
		if textBoxRef == nil or p1.foundationTextBoxProxy ~= nil then
			return
		end
		local t = {
			CaptureFocus = function()
				-- upvalues: p1 (copy)
				local current = p1.foundationTextBoxRef.current
				
				if current and current.focus then
					current.focus()
				end
			end,
			ReleaseFocus = function()
				-- upvalues: p1 (copy)
				local current = p1.foundationTextBoxRef.current
				
				if current and current.releaseFocus then
					current.releaseFocus()
				end
			end,
			IsFocused = function()
				-- upvalues: p1 (copy)
				local current = p1.foundationTextBoxRef.current
				
				return if current and current.getIsFocused then current.getIsFocused() == true else false
			end
		}
		setmetatable(t, {
			__index = function(_, p2)
				-- upvalues: p1 (copy)
				return if p2 == "Text" then p1.foundationProxyText or "" else nil
			end,
			__newindex = function(_, p2, p3)
				-- upvalues: p1 (copy), t (ref)
				if p2 == "Text" then
					local var9 = if typeof(p3) == "string" then p3 else ""
					p1.foundationProxyText = var9
					p1.foundationTextInputChangedCallback(var9)
					
					return
				end
				rawset(t, p2, p3)
			end
		})
		p1.foundationTextBoxProxy = t
		textBoxRef.current = t
	end
	
	function p2.onTextValidated(p2, p3, p4)
		-- upvalues: p1 (ref), fFlagSignUpTrackFailedRequest (copy)
		spawn(function()
			-- upvalues: p1 (copy), p2 (ref), fFlagSignUpTrackFailedRequest (copy), p3 (ref), p4 (ref)
			if p1.isMounted and p1.state.inputTextToValidate == p2 then
				local onInputTextValidated = p1.props.onInputTextValidated
				
				if onInputTextValidated then
					if fFlagSignUpTrackFailedRequest then
						onInputTextValidated(p2, p3, p4)
					else
						onInputTextValidated(p2, p3)
					end
				end
				p1:setState({ validatedInputText = p2, isInputTextValid = p3 })
			end
		end)
	end
	
	function p2.onTextInputBoxFocused()
		-- upvalues: p1 (ref)
		spawn(function()
			-- upvalues: p1 (copy)
			if p1.isMounted then
				local frameRef = p1.getFrameRef()
				
				if p1.props.textBoxFocusedCallback and frameRef.current then
					p1.props.textBoxFocusedCallback(frameRef.current.AbsolutePosition)
				end
				p1:setState({ textBoxFocused = true })
			end
		end)
	end
	
	function p2.onMouseEnter()
		-- upvalues: p1 (ref)
		if p1.isMounted then
			p1:setState({ textBoxHover = true })
		end
	end
	
	function p2.onMouseLeave()
		-- upvalues: p1 (ref)
		if p1.isMounted then
			p1:setState({ textBoxHover = false })
		end
	end
	
	function p2.onTextInputBoxFocusLost()
		-- upvalues: p1 (ref)
		spawn(function()
			-- upvalues: p1 (copy)
			if p1.isMounted then
				if p1.props.textBoxFocusLostCallback then
					p1.props.textBoxFocusLostCallback()
				end
				p1:setState({ textBoxFocused = false })
			end
		end)
	end
	
	function p2.onPositionChanged()
		-- upvalues: p1 (ref)
		spawn(function()
			-- upvalues: p1 (copy)
			if p1.isMounted and p1.state.textBoxFocused then
				local frameRef = p1.getFrameRef()
				
				if p1.props.focusedTextBoxPositionChangedCallback and frameRef.current then
					p1.props.focusedTextBoxPositionChangedCallback(frameRef.current.AbsolutePosition)
				end
			end
		end)
	end
	
	function p2.isInErrorState()
		-- upvalues: p1 (ref), fFlagSignUpTrackFailedRequest (copy), inputValidity (copy)
		local textBoxFocused
		local props = p1.props
		local state = p1.state
		
		if fFlagSignUpTrackFailedRequest and props.hasFieldFailed then
			return true
		elseif props.prerequisiteMet then
			if state.inputTextToValidate == "" then
				return false
			elseif state.isInputTextValid == inputValidity.Invalid then
				return state.interactionBegan
			end
			textBoxFocused = false
		else
			textBoxFocused = state.textBoxFocused
			
			if not textBoxFocused then
				textBoxFocused = state.interactionBegan
				
				return textBoxFocused and state.inputTextToValidate ~= ""
			end
		end
	end
	
	function p2.textInputBoxWithBorder()
		-- upvalues: withStyle (copy), p1 (ref), getFFlagLuaAppEnable10ftSignUpView (copy), enableAndroidPasswordSuggestionEngineFeature (copy), roactModule (copy), passwordBox (copy), genericTextBox (copy), getFFlagLuaAppEnableOpenTypeSupport (copy), getFFlagLuaAppEnableOpenTypeSignUpPageFix (copy), openTypeSupport (copy)
		return withStyle(function(p2)
			-- upvalues: p1 (copy), getFFlagLuaAppEnable10ftSignUpView (copy), enableAndroidPasswordSuggestionEngineFeature (copy), roactModule (copy), passwordBox (copy), genericTextBox (copy), getFFlagLuaAppEnableOpenTypeSupport (copy), getFFlagLuaAppEnableOpenTypeSignUpPageFix (copy), openTypeSupport (copy)
			local tokens = p1.props.tokens
			local font = p2.Font.Body.Font
			local var9 = if getFFlagLuaAppEnable10ftSignUpView() and tokens then tokens.textBodySize else p2.Font.BaseSize * p2.Font.Body.RelativeSize
			local color = p2.Theme.TextDefault.Color
			local transparency = p2.Theme.TextDefault.Transparency
			local color_1 = p2.Theme.BackgroundUIContrast.Color
			local transparency_1 = p2.Theme.BackgroundUIContrast.Transparency
			local color_2 = p2.Theme.TextDefault.Color
			local placeholderText = p1.props.placeholderText
			local textInputType = p1.props.textInputType
			local returnKeyType = p1.props.returnKeyType
			
			return if textInputType == Enum.TextInputType.Password or enableAndroidPasswordSuggestionEngineFeature and textInputType == Enum.TextInputType.NewPassword then roactModule.createElement(passwordBox, {
				Text = "",
				PlaceholderColor3 = nil,
				ManualFocusRelease = false,
				Size = UDim2.new(1, 0, 1, 0),
				Color = color_1,
				Transparency = transparency_1,
				TextSize = var9,
				TextColor = color,
				TextTransparency = transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				PlaceholderText = placeholderText,
				PlaceholderColor = color_2,
				ReturnKeyType = returnKeyType,
				CaptureFocusOnTapStart = p1.props.captureFocusOnTapStart,
				Disabled = p1.props.disabled,
				onChangeText = p1.textInputChangedCallback,
				onFocused = p1.onTextInputBoxFocused,
				onFocusLost = p1.onTextInputBoxFocusLost,
				onMouseEnter = p1.onMouseEnter,
				onMouseLeave = p1.onMouseLeave,
				onReturnPressedFromOnScreenKeyboard = p1.props.onReturnPressedFromOnScreenKeyboard,
				IsKeyboardOverlayUsed = p1.props.IsKeyboardOverlayUsed,
				TextBoxRef = p1.props.textBoxRef,
				CentralOverlayBlocksInput = p1.props.centralOverlayBlocksInput,
				hidePassword = p1.props.hidePassword,
				onToggleCallback = p1.props.onToggleCallback,
				IsNewPassword = enableAndroidPasswordSuggestionEngineFeature and (if textInputType ~= Enum.TextInputType.NewPassword then textInputType == Enum.TextInputType.NewPasswordShown else true)
			}) else roactModule.createElement(genericTextBox, {
				ClearTextOnFocus = false,
				PaddingX = 12,
				PaddingY = 7,
				Size = UDim2.new(1, 0, 1, 0),
				Text = p1.props.prefilledText or "",
				Font = font,
				TextSize = var9,
				TextColor = color,
				TextTransparency = transparency,
				TextXAlignment = Enum.TextXAlignment.Left,
				Color = color_1,
				Transparency = transparency_1,
				TextInputType = textInputType,
				openTypeFeatures = if getFFlagLuaAppEnableOpenTypeSupport() and getFFlagLuaAppEnableOpenTypeSignUpPageFix() then openTypeSupport:getUserNameStylisticAlternative() else nil,
				ReturnKeyType = returnKeyType,
				PlaceholderText = placeholderText,
				PlaceholderColor = color_2,
				onChangeText = p1.textInputChangedCallback,
				onFocused = p1.onTextInputBoxFocused,
				onFocusLost = p1.onTextInputBoxFocusLost,
				onMouseEnter = p1.onMouseEnter,
				onMouseLeave = p1.onMouseLeave,
				onReturnPressedFromOnScreenKeyboard = p1.props.onReturnPressedFromOnScreenKeyboard,
				NextSelectionDown = p1.props.NextSelectionDown,
				TextBoxRef = p1.props.textBoxRef
			})
		end)
	end
	
	function p2.textInputBoxFoundation()
		-- upvalues: fFlagAuthValidatorStyleOverrides (copy), p1 (ref), roactModule (copy), textInput (copy)
		local foundationInputSize = nil
		local foundationIconTrailing = nil
		
		if fFlagAuthValidatorStyleOverrides then
			foundationInputSize = p1.props.foundationInputSize
			foundationIconTrailing = p1.props.foundationIconTrailing
		end
		return roactModule.createElement(textInput, {
			LayoutOrder = 1,
			label = "",
			width = UDim.new(1, 0),
			size = foundationInputSize,
			iconTrailing = foundationIconTrailing,
			text = p1.foundationProxyText or "",
			placeholder = p1.props.placeholderText,
			textInputType = p1.props.textInputType,
			hasError = p1.isInErrorState(),
			isDisabled = p1.props.disabled,
			onChanged = p1.foundationTextInputChangedCallback,
			onFocusGained = p1.onTextInputBoxFocused,
			onFocusLost = p1.onTextInputBoxFocusLost,
			onReturnPressed = p1.props.onReturnPressedFromOnScreenKeyboard,
			textBoxRef = p1.foundationTextBoxRef
		})
	end
end

function collapsingTextInputValidator.isUsingFoundationTextInput(p1)
	-- upvalues: fFlagAuthValidatorStyleOverrides (ref), getFFlagAuthCollapsingValidatorFoundationInput (ref)
	return if fFlagAuthValidatorStyleOverrides then p1.props.useFoundationTextInput else p1.props.useFoundationTextInput and getFFlagAuthCollapsingValidatorFoundationInput()
end

function collapsingTextInputValidator.didMount(p1)
	-- upvalues: otterModule (ref), inputValidity (ref)
	p1.isMounted = true
	
	if p1:isUsingFoundationTextInput() then
		p1.bindFoundationTextBoxProxy()
	end
	p1.motor = otterModule.createGroupMotor({
		issueSummaryTextTransparency = 1,
		issueFullListTextTransparency = 1,
		issueCheckmarkTransparency = 1,
		issueTrackerHeight = 0
	})
	p1.motor:onStep(function(p2)
		-- upvalues: p1 (ref)
		p1.updateIssueSummaryTextTransparency(p2.issueSummaryTextTransparency)
		p1.updateIssueFullListTextTransparency(p2.issueFullListTextTransparency)
		p1.updateIssueCheckmarkTransparency(p2.issueCheckmarkTransparency)
		p1.updateIssueTrackerHeight(UDim2.new(1, 0, 0, p2.issueTrackerHeight))
	end)
	p1.motor:onComplete(function()
		-- upvalues: p1 (ref)
		if p1.props.onAnimationStateChangeCallback then
			p1.props.onAnimationStateChangeCallback(p1.props.textInputType, false)
		end
	end)
	p1.motor:start()
	local prefilledText = p1.props.prefilledText
	
	if prefilledText and prefilledText ~= "" then
		p1:setState({
			interactionBegan = false,
			inputTextToValidate = prefilledText,
			isInputTextValid = inputValidity.Unvalidated
		})
	end
end

function collapsingTextInputValidator.didUpdate(p1, p2, p3)
	-- upvalues: fFlagSignUpTrackFailedRequest (ref), inputValidity (ref), otterModule (ref)
	if p1:isUsingFoundationTextInput() and p2.prefilledText ~= p1.props.prefilledText then
		p1.foundationTextInputChangedCallback(p1.props.prefilledText or "")
	end
	local textBoxFocused_1
	local textBoxFocused = p1.state.textBoxFocused
	local issueSummaryHeight = p1.state.issueSummaryHeight
	local issueFullListHeight = p1.state.issueFullListHeight
	local showDetailedError = p1.props.showDetailedError
	local var1 = p3.validatedInputText ~= ""
	local var2 = if textBoxFocused then not p1.props.prerequisiteMet else not textBoxFocused
	local var3 = p1.state.validatedInputText ~= ""
	local props = p1.props
	local state = p1.state
	
	if fFlagSignUpTrackFailedRequest and props.hasFieldFailed then
		textBoxFocused_1 = true
	elseif props.prerequisiteMet then
		textBoxFocused_1 = if state.inputTextToValidate == "" then false else state.isInputTextValid == inputValidity.Invalid and state.interactionBegan
	else
		textBoxFocused_1 = state.textBoxFocused
		
		if not textBoxFocused_1 then
			local textBoxFocused_2
			textBoxFocused_1 = state.interactionBegan
			
			if textBoxFocused_1 then
				textBoxFocused_1 = state.inputTextToValidate ~= ""
				textBoxFocused_1 = nil
			end
		end
	end
	if fFlagSignUpTrackFailedRequest and p2.hasFieldFailed then
		textBoxFocused_2 = true
	elseif p2.prerequisiteMet then
		textBoxFocused_2 = if p3.inputTextToValidate == "" then false else p3.isInputTextValid == inputValidity.Invalid and p3.interactionBegan
	else
		textBoxFocused_2 = p3.textBoxFocused
		
		if not textBoxFocused_2 then
			textBoxFocused_2 = p3.interactionBegan
			
			if textBoxFocused_2 then
				textBoxFocused_2 = p3.inputTextToValidate ~= ""
				textBoxFocused_2 = nil
			end
		end
	end
	local _ = nil
	
	if showDetailedError and textBoxFocused_1 then
		var2 = false
		var3 = true
	end
	local var4 = if textBoxFocused or showDetailedError and textBoxFocused_1 then if p1.props.prerequisiteMet then issueFullListHeight else issueSummaryHeight elseif textBoxFocused_1 then issueSummaryHeight else 0
	local var5 = false
	
	if p1.props.pillClicked then
		issueSummaryHeight = 0
		var4 = 0
		p1.props.resetPillClicked()
		var5 = true
	end
	if textBoxFocused ~= p3.textBoxFocused or var1 ~= var3 or showDetailedError and textBoxFocused_1 or textBoxFocused_1 ~= textBoxFocused_2 then
		p1.motor:setGoal({
			issueSummaryTextTransparency = otterModule.spring(if var2 then 0 else 1, p1.springOptions),
			issueFullListTextTransparency = otterModule.spring(if var2 then 1 else 0, p1.springOptions),
			issueCheckmarkTransparency = otterModule.spring(if var3 then 0 else 1, p1.springOptions),
			issueTrackerHeight = otterModule.spring(var4, p1.springOptions)
		})
		
		if p1.props.onAnimationStateChangeCallback then
			p1.props.onAnimationStateChangeCallback(p1.props.textInputType, true)
			
			return
		end
	elseif issueSummaryHeight ~= p3.issueSummaryHeight or issueFullListHeight ~= p3.issueFullListHeight then
		if var5 then
			p1.motor:setGoal({
				issueTrackerHeight = otterModule.spring(var4, p1.springOptions)
			})
		else
			p1.motor:setGoal({ issueTrackerHeight = otterModule.instant(var4) })
		end
		if p1.props.onAnimationStateChangeCallback then
			p1.props.onAnimationStateChangeCallback(p1.props.textInputType, true)
		end
	end
end

function collapsingTextInputValidator.willUnmount(p1)
	p1.isMounted = false
	p1.motor:destroy()
	
	if p1.foundationTextBoxProxy ~= nil and p1.props.textBoxRef ~= nil and p1.props.textBoxRef.current == p1.foundationTextBoxProxy then
		p1.props.textBoxRef.current = nil
		p1.foundationTextBoxProxy = nil
	end
end

function collapsingTextInputValidator.render(p1)
	-- upvalues: authStatefulRoundCornerBorder (ref), fFlagAuthValidatorStyleOverrides (ref), withStyle (ref), getFFlagLuaAppEnable10ftSignUpView (ref), withLocalization (ref), roactModule (ref), fitChildren (ref), inputLabel (ref), fitTextLabel (ref), loading (ref), iconSize (ref), getFFlagEnableAuditForSinglePageSignUp (ref), registerAuditContent (ref), getFFlagEnableAuthStatefulTextInputUpdates (ref), issueTracker (ref), fFlagSignUpTrackFailedRequest (ref)
	local layoutOrder = p1.props.layoutOrder
	local titleTextKey = p1.props.titleTextKey
	local summaryErrorTextKey = p1.props.summaryErrorTextKey
	local validator = p1.props.validator
	local validatorAdditionalProps = p1.props.validatorAdditionalProps
	local inputTextToValidate = p1.state.inputTextToValidate
	local tokens = p1.props.tokens
	
	if not p1.props.prerequisiteMet then
		inputTextToValidate = ""
	end
	local default = authStatefulRoundCornerBorder.BorderState.Default
	
	if p1.isInErrorState() then
		default = authStatefulRoundCornerBorder.BorderState.Error
	elseif p1.state.textBoxFocused then
		default = authStatefulRoundCornerBorder.BorderState.Focused
	elseif p1.state.textBoxHover then
		default = authStatefulRoundCornerBorder.BorderState.Hover
	end
	local var1 = p1:isUsingFoundationTextInput()
	local paddingTopOverride = nil
	local useTrailingPadding = nil
	local colorContentOverride = nil
	local useFoundationTitle = nil
	local foundationTitleSize = nil
	local foundationTitleIsRequired = nil
	
	if fFlagAuthValidatorStyleOverrides then
		paddingTopOverride = p1.props.paddingTopOverride
		useTrailingPadding = p1.props.useTrailingPadding
		colorContentOverride = p1.props.colorContentOverride
		useFoundationTitle = p1.props.useFoundationTitle
		foundationTitleSize = p1.props.foundationTitleSize
		foundationTitleIsRequired = p1.props.foundationTitleIsRequired
	end
	return withStyle(function(p2)
		-- upvalues: p1 (ref), getFFlagLuaAppEnable10ftSignUpView (copy), tokens (ref), withLocalization (copy), titleTextKey (ref), summaryErrorTextKey (ref), roactModule (copy), fitChildren (copy), layoutOrder (ref), paddingTopOverride (write), useTrailingPadding (write), useFoundationTitle (write), inputLabel (copy), foundationTitleIsRequired (write), foundationTitleSize (write), fitTextLabel (copy), var1 (ref), authStatefulRoundCornerBorder (copy), default (write), loading (copy), iconSize (copy), getFFlagEnableAuditForSinglePageSignUp (copy), registerAuditContent (copy), getFFlagEnableAuthStatefulTextInputUpdates (copy), issueTracker (copy), validator (ref), validatorAdditionalProps (ref), inputTextToValidate (write), fFlagSignUpTrackFailedRequest (copy), colorContentOverride (write)
		local var2 = p2.Font.BaseSize * p2.Font.CaptionHeader.RelativeSize
		local contentGap = p1.getContentGap()
		
		if getFFlagLuaAppEnable10ftSignUpView() and tokens then
			var2 = tokens.textCaptionHeaderSize
		end
		return withLocalization({
			titleText = titleTextKey,
			summaryErrorText = summaryErrorTextKey
		})(function(p3)
			-- upvalues: roactModule (copy), fitChildren (copy), layoutOrder (copy), p1 (copy), contentGap (ref), paddingTopOverride (copy), useTrailingPadding (copy), useFoundationTitle (copy), inputLabel (copy), foundationTitleIsRequired (copy), foundationTitleSize (copy), fitTextLabel (copy), p2 (ref), var2 (write), var1 (copy), authStatefulRoundCornerBorder (copy), getFFlagLuaAppEnable10ftSignUpView (copy), tokens (copy), default (copy), loading (copy), iconSize (copy), getFFlagEnableAuditForSinglePageSignUp (copy), registerAuditContent (copy), titleTextKey (copy), getFFlagEnableAuthStatefulTextInputUpdates (copy), issueTracker (copy), validator (copy), validatorAdditionalProps (copy), inputTextToValidate (copy), fFlagSignUpTrackFailedRequest (copy), colorContentOverride (copy)
			local createElement_1
			local createElement = roactModule.createElement
			local fitFrame = fitChildren.FitFrame
			local t = {
				LayoutOrder = layoutOrder,
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = fitChildren.FitAxis.Height,
				BackgroundTransparency = 1,
				[roactModule.Ref] = p1.getFrameRef(),
				[roactModule.Change.AbsolutePosition] = p1.onPositionChanged
			}
			local t_1 = {
				UIListLayout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, contentGap)
				}),
				Padding = roactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, paddingTopOverride or 5),
					PaddingBottom = if useTrailingPadding then p1.issueTrailingPadding else UDim.new(0, if p1.props.paddingBottomOverride then p1.props.paddingBottomOverride else 5)
				}),
				Title = if useFoundationTitle then roactModule.createElement(inputLabel, {
					LayoutOrder = 0,
					Text = p3.titleText or "",
					isRequired = foundationTitleIsRequired,
					size = foundationTitleSize
				}) else roactModule.createElement(fitTextLabel, {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = fitChildren.FitAxis.Height,
					Text = p3.titleText or "",
					Font = p2.Font.CaptionHeader.Font,
					TextSize = var2,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					TextTransparency = p2.Theme.TextEmphasis.Transparency,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}
			
			if var1 then
				createElement_1 = roactModule.createElement(p1.textInputBoxFoundation)
			else
				createElement_1 = roactModule.createElement
				createElement_1 = createElement_1(authStatefulRoundCornerBorder, {
					layoutOrder = 1,
					size = UDim2.new(1, 0, 0, if getFFlagLuaAppEnable10ftSignUpView() and tokens then tokens.textboxHeight else 36),
					borderState = default
				}, {
					textbox = roactModule.createElement(p1.textInputBoxWithBorder),
					loadingSpinner = if p1.props.shouldShowLoadingIcon then roactModule.createElement(loading, {
						size = iconSize.Small,
						Position = UDim2.new(1, -22, 0.5, 0),
						AnchorPoint = Vector2.new(0.5, 0.5)
					}) else nil
				})
			end
			t_1.TextInputBox = createElement_1
			t_1.RegisterTitleAuditContent = if getFFlagEnableAuditForSinglePageSignUp() and p1.props.enableAuditContentCapture and registerAuditContent then roactModule.createElement(registerAuditContent, {
				translationKey = titleTextKey,
				translatedSourceString = p3.titleText
			}) else nil
			t_1.AnimatedWrapper = roactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				ClipsDescendants = true,
				Size = p1.issueTrackerHeight
			}, {
				Padding = roactModule.createElement("UIPadding", {
					PaddingRight = UDim.new(0, 12),
					PaddingLeft = if getFFlagEnableAuthStatefulTextInputUpdates() then UDim.new(0, 0) else UDim.new(0, 12)
				}),
				IssueSummaryWrapper = roactModule.createElement(fitChildren.FitFrame, {
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = fitChildren.FitAxis.Height,
					BackgroundTransparency = 1,
					[roactModule.Change.AbsoluteSize] = p1.onIssueSummarySizeChange
				}, {
					IssueSummaryText = p1.isInErrorState() and roactModule.createElement(fitTextLabel, {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = fitChildren.FitAxis.Height,
						Text = p3.summaryErrorText or "",
						Font = p2.Font.CaptionBody.Font,
						TextSize = p2.Font.BaseSize * p2.Font.CaptionBody.RelativeSize,
						TextColor3 = p2.Theme.Alert.Color,
						TextTransparency = p1.issueSummaryTextTransparency,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				}),
				IssueTrackerWrapper = roactModule.createElement(fitChildren.FitFrame, {
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = fitChildren.FitAxis.Height,
					BackgroundTransparency = 1,
					[roactModule.Change.AbsoluteSize] = p1.onIssueFullListSizeChange
				}, {
					IssueTracker = roactModule.createElement(issueTracker, {
						validator = validator,
						validatorAdditionalProps = validatorAdditionalProps,
						textToValidate = inputTextToValidate,
						onTextValidated = p1.onTextValidated,
						contentTransparency = p1.issueFullListTextTransparency,
						checkmarkTransparency = p1.issueCheckmarkTransparency,
						updateIssueCondition = p1.props.updateIssueCondition,
						debounceTime = if fFlagSignUpTrackFailedRequest then p1.props.debounceTime else nil,
						colorContentOverride = colorContentOverride
					})
				})
			})
			
			return createElement(fitFrame, t, t_1)
		end)
	end)
end

return collapsingTextInputValidator