local Modules = game:GetService("CoreGui").RobloxGui.Modules
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local UsernameIssueModule = require(Modules.LuaApp.Components.Authentication.Enum.UsernameIssue)
local IssueConditionModule = require(Modules.LuaApp.Components.Authentication.Enum.IssueCondition)

local function shouldSuggest(IssueCondition): boolean
	-- upvalues: UsernameIssueModule (copy), IssueConditionModule (copy)
	local IsProblematicMatch = false
	
	if IssueCondition then
		IsProblematicMatch = IssueCondition[UsernameIssueModule.AlreadyInUse] == IssueConditionModule.Problematic
		for i, value in pairs(IssueCondition) do
			if i ~= UsernameIssueModule.AlreadyInUse and value == IssueConditionModule.Problematic then
				return false
			end
		end
	end
	return IsProblematicMatch
end

return function(p1)
	-- upvalues: EventStreamConstantsModule (copy), shouldSuggest (copy)
	return {
		usernameSuggestionClicked = function(p2, p3)
			-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
			p1.getAuthEventAnalytics().reportUsernameSuggestionClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.UsernameSuggestion, p2, p3)
		end,
		logRefreshButtonClicked = function()
			-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
			p1.getAuthEventAnalytics().reportButtonClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, "usernameSuggestionRefreshButton")
		end,
		usernameSuggestionsShown = function(p2, p3)
			-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
			p1.getAuthEventAnalytics().reportInteractWithActionAndSection(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.Username, EventStreamConstantsModule.ActionType.Shown, "usernameSuggestionsShown", p2, p3)
		end,
		logSuggestableUsername = function(p2)
			-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
			p1.getAuthEventAnalytics().reportInteractWithAction(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.Username, EventStreamConstantsModule.ActionType.Shown, "suggestableUsernameInput", p2)
		end,
		shouldSuggest = function()
			-- upvalues: shouldSuggest (upval), p1 (copy)
			return (shouldSuggest(p1.getIssueCondition()))
		end,
		updatePillClicked = function()
			-- upvalues: p1 (copy)
			p1.updateState({ pillClicked = true })
		end,
		resetPillClicked = function()
			-- upvalues: p1 (copy)
			p1.updateState({ pillClicked = false })
		end,
		updateIssueCondition = function(IssueCondition)
			-- upvalues: p1 (copy)
			p1.updateState({ issueCondition = IssueCondition })
		end,
		updateSuggestionControlState = function(_, SuggestionControlState)
			-- upvalues: p1 (copy)
			p1.updateState({ suggestionControlState = SuggestionControlState })
		end,
		loadSuggestions = function()
			-- upvalues: p1 (copy)
			p1.updateState({ loadingSuggestions = true })
		end,
		finishSuggestions = function()
			-- upvalues: p1 (copy)
			p1.updateState({ loadingSuggestions = false })
		end
	}
end