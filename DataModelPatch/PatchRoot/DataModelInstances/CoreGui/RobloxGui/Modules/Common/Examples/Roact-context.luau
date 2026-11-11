local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local ContextProvider = RoactModule.Component:extend("ContextProvider")

function ContextProvider.init(p1)
	p1._context = { someValue = 5 }
end

function ContextProvider.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.oneChild(p1.props[RoactModule.Children])
end

local ContextReader = RoactModule.Component:extend("ContextReader")

function ContextReader.init(p1)
	print("Context value of", p1._context.someValue)
end

function ContextReader:render()
	return nil
end

return function()
	-- upvalues: RoactModule (copy), ContextProvider (copy), ContextReader (copy)
	RoactModule.mount(RoactModule.createElement(ContextProvider, {}, { SomeChild = RoactModule.createElement(ContextReader) }), nil, "SomeName")
end