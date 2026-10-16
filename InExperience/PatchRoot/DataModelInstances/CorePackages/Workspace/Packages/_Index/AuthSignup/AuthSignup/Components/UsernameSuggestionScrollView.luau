local Parent = script:FindFirstAncestor("AuthSignup").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local UsernameSuggestionShownFunction = AuthAnalyticsModule.Events.usernameSuggestionShown
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants

return function(p1) --[[ Line: 19 ]]
	-- upvalues: ReactModule (copy), FoundationModule (copy), UsernameSuggestionShownFunction (copy), EventStreamConstants (copy), View (copy), ScrollBarVisibility (copy)
	local Elements = {}
	
	for i, suggestionUsername in ipairs(p1.suggestionUsernames) do
		Elements[i] = ReactModule.createElement(FoundationModule.Pill, {
			isDisabled = false,
			text = suggestionUsername,
			onActivated = function() --[[ Line: 25 ]]
				-- upvalues: p1 (copy), suggestionUsername (copy)
				p1.onUsernameSelected(suggestionUsername)
			end
		})
	end
	ReactModule.useEffect(function() --[[ Line: 32 ]]
		-- upvalues: UsernameSuggestionShownFunction (upval), p1 (copy), EventStreamConstants (upval)
		UsernameSuggestionShownFunction(p1.eventContext, p1.inputUsername, p1.suggestionUsernames, EventStreamConstants.Field.Username)
	end, {})
	
	return ReactModule.createElement(View, {
		LayoutOrder = p1.layoutOrder,
		tag = { ["size-full-1100 padding-y-small"] = true }
	}, {
		ReactModule.createElement(FoundationModule.ScrollView, {
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.XY,
				CanvasSize = UDim2.fromOffset(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = ScrollBarVisibility.None
			},
			tag = { ["row gap-small no-wrap size-full-1000"] = true }
		}, Elements)
	})
end