local RoactModule = require(script.Parent.Parent.Roact)
local StoreContextModule = require(script.Parent.StoreContext)
local StoreProvider = RoactModule.Component:extend("StoreProvider")

function StoreProvider.validateProps(p1)
	if p1.store == nil then
		return false, "Error initializing StoreProvider. Expected a `store` prop to be a Rodux store."
	else
		return true
	end
end

function StoreProvider.init(p1, p2)
	p1.store = p2.store
end

function StoreProvider.render(p1)
	-- upvalues: RoactModule (copy), StoreContextModule (copy)
	return RoactModule.createElement(StoreContextModule.Provider, { value = p1.store }, RoactModule.oneChild(p1.props[RoactModule.Children]))
end

return StoreProvider