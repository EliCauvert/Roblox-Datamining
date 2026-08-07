local roactModule = require(script.Parent.Parent.Roact)
local storeContextModule = require(script.Parent.StoreContext)
local storeProvider = roactModule.Component:extend("StoreProvider")

function storeProvider.validateProps(p0) --[[ line: 7 ]]
	if p0.store == nil then
		return false, "Error initializing StoreProvider. Expected a `store` prop to be a Rodux store."
	end
	return true
end

function storeProvider.init(p1, p2) --[[ line: 15 ]]
	p1.store = p2.store
end

function storeProvider.render(p3) --[[ line: 19 ]]
	-- upvalues: roactModule (ref), storeContextModule (ref)
	return roactModule.createElement(storeContextModule.Provider, { value = p3.store }, roactModule.oneChild(p3.props[roactModule.Children]))
end

return storeProvider