local roactModule = require(script.Parent.Parent.Parent.Parent.Parent.Roact)
local layerCollectorContextModule = require(script.Parent.LayerCollectorContext)

return function(p1)
	-- upvalues: roactModule (ref), layerCollectorContextModule (ref)
	return roactModule.createElement(layerCollectorContextModule.Consumer, { render = p1 })
end