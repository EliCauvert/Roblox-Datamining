local parent = script.Parent.Parent
local reactModule = require(parent.Parent.React)
local capturesContextModule = require(parent.Context.CapturesContext)

return function()
	-- upvalues: reactModule (ref), capturesContextModule (ref)
	return {
		fireEvent = reactModule.useContext(capturesContextModule).fireAnalyticsEvent
	}
end