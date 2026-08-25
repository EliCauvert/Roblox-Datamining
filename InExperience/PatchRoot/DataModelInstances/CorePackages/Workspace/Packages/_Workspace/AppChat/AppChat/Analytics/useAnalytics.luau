local reactModule = require(script.Parent.Parent.Parent.React)
local roactChatAnalyticsContextModule = require(script.Parent.RoactChatAnalyticsContext)

return function()
	-- upvalues: reactModule (ref), roactChatAnalyticsContextModule (ref)
	return reactModule.useContext(roactChatAnalyticsContextModule)
end