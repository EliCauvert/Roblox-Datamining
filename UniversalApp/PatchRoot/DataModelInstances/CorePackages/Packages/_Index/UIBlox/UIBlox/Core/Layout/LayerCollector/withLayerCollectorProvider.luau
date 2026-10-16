local RoactModule = require(script.Parent.Parent.Parent.Parent.Parent.Roact)
local LayerCollectorContextModule = require(script.Parent.LayerCollectorContext)

return function(Render) --[[ Line: 9 | Named "LayerCollectorConsumer" ]]
	-- upvalues: RoactModule (copy), LayerCollectorContextModule (copy)
	return RoactModule.createElement(LayerCollectorContextModule.Consumer, { render = Render })
end