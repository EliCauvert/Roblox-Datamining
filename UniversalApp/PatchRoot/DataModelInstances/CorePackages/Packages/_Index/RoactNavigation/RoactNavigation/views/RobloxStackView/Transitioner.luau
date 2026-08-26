local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local reactModule = require(parent_1.React)
local otterModule = require(parent_1.Otter)
local scenesReducerModule = require(script.Parent.ScenesReducer)
local invariantModule = require(parent.utils.invariant)
local t = { frequency = 4 }

local function buildTransitionProps(p1, p2)
	-- upvalues: invariantModule (ref)
	local navigation = p1.navigation
	local options = p1.options
	local layout = p2.layout
	local position = p2.position
	local scenes = p2.scenes
	local var1 = nil
	
	for i, v in scenes do
		if v.isActive then
			var1 = v
			break
		end
	end
	invariantModule(var1, "Could not find active scene")
	
	return {
		layout = layout,
		navigation = navigation,
		position = position,
		scenes = scenes,
		scene = var1,
		options = options,
		index = var1.index
	}
end

local function _(p3)
	-- upvalues: array (ref)
	local var2 = array.filter(p3, function(p4)
		return not p4.isStale
	end)
	
	return if #var2 == #p3 then p3 else var2
end

local transitioner = reactModule.Component:extend("Transitioner")

function transitioner.init(p3)
	-- upvalues: reactModule (ref), otterModule (ref), scenesReducerModule (ref), buildTransitionProps (ref)
	local state = p3.props.navigation.state
	local descriptors = p3.props.descriptors
	p3._ref = reactModule.createRef()
	p3.state = {
		layout = { initWidth = 0, initHeight = 0, isMeasured = false },
		position = otterModule.createSingleMotor(state.index),
		scenes = scenesReducerModule({}, state, nil, descriptors)
	}
	
	function p4._doOnAbsoluteSizeChanged(...)
		-- upvalues: p3 (ref)
		return p3:_onAbsoluteSizeChanged(...)
	end
	
	p3._positionLastValue = state.index
	p3._prevTransitionProps = nil
	p3._transitionProps = buildTransitionProps(p3.props, p3.state)
	p3._isMounted = false
	p3._isTransitionRunning = false
	p3._transitionQueue = {}
	p3._completeSignalDisconnector = p3.state.position:onComplete(function()
		-- upvalues: p3 (ref)
		if p3._isMounted then
			p3:_onTransitionEnd()
		end
	end)
	p3._stepSignalDisconnector = p3.state.position:onStep(function(p4)
		-- upvalues: p3 (ref)
		if p3._isMounted then
			p3:_onPositionStep(p4)
		end
	end)
end

function transitioner.didMount(p3)
	p3._isMounted = true
end

function transitioner.willUnmount(p3)
	p3._isMounted = false
	
	if p3._completeSignalDisconnector then
		p3._completeSignalDisconnector()
		p3._completeSignalDisconnector = nil
	end
	if p3._stepSignalDisconnector then
		p3._stepSignalDisconnector()
		p3._stepSignalDisconnector = nil
	end
end

function transitioner.didUpdate(p3, p4)
	if not p3.state.layout.isMeasured and p3._ref.current then
		p3:_onAbsoluteSizeChanged(p3._ref.current)
	end
	if p3.props ~= p4 then
		if p3._isTransitionRunning then
			if (p3._transitionQueue[#p3._transitionQueue] or {}).prevProps ~= p4 then
				table.insert(p3._transitionQueue, { prevProps = p4 })
			end
			return
		else
			p3:_startTransition(p4, p3.props)
		end
	end
end

function transitioner.render(p3)
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		[reactModule.Change.AbsoluteSize] = p3._doOnAbsoluteSizeChanged,
		ref = p3._ref
	}, {
		TransitionerScenes = p3.props.render(p3._transitionProps, p3._prevTransitionProps, p3)
	})
end

function transitioner._onAbsoluteSizeChanged(value, p3)
	-- upvalues: object (ref), buildTransitionProps (ref)
	if not value._isMounted then return end
	local x = p3.AbsoluteSize.X
	local y = p3.AbsoluteSize.Y
	
	if x == value.state.layout.initWidth and y == value.state.layout.initHeight then
		return
	end
	local var2 = object.assign(table.clone(value.state.layout), { isMeasured = true, initWidth = x, initHeight = y })
	value._transitionProps = buildTransitionProps(value.props, object.assign(table.clone(value.state), { layout = var2 }))
	value:setState({ layout = var2 })
