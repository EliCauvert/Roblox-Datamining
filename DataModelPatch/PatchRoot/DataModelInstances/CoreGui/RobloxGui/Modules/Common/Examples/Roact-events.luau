local CoreGui = game:GetService("CoreGui")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local App = RoactModule.Component:extend("App")

function App:render()
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("ScreenGui", {}, {
		Button = RoactModule.createElement("TextButton", {
			Size = UDim2.new(0.5, 0, 0.5, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			[RoactModule.Event.Activated] = function(_)
				print("The button was clicked!")
			end
		})
	})
end

return function()
	-- upvalues: RoactModule (copy), App (copy), CoreGui (copy)
	RoactModule.mount(RoactModule.createElement(App), CoreGui, "Roact-events")
end