local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local App = RoactModule.Component:extend("App")

function App.render(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("ScreenGui", nil, {
		Label = RoactModule.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			Text = "Count: " .. tostring(p1.props.count),
			TextSize = 48,
			AutoButtonColor = false,
			[RoactModule.Event.Activated] = p1.props.onClick
		})
	})
end

local v1 = RoactRoduxModule.connect(function(p1, _)
	return { count = p1.count }
end, function(Callback)
	print("hello?")
	
	return {
		onClick = function()
			-- upvalues: Callback (copy)
			Callback({ type = "increment" })
		end
	}
end)(App)

local function reducer(p1, p2)
	local P3 = p1 or { count = 0 }
	
	return if p2.type == "increment" then { count = P3.count + 1 } else P3
end

return function()
	-- upvalues: RoduxModule (copy), reducer (copy), RoactModule (copy), RoactRoduxModule (copy), v1 (ref), CoreGui (copy)
	RoactModule.mount(RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = RoduxModule.Store.new(reducer) }, { App = RoactModule.createElement(v1) }), CoreGui, "Roact-demo-rodux")
end