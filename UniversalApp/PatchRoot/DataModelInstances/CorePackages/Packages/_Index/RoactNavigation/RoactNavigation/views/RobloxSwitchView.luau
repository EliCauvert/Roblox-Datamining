local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Object = require(Parent1.LuauPolyfill).Object
local ReactModule = require(Parent1.React)
local SceneViewModule = require(Parent.SceneView)
local config = { keepVisitedScreensMounted = false }
local RobloxSwitchView = ReactModule.Component:extend("RobloxSwitchView")

function RobloxSwitchView.getDerivedStateFromProps(p1, p2)
	-- upvalues: Object (copy), config (copy)
	local State = p1.navigation.state
	local Descriptors = p1.descriptors
	local VisitedScreenKeys = { [State.routes[State.index].key] = true }
	
	if Object.assign(table.clone(config), p1.navigationConfig or {}).keepVisitedScreensMounted and p2.visitedScreenKeys then
		for visitedScreenKey in p2.visitedScreenKeys do
			if Descriptors[visitedScreenKey] ~= nil then
				VisitedScreenKeys[visitedScreenKey] = true
			end
		end
	end
	return { visitedScreenKeys = VisitedScreenKeys }
end

function RobloxSwitchView.init(p3)
	p3.state = {}
end

function RobloxSwitchView.render(p3)
	-- upvalues: ReactModule (copy), SceneViewModule (copy)
	local State = p3.props.navigation.state
	local ScreenProps = p3.props.screenProps
	local VisitedScreenKeys = p3.state.visitedScreenKeys
	local Key = State.routes[State.index].key
	local Frames = {}
	
	for i, descriptor in p3.props.descriptors do
		local IsKeyMatch = i == Key
		
		if VisitedScreenKeys[i] == true then
			Frames["card_" .. i] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = false,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Visible = IsKeyMatch
			}, {
				Content = ReactModule.createElement(SceneViewModule, {
					component = descriptor.getComponent(),
					navigation = descriptor.navigation,
					screenProps = ScreenProps
				})
			})
		end
	end
	return ReactModule.createElement("Folder", nil, Frames)
end

return RobloxSwitchView