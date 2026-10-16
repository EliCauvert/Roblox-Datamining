local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Object = require(Parent2.LuauPolyfill).Object
local ReactModule = require(Parent2.React)
local StackActionsModule = require(Parent1.routers.StackActions)
local StackViewLayoutModule = require(Parent.StackViewLayout)
local TransitionerModule = require(Parent.Transitioner)
local StackViewTransitionConfigsModule = require(Parent.StackViewTransitionConfigs)
local config = { mode = require(Parent.StackPresentationStyle).Default }
local StackView = ReactModule.Component:extend("StackView")

function StackView.init(p1) --[[ Line: 20 ]]
	function p1._doRender(...) --[[ Line: 21 ]]
		-- upvalues: p1 (copy)
		return p1:_render(...)
	end
	
	function p1._doConfigureTransition(...) --[[ Line: 25 ]]
		-- upvalues: p1 (copy)
		return p1:_configureTransition(...)
	end
	
	function p1._doOnTransitionStart(...) --[[ Line: 29 ]]
		-- upvalues: p1 (copy)
		return p1:_onTransitionStart(...)
	end
	
	function p1._doOnTransitionEnd(...) --[[ Line: 33 ]]
		-- upvalues: p1 (copy)
		return p1:_onTransitionEnd(...)
	end
	
	function p1._doOnTransitionStep(...) --[[ Line: 37 ]]
		-- upvalues: p1 (copy)
		return p1:_onTransitionStep(...)
	end
end

function StackView.render(p1) --[[ Line: 42 ]]
	-- upvalues: ReactModule (copy), TransitionerModule (copy)
	return ReactModule.createElement(TransitionerModule, {
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

function StackView.didMount(p1) --[[ Line: 61 ]]
	-- upvalues: StackActionsModule (copy)
	local Navigation = p1.props.navigation
	
	if Navigation.state.isTransitioning then
		Navigation.dispatch(StackActionsModule.completeTransition({ key = Navigation.state.key }))
	end
end

function StackView._render(p1, TransitionProps, LastTransitionProps) --[[ Line: 70 ]]
	-- upvalues: Object (copy), config (copy), ReactModule (copy), StackViewLayoutModule (copy)
	return ReactModule.createElement(StackViewLayoutModule, Object.assign(Object.assign(table.clone(config), p1.props.navigationConfig), {
		screenProps = p1.props.screenProps,
		descriptors = p1.props.descriptors,
		transitionProps = TransitionProps,
		lastTransitionProps = LastTransitionProps
	}))
end

function StackView._configureTransition(p1, p2, p3) --[[ Line: 86 ]]
	-- upvalues: StackViewTransitionConfigsModule (copy)
	return StackViewTransitionConfigsModule.getTransitionConfig(p1.props.navigationConfig.transitionConfig, p2, p3, p1.props.navigationConfig.mode).transitionSpec
end

function StackView._onTransitionStart(p1, p2, p3) --[[ Line: 95 ]]
	local OnTransitionStart: (any, any) -> () = p1.props.onTransitionStart or p1.props.navigationConfig.onTransitionStart
	
	if OnTransitionStart and p2.index ~= p3.index then
		OnTransitionStart(p2.navigation, p3.navigation)
	end
end

function StackView._onTransitionEnd(p1, p2, p3) --[[ Line: 106 ]]
	-- upvalues: StackActionsModule (copy)
	local NavigationConfig = p1.props.navigationConfig
	local Navigation = p1.props.navigation
	local OnTransitionEnd: (any, any) -> () = p1.props.onTransitionEnd or NavigationConfig.onTransitionEnd
	local Key = p2.scene.route.key
	local IsKeyMatch = Navigation.state.routes[Navigation.state.index].key == Key
	
	if p2.navigation.state.isTransitioning and IsKeyMatch then
		Navigation.dispatch(StackActionsModule.completeTransition({ key = Navigation.state.key, toChildKey = Key }))
	end
	if OnTransitionEnd and p2.index ~= p3.index then
		OnTransitionEnd(p2.navigation, p3.navigation)
	end
end

function StackView._onTransitionStep(p1, p2, p3, p4) --[[ Line: 128 ]]
	local OnTransitionStep: (any, any, any) -> () = p1.props.onTransitionStep or p1.props.navigationConfig.onTransitionStep
	
	if OnTransitionStep and p2.index ~= p3.index then
		OnTransitionStep(p2.navigation, p3.navigation, p4)
	end
end

return StackView