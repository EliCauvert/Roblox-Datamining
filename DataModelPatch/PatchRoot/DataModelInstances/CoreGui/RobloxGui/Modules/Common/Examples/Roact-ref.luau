local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local App = RoactModule.Component:extend("App")

function App.init(p1)
	-- upvalues: RoactModule (copy)
	p1.ref = RoactModule.createRef()
end

function App.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(0, 123, 0, 123),
		[RoactModule.Ref] = p1.ref
	})
end

function App.didMount(p1)
	print("Roblox Instance:", p1.ref.current)
	print("Roblox Instance Size:", p1.ref.current.Size)
end

return function()
	-- upvalues: RoactModule (copy), App (copy)
	RoactModule.mount(RoactModule.createElement(App), nil, "SomeName")
end