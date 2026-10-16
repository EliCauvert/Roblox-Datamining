local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Array = LuauPolyfillModule.Array
local Object = LuauPolyfillModule.Object
local ReactModule = require(Parent1.React)
local OtterModule = require(Parent1.Otter)
local ScenesReducerModule = require(script.Parent.ScenesReducer)
local InvariantModule = require(Parent.utils.invariant)
local config = { frequency = 4 }

local function buildTransitionProps(Props, AssignResult) --[[ Line: 17 ]]
	-- upvalues: InvariantModule (copy)
	local Navigation = Props.navigation
	local Options = Props.options
	local Layout = AssignResult.layout
	local Position = AssignResult.position
	local Scenes = AssignResult.scenes
	local Scene = nil
	
	for _, scene in Scenes do
		if scene.isActive then
			Scene = scene
			break
		end
	end
	InvariantModule(Scene, "Could not find active scene")
	
	return {
		layout = Layout,
		navigation = Navigation,
		position = Position,
		scenes = Scenes,
		scene = Scene,
		options = Options,
		index = Scene.index
	}
end

local function _(p1) --[[ Line: 46 | Named "filterStale" ]]
	-- upvalues: Array (copy)
	local FilterResult = Array.filter(p1, function(p2): boolean --[[ Line: 47 ]]
		return not p2.isStale
	end)
	
	return if #FilterResult == #p1 then p1 else FilterResult
end

local Transitioner = ReactModule.Component:extend("Transitioner")

function Transitioner.init(p1) --[[ Line: 60 ]]
	-- upvalues: ReactModule (copy), OtterModule (copy), ScenesReducerModule (copy), buildTransitionProps (copy)
	local State = p1.props.navigation.state
	local Descriptors = p1.props.descriptors
	p1._ref = ReactModule.createRef()
	p1.state = {
		layout = { initWidth = 0, initHeight = 0, isMeasured = false },
		position = OtterModule.createSingleMotor(State.index),
		scenes = ScenesReducerModule({}, State, nil, Descriptors)
	}
	
	function p1._doOnAbsoluteSizeChanged(...) --[[ Line: 78 ]]
		-- upvalues: p1 (copy)
		return p1:_onAbsoluteSizeChanged(...)
	end
	
	p1._positionLastValue = State.index
	p1._prevTransitionProps = nil
	p1._transitionProps = buildTransitionProps(p1.props, p1.state)
	p1._isMounted = false
	p1._isTransitionRunning = false
	p1._transitionQueue = {}
	p1._completeSignalDisconnector = p1.state.position:onComplete(function() --[[ Line: 91 ]]
		-- upvalues: p1 (copy)
		if p1._isMounted then
			p1:_onTransitionEnd()
		end
	end)
	p1._stepSignalDisconnector = p1.state.position:onStep(function(PositionLastValue) --[[ Line: 97 ]]
		-- upvalues: p1 (copy)
		if p1._isMounted then
			p1:_onPositionStep(PositionLastValue)
		end
	end)
end

function Transitioner.didMount(p1) --[[ Line: 104 ]]
	p1._isMounted = true
end

function Transitioner.willUnmount(p1) --[[ Line: 108 ]]
	p1._isMounted = false
	
	if p1._completeSignalDisconnector then
		p1._completeSignalDisconnector()
		p1._completeSignalDisconnector = nil
	end
	if p1._stepSignalDisconnector then
		p1._stepSignalDisconnector()
		p1._stepSignalDisconnector = nil
	end
end

