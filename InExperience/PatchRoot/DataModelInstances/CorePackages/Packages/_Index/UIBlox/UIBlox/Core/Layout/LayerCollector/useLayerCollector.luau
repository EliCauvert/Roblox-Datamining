local ReactModule = require(script.Parent.Parent.Parent.Parent.Parent.React)
local LayerCollectorContextModule = require(script.Parent.LayerCollectorContext)

return function() --[[ Line: 9 ]]
	-- upvalues: ReactModule (copy), LayerCollectorContextModule (copy)
	return (ReactModule.useContext(LayerCollectorContextModule))
end