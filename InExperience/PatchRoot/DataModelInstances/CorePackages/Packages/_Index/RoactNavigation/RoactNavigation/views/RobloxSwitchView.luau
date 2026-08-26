local parent = script.Parent
local parent_1 = parent.Parent.Parent
local object = require(parent_1.LuauPolyfill).Object
local reactModule = require(parent_1.React)
local sceneViewModule = require(parent.SceneView)
local t = { keepVisitedScreensMounted = false }
local robloxSwitchView = reactModule.Component:extend("RobloxSwitchView")

function robloxSwitchView.getDerivedStateFromProps(p1, p2)
	-- upvalues: object (ref), t (ref)
	local state = p1.navigation.state
	local descriptors = p1.descriptors
	local t_1 = { [state.routes[state.index].key] = true }
	
	if object.assign(table.clone(t), p1.navigationConfig or {}).keepVisitedScreensMounted and p2.visitedScreenKeys then
		for i in p2.visitedScreenKeys do
			if descriptors[i] ~= nil then
				t_1[i] = true
			end
		end
	end
	return { visitedScreenKeys = t_1 }
end

function robloxSwitchView.init(p3)
	p3.state = {}
end

function robloxSwitchView.render(p3)
	-- upvalues: reactModule (ref), sceneViewModule (ref)
	local state = p3.props.navigation.state
	local screenProps = p3.props.screenProps
	local descriptors = p3.props.descriptors
	local visitedScreenKeys = p3.state.visitedScreenKeys
	local key = state.routes[state.index].key
	local t = {}
	
	for i, v in descriptors do
		local var1 = i == key
		
		if visitedScreenKeys[i] == true then
			t["card_" .. i] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = false,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Visible = var1
			}, {
				Content = reactModule.createElement(sceneViewModule, {
					component = v.getComponent(),
					navigation = v.navigation,
					screenProps = screenProps
				})
			})
		end
	end
	return reactModule.createElement("Folder", nil, t)
end

return robloxSwitchView