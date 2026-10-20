local _ = game:GetService("CorePackages")
local ScreenListModule = require(script.Parent.ScreenList)

return function(p1, p2)
	-- upvalues: ScreenListModule (copy)
	return { ScreenList = ScreenListModule((p1 or {}).ScreenList, p2) }
end