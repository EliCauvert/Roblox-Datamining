local reactModule = require(script.Parent.Parent.Parent.Parent.Parent.React)
local layerCollectorContextModule = require(script.Parent.LayerCollectorContext)

return function()
	-- upvalues: reactModule (ref), layerCollectorContextModule (ref)
	return reactModule.useContext(layerCollectorContextModule)
end