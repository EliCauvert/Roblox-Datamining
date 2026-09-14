local parent = script:FindFirstAncestor("AuthSignup").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local scrollBarVisibility = foundationModule.Enums.ScrollBarVisibility
local authAnalyticsModule = require(parent.AuthAnalytics)
local usernameSuggestionShown = authAnalyticsModule.Events.usernameSuggestionShown
local eventStreamConstants = authAnalyticsModule.EventStreamConstants

return function(p1)
	-- upvalues: reactModule (ref), foundationModule (ref), usernameSuggestionShown (ref), eventStreamConstants (ref), view (ref), scrollBarVisibility (ref)
	local t = {}
	
	for i, v in ipairs(p1.suggestionUsernames) do
		t[i] = reactModule.createElement(foundationModule.Pill, {
			isDisabled = false,
			text = v,
			onActivated = function()
				-- upvalues: p1 (ref), v (ref)
				p1.onUsernameSelected(v)
			end
		})
	end
	reactModule.useEffect(function()
		-- upvalues: usernameSuggestionShown (copy), p1 (ref), eventStreamConstants (copy)
		usernameSuggestionShown(p1.eventContext, p1.inputUsername, p1.suggestionUsernames, eventStreamConstants.Field.Username)
	end, {})
	
	return reactModule.createElement(view, {
		LayoutOrder = p1.layoutOrder,
		tag = { ["size-full-1100 padding-y-small"] = true }
	}, {
		reactModule.createElement(foundationModule.ScrollView, {
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.XY,
				CanvasSize = UDim2.fromOffset(0, 0),
				ScrollingDirection = Enum.ScrollingDirection.X,
				scrollBarVisibility = scrollBarVisibility.None
			},
			tag = { ["row gap-small no-wrap size-full-1000"] = true }
		}, t)
	})
end