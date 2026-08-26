local _ = game:GetService("CorePackages")
local screenListModule = require(script.Parent.ScreenList)

return function(p1, p2)
	-- upvalues: screenListModule (ref)
	return { ScreenList = screenListModule((p1 or {}).ScreenList, p2) }
end