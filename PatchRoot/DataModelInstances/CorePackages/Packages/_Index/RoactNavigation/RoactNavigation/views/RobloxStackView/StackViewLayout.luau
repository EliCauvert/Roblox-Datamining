-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:03 2026 Pacific Standard Time.

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
	renderOverlay = function(p0, p1, p2) --[[ line: 22 ]]
		-- upvalues: reactModule (ref), stackViewOverlayFrameModule (ref)
		return reactModule.createElement(stackViewOverlayFrameModule, {
			navigationOptions = p0,
			initialTransitionValue = p1,
			transitionChangedSignal = p2
		})
	end
}

local function _(p3, p4) --[[ line: 34 | named "calculateTransitionValue" ]]
	return math.max(math.min(1 + p4 - p3, 1), 0)
end

local stackViewLayout = reactModule.Component:extend("StackViewLayout")

function stackViewLayout.init(p5) --[[ line: 40 ]]
	p5:setState({})
	local index = p5.props.transitionProps.navigation.state.index
	p5._isMounted = false
	p5._positionLastValue = index
	
	function p5._renderScene(p6) --[[ line: 47 ]]
		-- upvalues: p5 (ref)
		return p5:_renderInnerScene(p6)
	end
	
	function p5._subscribeToOverlayUpdates(p7) --[[ line: 51 ]]
		-- upvalues: p5 (ref)
		local index = p5.props.transitionProps.scene.index
		
		return p5.props.transitionProps.position:onStep(function(p8) --[[ line: 55 ]]
			-- upvalues: p7 (ref), index (ref)
			p7(math.max(math.min(1 + p8 - index, 1), 0))
		end)
	end
end

function stackViewLayout._renderCard(p9, p10, p11) --[[ line: 61 ]]
	-- upvalues: object (ref), reactModule (ref), stackViewCardModule (ref)
	local transitionProps = p9.props.transitionProps
	local lastTransitionProps = p9.props.lastTransitionProps
	local transitionConfig = p9.state.transitionConfig
	local cardColor3 = p11.cardColor3
	local overlayEnabled = p11.overlayEnabled
	local transparent = p11.transparent
	local var8 = if lastTransitionProps then lastTransitionProps.scene.index else transitionProps.scene.index
	local t = {}
	local screenInterpolator = transitionConfig.screenInterpolator
	
	if screenInterpolator then
		t = screenInterpolator(object.assign(table.clone(transitionProps), { initialPositionValue = var8, scene = p10 }))
	end
	return reactModule.createElement(stackViewCardModule, object.assign(table.clone(transitionProps), t, {
		key = "card_" .. tostring(p10.key),
		scene = p10,
		renderScene = p9._renderScene,
		cardColor3 = if overlayEnabled or transparent then nil else cardColor3
	}))
end

function stackViewLayout._renderInnerScene(p12, p13) --[[ line: 96 ]]
	-- upvalues: reactModule (ref), sceneViewModule (ref)
	return reactModule.createElement(sceneViewModule, {
		screenProps = p12.props.screenProps,
		navigation = p13.descriptor.navigation,
		component = p13.descriptor.getComponent()
	})
end

function stackViewLayout.render(p14) --[[ line: 109 ]]
	-- upvalues: object (ref), t (ref), reactModule (ref)
	local topMostOpaqueSceneIndex = p14.state.topMostOpaqueSceneIndex
	local t_1 = {}
	
	for i, v in p14.props.transitionProps.scenes do
		local var11 = v.index < topMostOpaqueSceneIndex and not v.isActive
		local var12 = if v.descriptor.options then object.assign(table.clone(t), v.descriptor.options) else table.clone(t)
		t_1[tostring(v.key)] = reactModule.createElement(reactModule.Fragment, {}, {
			AbsorbInput = if not (var11 or not var12.absorbInput) then reactModule.createElement("TextButton", {
				Active = true,
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Text = " ",
				Selectable = var12.absorbInputSelectable,
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 2 * v.index - 1
			}) else nil,
			[tostring(v.index)] = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ClipsDescendants = false,
				Size = UDim2.new(1, 0, 1, 0),
				ZIndex = 2 * v.index,
				Visible = not var11
			}, {
				StationaryContent = if var12.overlayEnabled then reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ClipsDescendants = true,
					BorderSizePixel = 0,
					ZIndex = 1,
					Size = UDim2.new(1, 0, 1, 0)
				}, {
					Overlay = var12:renderOverlay(math.max(math.min(1 + p14._positionLastValue - v.index, 1), 0), p14._subscribeToOverlayUpdates)
				}) else nil,
				DynamicContent = reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ClipsDescendants = false,
					BorderSizePixel = 0,
					ZIndex = 2,
					Size = UDim2.new(1, 0, 1, 0)
				}, { ["card_" .. v.key] = p14:_renderCard(v, var12) })
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

function stackViewLayout.getDerivedStateFromProps(p15, _) --[[ line: 204 ]]
	-- upvalues: stackPresentationStyleModule (ref), object (ref), t (ref), stackViewTransitionConfigsModule (ref)
	local transitionProps = p15.transitionProps
	local scenes = transitionProps.scenes
	local isTransitioning = transitionProps.navigation.state.isTransitioning
	local scenesCount = #scenes
	local var14 = if p15.mode ~= stackPresentationStyleModule.Modal then p15.mode == stackPresentationStyleModule.Overlay else true
	local var15 = 0
	
	for i = scenesCount, 1, -1 do
		local var16 = scenes[i]
		local var17 = if var16.descriptor.options then object.assign(table.clone(t), var16.descriptor.options) else table.clone(t)
		
		if var17.transparent or var14 and var17.overlayEnabled or isTransitioning and i == scenesCount then
			continue
		end
		var15 = i
		break
	end
	return {
		topMostOpaqueSceneIndex = var15,
		transitionConfig = stackViewTransitionConfigsModule.getTransitionConfig(p15.transitionConfig, p15.transitionProps, p15.lastTransitionProps, p15.mode)
	}
end

function stackViewLayout.didMount(p16) --[[ line: 243 ]]
	p16._isMounted = true
	p16._positionDisconnector = p16.props.transitionProps.position:onStep(function(...) --[[ line: 246 ]]
		-- upvalues: p16 (ref)
		p16:_onPositionStep(...)
	end)
end

function stackViewLayout.willUnmount(p17) --[[ line: 251 ]]
	p17._isMounted = false
	
	if p17._positionDisconnector then
		p17._positionDisconnector()
		p17._positionDisconnector = nil
	end
end

function stackViewLayout.didUpdate(p18, p19) --[[ line: 260 ]]
	local position = p18.props.transitionProps.position
	
	if position ~= p19.transitionProps.position then
		p18._positionDisconnector()
		p18._positionDisconnector = position:onStep(function(...) --[[ line: 265 ]]
			-- upvalues: p18 (ref)
			p18:_onPositionStep(...)
		end)
	end
end

function stackViewLayout._onPositionStep(p20, p21) --[[ line: 271 ]]
	if p20._isMounted then
		p20._positionLastValue = p21
	end
end

return stackViewLayout