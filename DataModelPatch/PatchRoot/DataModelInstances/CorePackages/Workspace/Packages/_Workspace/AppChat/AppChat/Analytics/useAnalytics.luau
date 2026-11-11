local ReactModule = require(script.Parent.Parent.Parent.React)
local RoactChatAnalyticsContextModule = require(script.Parent.RoactChatAnalyticsContext)

return function()
	-- upvalues: ReactModule (copy), RoactChatAnalyticsContextModule (copy)
	return ReactModule.useContext(RoactChatAnalyticsContextModule)
end