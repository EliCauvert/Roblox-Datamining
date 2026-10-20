local CoreGui = game:GetService("CoreGui")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)

local function TickLabel(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("TextLabel", {
		TextSize = 48,
		Size = UDim2.new(1, 0, 1, 0),
		Text = ("Current tick is %d!"):format(p1.value)
	})
end

local App = RoactModule.Component:extend("App")

function App.init(p1)
	p1.running = false
	p1.state = { count = 0 }
end

function App.render(p1)
	-- upvalues: RoactModule (copy), TickLabel (copy)
	return RoactModule.createElement("ScreenGui", { Name = "Roact-demo-counter" }, {
		Count = RoactModule.createElement(TickLabel, { value = p1.state.count })
	})
end

function App.didMount(p1)
	spawn(function()
		-- upvalues: p1 (copy)
		p1.running = true
		while p1.running do
			p1:setState({ count = p1.state.count + 1 })
			wait(1)
		end
	end)
end

function App.willUnmount(p2)
	p2.running = false
end

return function()
	-- upvalues: RoactModule (copy), App (copy), CoreGui (copy)
	RoactModule.mount(RoactModule.createElement(App), CoreGui, "Roact-counter")
end