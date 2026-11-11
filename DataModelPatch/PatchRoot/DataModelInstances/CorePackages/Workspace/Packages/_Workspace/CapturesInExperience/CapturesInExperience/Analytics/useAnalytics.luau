local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local CapturesContextModule = require(Parent.Context.CapturesContext)

return function()
	-- upvalues: ReactModule (copy), CapturesContextModule (copy)
	return {
		fireEvent = ReactModule.useContext(CapturesContextModule).fireAnalyticsEvent
	}
end