end

function transitioner._computeScenes(p3, p4, p5)
	-- upvalues: scenesReducerModule (ref), array (ref)
	local var2 = scenesReducerModule(p3.state.scenes, p5.navigation.state, p4.navigation.state, p5.descriptors)
	
	if not p5.navigation.state.isTransitioning then
		local var3 = var2
		local var4 = array.filter(var3, function(p6)
			return not p6.isStale
		end)
		var2 = if #var4 == #var3 then var3 else var4
	end
	if p5.screenProps ~= p3.props.screenProps then
		p3:setState({ scenes = var2 })
	end
	return if var2 == p3.state.scenes then nil else var2
end

function transitioner._startTransition(p3, p4, p5)
	-- upvalues: object (ref), buildTransitionProps (ref), t (ref), otterModule (ref)
	local var2 = p4.navigation.state.index ~= p5.navigation.state.index
	local var3 = p3:_computeScenes(p4, p5)
	
	if var3 then
		local var4 = object.assign(table.clone(p3.state), { scenes = var3 })
		local position = var4.position
		local index = p5.navigation.state.index
		p3._prevTransitionProps = p3._transitionProps
		p3._transitionProps = buildTransitionProps(p5, var4)
		local isTransitioning = p3._transitionProps.navigation.state.isTransitioning
		
		if isTransitioning and var2 then
			p3._isTransitionRunning = true
		end
		p3:setState(var4, function()
			-- upvalues: isTransitioning (ref), var2 (ref), p5 (ref), p3 (ref), index (ref), object (copy), t (copy), position (ref), otterModule (copy)
			if isTransitioning and var2 then
				if p5.onTransitionStart then
					p5.onTransitionStart(p3._transitionProps, p3._prevTransitionProps)
				end
				if p3._positionLastValue == index then
					position:setGoal(otterModule.instant(p5.navigation.state.index))
					
					return
				end
				local t_1 = {}
				
				if p5.configureTransition then
					t_1 = p5.configureTransition(p3._transitionProps, p3._prevTransitionProps) or {}
				end
				position:setGoal(otterModule.spring(p5.navigation.state.index, object.assign(table.clone(t), t_1)))
				
				return
			elseif p5.onTransitionStart then
				p5.onTransitionStart(p3._transitionProps, p3._prevTransitionProps)
			end
			position:setGoal(otterModule.instant(index))
		end)
		
		return
	else
		p3._prevTransitionProps = p3._transitionProps
		
		if p3._isTransitionRunning then
			p3:_onTransitionEnd()
		end
	end
end

function transitioner._onTransitionEnd(p3)
	-- upvalues: array (ref), object (ref), buildTransitionProps (ref)
	local prevTransitionProps = p3._prevTransitionProps
	p3._prevTransitionProps = nil
	local scenes = p3.state.scenes
	local var2 = array.filter(scenes, function(p4)
		return not p4.isStale
	end)
	scenes = object.assign(table.clone(p3.state), { scenes = if #var2 == #scenes then scenes else var2 })
	p3._transitionProps = buildTransitionProps(p3.props, scenes)
	p3:setState(scenes, function()
		-- upvalues: p3 (ref), prevTransitionProps (ref)
		if p3.props.onTransitionEnd then
			p3.props.onTransitionEnd(p3._transitionProps, prevTransitionProps)
		end
		local var3 = p3._transitionQueue[1]
		
		if var3 then
			local prevProps = var3.prevProps
			p3._transitionQueue = table.clone(p3._transitionQueue)
			table.remove(p3._transitionQueue, 1)
			p3:_startTransition(prevProps, p3.props)
			
			return
		end
		p3._isTransitionRunning = false
	end)
end

function transitioner._onPositionStep(p3, p4)
	p3._positionLastValue = p4
	local index = p3._transitionProps.index
	local var2 = if p3._prevTransitionProps then p3._prevTransitionProps.index else index
	
	if p3.props.onTransitionStep and var2 ~= index then
		p3.props.onTransitionStep(p3._transitionProps, p3._prevTransitionProps, (p4 - var2) / (index - var2))
	end
end

return transitioner