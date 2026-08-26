local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local object = require(parent_2.LuauPolyfill).Object
local reactModule = require(parent_2.React)
local stackActionsModule = require(parent_1.routers.StackActions)
local stackViewLayoutModule = require(parent.StackViewLayout)
local transitionerModule = require(parent.Transitioner)
local stackViewTransitionConfigsModule = require(parent.StackViewTransitionConfigs)
local t = { mode = require(parent.StackPresentationStyle).Default }
local stackView = reactModule.Component:extend("StackView")

function stackView.init(p1)
	function p0._doRender(...)
		-- upvalues: p1 (ref)
		return p1:_render(...)
	end
	
	function p0._doConfigureTransition(...)
		-- upvalues: p1 (ref)
		return p1:_configureTransition(...)
	end
	
	function p0._doOnTransitionStart(...)
		-- upvalues: p1 (ref)
		return p1:_onTransitionStart(...)
	end
	
	function p0._doOnTransitionEnd(...)
		-- upvalues: p1 (ref)
		return p1:_onTransitionEnd(...)
	end
	
	function p0._doOnTransitionStep(...)
		-- upvalues: p1 (ref)
		return p1:_onTransitionStep(...)
	end
end

function stackView.render(p1)
	-- upvalues: reactModule (ref), transitionerModule (ref)
	return reactModule.createElement(transitionerModule, {
		render = p1._doRender,
		configureTransition = p1._doConfigureTransition,
		screenProps = p1.props.screenProps,
		navigation = p1.props.navigation,
		descriptors = p1.props.descriptors,
		onTransitionStart = p1._doOnTransitionStart,
		onTransitionEnd = p1._doOnTransitionEnd,
		onTransitionStep = p1._doOnTransitionStep
	})
end

function stackView.didMount(p1)
	-- upvalues: stackActionsModule (ref)
	local navigation = p1.props.navigation
	
	if navigation.state.isTransitioning then
		navigation.dispatch(stackActionsModule.completeTransition({ key = navigation.state.key }))
	end
end

function stackView._render(p1, p2, p3)
	-- upvalues: object (ref), t (ref), reactModule (ref), stackViewLayoutModule (ref)
	return reactModule.createElement(stackViewLayoutModule, object.assign(object.assign(table.clone(t), p1.props.navigationConfig), {
		screenProps = p1.props.screenProps,
		descriptors = p1.props.descriptors,
		transitionProps = p2,
		lastTransitionProps = p3
	}))
end

function stackView._configureTransition(p1, p2, p3)
	-- upvalues: stackViewTransitionConfigsModule (ref)
	return stackViewTransitionConfigsModule.getTransitionConfig(p1.props.navigationConfig.transitionConfig, p2, p3, p1.props.navigationConfig.mode).transitionSpec
end

function stackView._onTransitionStart(p1, p2, p3)
	local onTransitionStart = p1.props.onTransitionStart or p1.props.navigationConfig.onTransitionStart
	
	if onTransitionStart and p2.index ~= p3.index then
		onTransitionStart(p2.navigation, p3.navigation)
	end
end

function stackView._onTransitionEnd(p1, p2, p3)
	-- upvalues: stackActionsModule (ref)
	local navigation = p1.props.navigation
	local onTransitionEnd = p1.props.onTransitionEnd or p1.props.navigationConfig.onTransitionEnd
	local key = p2.scene.route.key
	
	if p2.navigation.state.isTransitioning and navigation.state.routes[navigation.state.index].key == key then
		navigation.dispatch(stackActionsModule.completeTransition({ key = navigation.state.key, toChildKey = key }))
	end
	if onTransitionEnd and p2.index ~= p3.index then
		onTransitionEnd(p2.navigation, p3.navigation)
	end
end

function stackView._onTransitionStep(p1, p2, p3, p4)
	local onTransitionStep = p1.props.onTransitionStep or p1.props.navigationConfig.onTransitionStep
	
	if onTransitionStep and p2.index ~= p3.index then
		onTransitionStep(p2.navigation, p3.navigation, p4)
	end
end

return stackView