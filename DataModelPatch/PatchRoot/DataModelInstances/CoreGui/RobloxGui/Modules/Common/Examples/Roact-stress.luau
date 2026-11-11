local CoreGui = game:GetService("CoreGui")
local RunService = game:GetService("RunService")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Node = RoactModule.Component:extend("Node")

function Node.render(p1)
	-- upvalues: RoactModule (copy)
	local X: number = p1.props.x
	local Y: number = p1.props.y
	
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(0, 10, 0, 10),
		Position = UDim2.new(0, 10 * X, 0, 10 * Y),
		BackgroundColor3 = Color3.new(math.sin(p1.props.time + X / 10 + Y / 10) * 0.5 + 0.5, 0.5, 0.5)
	})
end

local App = RoactModule.Component:extend("App")

function App.init(p1)
	p1.state = { time = tick() }
end

function App.render(p1)
	-- upvalues: RoactModule (copy), Node (copy)
	local Time = p1.state.time
	local Elements = {}
	local Count = 0
	
	for i = 0, 49 do
		for i1 = 0, 49 do
			Count += 1
			Elements[Count] = RoactModule.createElement(Node, { x = i, y = i1, time = Time })
		end
	end
	return RoactModule.createElement("ScreenGui", nil, Elements)
end

function App.didMount(p2)
	-- upvalues: RunService (copy)
	RunService.Stepped:Connect(function()
		-- upvalues: p2 (copy)
		p2:setState({ time = tick() })
	end)
end

return function()
	-- upvalues: RoactModule (copy), App (copy), CoreGui (copy)
	RoactModule.mount(RoactModule.createElement(App), CoreGui)
end