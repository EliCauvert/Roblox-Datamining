local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local PageObjectManagerProvider = RoactModule.Component:extend("PageObjectManagerProvider")
local Context = RoactModule.createContext(nil)

function PageObjectManagerProvider.render(p1)
	-- upvalues: RoactModule (copy), Context (copy)
	return RoactModule.createElement(Context.Provider, { value = p1.props.pageObjectManager }, p1.props[RoactModule.Children])
end

return {
	Provider = PageObjectManagerProvider,
	Consumer = Context.Consumer
}