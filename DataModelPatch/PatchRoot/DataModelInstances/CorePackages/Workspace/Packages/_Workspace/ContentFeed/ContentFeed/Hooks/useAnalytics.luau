local Parent = script.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local FeedContextModule = require(Parent.App.FeedContext)

return function()
	-- upvalues: ReactModule (copy), FeedContextModule (copy)
	return {
		fireEvent = ReactModule.useContext(FeedContextModule).fireAnalyticsEvent
	}
end