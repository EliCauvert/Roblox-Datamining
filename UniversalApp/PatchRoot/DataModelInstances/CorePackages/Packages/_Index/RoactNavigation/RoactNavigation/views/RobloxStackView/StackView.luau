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

function stackView.init(p0)
	function p0._doRender(...)
		-- upvalues: p0 (ref)
		return p0:_render(...)
	end
	
	function p0._doConfigureTransition(...)
		-- upvalues: p0 (ref)
		return p0:_configureTransition(...)
	end
	
	function p0._doOnTransitionStart(...)
		-- upvalues: p0 (ref)
		return p0:_onTransitionStart(...)
	end
	
	function p0._doOnTransitionEnd(...)
		-- upvalues: p0 (ref)
		return p0:_onTransitionEnd(...)
	end
	
	function p0._doOnTransitionStep(...)
		-- upvalues: p0 (ref)
		return p0:_onTransitionStep(...)
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

function stackView.didMount(p2)
	-- upvalues: stackActionsModule (ref)
	local navigation = p2.props.navigation
	
	if navigation.state.isTransitioning then
		navigation.dispatch(stackActionsModule.completeTransition({ key = navigation.state.key }))
	end
end

function stackView._render(p3, p4, p5)
	-- upvalues: object (ref), t (ref), reactModule (ref), stackViewLayoutModule (ref)
	return reactModule.createElement(stackViewLayoutModule, object.assign(object.assign(table.clone(t), p3.props.navigationConfig), {
		screenProps = p3.props.screenProps,
		descriptors = p3.props.descriptors,
		transitionProps = p4,
		lastTransitionProps = p5
	}))
end

function stackView._configureTransition(p6, p7, p8)
	-- upvalues: stackViewTransitionConfigsModule (ref)
	return stackViewTransitionConfigsModule.getTransitionConfig(p6.props.navigationConfig.transitionConfig, p7, p8, p6.props.navigationConfig.mode).transitionSpec
end

function stackView._onTransitionStart(p9, p10, p11)
	local onTransitionStart = p9.props.onTransitionStart or p9.props.navigationConfig.onTransitionStart
	
	if onTransitionStart and p10.index ~= p11.index then
		onTransitionStart(p10.navigation, p11.navigation)
	end
end

function stackView._onTransitionEnd(p12, p13, p14)
	-- upvalues: stackActionsModule (ref)
	local navigation = p12.props.navigation
	local onTransitionEnd = p12.props.onTransitionEnd or p12.props.navigationConfig.onTransitionEnd
	local key = p13.scene.route.key
	
	if p13.navigation.state.isTransitioning and navigation.state.routes[navigation.state.index].key == key then
		navigation.dispatch(stackActionsModule.completeTransition({ key = navigation.state.key, toChildKey = key }))
	end
	if onTransitionEnd and p13.index ~= p14.index then
		onTransitionEnd(p13.navigation, p14.navigation)
	end
end

function stackView._onTransitionStep(p15, p16, p17, p18)
	local onTransitionStep = p15.props.onTransitionStep or p15.props.navigationConfig.onTransitionStep
	
	if onTransitionStep and p16.index ~= p17.index then
		onTransitionStep(p16.navigation, p17.navigation, p18)
	end
end

return stackView