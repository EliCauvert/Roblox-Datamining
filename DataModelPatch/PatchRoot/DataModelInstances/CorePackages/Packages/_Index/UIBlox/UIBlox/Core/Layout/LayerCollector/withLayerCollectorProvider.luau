local RoactModule = require(script.Parent.Parent.Parent.Parent.Parent.Roact)
local LayerCollectorContextModule = require(script.Parent.LayerCollectorContext)

return function(Render)
	-- upvalues: RoactModule (copy), LayerCollectorContextModule (copy)
	return RoactModule.createElement(LayerCollectorContextModule.Consumer, { render = Render })
end