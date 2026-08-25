local reactModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.React)
local timersModule = require(script.Parent.Timers)
local _ = require(script.Parent.SimpleTimer)

return function(p0)
	-- upvalues: reactModule (ref), timersModule (ref)
	return reactModule.useRef(timersModule(p0)).current
end