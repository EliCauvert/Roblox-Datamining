local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local capturesContextModule = require(parent.Context.CapturesContext)

return function() --[[ line: 10 ]]
	-- upvalues: reactModule (ref), capturesContextModule (ref)
	return {
		fireEvent = reactModule.useContext(capturesContextModule).fireAnalyticsEvent
	}
end