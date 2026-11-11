local ReactModule = require(game:GetService("CorePackages").Packages.React)
local HandleMouseCursorModule = require(script.Parent.handleMouseCursor)

return function()
	-- upvalues: ReactModule (copy), HandleMouseCursorModule (copy)
	ReactModule.useEffect(function()
		-- upvalues: HandleMouseCursorModule (upval)
		return HandleMouseCursorModule()
	end, {})
	
	return nil
end