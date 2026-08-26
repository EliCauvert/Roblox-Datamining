local parent = script.Parent.Parent.Parent
local reactModule = require(parent.Parent.React)
local invariantModule = require(parent.utils.invariant)
local stackViewCard = reactModule.Component:extend("StackViewCard")

function stackViewCard.init(p1)
	-- upvalues: reactModule (ref)
	local index = p1.props.navigation.state.index
	p1._isMounted = false
	p1._positionLastValue = index
	p1._ref = reactModule.createRef()
end

function stackViewCard.render(p1)
	-- upvalues: invariantModule (ref), reactModule (ref)
	local forceHidden = p1.props.forceHidden
	local cardColor3 = p1.props.cardColor3
	local initialPosition = p1.props.initialPosition
	local renderScene = p1.props.renderScene
	local scene = p1.props.scene
	invariantModule(type(renderScene) == "function", "renderScene must be a function")
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		ClipsDescendants = false,
		Position = initialPosition,
		Size = UDim2.new(1, 0, 1, 0),
		BackgroundColor3 = cardColor3,
		BackgroundTransparency = if cardColor3 == nil then 1 else nil,
		Visible = not forceHidden,
		ref = p1._ref
	}, { Content = renderScene(scene) })
end

function stackViewCard.didMount(p1)
	p1._isMounted = true
	p1._positionDisconnector = p1.props.position:onStep(function(...)
		-- upvalues: p1 (ref)
		p1:_onPositionStep(...)
	end)
end

function stackViewCard.willUnmount(p1)
	p1._isMounted = false
	
	if p1._positionDisconnector then
		p1._positionDisconnector()
		p1._positionDisconnector = nil
	end
end

function stackViewCard.didUpdate(p1, p2)
	local position = p1.props.position
	local positionStep = p1.props.positionStep
	
	if position ~= p2.position then
		p1._positionDisconnector()
		p1._positionDisconnector = position:onStep(function(...)
			-- upvalues: p1 (ref)
			p1:_onPositionStep(...)
		end)
	end
	if positionStep ~= p2.positionStep then
		p1:_onPositionStep(p1._positionLastValue)
	end
end

function stackViewCard._onPositionStep(p1, p2)
	if not p1._isMounted then return end
	local positionStep = p1.props.positionStep
	
	if positionStep then
		positionStep(p1._ref, p2)
	end
	p1._positionLastValue = p2
end

return stackViewCard