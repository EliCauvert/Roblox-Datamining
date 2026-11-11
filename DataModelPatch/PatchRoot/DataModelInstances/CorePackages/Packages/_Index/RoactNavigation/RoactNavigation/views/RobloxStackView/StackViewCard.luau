local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.Parent.React)
local InvariantModule = require(Parent.utils.invariant)
local StackViewCard = ReactModule.Component:extend("StackViewCard")

function StackViewCard.init(p1)
	-- upvalues: ReactModule (copy)
	p1._isMounted = false
	p1._positionLastValue = p1.props.navigation.state.index
	p1._ref = ReactModule.createRef()
end

function StackViewCard.render(p1)
	-- upvalues: InvariantModule (copy), ReactModule (copy)
	local ForceHidden = p1.props.forceHidden
	local CardColor3 = p1.props.cardColor3
	local InitialPosition = p1.props.initialPosition
	local RenderSceneFunction = p1.props.renderScene
	local Scene = p1.props.scene
	InvariantModule(type(RenderSceneFunction) == "function", "renderScene must be a function")
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ClipsDescendants = false,
		Position = InitialPosition,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = CardColor3,
		BackgroundTransparency = if CardColor3 == nil then 1 else nil,
		Visible = not ForceHidden,
		ref = p1._ref
	}, { Content = RenderSceneFunction(Scene) })
end

function StackViewCard.didMount(p1)
	p1._isMounted = true
	p1._positionDisconnector = p1.props.position:onStep(function(...)
		-- upvalues: p1 (copy)
		p1:_onPositionStep(...)
	end)
end

function StackViewCard.willUnmount(p1)
	p1._isMounted = false
	
	if p1._positionDisconnector then
		p1._positionDisconnector()
		p1._positionDisconnector = nil
	end
end

function StackViewCard.didUpdate(p1, p2)
	local Position = p1.props.position
	local PositionStep = p1.props.positionStep
	
	if Position ~= p2.position then
		p1._positionDisconnector()
		p1._positionDisconnector = Position:onStep(function(...)
			-- upvalues: p1 (copy)
			p1:_onPositionStep(...)
		end)
	end
	if PositionStep ~= p2.positionStep then
		p1:_onPositionStep(p1._positionLastValue)
	end
end

function StackViewCard._onPositionStep(p1, _positionLastValue)
	if not p1._isMounted then return end
	local PositionStepFunction: (any, any) -> () = p1.props.positionStep
	
	if PositionStepFunction then
		PositionStepFunction(p1._ref, _positionLastValue)
	end
	p1._positionLastValue = _positionLastValue
end

return StackViewCard