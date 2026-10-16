local parent = script:FindFirstAncestor("AccountUpgrade").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local authAnalyticsModule = require(parent.AuthAnalytics)
local authSignupModule = require(parent.AuthSignup)
local eventStreamConstants = authAnalyticsModule.EventStreamConstants
local usernameSuggestionShown = authAnalyticsModule.Events.usernameSuggestionShown
local collapsingTextInputValidator = authSignupModule.Components.CollapsingTextInputValidator
local usernameValidator = authSignupModule.Thunks.UsernameValidator
local view = foundationModule.View
local text = foundationModule.Text
local chip = foundationModule.Chip
local inputSize = foundationModule.Enums.InputSize
local inputLabelSize = foundationModule.Enums.InputLabelSize

local function UsernameSuggestionList(p1)
	-- upvalues: reactModule (ref), chip (ref), usernameSuggestionShown (ref), eventStreamConstants (ref), view (ref), text (ref)
	local t = {}
	
	for i, v in ipairs(p1.suggestionUsernames) do
		t[`Suggestion{i}`] = reactModule.createElement(chip, {
			text = v,
			onActivated = function()
				-- upvalues: p1 (ref), v (ref)
				p1.onUsernameSelected(v)
			end,
			LayoutOrder = i
		})
	end
	reactModule.useEffect(function()
		-- upvalues: usernameSuggestionShown (copy), p1 (ref), eventStreamConstants (copy)
		usernameSuggestionShown(p1.eventContext, p1.inputUsername, p1.suggestionUsernames, eventStreamConstants.Field.Username)
	end, {})
	
	return reactModule.createElement(view, {
		tag = "row align-y-top gap-small size-full-0 auto-y padding-top-large",
		testId = "AccountUpgradeUsernameSuggestions",
		LayoutOrder = p1.LayoutOrder
	}, {
		Prompt = if p1.promptText == nil or p1.promptText == "" then nil else reactModule.createElement(text, {
			tag = "auto-xy text-body-small text-align-x-left content-emphasis",
			LayoutOrder = 1,
			testId = "AccountUpgradeUsernameSuggestionsPrompt",
			Text = p1.promptText
		}),
		Options = reactModule.createElement(view, {
			tag = "col align-x-left gap-small auto-xy",
			LayoutOrder = 2
		}, t)
	})
end

return function(p2)
	-- upvalues: reactModule (ref), view (ref), collapsingTextInputValidator (ref), usernameValidator (ref), inputSize (ref), inputLabelSize (ref), UsernameSuggestionList (ref), eventStreamConstants (ref)
	local var1 = reactModule.useRef(nil)
	local onSuggestionSelected = p2.onSuggestionSelected
	local updatePillClicked = p2.updatePillClicked
	local suggestions = p2.suggestions or {}
	
	return reactModule.createElement(view, {
		tag = "col size-full-0 auto-y",
		testId = "AccountUpgradeUsernameField",
		LayoutOrder = p2.LayoutOrder
	}, {
		Validator = reactModule.createElement(collapsingTextInputValidator, {
			layoutOrder = 1,
			useFoundationTitle = true,
			foundationTitleIsRequired = true,
			paddingTopOverride = 0,
			useTrailingPadding = true,
			titleTextKey = p2.titleTextKey,
			summaryErrorTextKey = p2.summaryErrorTextKey,
			prerequisiteMet = p2.isPrerequisiteMet,
			placeholderText = p2.placeholderText,
			prefilledText = p2.prefilledUsername,
			textInputType = Enum.TextInputType.Username,
			returnKeyType = Enum.ReturnKeyType.Next,
			validator = usernameValidator,
			validatorAdditionalProps = p2.validatorAdditionalProps,
			onInputTextChanged = p2.onTextChanged,
			onInputTextValidated = p2.onTextValidated,
			updateIssueCondition = p2.onIssueConditionChanged,
			textBoxRef = var1,
			pillClicked = p2.pillClicked,
			resetPillClicked = p2.resetPillClicked,
			useFoundationTextInput = p2.useFoundationTextInput,
			foundationInputSize = inputSize.Medium,
			foundationTitleSize = inputLabelSize.Medium,
			contentGapOverride = p2.contentGap,
			colorContentOverride = p2.colorContentOverride
		}),
		Suggestions = if #suggestions > 0 and onSuggestionSelected ~= nil then reactModule.createElement(UsernameSuggestionList, {
			LayoutOrder = 2,
			inputUsername = p2.username,
			suggestionUsernames = suggestions,
			promptText = p2.suggestionPrompt,
			eventContext = eventStreamConstants.Context.SinglePageSignUpScreen,
			onUsernameSelected = reactModule.useCallback(function(p3)
				-- upvalues: updatePillClicked (ref), var1 (ref), onSuggestionSelected (ref)
				if updatePillClicked ~= nil then
					updatePillClicked()
				end
				local current = var1.current
				
				if current ~= nil then
					current.Text = p3
				end
				if onSuggestionSelected ~= nil then
					onSuggestionSelected(p3)
				end
			end, { onSuggestionSelected, updatePillClicked })
		}) else nil
	})
end