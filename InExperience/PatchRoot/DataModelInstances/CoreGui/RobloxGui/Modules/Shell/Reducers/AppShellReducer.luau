local _ = game:GetService("CorePackages")
local screenListModule = require(script.Parent.ScreenList)

return function(p0, p1)
	-- upvalues: screenListModule (ref)
	return { ScreenList = screenListModule((p0 or {}).ScreenList, p1) }
end