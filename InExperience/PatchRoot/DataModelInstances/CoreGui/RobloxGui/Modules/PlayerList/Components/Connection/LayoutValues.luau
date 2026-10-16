local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local LayoutValuesContextModule = require(script.Parent.LayoutValuesContext)

return {
	Provider = function(p1) --[[ Line: 7 ]]
		-- upvalues: RoactModule (copy), LayoutValuesContextModule (copy)
		return RoactModule.createElement(LayoutValuesContextModule.Provider, { value = p1.layoutValues }, RoactModule.oneChild(p1[RoactModule.Children]))
	end,
	Consumer = LayoutValuesContextModule.Consumer,
	WithLayoutValues = function(Callback) --[[ Line: 13 ]]
		-- upvalues: RoactModule (copy), LayoutValuesContextModule (copy)
		assert(type(Callback) == "function", "Expect withLayoutValues callback to be a function.")
		
		return RoactModule.createElement(LayoutValuesContextModule.Consumer, { render = Callback })
	end
}