local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local AppCard = require(CorePackages.Workspace.Packages.RobloxAppNavigationCore).AppCard
local SceneView = require(CorePackages.Packages.RoactNavigation).SceneView
local FFlagAXUsePreloadingSwitchView = require(CorePackages.Workspace.Packages.AvatarExperienceFlags).FFlagAXUsePreloadingSwitchView
local config = { keepVisitedScreensMounted = false }
local PreloadingSwitchView = RoactModule.Component:extend("PreloadingSwitchView")
PreloadingSwitchView.validateProps = TModule.interface({
	navigation = TModule.interface({
		state = TModule.interface({
			index = TModule.number,
			routes = TModule.array(TModule.table)
		})
	}),
	navigationConfig = TModule.optional(TModule.interface({
		keepVisitedScreensMounted = TModule.optional(TModule.boolean)
	})),
	screenProps = TModule.optional(TModule.any),
	descriptors = TModule.table
})

function PreloadingSwitchView.getDerivedStateFromProps(p1, p2)
	-- upvalues: CryoModule (copy), config (copy)
	local State = p1.navigation.state
	local Descriptors = p1.descriptors
	local VisitedScreenKeys = { [State.routes[State.index].key] = true }
	
	if CryoModule.Dictionary.join(config, p1.navigationConfig or {}).keepVisitedScreensMounted then
		local VisitedScreenKeys1 = p2.visitedScreenKeys or {}
		for i in VisitedScreenKeys1 do
			if Descriptors[i] ~= nil then
				VisitedScreenKeys[i] = true
			end
		end
	end
	return { visitedScreenKeys = VisitedScreenKeys }
end

local function _(p3)
	return p3.options and p3.options.alwaysRendered
end

function PreloadingSwitchView.render(p3)
	-- upvalues: FFlagAXUsePreloadingSwitchView (copy), RoactModule (copy), AppCard (copy), SceneView (copy)
	local State = p3.props.navigation.state
	local ScreenProps = p3.props.screenProps
	local VisitedScreenKeys = p3.state.visitedScreenKeys
	local Key = State.routes[State.index].key
	local Elements = {}
	
	for i, descriptor in p3.props.descriptors do
		local IsKeyMatch = i == Key
		
		if VisitedScreenKeys[i] == true or descriptor.options and descriptor.options.alwaysRendered then
			Elements["card_" .. i] = if FFlagAXUsePreloadingSwitchView then RoactModule.createElement(AppCard, {
				isActive = IsKeyMatch,
				descriptor = descriptor,
				screenProps = ScreenProps,
				isVisible = IsKeyMatch
			}) else RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				ClipsDescendants = false,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 1, 0),
				Visible = IsKeyMatch
			}, {
				Content = RoactModule.createElement(SceneView, {
					component = descriptor.getComponent(),
					navigation = descriptor.navigation,
					screenProps = ScreenProps
				})
			})
		end
	end
	return RoactModule.createElement("Folder", nil, Elements)
end

return PreloadingSwitchView