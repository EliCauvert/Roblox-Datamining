local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local layoutValuesContextModule = require(script.Parent.LayoutValuesContext)

return {
	Provider = function(p1)
		-- upvalues: roactModule (ref), layoutValuesContextModule (ref)
		return roactModule.createElement(layoutValuesContextModule.Provider, { value = p1.layoutValues }, roactModule.oneChild(p1[roactModule.Children]))
	end,
	Consumer = layoutValuesContextModule.Consumer,
	WithLayoutValues = function(p1)
		-- upvalues: roactModule (ref), layoutValuesContextModule (ref)
		assert(type(p1) == "function", "Expect withLayoutValues callback to be a function.")
		
		return roactModule.createElement(layoutValuesContextModule.Consumer, { render = p1 })
	end
}