function Transitioner.didUpdate(p1, PrevProps) --[[ Line: 122 ]]
	if not p1.state.layout.isMeasured and p1._ref.current then
		p1:_onAbsoluteSizeChanged(p1._ref.current)
	end
	if p1.props ~= PrevProps then
		if not p1._isTransitionRunning then
			p1:_startTransition(PrevProps, p1.props)
		elseif (p1._transitionQueue[#p1._transitionQueue] or {}).prevProps ~= PrevProps then
			table.insert(p1._transitionQueue, { prevProps = PrevProps })
		end
		return
	end
end

function Transitioner.render(p1) --[[ Line: 147 ]]
	-- upvalues: ReactModule (copy)
	return ReactModule.createElement("Frame", {
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		[ReactModule.Change.AbsoluteSize] = p1._doOnAbsoluteSizeChanged,
		ref = p1._ref
	}, {
		TransitionerScenes = p1.props.render(p1._transitionProps, p1._prevTransitionProps, p1)
	})
end

function Transitioner._onAbsoluteSizeChanged(p1, Frame: Frame) --[[ Line: 165 ]]
	-- upvalues: Object (copy), buildTransitionProps (copy)
	if not p1._isMounted then return end
	local X = Frame.AbsoluteSize.X
	local Y = Frame.AbsoluteSize.Y
	
	if X ~= p1.state.layout.initWidth or Y ~= p1.state.layout.initHeight then
		local AssignResult = Object.assign(table.clone(p1.state.layout), { isMeasured = true, initWidth = X, initHeight = Y })
		p1._transitionProps = buildTransitionProps(p1.props, (Object.assign(table.clone(p1.state), { layout = AssignResult })))
		p1:setState({ layout = AssignResult })
		
		return
	end
end

function Transitioner._computeScenes(p1, p2, p3) --[[ Line: 194 ]]
	-- upvalues: ScenesReducerModule (copy), Array (copy)
	local ScenesReducerModuleResult = ScenesReducerModule(p1.state.scenes, p3.navigation.state, p2.navigation.state, p3.descriptors)
	
	if not p3.navigation.state.isTransitioning then
		local FilterResult = Array.filter(ScenesReducerModuleResult, function(p4): boolean --[[ Line: 47 ]]
			return not p4.isStale
		end)
		ScenesReducerModuleResult = if #FilterResult == #ScenesReducerModuleResult then ScenesReducerModuleResult else FilterResult
	end
	if p3.screenProps ~= p1.props.screenProps then
		p1:setState({ scenes = ScenesReducerModuleResult })
	end
	return if ScenesReducerModuleResult == p1.state.scenes then nil else ScenesReducerModuleResult
end

function Transitioner._startTransition(p1, PrevProps, Props) --[[ Line: 213 ]]
	-- upvalues: Object (copy), buildTransitionProps (copy), config (copy), OtterModule (copy)
	local IsNotIndexMatch = PrevProps.navigation.state.index ~= Props.navigation.state.index
	local Scenes = p1:_computeScenes(PrevProps, Props)
	
	if Scenes then
		local AssignResult = Object.assign(table.clone(p1.state), { scenes = Scenes })
		local Position = AssignResult.position
		local Index = Props.navigation.state.index
		p1._prevTransitionProps = p1._transitionProps
		p1._transitionProps = buildTransitionProps(Props, AssignResult)
		local IsTransitioning = p1._transitionProps.navigation.state.isTransitioning
		
		if IsTransitioning and IsNotIndexMatch then
			p1._isTransitionRunning = true
		end
		p1:setState(AssignResult, function() --[[ Line: 245 ]]
			-- upvalues: IsTransitioning (copy), IsNotIndexMatch (copy), Props (copy), p1 (copy), Index (copy), Object (upval), config (upval), Position (copy), OtterModule (upval)
			if IsTransitioning and IsNotIndexMatch then
				if Props.onTransitionStart then
					Props.onTransitionStart(p1._transitionProps, p1._prevTransitionProps)
				end
				if p1._positionLastValue ~= Index then
					Position:setGoal(OtterModule.spring(Props.navigation.state.index, (Object.assign(table.clone(config), if Props.configureTransition then Props.configureTransition(p1._transitionProps, p1._prevTransitionProps) or {} else {}))))
					
					return
				else
					Position:setGoal(OtterModule.instant(Props.navigation.state.index))
					
					return
				end
			else
				if Props.onTransitionStart then
					Props.onTransitionStart(p1._transitionProps, p1._prevTransitionProps)
				end
				Position:setGoal(OtterModule.instant(Index))
			end
		end)
		
		return
	else
		p1._prevTransitionProps = p1._transitionProps
		
		if p1._isTransitionRunning then
			p1:_onTransitionEnd()
		end
	end
end

function Transitioner._onTransitionEnd(p1) --[[ Line: 284 ]]
	-- upvalues: Array (copy), Object (copy), buildTransitionProps (copy)
	local PrevTransitionProps = p1._prevTransitionProps
	p1._prevTransitionProps = nil
	local Scenes = p1.state.scenes
	local FilterResult = Array.filter(Scenes, function(p2): boolean --[[ Line: 47 ]]
		return not p2.isStale
	end)
	local AssignResult = Object.assign(table.clone(p1.state), {
		scenes = if #FilterResult == #Scenes then Scenes else FilterResult
	})
	p1._transitionProps = buildTransitionProps(p1.props, AssignResult)
	p1:setState(AssignResult, function() --[[ Line: 296 ]]
		-- upvalues: p1 (copy), PrevTransitionProps (copy)
		if p1.props.onTransitionEnd then
			p1.props.onTransitionEnd(p1._transitionProps, PrevTransitionProps)
		end
		local TransitionQueueEntry = p1._transitionQueue[1]
		
		if TransitionQueueEntry then
			local PrevProps = TransitionQueueEntry.prevProps
			p1._transitionQueue = table.clone(p1._transitionQueue)
			table.remove(p1._transitionQueue, 1)
			p1:_startTransition(PrevProps, p1.props)
			
			return
		else
			p1._isTransitionRunning = false
		end
	end)
end

function Transitioner._onPositionStep(p1, _positionLastValue) --[[ Line: 315 ]]
	p1._positionLastValue = _positionLastValue
	local Index = p1._transitionProps.index
	local Index1 = if p1._prevTransitionProps then p1._prevTransitionProps.index else Index
	
	if p1.props.onTransitionStep and Index1 ~= Index then
		p1.props.onTransitionStep(p1._transitionProps, p1._prevTransitionProps, (_positionLastValue - Index1) / (Index - Index1))
	end
end

return Transitioner