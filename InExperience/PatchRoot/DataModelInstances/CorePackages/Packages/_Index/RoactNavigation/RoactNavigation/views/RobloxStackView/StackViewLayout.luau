local Parent = script.Parent
local Parent1 = Parent.Parent
local Parent2 = Parent1.Parent.Parent
local Object = require(Parent2.LuauPolyfill).Object
local ReactModule = require(Parent2.React)
local StackPresentationStyleModule = require(Parent.StackPresentationStyle)
local StackViewTransitionConfigsModule = require(Parent.StackViewTransitionConfigs)
local StackViewOverlayFrameModule = require(Parent.StackViewOverlayFrame)
local StackViewCardModule = require(Parent.StackViewCard)
local SceneViewModule = require(Parent1.SceneView)
local Tbl = {
	absorbInput = true,
	absorbInputSelectable = true,
	overlayEnabled = false,
	overlayTransparency = 0.7,
	transparent = false,
	overlayColor3 = Color3.new(0, 0, 0),
	renderOverlay = function(NavigationOptions, InitialTransitionValue, TransitionChangedSignal)
		-- upvalues: ReactModule (copy), StackViewOverlayFrameModule (copy)
		return ReactModule.createElement(StackViewOverlayFrameModule, {
			navigationOptions = NavigationOptions,
			initialTransitionValue = InitialTransitionValue,
			transitionChangedSignal = TransitionChangedSignal
		})
	end
}

local function _(p1, p2: number): number
	return (math.max(math.min(1 + p2 - p1, 1), 0))
end

local StackViewLayout = ReactModule.Component:extend("StackViewLayout")

function StackViewLayout.init(p1)
	p1:setState({})
	p1._isMounted = false
	p1._positionLastValue = p1.props.transitionProps.navigation.state.index
	
	function p1._renderScene(p2)
		-- upvalues: p1 (copy)
		return p1:_renderInnerScene(p2)
	end
	
	function p1._subscribeToOverlayUpdates(Callback)
		-- upvalues: p1 (copy)
		local Index = p1.props.transitionProps.scene.index
		
		return p1.props.transitionProps.position:onStep(function(p2: number)
			-- upvalues: Callback (copy), Index (copy)
			Callback((math.max(math.min(1 + p2 - Index, 1), 0)))
		end)
	end
end

function StackViewLayout._renderCard(p1, Scene, AssignResult)
	-- upvalues: Object (copy), ReactModule (copy), StackViewCardModule (copy)
	local TransitionProps = p1.props.transitionProps
	local LastTransitionProps = p1.props.lastTransitionProps
	local CardColor3 = AssignResult.cardColor3
	local OverlayEnabled = AssignResult.overlayEnabled
	local Transparent = AssignResult.transparent
	local Index = if LastTransitionProps then LastTransitionProps.scene.index else TransitionProps.scene.index
	local t = {}
	local ScreenInterpolatorFunction = p1.state.transitionConfig.screenInterpolator
	
	if ScreenInterpolatorFunction then
		t = ScreenInterpolatorFunction(Object.assign(table.clone(TransitionProps), { initialPositionValue = Index, scene = Scene }))
	end
	return ReactModule.createElement(StackViewCardModule, Object.assign(table.clone(TransitionProps), t, {
		key = "card_" .. tostring(Scene.key),
		scene = Scene,
		renderScene = p1._renderScene,
		cardColor3 = if OverlayEnabled or Transparent then nil else CardColor3
	}))
end

function StackViewLayout._renderInnerScene(p1, p2)
	-- upvalues: ReactModule (copy), SceneViewModule (copy)
	return ReactModule.createElement(SceneViewModule, {
		screenProps = p1.props.screenProps,
		navigation = p2.descriptor.navigation,
		component = p2.descriptor.getComponent()
	})
end

