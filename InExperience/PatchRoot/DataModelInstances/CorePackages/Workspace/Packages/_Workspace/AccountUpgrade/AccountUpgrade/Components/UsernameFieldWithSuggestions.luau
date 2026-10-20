local AccountUpgrade = script:FindFirstAncestor("AccountUpgrade")
local Parent = AccountUpgrade.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local AuthSignupModule = require(Parent.AuthSignup)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local UsernameSuggestionShownFunction = AuthAnalyticsModule.Events.usernameSuggestionShown
local FFlagAccountUpgradeOAuthTelemetryModule = require(AccountUpgrade.Flags.FFlagAccountUpgradeOAuthTelemetry)
local CollapsingTextInputValidator = AuthSignupModule.Components.CollapsingTextInputValidator
local UsernameValidator = AuthSignupModule.Thunks.UsernameValidator
local View = FoundationModule.View
local Text = FoundationModule.Text
local Chip = FoundationModule.Chip
local InputSize = FoundationModule.Enums.InputSize
local InputLabelSize = FoundationModule.Enums.InputLabelSize

local function UsernameSuggestionList(Frame)
	-- upvalues: ReactModule (copy), Chip (copy), UsernameSuggestionShownFunction (copy), EventStreamConstants (copy), View (copy), Text (copy)
	local Elements = {}
	
	for LayoutOrder, suggestionUsername in ipairs(Frame.suggestionUsernames) do
		Elements[`Suggestion{LayoutOrder}`] = ReactModule.createElement(Chip, {
			text = suggestionUsername,
			onActivated = function()
				-- upvalues: Frame (copy), suggestionUsername (copy)
				Frame.onUsernameSelected(suggestionUsername)
			end,
			LayoutOrder = LayoutOrder
		})
	end
	ReactModule.useEffect(function()
		-- upvalues: UsernameSuggestionShownFunction (upval), Frame (copy), EventStreamConstants (upval)
		UsernameSuggestionShownFunction(Frame.eventContext, Frame.inputUsername, Frame.suggestionUsernames, EventStreamConstants.Field.Username)
	end, {})
	
	return ReactModule.createElement(View, {
		tag = "row align-y-top gap-small size-full-0 auto-y padding-top-large",
		testId = "AccountUpgradeUsernameSuggestions",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Prompt = if Frame.promptText == nil or Frame.promptText == "" then nil else ReactModule.createElement(Text, {
			tag = "auto-xy text-body-small text-align-x-left content-emphasis",
			LayoutOrder = 1,
			testId = "AccountUpgradeUsernameSuggestionsPrompt",
			Text = Frame.promptText
		}),
		Options = ReactModule.createElement(View, {
			tag = "col align-x-left gap-small auto-xy",
			LayoutOrder = 2
		}, Elements)
	})
end

return function(Frame)
	-- upvalues: ReactModule (copy), View (copy), CollapsingTextInputValidator (copy), UsernameValidator (copy), InputSize (copy), InputLabelSize (copy), UsernameSuggestionList (copy), FFlagAccountUpgradeOAuthTelemetryModule (copy), EventStreamConstants (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local OnSuggestionSelectedFunction = Frame.onSuggestionSelected
	local UpdatePillClickedFunction = Frame.updatePillClicked
	local UseResult = ReactModule.useCallback(function(Text)
		-- upvalues: UpdatePillClickedFunction (copy), UseRefResult (copy), OnSuggestionSelectedFunction (copy)
		if UpdatePillClickedFunction ~= nil then
			UpdatePillClickedFunction()
		end
		local Current = UseRefResult.current
		
		if Current ~= nil then
			Current.Text = Text
		end
		if OnSuggestionSelectedFunction ~= nil then
			OnSuggestionSelectedFunction(Text)
		end
	end, { OnSuggestionSelectedFunction, UpdatePillClickedFunction })
	local Suggestions = Frame.suggestions or {}
	
	return ReactModule.createElement(View, {
		tag = "col size-full-0 auto-y",
		testId = "AccountUpgradeUsernameField",
		LayoutOrder = Frame.LayoutOrder
	}, {
		Validator = ReactModule.createElement(CollapsingTextInputValidator, {
			layoutOrder = 1,
			useFoundationTitle = true,
			foundationTitleIsRequired = true,
			paddingTopOverride = 0,
			useTrailingPadding = true,
			titleTextKey = Frame.titleTextKey,
			summaryErrorTextKey = Frame.summaryErrorTextKey,
			prerequisiteMet = Frame.isPrerequisiteMet,
			placeholderText = Frame.placeholderText,
			prefilledText = Frame.prefilledUsername,
			textInputType = Enum.TextInputType.Username,
			returnKeyType = Enum.ReturnKeyType.Next,
			validator = UsernameValidator,
			validatorAdditionalProps = Frame.validatorAdditionalProps,
			onInputTextChanged = Frame.onTextChanged,
			onInputTextValidated = Frame.onTextValidated,
			textBoxFocusedCallback = Frame.onFocused,
			updateIssueCondition = Frame.onIssueConditionChanged,
			textBoxRef = UseRefResult,
			pillClicked = Frame.pillClicked,
			resetPillClicked = Frame.resetPillClicked,
			useFoundationTextInput = Frame.useFoundationTextInput,
			foundationInputSize = Frame.inputSize or InputSize.Medium,
			foundationTitleSize = Frame.titleSize or InputLabelSize.Medium,
			foundationTitleIsBold = Frame.isTitleBold,
			contentGapOverride = Frame.contentGap,
			colorContentOverride = Frame.colorContentOverride
		}),
		Suggestions = if #Suggestions > 0 and OnSuggestionSelectedFunction ~= nil then ReactModule.createElement(UsernameSuggestionList, {
			LayoutOrder = 2,
			inputUsername = Frame.username,
			suggestionUsernames = Suggestions,
			promptText = Frame.suggestionPrompt,
			eventContext = if FFlagAccountUpgradeOAuthTelemetryModule and Frame.eventContext then Frame.eventContext else EventStreamConstants.Context.SinglePageSignUpScreen,
			onUsernameSelected = UseResult
		}) else nil
	})
end