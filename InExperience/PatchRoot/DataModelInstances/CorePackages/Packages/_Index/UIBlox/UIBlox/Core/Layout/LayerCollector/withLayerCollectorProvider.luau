local roactModule = require(script.Parent.Parent.Parent.Parent.Parent.Roact)
local layerCollectorContextModule = require(script.Parent.LayerCollectorContext)

return function(p0) --[[ line: 9 | named "LayerCollectorConsumer" ]]
	-- upvalues: roactModule (ref), layerCollectorContextModule (ref)
	return roactModule.createElement(layerCollectorContextModule.Consumer, { render = p0 })
end