local ReactModule = require(script:FindFirstAncestor("SocialLuaAnalytics").Parent.React)
local TimersModule = require(script.Parent.Timers)
local _ = require(script.Parent.SimpleTimer)

return function(p1)
	-- upvalues: ReactModule (copy), TimersModule (copy)
	return ReactModule.useRef(TimersModule(p1)).current
end