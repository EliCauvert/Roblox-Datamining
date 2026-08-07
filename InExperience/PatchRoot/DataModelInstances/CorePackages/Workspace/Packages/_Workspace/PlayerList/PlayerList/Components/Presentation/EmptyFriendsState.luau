local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local foundationModule = require(parent_1.Foundation)
local view = foundationModule.View
local text = foundationModule.Text
local constantsModule = require(parent.Common.Constants)

return reactModule.memo(function(p0) --[[ line: 16 | named "EmptyFriendsStateImpl" ]]
	-- upvalues: reactModule (ref), view (ref), constantsModule (ref), text (ref)
	return reactModule.createElement(view, {
		tag = constantsModule.STATE_PANEL_TAG,
		LayoutOrder = p0.layoutOrder
	}, {
		Message = reactModule.createElement(text, {
			Text = "None of your friends have played this experience yet.",
			tag = "size-full-0 auto-y text-body-small text-align-x-center content-default",
			TextWrapped = true
		})
	})
end)