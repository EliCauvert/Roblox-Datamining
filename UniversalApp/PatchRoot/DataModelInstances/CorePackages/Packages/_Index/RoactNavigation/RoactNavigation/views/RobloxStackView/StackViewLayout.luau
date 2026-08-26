local parent = script.Parent
local parent_1 = parent.Parent
local parent_2 = parent_1.Parent.Parent
local object = require(parent_2.LuauPolyfill).Object
local reactModule = require(parent_2.React)
local stackPresentationStyleModule = require(parent.StackPresentationStyle)
local stackViewTransitionConfigsModule = require(parent.StackViewTransitionConfigs)
local stackViewOverlayFrameModule = require(parent.StackViewOverlayFrame)
local stackViewCardModule = require(parent.StackViewCard)
local sceneViewModule = require(parent_1.SceneView)
local t = {
	absorbInput = true,
	absorbInputSelectable = true,
	overlayEnabled = false,
	overlayTransparency = 0.7,
	transparent = false,
	overlayColor3 = Color3.new(0, 0, 0),
	renderOverlay = function(p1, p2, p3)
		-- upvalues: reactModule (ref), stackViewOverlayFrameModule (ref)
		return reactModule.createElement(stackViewOverlayFrameModule, {
			navigationOptions = p1,
			initialTransitionValue = p2,
			transitionChangedSignal = p3
		})
	end
}

local function _(p1, p2)
	return math.max(math.min(1 + p2 - p1, 1), 0)
end

local stackViewLayout = reactModule.Component:extend("StackViewLayout")

function stackViewLayout.init(p1)
	p1:setState({})
	local index = p1.props.transitionProps.navigation.state.index
	p1._isMounted = false
	p1._positionLastValue = index
	
	function p5._renderScene(p2)
		-- upvalues: p1 (ref)
		return p1:_renderInnerScene(p2)
	end
	
	function p5._subscribeToOverlayUpdates(p2)
		-- upvalues: p1 (ref)
		local index = p1.props.transitionProps.scene.index
		
		return p1.props.transitionProps.position:onStep(function(p3)
			-- upvalues: p2 (ref), index (ref)
			p2(math.max(math.min(1 + p3 - index, 1), 0))
		end)
	end
end

function stackViewLayout._renderCard(p1, p2, p3)
	-- upvalues: object (ref), reactModule (ref), stackViewCardModule (ref)
	local transitionProps = p1.props.transitionProps
	local lastTransitionProps = p1.props.lastTransitionProps
	local transitionConfig = p1.state.transitionConfig
	local cardColor3 = p3.cardColor3
	local overlayEnabled = p3.overlayEnabled
	local transparent = p3.transparent
	local var1 = if lastTransitionProps then lastTransitionProps.scene.index else transitionProps.scene.index
	local t = {}
	local screenInterpolator = transitionConfig.screenInterpolator
	
	if screenInterpolator then
		t = screenInterpolator(object.assign(table.clone(transitionProps), { initialPositionValue = var1, scene = p2 }))
	end
	return reactModule.createElement(stackViewCardModule, object.assign(table.clone(transitionProps), t, {
		key = "card_" .. tostring(p2.key),
		scene = p2,
		renderScene = p1._renderScene,
		cardColor3 = if overlayEnabled or transparent then nil else cardColor3
	}))
end

function stackViewLayout._renderInnerScene(p1, p2)
	-- upvalues: reactModule (ref), sceneViewModule (ref)
	return reactModule.createElement(sceneViewModule, {
		screenProps = p1.props.screenProps,
		navigation = p2.descriptor.navigation,
		component = p2.descriptor.getComponent()
	})
end

function stackViewLayout.render(p1)
	-- upvalues: object (ref), t (ref), reactModule (ref)
	local topMostOpaqueSceneIndex = p1.state.topMostOpaqueSceneIndex
	local t_1 = {}
	
	for i, v in p1.props.transitionProps.scenes do
		local var1 = v.index < topMostOpaqueSceneIndex and not v.isActive
		local var2 = if v.descriptor.options then object.assign(table.clone(t), v.descriptor.options) else table.clone(t)
		t_1[tostring(v.key)] = reactModule.createElement(reactModule.Fragment, {}, {
			AbsorbInput = if not (var1 or not var2.absorbInput) then reactModule.createElement("TextButton", {
				Active = true,
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = " ",
				Selectable = var2.absorbInputSelectable,
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 2 * v.index - 1
			}) else nil,
			[tostring(v.index)] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 2 * v.index,
				Visible = not var1
			}, {
				StationaryContent = if var2.overlayEnabled then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					BorderSizePixel = 0,
					ZIndex = 1,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					Overlay = var2:renderOverlay(math.max(math.min(1 + p1._positionLastValue - v.index, 1), 0), p1._subscribeToOverlayUpdates)
				}) else nil,
				DynamicContent = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ClipsDescendants = false,
					BorderSizePixel = 0,
					ZIndex = 2,
					Size = UDim2.new(1, 0, 1, 0)
				}, { ["card_" .. v.key] = p1:_renderCard(v, var2) })
			})
		})
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = false,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 1, 0)
	}, t_1)
end

function stackViewLayout.getDerivedStateFromProps(p2, _)
	-- upvalues: stackPresentationStyleModule (ref), object (ref), t (ref), stackViewTransitionConfigsModule (ref)
	local transitionProps = p2.transitionProps
	local scenes = transitionProps.scenes
	local isTransitioning = transitionProps.navigation.state.isTransitioning
	local scenesCount = #scenes
	local var3 = if p2.mode ~= stackPresentationStyleModule.Modal then p2.mode == stackPresentationStyleModule.Overlay else true
	local var4 = 0
	
	for i = scenesCount, 1, -1 do
		local var5 = scenes[i]
		local var6 = if var5.descriptor.options then object.assign(table.clone(t), var5.descriptor.options) else table.clone(t)
		
		if var6.transparent or var3 and var6.overlayEnabled or isTransitioning and i == scenesCount then
			continue
		end
		var4 = i
		break
	end
	return {
		topMostOpaqueSceneIndex = var4,
		transitionConfig = stackViewTransitionConfigsModule.getTransitionConfig(p2.transitionConfig, p2.transitionProps, p2.lastTransitionProps, p2.mode)
	}
end

function stackViewLayout.didMount(p3)
	p3._isMounted = true
	p3._positionDisconnector = p3.props.transitionProps.position:onStep(function(...)
		-- upvalues: p3 (ref)
		p3:_onPositionStep(...)
	end)
end

function stackViewLayout.willUnmount(p3)
	p3._isMounted = false
	
	if p3._positionDisconnector then
		p3._positionDisconnector()
		p3._positionDisconnector = nil
	end
end

function stackViewLayout.didUpdate(p3, p4)
	local position = p3.props.transitionProps.position
	
	if position ~= p4.transitionProps.position then
		p3._positionDisconnector()
		p3._positionDisconnector = position:onStep(function(...)
			-- upvalues: p3 (ref)
			p3:_onPositionStep(...)
		end)
	end
end

function stackViewLayout._onPositionStep(p3, p4)
	if p3._isMounted then
		p3._positionLastValue = p4
	end
end

return stackViewLayout