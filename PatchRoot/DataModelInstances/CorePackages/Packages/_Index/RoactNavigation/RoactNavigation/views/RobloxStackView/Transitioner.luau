-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:03 2026 Pacific Standard Time.

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

local function buildTransitionProps(p0, p1) --[[ line: 17 ]]
	-- upvalues: invariantModule (ref)
	local navigation = p0.navigation
	local options = p0.options
	local layout = p1.layout
	local position = p1.position
	local scenes = p1.scenes
	local var8 = nil
	
	for i, v in scenes do
		if v.isActive then
			var8 = v
			break
		end
	end
	invariantModule(var8, "Could not find active scene")
	
	return {
		layout = layout,
		navigation = navigation,
		position = position,
		scenes = scenes,
		scene = var8,
		options = options,
		index = var8.index
	}
end

local function _(p2) --[[ line: 46 | named "filterStale" ]]
	-- upvalues: array (ref)
	local var9 = array.filter(p2, function(p3) --[[ line: 47 ]]
		return not p3.isStale
	end)
	
	return if #var9 == #p2 then p2 else var9
end

local transitioner = reactModule.Component:extend("Transitioner")

function transitioner.init(p4) --[[ line: 60 ]]
	-- upvalues: reactModule (ref), otterModule (ref), scenesReducerModule (ref), buildTransitionProps (ref)
	local state = p4.props.navigation.state
	local descriptors = p4.props.descriptors
	p4._ref = reactModule.createRef()
	p4.state = {
		layout = { initWidth = 0, initHeight = 0, isMeasured = false },
		position = otterModule.createSingleMotor(state.index),
		scenes = scenesReducerModule({}, state, nil, descriptors)
	}
	
	function p4._doOnAbsoluteSizeChanged(...) --[[ line: 78 ]]
		-- upvalues: p4 (ref)
		return p4:_onAbsoluteSizeChanged(...)
	end
	
	p4._positionLastValue = state.index
	p4._prevTransitionProps = nil
	p4._transitionProps = buildTransitionProps(p4.props, p4.state)
	p4._isMounted = false
	p4._isTransitionRunning = false
	p4._transitionQueue = {}
	p4._completeSignalDisconnector = p4.state.position:onComplete(function() --[[ line: 91 ]]
		-- upvalues: p4 (ref)
		if p4._isMounted then
			p4:_onTransitionEnd()
		end
	end)
	p4._stepSignalDisconnector = p4.state.position:onStep(function(p5) --[[ line: 97 ]]
		-- upvalues: p4 (ref)
		if p4._isMounted then
			p4:_onPositionStep(p5)
		end
	end)
end

function transitioner.didMount(p6) --[[ line: 104 ]]
	p6._isMounted = true
end

function transitioner.willUnmount(p7) --[[ line: 108 ]]
	p7._isMounted = false
	
	if p7._completeSignalDisconnector then
		p7._completeSignalDisconnector()
		p7._completeSignalDisconnector = nil
	end
	if p7._stepSignalDisconnector then
		p7._stepSignalDisconnector()
		p7._stepSignalDisconnector = nil
	end
end

function transitioner.didUpdate(p8, p9) --[[ line: 122 ]]
	if not p8.state.layout.isMeasured and p8._ref.current then
		p8:_onAbsoluteSizeChanged(p8._ref.current)
	end
	if p8.props ~= p9 then
		if p8._isTransitionRunning then
			if (p8._transitionQueue[#p8._transitionQueue] or {}).prevProps ~= p9 then
				table.insert(p8._transitionQueue, { prevProps = p9 })
			end
			return
		else
			p8:_startTransition(p9, p8.props)
		end
	end
end

function transitioner.render(p10) --[[ line: 147 ]]
	-- upvalues: reactModule (ref)
	return reactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		[reactModule.Change.AbsoluteSize] = p10._doOnAbsoluteSizeChanged,
		ref = p10._ref
	}, {
		TransitionerScenes = p10.props.render(p10._transitionProps, p10._prevTransitionProps, p10)
	})
end

function transitioner._onAbsoluteSizeChanged(value, p11) --[[ line: 165 ]]
	-- upvalues: object (ref), buildTransitionProps (ref)
	if not value._isMounted then return end
	local x = p11.AbsoluteSize.X
	local y = p11.AbsoluteSize.Y
	
	if x == value.state.layout.initWidth and y == value.state.layout.initHeight then
		return
	end
	local var10 = object.assign(table.clone(value.state.layout), { isMeasured = true, initWidth = x, initHeight = y })
	value._transitionProps = buildTransitionProps(value.props, object.assign(table.clone(value.state), { layout = var10 }))
	value:setState({ layout = var10 })
