local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local RoduxModule = require(CorePackages.Packages.Rodux)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local v1 = RoactRoduxModule.connect(function(p1, _)
	return { location = p1.location }
end, function(Callback)
	return {
		onClick = function(Location)
			-- upvalues: Callback (copy)
			Callback({ type = "Navigate", location = Location })
		end
	}
end)(function(p1)
	-- upvalues: RoactModule (copy)
	local OnClickFunction = p1.onClick
	
	return RoactModule.createElement("TextButton", {
		Size = UDim2.new(0, 100, 0, 30),
		Text = p1.text,
		[RoactModule.Event.Activated] = function()
			-- upvalues: OnClickFunction (copy), p1 (copy)
			OnClickFunction(p1.target)
		end
	})
end)
local v2 = RoactRoduxModule.connect(function(p1, _)
	return { enabled = #p1.history > 0 }
end, function(Callback)
	return {
		onClick = function()
			-- upvalues: Callback (copy)
			Callback({ type = "Back" })
		end
	}
end)(function(p1)
	-- upvalues: RoactModule (copy)
	local Enabled = p1.enabled
	
	return RoactModule.createElement("TextButton", {
		Size = UDim2.new(0, 30, 0, 30),
		Text = "<",
		AutoButtonColor = Enabled,
		BackgroundColor3 = Enabled and Color3.new(0.8, 0.8, 0.8) or Color3.new(0.5, 0.5, 0.5),
		[RoactModule.Event.Activated] = p1.onClick
	})
end)
local v3 = RoactRoduxModule.connect(function(p1, _)
	return { current = p1.current }
end, nil)(function(p1)
	-- upvalues: RoactModule (copy)
	local Component = p1.component
	
	return if p1.current == p1.match then RoactModule.createElement(Component) else nil
end)

local function NavBar()
	-- upvalues: RoactModule (copy), v2 (ref), v1 (ref)
	return RoactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 0, 30),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = Color3.new(1, 1, 1)
	}, {
		Layout = RoactModule.createElement("UIListLayout", { FillDirection = Enum.FillDirection.Horizontal }),
		Back = RoactModule.createElement(v2),
		GoHome = RoactModule.createElement(v1, { text = "Go to Home", target = "home" }),
		GoAbout = RoactModule.createElement(v1, { text = "Go to About", target = "about" }),
		GoContact = RoactModule.createElement(v1, { text = "Go to Contact", target = "contact" })
	})
end

local function Home()
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("TextLabel", {
		Text = "Home",
		TextSize = 30,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(0.5, 0.3, 0.7),
		TextColor3 = Color3.new(0.95, 0.95, 0.95)
	})
end

local function About()
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("TextLabel", {
		Text = "About",
		TextSize = 30,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(0.5, 0.6, 0.2),
		TextColor3 = Color3.new(0.95, 0.95, 0.95)
	})
end

local function Contact()
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("TextLabel", {
		Text = "Contact",
		TextSize = 30,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = Color3.new(0.8, 0.3, 0.4),
		TextColor3 = Color3.new(0.95, 0.95, 0.95)
	})
end

local App = RoactModule.Component:extend("App")

function App:render()
	-- upvalues: RoactModule (copy), v3 (ref), Home (copy), About (copy), Contact (copy), NavBar (copy)
	return RoactModule.createElement("ScreenGui", {}, {
		Body = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, 600, 0, 400),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5)
		}, {
			Home = RoactModule.createElement(v3, { match = "home", component = Home }),
			About = RoactModule.createElement(v3, { match = "about", component = About }),
			Contact = RoactModule.createElement(v3, { match = "contact", component = Contact }),
			NavBar = RoactModule.createElement(NavBar)
		})
	})
end

local function reducer(p1, p2)
	-- upvalues: CryoModule (copy)
	local P11 = p1 or { current = "home", history = {} }
	
	if p2.type == "Navigate" then
		if P11.current ~= p2.location then
			return {
				current = p2.location,
				history = CryoModule.List.join(P11.history, { P11.current })
			}
		end
	elseif p2.type == "Back" then
		local CountHistory = #P11.history
		
		return if CountHistory == 0 then P11 else {
			current = P11.history[CountHistory],
			history = CryoModule.List.removeIndex(P11.history, CountHistory)
		}
	end
	return P11
end

return function()
	-- upvalues: RoduxModule (copy), reducer (copy), RoactModule (copy), RoactRoduxModule (copy), App (copy), CoreGui (copy)
	RoactModule.mount(RoactModule.createElement(RoactRoduxModule.StoreProvider, { store = RoduxModule.Store.new(reducer) }, { App = RoactModule.createElement(App) }), CoreGui, "Roact-router")
end