function StackViewLayout.render(p1)
	-- upvalues: Object (copy), Tbl (copy), ReactModule (copy)
	local TopMostOpaqueSceneIndex = p1.state.topMostOpaqueSceneIndex
	local Elements = {}
	
	for _, scene in p1.props.transitionProps.scenes do
		local NoIsActive: boolean = scene.index < TopMostOpaqueSceneIndex and not scene.isActive
		local AssignResult = if scene.descriptor.options then Object.assign(table.clone(Tbl), scene.descriptor.options) else table.clone(Tbl)
		local AbsorbInput = AssignResult.absorbInput
		local AbsorbInputSelectable = AssignResult.absorbInputSelectable
		local RenderOverlayFunction = AssignResult.renderOverlay
		Elements[tostring(scene.key)] = ReactModule.createElement(ReactModule.Fragment, {}, {
			AbsorbInput = if NoIsActive or not AbsorbInput then nil else ReactModule.createElement("TextButton", {
				Active = true,
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = " ",
				Selectable = AbsorbInputSelectable,
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 2 * scene.index - 1
			}),
			[tostring(scene.index)] = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 2 * scene.index,
				Visible = not NoIsActive
			}, {
				StationaryContent = if AssignResult.overlayEnabled then ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					BorderSizePixel = 0,
					ZIndex = 1,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					Overlay = RenderOverlayFunction(AssignResult, math.max(math.min(1 + p1._positionLastValue - scene.index, 1), 0), p1._subscribeToOverlayUpdates)
				}) else nil,
				DynamicContent = ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ClipsDescendants = false,
					BorderSizePixel = 0,
					ZIndex = 2,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					["card_" .. scene.key] = p1:_renderCard(scene, AssignResult)
				})
			})
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0)
	}, Elements)
end

function StackViewLayout.getDerivedStateFromProps(p2, _)
	-- upvalues: StackPresentationStyleModule (copy), Object (copy), Tbl (copy), StackViewTransitionConfigsModule (copy)
	local TransitionProps = p2.transitionProps
	local Scenes = TransitionProps.scenes
	local IsTransitioning = TransitionProps.navigation.state.isTransitioning
	local CountScenes = #Scenes
	local IsModeMatch: boolean = p2.mode == StackPresentationStyleModule.Modal or p2.mode == StackPresentationStyleModule.Overlay
	local TopMostOpaqueSceneIndex = 0
	
	for i = CountScenes, 1, -1 do
		local Scene = Scenes[i]
		local AssignResult = if Scene.descriptor.options then Object.assign(table.clone(Tbl), Scene.descriptor.options) else table.clone(Tbl)
		
		if AssignResult.transparent or IsModeMatch and AssignResult.overlayEnabled or IsTransitioning and i == CountScenes then
			continue
		end
		TopMostOpaqueSceneIndex = i
		break
	end
	return {
		topMostOpaqueSceneIndex = TopMostOpaqueSceneIndex,
		transitionConfig = StackViewTransitionConfigsModule.getTransitionConfig(p2.transitionConfig, p2.transitionProps, p2.lastTransitionProps, p2.mode)
	}
end

function StackViewLayout.didMount(p3)
	p3._isMounted = true
	p3._positionDisconnector = p3.props.transitionProps.position:onStep(function(...)
		-- upvalues: p3 (copy)
		p3:_onPositionStep(...)
	end)
end

function StackViewLayout.willUnmount(p3)
	p3._isMounted = false
	
	if p3._positionDisconnector then
		p3._positionDisconnector()
		p3._positionDisconnector = nil
	end
end

function StackViewLayout.didUpdate(p3, p4)
	local Position = p3.props.transitionProps.position
	
	if Position ~= p4.transitionProps.position then
		p3._positionDisconnector()
		p3._positionDisconnector = Position:onStep(function(...)
			-- upvalues: p3 (copy)
			p3:_onPositionStep(...)
		end)
	end
end

function StackViewLayout._onPositionStep(p3, _positionLastValue)
	if p3._isMounted then
		p3._positionLastValue = _positionLastValue
	end
end

return StackViewLayout