end

function transitioner._computeScenes(p12, p13, p14) --[[ line: 194 ]]
	-- upvalues: scenesReducerModule (ref), array (ref)
	local var11 = scenesReducerModule(p12.state.scenes, p14.navigation.state, p13.navigation.state, p14.descriptors)
	
	if not p14.navigation.state.isTransitioning then
		local var12 = var11
		local var13 = array.filter(var12, function(p15) --[[ line: 47 ]]
			return not p15.isStale
		end)
		var11 = if #var13 == #var12 then var12 else var13
	end
	if p14.screenProps ~= p12.props.screenProps then
		p12:setState({ scenes = var11 })
	end
	return if var11 == p12.state.scenes then nil else var11
end

function transitioner._startTransition(p16, p17, p18) --[[ line: 213 ]]
	-- upvalues: object (ref), buildTransitionProps (ref), t (ref), otterModule (ref)
	local var14 = p17.navigation.state.index ~= p18.navigation.state.index
	local var15 = p16:_computeScenes(p17, p18)
	
	if var15 then
		local var16 = object.assign(table.clone(p16.state), { scenes = var15 })
		local position = var16.position
		local index = p18.navigation.state.index
		p16._prevTransitionProps = p16._transitionProps
		p16._transitionProps = buildTransitionProps(p18, var16)
		local isTransitioning = p16._transitionProps.navigation.state.isTransitioning
		
		if isTransitioning and var14 then
			p16._isTransitionRunning = true
		end
		p16:setState(var16, function() --[[ line: 245 ]]
			-- upvalues: isTransitioning (ref), var14 (ref), p18 (ref), p16 (ref), index (ref), object (copy), t (copy), position (ref), otterModule (copy)
			if isTransitioning and var14 then
				if p18.onTransitionStart then
					p18.onTransitionStart(p16._transitionProps, p16._prevTransitionProps)
				end
				if p16._positionLastValue == index then
					position:setGoal(otterModule.instant(p18.navigation.state.index))
					
					return
				end
				local t_1 = {}
				
				if p18.configureTransition then
					t_1 = p18.configureTransition(p16._transitionProps, p16._prevTransitionProps) or {}
				end
				position:setGoal(otterModule.spring(p18.navigation.state.index, object.assign(table.clone(t), t_1)))
				
				return
			elseif p18.onTransitionStart then
				p18.onTransitionStart(p16._transitionProps, p16._prevTransitionProps)
			end
			position:setGoal(otterModule.instant(index))
		end)
		
		return
	else
		p16._prevTransitionProps = p16._transitionProps
		
		if p16._isTransitionRunning then
			p16:_onTransitionEnd()
		end
	end
end

function transitioner._onTransitionEnd(p19) --[[ line: 284 ]]
	-- upvalues: array (ref), object (ref), buildTransitionProps (ref)
	local prevTransitionProps = p19._prevTransitionProps
	p19._prevTransitionProps = nil
	local scenes = p19.state.scenes
	local var18 = array.filter(scenes, function(p20) --[[ line: 47 ]]
		return not p20.isStale
	end)
	scenes = object.assign(table.clone(p19.state), { scenes = if #var18 == #scenes then scenes else var18 })
	p19._transitionProps = buildTransitionProps(p19.props, scenes)
	p19:setState(scenes, function() --[[ line: 296 ]]
		-- upvalues: p19 (ref), prevTransitionProps (ref)
		if p19.props.onTransitionEnd then
			p19.props.onTransitionEnd(p19._transitionProps, prevTransitionProps)
		end
		local var19 = p19._transitionQueue[1]
		
		if var19 then
			local prevProps = var19.prevProps
			p19._transitionQueue = table.clone(p19._transitionQueue)
			table.remove(p19._transitionQueue, 1)
			p19:_startTransition(prevProps, p19.props)
			
			return
		end
		p19._isTransitionRunning = false
	end)
end

function transitioner._onPositionStep(p21, p22) --[[ line: 315 ]]
	p21._positionLastValue = p22
	local index = p21._transitionProps.index
	local var20 = if p21._prevTransitionProps then p21._prevTransitionProps.index else index
	
	if p21.props.onTransitionStep and var20 ~= index then
		p21.props.onTransitionStep(p21._transitionProps, p21._prevTransitionProps, (p22 - var20) / (index - var20))
	end
end

return transitioner